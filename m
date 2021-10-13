Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90164C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 16:30:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DE1060D42
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 16:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DE1060D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oh9ga8x2E7yJ4H/0QpLCHq1WIfrQhwiipXYQeH60uGQ=; b=Bj06aAYolJn5g1RaaJ2FaYWKHO
	JNOC5ddERyAmYQUB8g4HYf7bQz1exFnCUPYGdj1k4y8o2tSDCm4ksTsQdo229FLSagy0n9g7C855Q
	PITZPekA0mdeCa3zJtr7W2nEWstenYzuq2BcKYHYOHJ6K+hX1QgB79p1jWatMwuVvtiM4nImNZMSt
	nLT6iCFRfWhtJdj3pst7wFgsQ4TBzzcI5OVwfR8RHhNWu8wQoLQrWWFtQYLQf261u9FGo2oPmSegJ
	78GUj7DxNSszWoBB9csPShhrSDw6RDxHS3MBBmA84kTbPfuMKIlzgRclZSJ4a2N5jI2I7w4B9rBMT
	3m4dtvug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mah8c-0002fc-0s; Wed, 13 Oct 2021 16:29:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mah8Z-0002et-CI
 for linux-mediatek@lists.infradead.org; Wed, 13 Oct 2021 16:29:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1FF2360D42;
 Wed, 13 Oct 2021 16:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634142590;
 bh=dvCyprG3xyU4rgXCivSK+cq5KyFBW76Ovx/4Z3OH9Ac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oZKmSTYzaUcBuN92tYlubjRGprRWNceDf1aor7CRX/ujU6yVleO7cRpLOvx4q89l0
 iO+MexOe3ugMiJ/kqB3TVqzX8TebjriFMol2JQ56SYQUVhmo2jbayL9rgVQXJn/SiI
 Ed/DnHI0QNPaF7zfC5E1j0NQZbs5rHT6+vQCpym5iIpo4XBRPnqTsYpevPTvhpu/Qf
 UF+zQZOrfQX7dXSGx8CMkmgG+1DwkXlKkAuE7k6z1MHlfGt4REKf1PX47A/3F/YOU2
 T7Ej6DZNPGNeMGyRY8/W0+LOQwKg9X/tpKbLHdKlwAdaYRAeFekS5/a29gUJK9T1x3
 3YRMXNyaS92qA==
Date: Wed, 13 Oct 2021 18:29:47 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Mark-YW.Chen@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
 steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
 jemele@google.com, abhishekpandit@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 11/16] mt76: sdio: extend sdio module to support CONNAC2
Message-ID: <YWcJe27HQMS7B85j@lore-desk>
References: <cover.1634077769.git.objelf@gmail.com>
 <654f1b4b4f5c5b566e8a64795a3c8ebcc19a7593.1634077769.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <654f1b4b4f5c5b566e8a64795a3c8ebcc19a7593.1634077769.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_092951_489872_9A3E2AD8 
X-CRM114-Status: GOOD (  25.16  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8669708406290487345=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8669708406290487345==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wMjCA7l1ejsqw0vd"
Content-Disposition: inline


--wMjCA7l1ejsqw0vd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Extend sdio module to support CONNAC2 hw that mt7921s rely on.
>=20
> Tested-by: Deren Wu <deren.wu@mediatek.com>
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Co-developed-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h     |  5 +-
>  .../net/wireless/mediatek/mt76/mt7615/sdio.c  |  5 +-
>  drivers/net/wireless/mediatek/mt76/sdio.c     | 23 ++++++-
>  drivers/net/wireless/mediatek/mt76/sdio.h     | 50 ++++++++++++++-
>  .../net/wireless/mediatek/mt76/sdio_txrx.c    | 62 ++++++++++++++++---
>  5 files changed, 128 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index e2f33956a122..06f0d1348d52 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -505,6 +505,8 @@ struct mt76_sdio {
> =20
>  	struct sdio_func *func;
>  	void *intr_data;
> +	int intr_size;
> +	u8 hw_ver;
> =20
>  	struct {
>  		int pse_data_quota;
> @@ -1249,7 +1251,8 @@ int mt76s_alloc_queues(struct mt76_dev *dev);
>  void mt76s_deinit(struct mt76_dev *dev);
>  void mt76s_sdio_irq(struct sdio_func *func);
>  void mt76s_txrx_worker(struct mt76_sdio *sdio);
> -int mt76s_hw_init(struct mt76_dev *dev, struct sdio_func *func);
> +int mt76s_hw_init(struct mt76_dev *dev, struct sdio_func *func,
> +		  int hw_ver);
>  u32 mt76s_rr(struct mt76_dev *dev, u32 offset);
>  void mt76s_wr(struct mt76_dev *dev, u32 offset, u32 val);
>  u32 mt76s_rmw(struct mt76_dev *dev, u32 offset, u32 mask, u32 val);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c b/drivers/n=
et/wireless/mediatek/mt76/mt7615/sdio.c
> index f47e25f6dedb..a6b5d536d962 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
> @@ -100,7 +100,7 @@ static int mt7663s_probe(struct sdio_func *func,
>  	if (ret < 0)
>  		goto error;
> =20
> -	ret =3D mt76s_hw_init(mdev, func);
> +	ret =3D mt76s_hw_init(mdev, func, MT76_CONNAC_SDIO);
>  	if (ret)
>  		goto error;
> =20
> @@ -108,8 +108,9 @@ static int mt7663s_probe(struct sdio_func *func,
>  		    (mt76_rr(dev, MT_HW_REV) & 0xff);
>  	dev_dbg(mdev->dev, "ASIC revision: %04x\n", mdev->rev);
> =20
> +	mdev->sdio.intr_size =3D sizeof(struct mt76_connac_sdio_intr);
>  	mdev->sdio.intr_data =3D devm_kmalloc(mdev->dev,
> -					    sizeof(struct mt76s_intr),
> +					    mdev->sdio.intr_size,
>  					    GFP_KERNEL);
>  	if (!mdev->sdio.intr_data) {
>  		ret =3D -ENOMEM;
> diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c b/drivers/net/wire=
less/mediatek/mt76/sdio.c
> index 82fb4c110b90..bb40cc3e9c2b 100644
> --- a/drivers/net/wireless/mediatek/mt76/sdio.c
> +++ b/drivers/net/wireless/mediatek/mt76/sdio.c
> @@ -221,11 +221,13 @@ int mt76s_rd_rp(struct mt76_dev *dev, u32 base,
>  }
>  EXPORT_SYMBOL_GPL(mt76s_rd_rp);
> =20
> -int mt76s_hw_init(struct mt76_dev *dev, struct sdio_func *func)
> +int mt76s_hw_init(struct mt76_dev *dev, struct sdio_func *func, int hw_v=
er)
>  {
>  	u32 status, ctrl;
>  	int ret;
> =20
> +	dev->sdio.hw_ver =3D hw_ver;
> +
>  	sdio_claim_host(func);
> =20
>  	ret =3D sdio_enable_func(func);
> @@ -255,12 +257,27 @@ int mt76s_hw_init(struct mt76_dev *dev, struct sdio=
_func *func)
>  		goto disable_func;
> =20
>  	ctrl =3D WHIER_RX0_DONE_INT_EN | WHIER_TX_DONE_INT_EN;
> +	if (hw_ver =3D=3D MT76_CONNAC2_SDIO)
> +		ctrl |=3D WHIER_RX1_DONE_INT_EN;
>  	sdio_writel(func, ctrl, MCR_WHIER, &ret);
>  	if (ret < 0)
>  		goto disable_func;
> =20
> -	/* set WHISR as read clear and Rx aggregation number as 16 */
> -	ctrl =3D FIELD_PREP(MAX_HIF_RX_LEN_NUM, 16);
> +	switch (hw_ver) {
> +	case MT76_CONNAC_SDIO:
> +		/* set WHISR as read clear and Rx aggregation number as 16 */
> +		ctrl =3D FIELD_PREP(MAX_HIF_RX_LEN_NUM, 16);
> +		break;
> +	default:
> +		ctrl =3D sdio_readl(func, MCR_WHCR, &ret);
> +		if (ret < 0)
> +			goto disable_func;
> +		ctrl &=3D ~MAX_HIF_RX_LEN_NUM_CONNAC2;
> +		ctrl &=3D ~W_INT_CLR_CTRL; /* read clear */
> +		ctrl |=3D FIELD_PREP(MAX_HIF_RX_LEN_NUM_CONNAC2, 0);
> +		break;
> +	}
> +
>  	sdio_writel(func, ctrl, MCR_WHCR, &ret);
>  	if (ret < 0)
>  		goto disable_func;
> diff --git a/drivers/net/wireless/mediatek/mt76/sdio.h b/drivers/net/wire=
less/mediatek/mt76/sdio.h
> index 03877d89e152..7d2ec044dcb1 100644
> --- a/drivers/net/wireless/mediatek/mt76/sdio.h
> +++ b/drivers/net/wireless/mediatek/mt76/sdio.h
> @@ -21,7 +21,12 @@
>  #define MCR_WHCR			0x000C
>  #define W_INT_CLR_CTRL			BIT(1)
>  #define RECV_MAILBOX_RD_CLR_EN		BIT(2)
> +#define WF_SYS_RSTB			BIT(4) /* supported in CONNAC2 */
> +#define WF_WHOLE_PATH_RSTB		BIT(5) /* supported in CONNAC2 */
> +#define WF_SDIO_WF_PATH_RSTB		BIT(6) /* supported in CONNAC2 */
>  #define MAX_HIF_RX_LEN_NUM		GENMASK(13, 8)
> +#define MAX_HIF_RX_LEN_NUM_CONNAC2	GENMASK(14, 8) /* supported in CONNAC=
2 */
> +#define WF_RST_DONE			BIT(15) /* supported in CONNAC2 */
>  #define RX_ENHANCE_MODE			BIT(16)
> =20
>  #define MCR_WHISR			0x0010
> @@ -29,6 +34,7 @@
>  #define WHIER_D2H_SW_INT		GENMASK(31, 8)
>  #define WHIER_FW_OWN_BACK_INT_EN	BIT(7)
>  #define WHIER_ABNORMAL_INT_EN		BIT(6)
> +#define WHIER_WDT_INT_EN		BIT(5) /* supported in CONNAC2 */
>  #define WHIER_RX1_DONE_INT_EN		BIT(2)
>  #define WHIER_RX0_DONE_INT_EN		BIT(1)
>  #define WHIER_TX_DONE_INT_EN		BIT(0)
> @@ -100,7 +106,37 @@
> =20
>  #define MCR_SWPCDBGR			0x0154
> =20
> -struct mt76s_intr {
> +#define MCR_H2DSM2R			0x0160 /* supported in CONNAC2 */
> +#define MCR_H2DSM3R			0x0164 /* supported in CONNAC2 */
> +#define MCR_D2HRM3R			0x0174 /* supported in CONNAC2 */
> +#define MCR_WTQCR8			0x0190 /* supported in CONNAC2 */
> +#define MCR_WTQCR9			0x0194 /* supported in CONNAC2 */
> +#define MCR_WTQCR10			0x0198 /* supported in CONNAC2 */
> +#define MCR_WTQCR11			0x019C /* supported in CONNAC2 */
> +#define MCR_WTQCR12			0x01A0 /* supported in CONNAC2 */
> +#define MCR_WTQCR13			0x01A4 /* supported in CONNAC2 */
> +#define MCR_WTQCR14			0x01A8 /* supported in CONNAC2 */
> +#define MCR_WTQCR15			0x01AC /* supported in CONNAC2 */
> +
> +enum mt76_connac_sdio_ver {
> +	MT76_CONNAC_SDIO,
> +	MT76_CONNAC2_SDIO,
> +};
> +
> +struct mt76_connac2_sdio_intr {
> +	u32 isr;
> +	struct {
> +		u32 wtqcr[16];
> +	} tx;
> +	struct {
> +		u16 num[2];
> +		u16 len0[16];
> +		u16 len1[128];
> +	} rx;
> +	u32 rec_mb[2];
> +} __packed;
> +
> +struct mt76_connac_sdio_intr {
>  	u32 isr;
>  	struct {
>  		u32 wtqcr[8];
> @@ -112,4 +148,16 @@ struct mt76s_intr {
>  	u32 rec_mb[2];
>  } __packed;
> =20
> +struct mt76s_intr {
> +	u32 isr;
> +	struct {
> +		u32 *wtqcr;
> +	} tx;
> +	struct {
> +		u16 num[2];
> +		u16 *len[2];
> +	} rx;
> +	u32 rec_mb[2];
> +};
> +
>  #endif
> diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net=
/wireless/mediatek/mt76/sdio_txrx.c
> index ceb3dc0613d6..73289a9845d7 100644
> --- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> +++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> @@ -81,7 +81,7 @@ static int
>  mt76s_rx_run_queue(struct mt76_dev *dev, enum mt76_rxq_id qid,
>  		   struct mt76s_intr *intr)
>  {
> -	struct mt76_queue *q =3D &dev->q_rx[qid];
> +	struct mt76_queue *q =3D &dev->q_rx[0];

why qid is always 0 here?

Regards,
Lorenzo

>  	struct mt76_sdio *sdio =3D &dev->sdio;
>  	int len =3D 0, err, i;
>  	struct page *page;
> @@ -112,8 +112,10 @@ mt76s_rx_run_queue(struct mt76_dev *dev, enum mt76_r=
xq_id qid,
>  	for (i =3D 0; i < intr->rx.num[qid]; i++) {
>  		int index =3D (q->head + i) % q->ndesc;
>  		struct mt76_queue_entry *e =3D &q->entry[index];
> +		__le32 *rxd =3D (__le32 *)buf;
> =20
> -		len =3D intr->rx.len[qid][i];
> +		/* parse rxd to get the actual packet length */
> +		len =3D FIELD_GET(GENMASK(15, 0), le32_to_cpu(rxd[0]));
>  		e->skb =3D mt76s_build_rx_skb(buf, len, round_up(len + 4, 4));
>  		if (!e->skb)
>  			break;
> @@ -132,35 +134,72 @@ mt76s_rx_run_queue(struct mt76_dev *dev, enum mt76_=
rxq_id qid,
>  	return i;
>  }
> =20
> +static void mt76s_intr_parse(struct mt76_dev *dev, void *data,
> +			     struct mt76s_intr *intr)
> +{
> +	struct mt76_connac_sdio_intr *intr_v1;
> +	struct mt76_connac2_sdio_intr *intr_v2;
> +	int i;
> +
> +	switch (dev->sdio.hw_ver) {
> +	case MT76_CONNAC_SDIO:
> +		intr_v1 =3D data;
> +		intr->isr =3D  intr_v1->isr;
> +		intr->tx.wtqcr =3D intr_v1->tx.wtqcr;
> +		for (i =3D 0; i < 2 ; i++) {
> +			intr->rx.num[i] =3D intr_v1->rx.num[i];
> +			intr->rx.len[i] =3D intr_v1->rx.len[i];
> +			intr->rec_mb[i] =3D intr_v1->rec_mb[i];
> +		}
> +		break;
> +	default:
> +		intr_v2 =3D data;
> +		intr->isr =3D  intr_v2->isr;
> +		intr->tx.wtqcr =3D intr_v2->tx.wtqcr;
> +		for (i =3D 0; i < 2 ; i++) {
> +			intr->rx.num[i] =3D intr_v2->rx.num[i];
> +			if (!i)
> +				intr->rx.len[0] =3D intr_v2->rx.len0;
> +			else
> +				intr->rx.len[1] =3D intr_v2->rx.len1;
> +			intr->rec_mb[i] =3D intr_v2->rec_mb[i];
> +		}
> +		break;
> +	}
> +}
> +
>  static int mt76s_rx_handler(struct mt76_dev *dev)
>  {
>  	struct mt76_sdio *sdio =3D &dev->sdio;
> -	struct mt76s_intr *intr =3D sdio->intr_data;
> +	void *data =3D sdio->intr_data;
> +	struct mt76s_intr intr;
>  	int nframes =3D 0, ret;
> =20
> -	ret =3D sdio_readsb(sdio->func, intr, MCR_WHISR, sizeof(*intr));
> +	ret =3D sdio_readsb(sdio->func, data, MCR_WHISR, sdio->intr_size);
>  	if (ret < 0)
>  		return ret;
> =20
> -	trace_dev_irq(dev, intr->isr, 0);
> +	mt76s_intr_parse(dev, data, &intr);
> =20
> -	if (intr->isr & WHIER_RX0_DONE_INT_EN) {
> -		ret =3D mt76s_rx_run_queue(dev, 0, intr);
> +	trace_dev_irq(dev, intr.isr, 0);
> +
> +	if (intr.isr & WHIER_RX0_DONE_INT_EN) {
> +		ret =3D mt76s_rx_run_queue(dev, 0, &intr);
>  		if (ret > 0) {
>  			mt76_worker_schedule(&sdio->net_worker);
>  			nframes +=3D ret;
>  		}
>  	}
> =20
> -	if (intr->isr & WHIER_RX1_DONE_INT_EN) {
> -		ret =3D mt76s_rx_run_queue(dev, 1, intr);
> +	if (intr.isr & WHIER_RX1_DONE_INT_EN) {
> +		ret =3D mt76s_rx_run_queue(dev, 1, &intr);
>  		if (ret > 0) {
>  			mt76_worker_schedule(&sdio->net_worker);
>  			nframes +=3D ret;
>  		}
>  	}
> =20
> -	nframes +=3D !!mt76s_refill_sched_quota(dev, intr->tx.wtqcr);
> +	nframes +=3D !!mt76s_refill_sched_quota(dev, intr.tx.wtqcr);
> =20
>  	return nframes;
>  }
> @@ -173,6 +212,9 @@ mt76s_tx_pick_quota(struct mt76_sdio *sdio, bool mcu,=
 int buf_sz,
> =20
>  	pse_sz =3D DIV_ROUND_UP(buf_sz + sdio->sched.deficit, MT_PSE_PAGE_SZ);
> =20
> +	if (mcu && sdio->hw_ver =3D=3D MT76_CONNAC2_SDIO)
> +		pse_sz =3D 1;
> +
>  	if (mcu) {
>  		if (sdio->sched.pse_mcu_quota < *pse_size + pse_sz)
>  			return -EBUSY;
> --=20
> 2.25.1
>=20

--wMjCA7l1ejsqw0vd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYWcJewAKCRA6cBh0uS2t
rBMeAQC6xcOj/6zuVlgDfFNvgC+rSIztK5MWiUAXqtuTRJxPAwEA7HZGbc0wwq+h
DwlheKLi2Rd9V0PD2/H1L70KyBS2/gg=
=/Y3a
-----END PGP SIGNATURE-----

--wMjCA7l1ejsqw0vd--


--===============8669708406290487345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8669708406290487345==--

