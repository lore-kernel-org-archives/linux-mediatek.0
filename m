From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH 1/2] net-next: stmmac: add support for hash table size
 128/256 in dwmac4
Date: Mon, 29 Apr 2019 09:00:53 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B46DE20@DE02WEMBXB.internal.synopsys.com>
References: <1556519724-1576-1-git-send-email-biao.huang@mediatek.com>
 <1556519724-1576-2-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556519724-1576-2-git-send-email-biao.huang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Biao Huang <biao.huang@mediatek.com>, "davem@davemloft.net" <davem@davemloft.net>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "yt.shen@mediatek.com" <yt.shen@mediatek.com>, "jianguo.zhang@mediatek.com" <jianguo.zhang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Biao Huang <biao.huang@mediatek.com>
Date: Mon, Apr 29, 2019 at 07:35:23

> +#define GMAC_HASH_TAB(x)		(0x10 + x * 4)

You need to guard x here with parenthesis.

>  	void __iomem *ioaddr =3D (void __iomem *)dev->base_addr;
> -	unsigned int value =3D 0;
> +	unsigned int value;
> +	int i;
> +	int numhashregs =3D (hw->multicast_filter_bins >> 5);
> +	int mcbitslog2 =3D hw->mcast_bits_log2;

Reverse Christmas tree order here please.

Thanks,
Jose Miguel Abreu
