Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15F3C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 06:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMJj7eYul/QxemceKc8T5JUR0REsVLWLlq9u+LmgjxM=; b=bnSs/4KJOJukM9
	h4F3JnR9rH7s8zVuAFk0IvNQ/vWp2UaOAw3vOf8ws6TDEumvxvemnbNFewsZitB3mS64PXAvxlFOo
	uEhFmeY35UyIC5kB/HuzOm5/FO6AfnRowoWv0VW8P+rpCKBDYOArf2aEL/6DpUS3XdhJfjCC2ujqR
	WNg8D+YU70TJ/RZWa9aspHh+IpOSHPzPeHB+NgfdBmeBR6rTZSEzYgNB9PM1heSz8xDxNLerlioZa
	ms9TC7tIhi7lu2bFvxcsoMfsnrp184AiCu0lWUVvMplzmpyXexnnyXSYaBVYIv5HNdWp7ONt/pvM0
	GzBaUvSWuDinzSyZ2MrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDKv7-000f99-8w; Fri, 28 Jan 2022 06:39:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDKuf-000f1g-4f; Fri, 28 Jan 2022 06:39:14 +0000
X-UUID: eb7920502014414aa911b0c7245c7150-20220127
X-UUID: eb7920502014414aa911b0c7245c7150-20220127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1144079650; Thu, 27 Jan 2022 23:39:10 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Jan 2022 22:38:34 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 28 Jan 2022 14:38:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 14:38:20 +0800
Message-ID: <10f4a1a11759f2b2a2d322f9d4f17c3159f9769a.camel@mediatek.com>
Subject: Re: [RFC PATCH 2/2] drm/mediatek: add mtk8195 hdmi display driver
From: CK Hu <ck.hu@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Date: Fri, 28 Jan 2022 14:38:20 +0800
In-Reply-To: <20211108000847.14320-3-granquet@baylibre.com>
References: <20211108000847.14320-1-granquet@baylibre.com>
 <20211108000847.14320-3-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_223913_203692_73F1833A 
X-CRM114-Status: GOOD (  20.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Guillaume:

On Mon, 2021-11-08 at 01:08 +0100, Guillaume Ranquet wrote:
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Change-Id: I6399dec26cfe56a338c2ca96989cb7cbd14e292b
> ---
>  drivers/gpu/drm/mediatek/Kconfig              |    9 +
>  drivers/gpu/drm/mediatek/Makefile             |    2 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c    |  219 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h    |   24 +-
>  drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c    | 1835
> +++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h    |   26 +
>  .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c    |  530 +++++
>  .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h    |   20 +
>  .../gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h   |  329 +++
>  9 files changed, 2932 insertions(+), 62 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h
> 
> diff --git a/drivers/gpu/drm/mediatek/Kconfig
> b/drivers/gpu/drm/mediatek/Kconfig
> index 0df75bceb74e..76cc402cbd75 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -31,3 +31,12 @@ config DRM_MEDIATEK_HDMI
>  	help
>  	  DRM/KMS HDMI driver for Mediatek SoCs

[snip]

> +
> +static int mtk_hdmi_ddc_xfer(struct i2c_adapter *adapter, struct
> i2c_msg *msgs,
> +			     int num)
> +{
> +	struct mtk_hdmi_ddc *ddc = adapter->algo_data;
> +	struct device *dev = adapter->dev.parent;
> +	int ret;
> +	int i;
> +
> +	if (!ddc)
> +		return -EINVAL;
> +
> +	for (i = 0; i < num; i++) {
> +		struct i2c_msg *msg = &msgs[i];
> +
> +		if (msg->flags & I2C_M_RD)
> +			ret = fg_ddc_data_read(ddc, msg->addr, msg-
> >buf[0],
> +					    (msg->len), &msg->buf[0]);
> +		else
> +			ret = fg_ddc_data_write(ddc, msg->addr, msg-
> >buf[0],
> +					     (msg->len - 1), &msg-
> >buf[1]);

Why do you use msg->buf[1]? In mt8173 hdmi ddc driver,
mtk_hdmi_ddc_write_msg() just use msg->buf[0]. If using msg->buf[1] is
advance function, separate this advance function to another patch.

Regards,
CK

> +
> +		if (ret <= 0)
> +			goto xfer_end;
> +	}
> +
> +	return i;
> +
> +xfer_end:
> +	dev_err(dev, "ddc failed! : %d\n", ret);
> +	return ret;
> +}
> +


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
