From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: Aw: [PATCH net-next v2 0/3] net: dsa: mt7530: Convert to PHYLINK
 and add support for port 5
Date: Thu, 22 Aug 2019 17:44:13 +0200
Message-ID: <trinity-b1f48e51-af73-466d-9ecf-d560a7d7c1ee-1566488653737@3c-app-gmx-bap07>
References: <20190821144547.15113-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190821144547.15113-1-opensource@vdorst.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-mips@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, =?UTF-8?Q?=22Ren=C3=A9_van_Dorst=22?= <opensource@vdorst.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi,

tested on BPI-R2 (mt7623) with 2 Problems (already reported to Rene, just to inform everyone)...maybe anybody has an idea

- linux-next (i know it's not part of the series, but a pitfall on testing other devices) seems to break power-regulator somewhere here:

priv->core_pwr = devm_regulator_get(&mdiodev->dev, "core"); returns 517

#define EPROBE_DEFER517/* Driver requests probe retry */

https://elixir.bootlin.com/linux/latest/source/drivers/regulator/core.c#L1726

without linux-next switch came up including dsa-ports

- RX-traffic (run iperf3 -c x.x.x.x -R) is only 780 Mbits/sec (TX=940 Mbits/sec), same measure with 5.3-rc4 gives 940 MBit/s with same devices,
maybe caused by changes for mt76x8?

regards Frank
