From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH 1/4] net: stmmac: update rx tail pointer register to fix
 rx dma hang issue.
Date: Mon, 29 Apr 2019 08:51:39 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B46DDF0@DE02WEMBXB.internal.synopsys.com>
References: <1556518556-32464-1-git-send-email-biao.huang@mediatek.com>
 <1556518556-32464-2-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556518556-32464-2-git-send-email-biao.huang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Biao Huang <biao.huang@mediatek.com>, "davem@davemloft.net" <davem@davemloft.net>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "yt.shen@mediatek.com" <yt.shen@mediatek.com>, "jianguo.zhang@mediatek.com" <jianguo.zhang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Biao Huang <biao.huang@mediatek.com>
Date: Mon, Apr 29, 2019 at 07:15:53

> Currently we will not update the receive descriptor tail pointer in
> stmmac_rx_refill. Rx dma will think no available descriptors and stop
> once received packets exceed DMA_RX_SIZE, so that the rx only test will f=
ail.
>=20
> Update the receive tail pointer in stmmac_rx_refill to add more descripto=
rs
> to the rx channel, so packets can be received continually
>=20
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |    3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 97c5e1a..818ad88 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3336,6 +3336,9 @@ static inline void stmmac_rx_refill(struct stmmac_p=
riv *priv, u32 queue)
>  		entry =3D STMMAC_GET_ENTRY(entry, DMA_RX_SIZE);
>  	}
>  	rx_q->dirty_rx =3D entry;
> +	stmmac_set_rx_tail_ptr(priv, priv->ioaddr,
> +			       rx_q->dma_rx_phy + (entry * sizeof(struct dma_desc)),

I think you can just use the "rx_q->rx_tail_addr" here. It'll always=20
trigger a poll demand for the channel.

Thanks,
Jose Miguel Abreu
