From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH 2/2] net-next: stmmac: add mdio clause 45 access from
 mac device for dwmac4
Date: Mon, 29 Apr 2019 15:03:59 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B46E586@DE02WEMBXB.internal.synopsys.com>
References: <1556519724-1576-1-git-send-email-biao.huang@mediatek.com>
 <1556519724-1576-3-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556519724-1576-3-git-send-email-biao.huang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Biao Huang <biao.huang@mediatek.com>, "davem@davemloft.net" <davem@davemloft.net>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "yt.shen@mediatek.com" <yt.shen@mediatek.com>, "jianguo.zhang@mediatek.com" <jianguo.zhang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Biao Huang <biao.huang@mediatek.com>
Date: Mon, Apr 29, 2019 at 07:35:24

> +		value |=3D priv->hw->mii.cl45_en;

This tells the MAC that a C45 Capable PHY is connected so it should be=20
written before anything else. Maybe that explains the need for the=20
mdelay() that you have in the code ?

Thanks,
Jose Miguel Abreu
