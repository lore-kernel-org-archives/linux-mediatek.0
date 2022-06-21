Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27D4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 02:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfyFfu1h+0xdUu5CAycMjDSxCWC+K4ZoeYHbOdSXryY=; b=piZwMe+cAM1zjDOH5Whf6zwzaM
	wL7WL4Ac5AHsIR+Nnkt44Iyg49MnD7gtH5fAG1fqhcEEY1MpvIbgmxlsFVz7zBaN/C+S69Q95ggvt
	NoRE5HtfXIjtejmNq9E2lF0lwGvJuvKoLQizz2MUDC/DcAqrpcpZZGYXSFicMlg+YflwY0t+9hseq
	kO3Hw+fgtuEu6/AK5nNx2dpRvaR0LOcuOuK2pVwdUz0xvt7hCo0X4XNN4pz+HdJ9lvr29dG7qBOuC
	29+p09ildlafzkXLpi+E+K05R6P2bZ4i8HCOSsmcRhdQJHwjDrQZUVben8TC2dRgJga+zd9WNbLYI
	FJPqkM9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3U2u-003JQR-Vc; Tue, 21 Jun 2022 02:55:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3U2s-003JPm-5y; Tue, 21 Jun 2022 02:55:15 +0000
X-UUID: 6d1a7ceb5ab24c939437e65a5fea8445-20220620
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:6f893f33-b8f2-447b-a034-bfb8222d5b3b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:717a9445-8aeb-4699-8d4d-d8df2108d8fb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 6d1a7ceb5ab24c939437e65a5fea8445-20220620
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 397540595; Mon, 20 Jun 2022 19:55:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jun 2022 19:55:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 21 Jun 2022 10:55:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 21 Jun 2022 10:55:06 +0800
Message-ID: <218de671054a2c02d47a0bb4a31a0b07d24d7eee.camel@mediatek.com>
Subject: Re: [PATCH v12 11/14] drm/mediatek: dpi: Add tvd_clk enable/disable
 flow
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 21 Jun 2022 10:55:05 +0800
In-Reply-To: <20220620121028.29234-12-rex-bc.chen@mediatek.com>
References: <20220620121028.29234-1-rex-bc.chen@mediatek.com>
	 <20220620121028.29234-12-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_195514_276770_BE538105 
X-CRM114-Status: GOOD (  19.13  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Bo-Chen:

On Mon, 2022-06-20 at 20:10 +0800, Bo-Chen Chen wrote:
> We should enable/disable tvd_clk when power_on/power_off, so add this
> patch to do this.

Without this patch, what would happen?
It seems this patch is redundant for these SoCs:

static const struct of_device_id mtk_dpi_of_ids[] = {
	{ .compatible = "mediatek,mt2701-dpi",
	  .data = &mt2701_conf,
	},
	{ .compatible = "mediatek,mt8173-dpi",
	  .data = &mt8173_conf,
	},
	{ .compatible = "mediatek,mt8183-dpi",
	  .data = &mt8183_conf,
	},
	{ .compatible = "mediatek,mt8192-dpi",
	  .data = &mt8192_conf,
	},
	{ },
};

Regards,
CK


> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 2717b1741b7a..f83ecb154457 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -455,6 +455,7 @@ static void mtk_dpi_power_off(struct mtk_dpi
> *dpi)
>  	mtk_dpi_disable(dpi);
>  	clk_disable_unprepare(dpi->pixel_clk);
>  	clk_disable_unprepare(dpi->engine_clk);
> +	clk_disable_unprepare(dpi->tvd_clk);
>  }
>  
>  static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> @@ -464,10 +465,16 @@ static int mtk_dpi_power_on(struct mtk_dpi
> *dpi)
>  	if (++dpi->refcount != 1)
>  		return 0;
>  
> +	ret = clk_prepare_enable(dpi->tvd_clk);
> +	if (ret) {
> +		dev_err(dpi->dev, "Failed to enable tvd pll: %d\n",
> ret);
> +		goto err_refcount;
> +	}
> +
>  	ret = clk_prepare_enable(dpi->engine_clk);
>  	if (ret) {
>  		dev_err(dpi->dev, "Failed to enable engine clock:
> %d\n", ret);
> -		goto err_refcount;
> +		goto err_engine;
>  	}
>  
>  	ret = clk_prepare_enable(dpi->pixel_clk);
> @@ -484,6 +491,8 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>  
>  err_pixel:
>  	clk_disable_unprepare(dpi->engine_clk);
> +err_engine:
> +	clk_disable_unprepare(dpi->tvd_clk);
>  err_refcount:
>  	dpi->refcount--;
>  	return ret;


