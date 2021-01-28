Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F596C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 06:20:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A39266146D
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 06:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A39266146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q9feQZB5KAihw/kREQ40hfolHs4O+TeKSTtb7Fw9VaU=; b=N2pVWmUJ3WXPY3OSb1/bjbkZs
	PnvrwyOs2plKuOyOWVSRNv5a0GhQURLAMPi5JOWekZvP14j0hrftMtadAIr2V2bCIE0cb47EMqUg5
	m1nh87BoC5o2liz37XOAfmBY/qGKJQaFik1OzLVgz4c9fSLmlA7eLEqcV7tkzBChqW2haKvdXsAxZ
	uevYJ7PInvWwMYBgzyC/jMCdFOCjmBlbT0SZBMq/AC1gI7iTHQfgx3Sjn1Ev36+T4t6DYaZGK8pmg
	gEbjVFHGGpLG56l6hG5yWbwMdxkJE4G1rQ36n27HZktxxpguUYsocv8sPcdrn5htIxH6Dprx6aW+k
	yX3XjXK1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l50ew-0002jx-4p; Thu, 28 Jan 2021 06:20:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l50et-0002j1-KM; Thu, 28 Jan 2021 06:20:00 +0000
X-UUID: 1be82dc253374de7900db615a50760fe-20210127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9l/3qxAZieqX345ryvbLhbIWYhgxrPRb06fzhqIsH4I=; 
 b=d7v5tLSxniZ5xBAoXnZJQv8bRx0TJIQBoyfXzNGUDXFsg6J8Jaqv0Avr/h8yiLqMy6XUOuVZG6bE1LVb80xeKxrXsOmS1v6xECZkv+b42I+C5kdJ4lMaFV6mji8NhwuyHyScDjFput8Euf/1dXzIeRik2+8VbJTio6e0eQrCWTw=;
X-UUID: 1be82dc253374de7900db615a50760fe-20210127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 161931991; Wed, 27 Jan 2021 22:19:56 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 22:19:55 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 14:19:51 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 14:19:52 +0800
Message-ID: <1611814791.28312.12.camel@mtksdaap41>
Subject: Re: [PATCH v10 8/9] drm/mediatek: add DDP support for MT8183
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 14:19:51 +0800
In-Reply-To: <1611814421.28312.9.camel@mtksdaap41>
References: <20210127045422.2418917-1-hsinyi@chromium.org>
 <20210127045422.2418917-9-hsinyi@chromium.org>
 <1611814421.28312.9.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6B1B6152A535CF41E1E99F1F5C98B01A2969156BDD91B00DC1A7E800C4434FCC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_011959_857504_539FF68B 
X-CRM114-Status: GOOD (  22.57  )
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2021-01-28 at 14:13 +0800, CK Hu wrote:
> Hi, Hsin-Yi:
> 
> Modify the title's prefix to 'soc: mediatek:'

Modify more, the title should be 'soc: mediatek: add mtk mutex support
for MT8183'

> 
> On Wed, 2021-01-27 at 12:54 +0800, Hsin-Yi Wang wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > 
> > Add DDP support for MT8183 SoC.
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/soc/mediatek/mtk-mutex.c | 50 ++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> > index f531b119da7a9..f64e9c33e85ad 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -14,6 +14,8 @@
> >  
> >  #define MT2701_MUTEX0_MOD0			0x2c
> >  #define MT2701_MUTEX0_SOF0			0x30
> > +#define MT8183_DISP_MUTEX0_MOD0			0x30
> > +#define MT8183_DISP_MUTEX0_SOF0			0x2c
> 
> Modify 'DISP_MUTEX' to 'MUTEX'
> 
> >  
> >  #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
> >  #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
> > @@ -37,6 +39,18 @@
> >  #define MT8167_MUTEX_MOD_DISP_DITHER		15
> >  #define MT8167_MUTEX_MOD_DISP_UFOE		16
> >  
> > +#define MT8183_MUTEX_MOD_DISP_RDMA0		0
> > +#define MT8183_MUTEX_MOD_DISP_RDMA1		1
> > +#define MT8183_MUTEX_MOD_DISP_OVL0		9
> > +#define MT8183_MUTEX_MOD_DISP_OVL0_2L		10
> > +#define MT8183_MUTEX_MOD_DISP_OVL1_2L		11
> > +#define MT8183_MUTEX_MOD_DISP_WDMA0		12
> > +#define MT8183_MUTEX_MOD_DISP_COLOR0		13
> > +#define MT8183_MUTEX_MOD_DISP_CCORR0		14
> > +#define MT8183_MUTEX_MOD_DISP_AAL0		15
> > +#define MT8183_MUTEX_MOD_DISP_GAMMA0		16
> > +#define MT8183_MUTEX_MOD_DISP_DITHER0		17
> > +
> >  #define MT8173_MUTEX_MOD_DISP_OVL0		11
> >  #define MT8173_MUTEX_MOD_DISP_OVL1		12
> >  #define MT8173_MUTEX_MOD_DISP_RDMA0		13
> > @@ -87,6 +101,12 @@
> >  #define MT2712_MUTEX_SOF_DSI3			6
> >  #define MT8167_MUTEX_SOF_DPI0			2
> >  #define MT8167_MUTEX_SOF_DPI1			3
> > +#define MT8183_MUTEX_SOF_DSI0			1
> > +#define MT8183_MUTEX_SOF_DPI0			2
> > +
> > +/* Add EOF setting so overlay hardware can receive frame done irq */
> > +#define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
> > +#define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
> >  
> >  struct mtk_mutex {
> >  	int id;
> > @@ -181,6 +201,20 @@ static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> >  	[DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
> >  };
> >  
> > +static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> > +	[DDP_COMPONENT_AAL0] = MT8183_MUTEX_MOD_DISP_AAL0,
> > +	[DDP_COMPONENT_CCORR] = MT8183_MUTEX_MOD_DISP_CCORR0,
> > +	[DDP_COMPONENT_COLOR0] = MT8183_MUTEX_MOD_DISP_COLOR0,
> > +	[DDP_COMPONENT_DITHER] = MT8183_MUTEX_MOD_DISP_DITHER0,
> > +	[DDP_COMPONENT_GAMMA] = MT8183_MUTEX_MOD_DISP_GAMMA0,
> > +	[DDP_COMPONENT_OVL0] = MT8183_MUTEX_MOD_DISP_OVL0,
> > +	[DDP_COMPONENT_OVL_2L0] = MT8183_MUTEX_MOD_DISP_OVL0_2L,
> > +	[DDP_COMPONENT_OVL_2L1] = MT8183_MUTEX_MOD_DISP_OVL1_2L,
> > +	[DDP_COMPONENT_RDMA0] = MT8183_MUTEX_MOD_DISP_RDMA0,
> > +	[DDP_COMPONENT_RDMA1] = MT8183_MUTEX_MOD_DISP_RDMA1,
> > +	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
> > +};
> > +
> >  static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> >  	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> >  	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
> > @@ -198,6 +232,12 @@ static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> >  	[MUTEX_SOF_DPI1] = MT8167_MUTEX_SOF_DPI1,
> >  };
> >  
> > +static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> > +	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> > +	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
> > +	[MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
> 
> According to discussion in [1], add comment for the odd EOF setting.
> 
> [1]
> https://patchwork.kernel.org/project/linux-mediatek/patch/1595469798-3824-8-git-send-email-yongqiang.niu@mediatek.com/
> 
> Regards,
> CK.
> 
> 
> > +};
> > +
> >  static const struct mtk_mutex_data mt2701_mutex_driver_data = {
> >  	.mutex_mod = mt2701_mutex_mod,
> >  	.mutex_sof = mt2712_mutex_sof,
> > @@ -227,6 +267,14 @@ static const struct mtk_mutex_data mt8173_mutex_driver_data = {
> >  	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
> >  };
> >  
> > +static const struct mtk_mutex_data mt8183_mutex_driver_data = {
> > +	.mutex_mod = mt8183_mutex_mod,
> > +	.mutex_sof = mt8183_mutex_sof,
> > +	.mutex_mod_reg = MT8183_DISP_MUTEX0_MOD0,
> > +	.mutex_sof_reg = MT8183_DISP_MUTEX0_SOF0,
> > +	.no_clk = true,
> > +};
> > +
> >  struct mtk_mutex *mtk_mutex_get(struct device *dev)
> >  {
> >  	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> > @@ -457,6 +505,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
> >  	  .data = &mt8167_mutex_driver_data},
> >  	{ .compatible = "mediatek,mt8173-disp-mutex",
> >  	  .data = &mt8173_mutex_driver_data},
> > +	{ .compatible = "mediatek,mt8183-disp-mutex",
> > +	  .data = &mt8183_mutex_driver_data},
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
