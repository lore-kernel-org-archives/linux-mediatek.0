Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5289BC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 07:46:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E79D964DD8
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 07:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E79D964DD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JJ9QpUgj9HVg/OwnvLKdZGXE3NUdzU/Gq6QHqLQ10ms=; b=2NVF4M23mPvSSBPOXXqC2+R44
	E7DyON9kYP2da9AvpB78IXBOUPInLNleN7+MG/mv3oFudMAJvkbYxjQXZ5cII9P581fqnreJr4jLW
	l0FtiP26eximXvIEtXR2XwjdXeqPG74183rU97oBwajudUF+U6j+LvyCTFwVKCka84tduRpTUqahx
	wKH9t7vKgHF+CvYuuAOCZkUQvlQoi8KPn2+NY03Eb03n7JlU2xUGF5rueTptcntIzoS26/fGlDAY4
	F74b2kWPryIHRChwFCfi19u/5S9ekxYqNhxLDgqaKf+vWKl8axJo8b7EiOh8z8EnQigjnR/cLAbXM
	hkuijZepg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l520d-0003Ne-07; Thu, 28 Jan 2021 07:46:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l520a-0003N0-8G; Thu, 28 Jan 2021 07:46:29 +0000
X-UUID: 9ea9973547454bc1ab3600f0dd4ba0c0-20210127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=c9gdNjmeMqiUvuQwcv01PQ6DmCkI4yW/69ukd7Zj6m4=; 
 b=YIZBCaswfJP72ZJUkgw+CXFnVNnaWP0+plSb9QxiBXfmQzlH3Iz8bFXkMBAUFgr8ljOF0XWWnDiaY0obzljmPIDa8tdZVhlka4R9HomsADNKmfoejd7NHiL5Vpddjmp7eZ6y/glGV9xr0b3IbEDkYnbzoMblNpEegr21U0hrtsU=;
X-UUID: 9ea9973547454bc1ab3600f0dd4ba0c0-20210127
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 896170423; Wed, 27 Jan 2021 23:46:26 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 23:46:24 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 15:46:21 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 15:46:20 +0800
Message-ID: <1611819981.16091.6.camel@mtksdaap41>
Subject: Re: [PATCH v11 8/9] soc: mediatek: add mtk mutex support for MT8183
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 15:46:21 +0800
In-Reply-To: <20210128072802.830971-9-hsinyi@chromium.org>
References: <20210128072802.830971-1-hsinyi@chromium.org>
 <20210128072802.830971-9-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DCECC5BE7E61B5432AE1222A77586C89CDAD526E3E8AD7EF97E91E585D2340E82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_024628_522872_E56D5FF7 
X-CRM114-Status: GOOD (  18.63  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Hsin-Yi:

On Thu, 2021-01-28 at 15:28 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Add mtk mutex support for MT8183 SoC.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/soc/mediatek/mtk-mutex.c | 50 ++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index f531b119da7a9..b348f962f82a4 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -14,6 +14,8 @@
>  
>  #define MT2701_MUTEX0_MOD0			0x2c
>  #define MT2701_MUTEX0_SOF0			0x30
> +#define MT8183_DISP_MUTEX0_MOD0			0x30
> +#define MT8183_DISP_MUTEX0_SOF0			0x2c

Modify 'DISP_MUTEX' to 'MUTEX'

Regards,
CK

>  
>  #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
>  #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
> @@ -37,6 +39,18 @@
>  #define MT8167_MUTEX_MOD_DISP_DITHER		15
>  #define MT8167_MUTEX_MOD_DISP_UFOE		16
>  
> +#define MT8183_MUTEX_MOD_DISP_RDMA0		0
> +#define MT8183_MUTEX_MOD_DISP_RDMA1		1
> +#define MT8183_MUTEX_MOD_DISP_OVL0		9
> +#define MT8183_MUTEX_MOD_DISP_OVL0_2L		10
> +#define MT8183_MUTEX_MOD_DISP_OVL1_2L		11
> +#define MT8183_MUTEX_MOD_DISP_WDMA0		12
> +#define MT8183_MUTEX_MOD_DISP_COLOR0		13
> +#define MT8183_MUTEX_MOD_DISP_CCORR0		14
> +#define MT8183_MUTEX_MOD_DISP_AAL0		15
> +#define MT8183_MUTEX_MOD_DISP_GAMMA0		16
> +#define MT8183_MUTEX_MOD_DISP_DITHER0		17
> +
>  #define MT8173_MUTEX_MOD_DISP_OVL0		11
>  #define MT8173_MUTEX_MOD_DISP_OVL1		12
>  #define MT8173_MUTEX_MOD_DISP_RDMA0		13
> @@ -87,6 +101,11 @@
>  #define MT2712_MUTEX_SOF_DSI3			6
>  #define MT8167_MUTEX_SOF_DPI0			2
>  #define MT8167_MUTEX_SOF_DPI1			3
> +#define MT8183_MUTEX_SOF_DSI0			1
> +#define MT8183_MUTEX_SOF_DPI0			2
> +
> +#define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
> +#define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
>  
>  struct mtk_mutex {
>  	int id;
> @@ -181,6 +200,20 @@ static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
>  };
>  
> +static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> +	[DDP_COMPONENT_AAL0] = MT8183_MUTEX_MOD_DISP_AAL0,
> +	[DDP_COMPONENT_CCORR] = MT8183_MUTEX_MOD_DISP_CCORR0,
> +	[DDP_COMPONENT_COLOR0] = MT8183_MUTEX_MOD_DISP_COLOR0,
> +	[DDP_COMPONENT_DITHER] = MT8183_MUTEX_MOD_DISP_DITHER0,
> +	[DDP_COMPONENT_GAMMA] = MT8183_MUTEX_MOD_DISP_GAMMA0,
> +	[DDP_COMPONENT_OVL0] = MT8183_MUTEX_MOD_DISP_OVL0,
> +	[DDP_COMPONENT_OVL_2L0] = MT8183_MUTEX_MOD_DISP_OVL0_2L,
> +	[DDP_COMPONENT_OVL_2L1] = MT8183_MUTEX_MOD_DISP_OVL1_2L,
> +	[DDP_COMPONENT_RDMA0] = MT8183_MUTEX_MOD_DISP_RDMA0,
> +	[DDP_COMPONENT_RDMA1] = MT8183_MUTEX_MOD_DISP_RDMA1,
> +	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
> +};
> +
>  static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>  	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>  	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
> @@ -198,6 +231,13 @@ static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>  	[MUTEX_SOF_DPI1] = MT8167_MUTEX_SOF_DPI1,
>  };
>  
> +/* Add EOF setting so overlay hardware can receive frame done irq */
> +static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> +	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> +	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
> +	[MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
> +};
> +
>  static const struct mtk_mutex_data mt2701_mutex_driver_data = {
>  	.mutex_mod = mt2701_mutex_mod,
>  	.mutex_sof = mt2712_mutex_sof,
> @@ -227,6 +267,14 @@ static const struct mtk_mutex_data mt8173_mutex_driver_data = {
>  	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
>  };
>  
> +static const struct mtk_mutex_data mt8183_mutex_driver_data = {
> +	.mutex_mod = mt8183_mutex_mod,
> +	.mutex_sof = mt8183_mutex_sof,
> +	.mutex_mod_reg = MT8183_DISP_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT8183_DISP_MUTEX0_SOF0,
> +	.no_clk = true,
> +};
> +
>  struct mtk_mutex *mtk_mutex_get(struct device *dev)
>  {
>  	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> @@ -457,6 +505,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
>  	  .data = &mt8167_mutex_driver_data},
>  	{ .compatible = "mediatek,mt8173-disp-mutex",
>  	  .data = &mt8173_mutex_driver_data},
> +	{ .compatible = "mediatek,mt8183-disp-mutex",
> +	  .data = &mt8183_mutex_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
