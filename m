Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E3DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 04:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/kIt8YGhHvNDlb5aEtV7ZGwvTVdCgXp+vKzBahKiF0=; b=JLiBp9x6BIX9hiW4Ixi8hXg/cG
	sJ5X8sA7/dfmKuxwoPn4q1sm8jsOrgkhKtcqkF+U1Pb6Oer/rn2oOYny2K/nXgjspsWljNc4FDm0H
	FYw6SVlnmSDuGczhVmUM5tfcsZFpvqzXf89x1NJe4DniPlNCcYKehsoWWqcDAaU4oxIoFxWazkHaa
	Atf02v41yYpAMqK+r5dmu5ymS5jV7ALwYdwXKYq+aYt+WpjtZcx0xoD30iwL2LsvOfnYFWDAjG9DT
	+788oeYOsPHysX89VHYU+q2E1jAWty7SFK1KQpwNDH4tio6Dn6X1j3eb8I8TD03inMrsZsbUWfWSk
	o0fGGNfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ZsL-00EN1S-OG; Tue, 05 Jul 2022 04:09:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ZsB-00EMyu-6s; Tue, 05 Jul 2022 04:09:16 +0000
X-UUID: 9596cb4d4b70403cbc75af417556be51-20220704
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:45b17b21-ba3e-4ae5-b0a9-0266d79e3a8e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:dbb96b63-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 9596cb4d4b70403cbc75af417556be51-20220704
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1841362732; Mon, 04 Jul 2022 21:09:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 5 Jul 2022 11:48:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 5 Jul 2022 11:48:31 +0800
Message-ID: <20a5ac6a0e089a11f82f2d6eaa303a775b11e3a3.camel@mediatek.com>
Subject: Re: [PATCH v15 04/16] drm/mediatek: dpi: Remove output format of YUV
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<xinlei.lee@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 5 Jul 2022 11:48:31 +0800
In-Reply-To: <20220701035845.16458-5-rex-bc.chen@mediatek.com>
References: <20220701035845.16458-1-rex-bc.chen@mediatek.com>
	 <20220701035845.16458-5-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_210915_299679_11D85CA3 
X-CRM114-Status: GOOD (  15.82  )
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

On Fri, 2022-07-01 at 11:58 +0800, Bo-Chen Chen wrote:
> DPI is not support output format as YUV, but there is the setting of
> configuring output YUV. Therefore, remove them in this patch.

Applied to mediatek-drm-next [1], thanks.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Regards,
CK

> 
> Fixes: 9e629c17aa8d ("drm/mediatek: Add DPI sub driver")
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 31 ++++++--------------------
> ----
>  1 file changed, 6 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index f66a121ba0c9..3473ee18ad97 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -54,13 +54,7 @@ enum mtk_dpi_out_channel_swap {
>  };
>  
>  enum mtk_dpi_out_color_format {
> -	MTK_DPI_COLOR_FORMAT_RGB,
> -	MTK_DPI_COLOR_FORMAT_RGB_FULL,
> -	MTK_DPI_COLOR_FORMAT_YCBCR_444,
> -	MTK_DPI_COLOR_FORMAT_YCBCR_422,
> -	MTK_DPI_COLOR_FORMAT_XV_YCC,
> -	MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL,
> -	MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
> +	MTK_DPI_COLOR_FORMAT_RGB
>  };
>  
>  struct mtk_dpi {
> @@ -373,24 +367,11 @@ static void mtk_dpi_config_disable_edge(struct
> mtk_dpi *dpi)
>  static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
>  					enum mtk_dpi_out_color_format
> format)
>  {
> -	if ((format == MTK_DPI_COLOR_FORMAT_YCBCR_444) ||
> -	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
> -		mtk_dpi_config_yuv422_enable(dpi, false);
> -		mtk_dpi_config_csc_enable(dpi, true);
> -		mtk_dpi_config_swap_input(dpi, false);
> -		mtk_dpi_config_channel_swap(dpi,
> MTK_DPI_OUT_CHANNEL_SWAP_BGR);
> -	} else if ((format == MTK_DPI_COLOR_FORMAT_YCBCR_422) ||
> -		   (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
> -		mtk_dpi_config_yuv422_enable(dpi, true);
> -		mtk_dpi_config_csc_enable(dpi, true);
> -		mtk_dpi_config_swap_input(dpi, true);
> -		mtk_dpi_config_channel_swap(dpi,
> MTK_DPI_OUT_CHANNEL_SWAP_RGB);
> -	} else {
> -		mtk_dpi_config_yuv422_enable(dpi, false);
> -		mtk_dpi_config_csc_enable(dpi, false);
> -		mtk_dpi_config_swap_input(dpi, false);
> -		mtk_dpi_config_channel_swap(dpi,
> MTK_DPI_OUT_CHANNEL_SWAP_RGB);
> -	}
> +	/* only support RGB888 */
> +	mtk_dpi_config_yuv422_enable(dpi, false);
> +	mtk_dpi_config_csc_enable(dpi, false);
> +	mtk_dpi_config_swap_input(dpi, false);
> +	mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
>  }
>  
>  static void mtk_dpi_dual_edge(struct mtk_dpi *dpi)


