Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BD9C19F2D
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Aug 2022 08:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEqeMCYw5b9KhVve378Sy7vFdIoCHC0mooehECOFz+c=; b=BYL3yhjvifTmLEQT0v9pXcEAFs
	wLB90cvLJ/m5i0S9cVQ5ws3qmcEzj/UtpG44IXR9Ibmv76duslLUcdXY19vscHFswPR8fel2jWaMt
	RTsG75kv7TmabQU30MupMYssi/0987vVeOilgIkOTJ1QvWDTKSJ8SLPdBr2qJRIQL9Pu5STp95XZb
	kGBKX0R0E/qYNvJ78TFRa1OqkGt7qhDl+CY4+GDssDk6yfNtR6dTY/dMrrahBipwz+rACJMmEqxEz
	Wo1lpSbvHGSuECJeQmTH+spbApchmkS3C95Pf2iTWGJX8PU3Lt/EvLDzRrF9k+KVkxG3deMIfmUkI
	6uxA27jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLKU3-002jdR-Kk; Tue, 09 Aug 2022 08:21:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLKU0-002jbt-Qe; Tue, 09 Aug 2022 08:21:02 +0000
X-UUID: 6715ad15596149c2bf2672b16cb2cd85-20220809
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:a10b3f99-08fe-46d9-bdcb-2e449764bbe4,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:57bf289c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6715ad15596149c2bf2672b16cb2cd85-20220809
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 456238435; Tue, 09 Aug 2022 01:17:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 9 Aug 2022 15:57:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 9 Aug 2022 15:57:18 +0800
Message-ID: <6f067d36efffab65490348704bb892252cc400ef.camel@mediatek.com>
Subject: Re: [PATCH v16 3/8] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "mripard@kernel.org"
	<mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "deller@gmx.de"
	<deller@gmx.de>, "airlied@linux.ie" <airlied@linux.ie>
CC: "msp@baylibre.com" <msp@baylibre.com>, "granquet@baylibre.com"
	<granquet@baylibre.com>, Jitao Shi
 =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?= <jitao.shi@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, LiangXu Xu
 =?UTF-8?Q?=28=E5=BE=90=E4=BA=AE=29?= <LiangXu.Xu@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-fbdev@vger.kernel.org"
	<linux-fbdev@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 9 Aug 2022 15:57:18 +0800
In-Reply-To: <d9eb673132f643e39caeb422309bf4315f0c136e.camel@mediatek.com>
References: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
	 <20220805101459.3386-4-rex-bc.chen@mediatek.com>
	 <d9eb673132f643e39caeb422309bf4315f0c136e.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_012100_880632_9EC005AE 
X-CRM114-Status: GOOD (  33.82  )
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

On Mon, 2022-08-08 at 13:46 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Fri, 2022-08-05 at 18:14 +0800, Bo-Chen Chen wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > This patch adds a embedded displayport driver for the MediaTek
> > mt8195
> > SoC.
> > 
> > It supports the MT8195, the embedded DisplayPort units. It offers
> > DisplayPort 1.4 with up to 4 lanes.
> > 
> > The driver creates a child device for the phy. The child device
> > will
> > never exist without the parent being active. As they are sharing a
> > register range, the parent passes a regmap pointer to the child so
> > that
> > both can work with the same register range. The phy driver sets
> > device
> > data that is read by the parent to get the phy device that can be
> > used
> > to control the phy properties.
> > 
> > This driver is based on an initial version by
> > Jitao shi <jitao.shi@mediatek.com>
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > Tested-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> 
> [snip]
> 
> > +
> > +static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
> > +{
> > +	struct mtk_dp *mtk_dp = dev;
> > +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> > +	u32 irq_status;
> > +
> > +	irq_status = mtk_dp_read(mtk_dp, MTK_DP_TOP_IRQ_STATUS);
> > +
> > +	if (!(irq_status & RGS_IRQ_STATUS_TRANSMITTER))
> > +		return IRQ_HANDLED;
> 
> If one of MTK_DP_HPD_INTERRUPT, MTK_DP_HPD_CONNECT,
> MTK_DP_HPD_DISCONNECT exist, does it imply RGS_IRQ_STATUS_TRANSMITTER
> exist? If so, I think this checking is redundant because we could
> directly check MTK_DP_HPD_INTERRUPT, MTK_DP_HPD_CONNECT,
> MTK_DP_HPD_DISCONNECT.
> 

Hello CK,

After checking with Jitao, we can remove this check and use
mtk_dp_swirq_get_clear|mtk_dp_hwirq_get_clear directly.

> > +
> > +	irq_status = mtk_dp_swirq_get_clear(mtk_dp) |
> > +		     mtk_dp_hwirq_get_clear(mtk_dp);
> > +
> > +	if (!irq_status)
> > +		return IRQ_HANDLED;
> > +
> > +	if (irq_status & MTK_DP_HPD_INTERRUPT)
> > +		train_info->hpd_inerrupt = true;
> 
> train_info->hpd_inerrupt is useless, so drop it.
> 
> > +
> > +	if (!(irq_status & MTK_DP_HPD_CONNECT ||
> > +	      irq_status & MTK_DP_HPD_DISCONNECT))
> > +		return IRQ_WAKE_THREAD;
> 
> this could be changed to
> 
> if (irq_status == MTK_DP_HPD_INTERRUPT)
> 	return IRQ_WAKE_THREAD;
> 
> But I find one problem. If irq_status == MTK_DP_HPD_INTERRUPT |
> MTK_DP_HPD_CONNECT, the thread would not be waked up. Is this what
> you
> want?
> 
> Regards,
> CK
> 

It is possible we will encounter (irq_status & MTK_DP_HPD_CONNECT) &&
(irq_status & MTK_DP_HPD_INTERRUPT)

So I will modify like this:

if (!(irq_status & MTK_DP_HPD_CONNECT ||
      irq_status & MTK_DP_HPD_DISCONNECT))
	return IRQ_WAKE_THREAD;

xxxxxx

if (irq_status & MTK_DP_HPD_INTERRUPT &&
    irq_status & MTK_DP_HPD_CONNECT)
	return IRQ_WAKE_THREAD;

return IRQ_HANDLED;

BRs,
Bo-Chen
> > +
> > +	if (!!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
> > +	       HPD_DB_DP_TRANS_P0_MASK))
> > +		train_info->cable_plugged_in = true;
> > +	else
> > +		train_info->cable_plugged_in = false;
> > +
> > +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> > +			   DP_PWR_STATE_BANDGAP_TPLL_LANE,
> > +			   DP_PWR_STATE_MASK);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> 
> 


