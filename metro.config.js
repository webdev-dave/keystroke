const {getDefaultConfig, mergeConfig} = require('@react-native/metro-config');

/**
 * Metro configuration
 * https://reactnative.dev/docs/metro
 *
 * @type {import('metro-config').MetroConfig}
 */
const config = {
  watchFolders: [__dirname],
  resolver: {
    blockList: [
      /node_modules\/.*\/android\/build\/.*/,
      /node_modules\/.*\/android\/.cxx\/.*/,
      /android\/app\/build\/.*/,
      /android\/build\/.*/,
    ],
  },
};

module.exports = mergeConfig(getDefaultConfig(__dirname), config);
