Return-Path: <SRS0=AkNb=2K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D39C43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 02:36:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4DB124680
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 02:36:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u8gx5IEy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="clAgRfNy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4DB124680
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bE4Fd4+9tQhuE1xsEmGMNUYpggMa4wul838BZ8u1XTQ=; b=u8gx5IEyKS/ddY
	xnzuQh2Mk9eH20paF0wrW5R7ntQUmbwUHWnB66wzyquu4yr4vWQCUg5iQHSWh9xPG5cP+GetvVBa0
	zhDG62wzRDdvylq8rr2Y1XuN7wq9xcVm3dz/hE50ZkDfoujjeTtJZ0aik0/Tjg6tW28OdwklUKyZR
	RORcO8EZYdMNBvInGAxWJuTlrzAo98Nc/zcnvNxriw9twvjJvWGFVka3rDolz3gezHtE02n1th+nL
	DE7m6Zfg04bERUC0KwpSRFhxd9FslS2YXVB47n2IxKGKiTh5Y8wRtAPwhLNFrmZJyOdynI7qKBRZ8
	TjE3LwQKU699jhHnXI4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii89A-0006iy-Cb; Fri, 20 Dec 2019 02:36:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii896-0006iH-VZ
 for linux-mediatek@lists.infradead.org; Fri, 20 Dec 2019 02:36:06 +0000
X-UUID: 5d8ea8b51d7441cd8164bec0b68f751c-20191219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tEcYWZijm0bFlilOapxtQzBH1rfZ6D9Bauhv1QIh7Vg=; 
 b=clAgRfNyFTyTFk79VIddsNZ7aJKg/p7C5f3zJYXo4rIXg6Igl33jXmhZO+Xyw2MYWUBSwQtmXc8NKulEn4EXPKWwY9hweN3mblAK0JCVvvITO9T68j4cQe1jaPTTNwCtOwt5KIthf2o2DGKqDi3W6wG5rPh2LRwSm3alOwK30KU=;
X-UUID: 5d8ea8b51d7441cd8164bec0b68f751c-20191219
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1695667029; Thu, 19 Dec 2019 18:35:52 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Dec 2019 18:31:55 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Dec 2019 10:31:11 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 20 Dec 2019 10:30:36 +0800
Message-ID: <1576809089.26847.10.camel@mtksdaap41>
Subject: Re: [PATCH 4/4] drm/mediatek: config mipitx impedance with
 calibration data
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Fri, 20 Dec 2019 10:31:29 +0800
In-Reply-To: <20191216082937.119164-5-jitao.shi@mediatek.com>
References: <20191216082937.119164-1-jitao.shi@mediatek.com>
 <20191216082937.119164-5-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_183605_029415_84C672FE 
X-CRM114-Status: GOOD (  16.26  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, stonea168@163.com, cawa.cheng@mediatek.com,
 dri-devel@lists.freedesktop.org, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Jitao:

On Mon, 2019-12-16 at 16:29 +0800, Jitao Shi wrote:
> Read calibration data from nvmem, and config mipitx impedance with
> calibration data to make sure their impedance are 100ohm.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_mipi_tx.h        |  1 +
>  drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c | 63 +++++++++++++++++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.h b/drivers/gpu/drm/mediatek/mtk_mipi_tx.h
> index eea44327fe9f..a1b6292145de 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.h
> +++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.h
> @@ -28,6 +28,7 @@ struct mtk_mipi_tx {
>  	void __iomem *regs;
>  	u32 data_rate;
>  	u32 mipitx_drive;
> +	u32 rt_code[5];
>  	const struct mtk_mipitx_data *driver_data;
>  	struct clk_hw pll_hw;
>  	struct clk *pll;
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
> index 124fdf95f1e5..f624516944bb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
> @@ -5,6 +5,8 @@
>   */
>  
>  #include "mtk_mipi_tx.h"
> +#include <linux/nvmem-consumer.h>
> +#include <linux/slab.h>
>  
>  #define MIPITX_LANE_CON		0x000c
>  #define RG_DSI_CPHY_T1DRV_EN		BIT(0)
> @@ -28,6 +30,7 @@
>  #define MIPITX_PLL_CON4		0x003c
>  #define RG_DSI_PLL_IBIAS		(3 << 10)
>  
> +#define MIPITX_D2P_RTCODE	0x0100
>  #define MIPITX_D2_SW_CTL_EN	0x0144
>  #define MIPITX_D0_SW_CTL_EN	0x0244
>  #define MIPITX_CK_CKMODE_EN	0x0328
> @@ -108,6 +111,64 @@ static const struct clk_ops mtk_mipi_tx_pll_ops = {
>  	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
>  };
>  
> +static int mtk_mipi_tx_config_calibration_data(struct mtk_mipi_tx *mipi_tx)
> +{
> +	u32 *buf = NULL;

Need not to assign NULL to buf, it would be assigned some value later.

> +	int i, j;
> +	struct nvmem_cell *cell;
> +	struct device *dev = mipi_tx->dev;
> +	size_t len;
> +
> +	cell = nvmem_cell_get(dev, "calibration-data");
> +	if (IS_ERR(cell)) {
> +		dev_warn(dev, "nvmem_cell_get fail\n");

In [1], nvmem is optional property, so I think you should use dev_dbg()
or dev_info().

[1]
http://lists.infradead.org/pipermail/linux-mediatek/2019-December/025640.html

> +		return -EINVAL;

The caller does not process return value, so I think you don't need to
return value.

> +	}
> +
> +	buf = (u32 *)nvmem_cell_read(cell, &len);
> +
> +	nvmem_cell_put(cell);
> +
> +	if (IS_ERR(buf)) {
> +		dev_warn(dev, "can't get data\n");
> +		return -EINVAL;
> +	}
> +
> +	if (len < 3 * sizeof(u32)) {
> +		dev_warn(dev, "invalid calibration data\n");
> +		kfree(buf);
> +		return -EINVAL;
> +	}
> +
> +	mipi_tx->rt_code[0] = ((buf[0] >> 6 & 0x1F) << 5) |

You don't access rt_code[] out of this function, so I think this could
be local variable.

> +			      (buf[0] >> 11 & 0x1F);

Lower case 0x1f.

> +	mipi_tx->rt_code[1] = ((buf[1] >> 27 & 0x1F) << 5) |
> +			      (buf[0] >> 1 & 0x1F);
> +	mipi_tx->rt_code[2] = ((buf[1] >> 17 & 0x1F) << 5) |
> +			      (buf[1] >> 22 & 0x1F);
> +	mipi_tx->rt_code[3] = ((buf[1] >> 7 & 0x1F) << 5) |
> +			      (buf[1] >> 12 & 0x1F);
> +	mipi_tx->rt_code[4] = ((buf[2] >> 27 & 0x1F) << 5) |
> +			      (buf[1] >> 2 & 0x1F);

Why not just save rt_code in nvmem and you don't need to translate here?
If you need to do so, please add description for this.

> +
> +	for (i = 0; i < 5; i++) {
> +		if ((mipi_tx->rt_code[i] & 0x1F) == 0)
> +			mipi_tx->rt_code[i] |= 0x10;
> +
> +		if ((mipi_tx->rt_code[i] >> 5 & 0x1F) == 0)
> +			mipi_tx->rt_code[i] |= 0x10 << 5;
> +
> +		for (j = 0; j < 10; j++) {
> +			mtk_mipi_tx_update_bits(mipi_tx,
> +				MIPITX_D2P_RTCODE * (i + 1) + j * 4,
> +				1, mipi_tx->rt_code[i] >> j & 1);
> +		}

There is only one statement in for-loop, so you could get rid of {}.

Regards,
CK

> +	}
> +
> +	kfree(buf);
> +	return 0;
> +}
> +
>  static void mtk_mipi_tx_power_on_signal(struct phy *phy)
>  {
>  	struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
> @@ -130,6 +191,8 @@ static void mtk_mipi_tx_power_on_signal(struct phy *phy)
>  				RG_DSI_HSTX_LDO_REF_SEL,
>  				mipi_tx->mipitx_drive << 6);
>  
> +	mtk_mipi_tx_config_calibration_data(mipi_tx);
> +
>  	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_CK_CKMODE_EN, DSI_CK_CKMODE_EN);
>  }
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
