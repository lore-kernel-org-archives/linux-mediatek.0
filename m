From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: BUG: devm_regulator_get returns EPROBE_DEFER
 (5.3-rc5..next-20190822) for bpi-r2/mt7623/mt7530
Date: Thu, 22 Aug 2019 21:23:57 +0200
Message-ID: <trinity-584a4b1c-18c9-43ae-8c1a-5057933ad905-1566501837738@3c-app-gmx-bs43>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, =?UTF-8?Q?=22Ren=C3=A9_van_Dorst=22?= <opensource@vdorst.com>
List-Id: linux-mediatek@lists.infradead.org

Hi,

i've encountered a bug in regulator between 5.3-rc5 and next-20190822

i build for bananapi-r2/mt7623 using this branch (includes next-patches):

https://github.com/vDorst/linux-1/blob/c34582d96520566c45068b92e080620458ffc1ff/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts#L166

and noticed that switch does not came up

priv->core_pwr = devm_regulator_get(&mdiodev->dev, "core"); returns 517

located here:
https://github.com/vDorst/linux-1/blob/c34582d96520566c45068b92e080620458ffc1ff/drivers/net/dsa/mt7530.c#L1590

#define EPROBE_DEFER 517/* Driver requests probe retry */

https://elixir.bootlin.com/linux/latest/source/drivers/regulator/core.c#L1726

seems of_find_regulator_by_node(node); is failing here, but i see the dts-node (mt6323_vpa_reg: buck_vpa) in /sys/firmware/devicetree/...

tried without next-patches and switch came up including dsa-ports.

i found no commit yet which breaks the regulator-setup

any idea about this?

regards Frank
