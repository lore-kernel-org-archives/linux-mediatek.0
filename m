From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [v4, PATCH] net: stmmac: add support for hash table size
 128/256 in dwmac4
Date: Wed, 29 May 2019 07:39:49 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B932F51@DE02WEMBXB.internal.synopsys.com>
References: <1559093924-7791-1-git-send-email-biao.huang@mediatek.com>
 <1559093924-7791-2-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559093924-7791-2-git-send-email-biao.huang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Biao Huang <biao.huang@mediatek.com>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "yt.shen@mediatek.com" <yt.shen@mediatek.com>, "jianguo.zhang@mediatek.com" <jianguo.zhang@mediatek.com>, "boon.leong.ong@intel.com" <boon.leong.ong@intel.com>, "andrew@lunn.ch" <andrew@lunn.ch>
List-Id: linux-mediatek@lists.infradead.org

From: Biao Huang <biao.huang@mediatek.com>
Date: Wed, May 29, 2019 at 02:38:44

>  	} else if (!netdev_mc_empty(dev)) {
> -		u32 mc_filter[2];
> +		u32 mc_filter[8];
>  		struct netdev_hw_addr *ha;

The reverse christmas tree also applies here.

I also see some coding-style errors, like missing line breaks, etc...=20
that checkpatch should complain about.

Also, please run this patch against stmmac selftests and add the output=20
to the commit log.

Thanks,
Jose Miguel Abreu
