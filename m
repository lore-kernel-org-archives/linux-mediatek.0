Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A1CC28CF5
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 04:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fO0c2mDNaPGLiCzCiDXaGcm0GReuxoM3vyeLpNOi2SU=; b=jewm/zbRKbV+vt
	7W86LSMOkVLu8CFkiv4MWGh4oEm6EtRIRjaGU6mk+QV4QKKUyN2WKcpPuQmEUpdFP4sBxCbUHk3gd
	oYWkQLnS9HtzT+4Sk02XTElepJyrJMDXZ8W1P8yq+A9vSAZKcVcJkrM/Qu3n0DS34bQzgIk5ygdb9
	sNDGQLCe6iLBoCapzwZ8oTkdJLZWd6ehH+00DeWWs00J4UpBFk/Df4WurWwKZFzc2DdKbvxvNkE7F
	IIhQnudDVk4ubtT2suCHw06GgKAjKdkN6k6r4pj4uHg+AFuXtq3kggWeK6bLJ81ieCg/ln7XawiuX
	k2PXE81KUBycFrVxkjvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCaDD-00A91C-Hb; Wed, 26 Jan 2022 04:47:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCaD0-00A90e-OM; Wed, 26 Jan 2022 04:47:04 +0000
X-UUID: 0f1d03b8f76340eda0467c0c42457be6-20220125
X-UUID: 0f1d03b8f76340eda0467c0c42457be6-20220125
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1327426715; Tue, 25 Jan 2022 21:46:59 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 20:43:21 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 Jan 2022 12:43:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 Jan 2022 12:43:18 +0800
Message-ID: <23915f6d4890d6c7115a01202b84b7aa63d51e36.camel@mediatek.com>
Subject: Re: [PATCH v14 09/12] soc: mediatek: add mtk-mutex support for
 mt8195 vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Wed, 26 Jan 2022 12:43:18 +0800
In-Reply-To: <6e23ceaac55d64b7c74c5ce6d7114936354c2011.camel@mediatek.com>
References: <20220107101425.6917-1-jason-jh.lin@mediatek.com>
 <20220107101425.6917-10-jason-jh.lin@mediatek.com>
 <6e23ceaac55d64b7c74c5ce6d7114936354c2011.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_204702_858727_99F5B380 
X-CRM114-Status: GOOD (  25.20  )
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
Cc: devicetree@vger.kernel.org, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, singo.chang@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 nancy.lin@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi CK,

Thanks for the reviews.

On Mon, 2022-01-24 at 17:13 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Fri, 2022-01-07 at 18:14 +0800, jason-jh.lin wrote:
> > Add mtk-mutex support for mt8195 vdosys0.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > Acked-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> > This patch is base on [1]
> > [1] Add mmsys and mutex support for MDP
> > - 
> > 
https://patchwork.kernel.org/project/linux-mediatek/cover/20220104091712.25670-1-moudy.ho@mediatek.com/
> > ---
> >  drivers/soc/mediatek/mtk-mutex.c | 95
> > +++++++++++++++++++++++++++++++-
> >  1 file changed, 92 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > b/drivers/soc/mediatek/mtk-mutex.c
> > index 615c42260a50..89daab7e6863 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -21,6 +21,9 @@
> >  #define MT8183_MUTEX0_MOD0			0x30
> >  #define MT8183_MUTEX0_SOF0			0x2c

[snip]

> >  
> > +static const unsigned int mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] = {
> > +	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> > +	[MUTEX_SOF_DSI0] = MT8195_MUTEX_SOF_DSI0 |
> > MT8195_MUTEX_EOF_DSI0,
> > +	[MUTEX_SOF_DSI1] = MT8195_MUTEX_SOF_DSI1 |
> > MT8195_MUTEX_EOF_DSI1,
> > +	[MUTEX_SOF_DPI0] = MT8195_MUTEX_SOF_DPI0 |
> > MT8195_MUTEX_EOF_DPI0,
> > +	[MUTEX_SOF_DPI1] = MT8195_MUTEX_SOF_DPI1 |
> > MT8195_MUTEX_EOF_DPI1,
> > +	[MUTEX_SOF_DP_INTF0] =
> > +		MT8195_MUTEX_SOF_DP_INTF0 | MT8195_MUTEX_EOF_DP_INTF0,
> 
> Why add EOF? Add comment for this.
> 
> Regards,
> CK
> 
OK, I' ll add this comment:

/*
 * To support refresh mode(video mode), DISP_REG_MUTEX_SOF should
 * select the EOF source and configure the EOF plus timing from the 
 * module that provides the timing signal.
 * So that MUTEX can not only send a STREAM_DONE event to GCE
 * but also detect the error at end of frame(EAEOF) when EOF signal
 * arrives.
 */

Regards,
Jason-JH.Lin

> > +	[MUTEX_SOF_DP_INTF1] =
> > +		MT8195_MUTEX_SOF_DP_INTF1 | MT8195_MUTEX_EOF_DP_INTF1,
> > +};
> > +
> >  static const struct mtk_mutex_data mt2701_mutex_driver_data = {
> >  	.mutex_mod = mt2701_mutex_mod,
> >  	.mutex_sof = mt2712_mutex_sof,
> > @@ -355,6 +431,13 @@ static const struct mtk_mutex_data
> > mt8192_mutex_driver_data = {
> >  	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> >  };
> >  
> > +static const struct mtk_mutex_data mt8195_mutex_driver_data = {
> > +	.mutex_mod = mt8195_mutex_mod,
> > +	.mutex_sof = mt8195_mutex_sof,
> > +	.mutex_mod_reg = MT8195_DISP_MUTEX0_MOD0,
> > +	.mutex_sof_reg = MT8195_DISP_MUTEX0_SOF,
> > +};
> > +
> >  struct mtk_mutex *mtk_mutex_get(struct device *dev)
> >  {
> >  	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> > @@ -442,6 +525,9 @@ void mtk_mutex_add_comp(struct mtk_mutex
> > *mutex,
> >  	case DDP_COMPONENT_DPI1:
> >  		sof_id = MUTEX_SOF_DPI1;
> >  		break;
> > +	case DDP_COMPONENT_DP_INTF0:
> > +		sof_id = MUTEX_SOF_DP_INTF0;
> > +		break;
> >  	default:
> >  		if (mtx->data->mutex_mod[id] < 32) {
> >  			offset = DISP_REG_MUTEX_MOD(mtx->data-
> > > mutex_mod_reg,
> > 
> > @@ -481,6 +567,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex
> > *mutex,
> >  	case DDP_COMPONENT_DSI3:
> >  	case DDP_COMPONENT_DPI0:
> >  	case DDP_COMPONENT_DPI1:
> > +	case DDP_COMPONENT_DP_INTF0:
> >  		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
> >  			       mtx->regs +
> >  			       DISP_REG_MUTEX_SOF(mtx->data-
> > > mutex_sof_reg,
> > 
> > @@ -678,6 +765,8 @@ static const struct of_device_id
> > mutex_driver_dt_match[] = {
> >  	  .data = &mt8183_mutex_driver_data},
> >  	{ .compatible = "mediatek,mt8192-disp-mutex",
> >  	  .data = &mt8192_mutex_driver_data},
> > +	{ .compatible = "mediatek,mt8195-disp-mutex",
> > +	  .data = &mt8195_mutex_driver_data},
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
> 
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
