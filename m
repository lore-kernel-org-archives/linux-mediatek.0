From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: Aw: [PATCH net-next v2 0/3] net: dsa: mt7530: Convert to PHYLINK
 and add support for port 5
Date: Thu, 22 Aug 2019 18:26:31 +0200
Message-ID: <trinity-34b058f1-59d5-44b0-8783-a2c2440daf91-1566491191041@3c-app-gmx-bap07>
References: <20190821144547.15113-1-opensource@vdorst.com>
 <trinity-b1f48e51-af73-466d-9ecf-d560a7d7c1ee-1566488653737@3c-app-gmx-bap07>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <trinity-b1f48e51-af73-466d-9ecf-d560a7d7c1ee-1566488653737@3c-app-gmx-bap07>
Sender: netdev-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>
Cc: =?UTF-8?Q?=22Ren=C3=A9_van_Dorst=22?= <opensource@vdorst.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-mips@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

tested now also on bpi-r64 (mt7622) v0.1 (rtl8367 switch), without linux-next to avoid power-regulator-problems like on bpi-r2

dmesg without warnings/errors caused by this patches
link came up as desired
iperf3 looks good: 943 Mbits/sec in both directions and no other issues

so it is currently only the rx-throughput-problem on mt7623/bpi-r2

regards Frank
