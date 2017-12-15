From: Sean Wang <sean.wang@mediatek.com>
Subject: [net-next] phylib: Add device reset GPIO support causes DSA MT7530
 acquires reset-gpios fails
Date: Fri, 15 Dec 2017 14:55:03 +0800
Message-ID: <1513320903.28444.65.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: sergei.shtylyov@cogentembedded.com, andrew@lunn.ch, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, richard.leitner@skidata.com, geert+renesas@glider.be
List-Id: linux-mediatek@lists.infradead.org

Hi Sergei,

Recently I found the patch commit bafbdd527d56 (phylib: Add device reset
GPIO support) would have the impact on MT7530 driver. Which causes the
DSA MT7530 device (it's the child node under mdio bus) gets the
reset-gpios fails because the same GPIO seems already be held in the
earlier mdiobus_register_device call patched through the commit.

do you have any idea how the commits also considers DSA case ?

I guessed the DSA lan9303, mv88e8 switch should have the same issue
since they have the same GPIO name as mdiobus_register_device required.

drivers/net/dsa/lan9303-core.c:1303:    chip->reset_gpio =
devm_gpiod_get_optional(chip->dev, "reset",
drivers/net/dsa/mv88e6xxx/chip.c:3936:  chip->reset =
devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
drivers/net/dsa/mt7530.c:1476:          priv->reset =
devm_gpiod_get_optional(&mdiodev->dev, "reset",

Below is the stack dump I added in of_get_named_gpiod_flags call. Which
apparently shows mdiobus_register_device would get gpio at first and
then DSA driver does.

[    2.570607] [<c010d878>] (show_stack) from [<c073149c>] (dump_stack
+0x98/0xac)
[    2.577779] [<c073149c>] (dump_stack) from [<c03ed3cc>]
(of_get_named_gpiod_flags+0xe8/0x128)
[    2.586239] [<c03ed3cc>] (of_get_named_gpiod_flags) from [<c03ecbb4>]
(fwnode_get_named_gpiod+0x5c/0xd0)
[    2.595648] [<c03ecbb4>] (fwnode_get_named_gpiod) from [<c04e3d00>]
(mdiobus_register_device+0x64/0xa8)
[    2.604969] [<c04e3d00>] (mdiobus_register_device) from [<c04e4ca4>]
(mdio_device_register+0x34/0x8c)
[    2.614119] [<c04e4ca4>] (mdio_device_register) from [<c05b9ff0>]
(of_mdiobus_register+0x150/0x2c8)
[    2.623097] [<c05b9ff0>] (of_mdiobus_register) from [<c04ea680>]
(mtk_probe+0x6a4/0x820)
[    2.631128] [<c04ea680>] (mtk_probe) from [<c04688e4>]
(platform_drv_probe+0x5c/0xc0)
[    2.638898] [<c04688e4>] (platform_drv_probe) from [<c0466558>]
(driver_probe_device+0x2f4/0x4d8)
[    2.647702] [<c0466558>] (driver_probe_device) from [<c0466848>]
(__driver_attach+0x10c/0x128)
[    2.656248] [<c0466848>] (__driver_attach) from [<c046408c>]
(bus_for_each_dev+0x78/0xac)
[    2.664364] [<c046408c>] (bus_for_each_dev) from [<c0465cc0>]
(driver_attach+0x2c/0x30)
[    2.672307] [<c0465cc0>] (driver_attach) from [<c0465688>]
(bus_add_driver+0x1e0/0x278)
[    2.680250] [<c0465688>] (bus_add_driver) from [<c0467574>]
(driver_register+0x88/0x108)would
[    2.688277] [<c0467574>] (driver_register) from [<c0468834>]
(__platform_driver_register+0x50/0x58)
[    2.697256] [<c0468834>] (__platform_driver_register) from
[<c0b34780>] (mtk_driver_init+0x24/0x28)
[    2.706234] [<c0b34780>] (mtk_driver_init) from [<c0101b98>]
(do_one_initcall+0x50/0x17c)
[    2.714351] [<c0101b98>] (do_one_initcall) from [<c0b00f70>]
(kernel_init_freeable+0x154/0x1f4)
[    2.722984] [<c0b00f70>] (kernel_init_freeable) from [<c0746b1c>]
(kernel_init+0x18/0x124)
[    2.731185] [<c0746b1c>] (kernel_init) from [<c0108e08>]
(ret_from_fork+0x14/0x2c)
[    2.738719] of_get_named_gpiod_flags: parsed 'reset-gpios' property
of node '/ethernet@1b100000/mdio-bus/switch@0[0]' - status (0)
[    2.750631] mt7530 mdio-bus:00: GPIO lookup for consumer reset
[    2.756443] mt7530 mdio-bus:00: using device tree for GPIO lookup
[    2.762494] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
4.15.0-rc2-00819-g4d89425-dirty #6
[    2.770514] Hardware name: Mediatek Cortex-A7 (Device Tree)
[    2.776049] [<c0113390>] (unwind_backtrace) from [<c010d878>]
(show_stack+0x20/0x24)
[    2.783733] [<c010d878>] (show_stack) from [<c073149c>] (dump_stack
+0x98/0xac)
[    2.790901] [<c073149c>] (dump_stack) from [<c03ed3cc>]
(of_get_named_gpiod_flags+0xe8/0x128)
[    2.799359] [<c03ed3cc>] (of_get_named_gpiod_flags) from [<c03ed4a8>]
(of_find_gpio+0x70/0xfc)
[    2.807903] [<c03ed4a8>] (of_find_gpio) from [<c03ec7f8>]
(gpiod_get_index+0xac/0x2a0)
[    2.815759] [<c03ec7f8>] (gpiod_get_index) from [<c03e6dd4>]
(devm_gpiod_get_index+0x5c/0x98)
[    2.824220] [<c03e6dd4>] (devm_gpiod_get_index) from [<c03e6e80>]
(devm_gpiod_get_optional+0x20/0wouldx34)
[    2.833370] [<c03e6e80>] (devm_gpiod_get_optional) from [<c04e6e04>]
(mt7530_probe+0x170/0x1a0)
[    2.842003] [<c04e6e04>] (mt7530_probe) from [<c04e4b98>] (mdio_probe
+0x40/0x64)
[    2.849342] [<c04e4b98>] (mdio_probe) from [<c0466558>]
(driver_probe_device+0x2f4/0x4d8)
[    2.857455] [<c0466558>] (driver_probe_device) from [<c046692c>]
(__device_attach_driver+0xc8/0x144)
[    2.866518] [<c046692c>] (__device_attach_driver) from [<c046415c>]
(bus_for_each_drv+0x70/0xa4)geert+renesas@glider.be
[    2.875235] [<c046415c>] (bus_for_each_drv) from [<c04660b4>]
(__device_attach+0xc0/0x150)
[    2.883434] [<c04660b4>] (__device_attach) from [<c0466a04>]
(device_initial_probe+0x1c/0x20)
[    2.891893] [<c0466a04>] (device_initial_probe) from [<c0465358>]
(bus_probe_device+0x94/0x9c)
[    2.900440] [<c0465358>] (bus_probe_device) from [<c0463078>]
(device_add+0x374/0x5c0)
[    2.908297] [<c0463078>] (device_add) from [<c04e4cb4>]
(mdio_device_register+0x44/0x8c)
[    2.916326] [<c04e4cb4>] (mdio_device_register) from [<c05b9ff0>]
(of_mdiobus_register+0x150/0x2c8)
[    2.925302] [<c05b9ff0>] (of_mdiobus_register) from [<c04ea680>]
(mtk_probe+0x6a4/0x820)


and the related dts I used is as below 
would
         mdio: mdio-bus {
                #address-cells = <1>;
                #size-cells = <0>;

                switch@0 {
                        compatible = "mediatek,mt7530";
                        #address-cells = <1>;
                        #size-cells = <0>;
                        reg = <0>;
                        reset-gpios = <&pio 33 0>;
                        core-supply = <&mt6323_vpa_reg>;
                        io-supply = <&mt6323_vemc3v3_reg>;

                        ports {
                                #address-cells = <1>;
                                #size-cells = <0>;
                                reg = <0>;

                                port@0 {
                                        reg = <0>;
                                        label = "wan";
                                };
	Sean
