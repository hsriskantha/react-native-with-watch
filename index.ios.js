/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  TouchableHighlight,
  NativeModules,
} from 'react-native';

class ReactNativeWithWatch extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          React Native + Apple Watch!
        </Text>
        <TouchableHighlight style={styles.button}
          onPress={() => {
            const randomNumber = Math.round((Math.random() * 100) + 1);
            NativeModules.Watch.sendMessage("React Native", randomNumber.toString());
          }}>
          <Text style={styles.instructions}>
            Generate random number!
          </Text>
        </TouchableHighlight>
    </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
  button: {
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#FE7D60',
    width: 200,
    height: 50,
    borderRadius: 4,
  },
});

AppRegistry.registerComponent('ReactNativeWithWatch', () => ReactNativeWithWatch);
