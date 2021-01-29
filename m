Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEE2C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 08:53:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3619364E13
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 08:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3619364E13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vDcSvlI0dZE/UcVYJzao/zdNvsJ1rsIOuMABZSOjNpM=; b=3c9Cc3RiTnPMsACreMBpct9H+
	Mld5WwShwJDwUKGD651PYYMKv9WO3WyAhMiYUldNIHgJj5xyI9EJ9/DoNqwaytgi9EPKebn+hNhYo
	J6eG0L5tfXWYfeqL/b3zko/M99dmqVFpHicMO5HhGhQCDpzb5/3bYd7+FARAfSGz/SsuoAiNLLj8D
	6rIBf19Hj2Ckw5PDL5Hy/u1aVhTjknu0UIpz+dhRdwJMDVhFzNgIcr7js+7Eue8BvsIylptN0xTqA
	a4tN5dlpWJNP8hgTvoc3+U/9l+2jE2Q+UjI8XPc54BcErNHPoRHBHU9P12dS6emofq4goywIGg5nN
	b4Iadu/lQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5PWX-0000X8-IM; Fri, 29 Jan 2021 08:53:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5PWV-0000Vr-Lx; Fri, 29 Jan 2021 08:53:00 +0000
X-UUID: 5f58b8f94e2245a597aebd4bf2c18475-20210129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/3q0mlOu7gJgzrpK4SZhxTaGZhiKC2GOEb6iu7kvGeI=; 
 b=niCTxVpwcBk5LmbVz8HTpPina/b7P6pyf3Vc0XqxqyChdGDfwtFFLBFVEPrZNtXaSNCSa5yXfNiDChngpFWoGsWITcBw+OdUc8Otlvy3b1WmqEFsMCeh+udaJFD2LfrPwUUmOWrJp5FkX2vJNgT/Qo4jBSBpjCzfdA6ZyUJ7CwI=;
X-UUID: 5f58b8f94e2245a597aebd4bf2c18475-20210129
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 395976169; Fri, 29 Jan 2021 00:52:57 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 00:42:54 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 16:42:51 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Jan 2021 16:42:51 +0800
Message-ID: <1611909770.31184.12.camel@mtksdaap41>
Subject: Re: [PATCH v4 7/8] soc: mediatek: add mtk mutex support for MT8192
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 29 Jan 2021 16:42:50 +0800
In-Reply-To: <20210129073436.2429834-8-hsinyi@chromium.org>
References: <20210129073436.2429834-1-hsinyi@chromium.org>
 <20210129073436.2429834-8-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B39B3CC9B666C24300CC1958077EE6675F149E906B4AEB7FCECA4F46F3A9BF782000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_035259_857086_52578905 
X-CRM114-Status: GOOD (  16.62  )
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

On Fri, 2021-01-29 at 15:34 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Add mtk mutex support for MT8192 SoC.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/soc/mediatek/mtk-mutex.c | 35 ++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 718a41beb6afb..dfd9806d5a001 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -39,6 +39,18 @@
>  #define MT8167_MUTEX_MOD_DISP_DITHER		15
>  #define MT8167_MUTEX_MOD_DISP_UFOE		16
>  
> +#define MT8192_MUTEX_MOD_DISP_OVL0		0
> +#define MT8192_MUTEX_MOD_DISP_OVL0_2L		1
> +#define MT8192_MUTEX_MOD_DISP_RDMA0		2
> +#define MT8192_MUTEX_MOD_DISP_COLOR0		4
> +#define MT8192_MUTEX_MOD_DISP_CCORR0		5
> +#define MT8192_MUTEX_MOD_DISP_AAL0		6
> +#define MT8192_MUTEX_MOD_DISP_GAMMA0		7
> +#define MT8192_MUTEX_MOD_DISP_POSTMASK0		8
> +#define MT8192_MUTEX_MOD_DISP_DITHER0		9
> +#define MT8192_MUTEX_MOD_DISP_OVL2_2L		16
> +#define MT8192_MUTEX_MOD_DISP_RDMA4		17
> +
>  #define MT8183_MUTEX_MOD_DISP_RDMA0		0
>  #define MT8183_MUTEX_MOD_DISP_RDMA1		1
>  #define MT8183_MUTEX_MOD_DISP_OVL0		9
> @@ -214,6 +226,20 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
>  };
>  
> +static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> +	[DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
> +	[DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
> +	[DDP_COMPONENT_COLOR0] = MT8192_MUTEX_MOD_DISP_COLOR0,
> +	[DDP_COMPONENT_DITHER] = MT8192_MUTEX_MOD_DISP_DITHER0,
> +	[DDP_COMPONENT_GAMMA] = MT8192_MUTEX_MOD_DISP_GAMMA0,
> +	[DDP_COMPONENT_POSTMASK0] = MT8192_MUTEX_MOD_DISP_POSTMASK0,
> +	[DDP_COMPONENT_OVL0] = MT8192_MUTEX_MOD_DISP_OVL0,
> +	[DDP_COMPONENT_OVL_2L0] = MT8192_MUTEX_MOD_DISP_OVL0_2L,
> +	[DDP_COMPONENT_OVL_2L2] = MT8192_MUTEX_MOD_DISP_OVL2_2L,
> +	[DDP_COMPONENT_RDMA0] = MT8192_MUTEX_MOD_DISP_RDMA0,
> +	[DDP_COMPONENT_RDMA4] = MT8192_MUTEX_MOD_DISP_RDMA4,
> +};
> +
>  static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>  	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>  	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
> @@ -275,6 +301,13 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
>  	.no_clk = true,
>  };
>  
> +static const struct mtk_mutex_data mt8192_mutex_driver_data = {
> +	.mutex_mod = mt8192_mutex_mod,
> +	.mutex_sof = mt8183_mutex_sof,
> +	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> +};
> +
>  struct mtk_mutex *mtk_mutex_get(struct device *dev)
>  {
>  	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> @@ -507,6 +540,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
>  	  .data = &mt8173_mutex_driver_data},
>  	{ .compatible = "mediatek,mt8183-disp-mutex",
>  	  .data = &mt8183_mutex_driver_data},
> +	{ .compatible = "mediatek,mt8192-disp-mutex",
> +	  .data = &mt8192_mutex_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
