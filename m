Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B57C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 08:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06dqVaiUdOHQGgTipX+bfEwyp+KMVYkzO7ZTntThuxw=; b=FEd8sK6M6AOsO8TnIjPDWXpc6J
	5jlRayNHFJSirQjprbub849vMUsWg/aLZtSTM0+3ATHlP+kxF0SuhwNJavN50B/q9O2v9pIhKynxe
	J0B0wcp/u7Q11meeGFNXLxvho7mLo2LoA5tdUY8Wn45OGCcNbEQAi92N+bQd2AUbG6BQH3kulur7D
	lwpqJAzgR7vpkaGiRaYablo0+YWpEmRtocZbVyAhYTVIr51Ia0BnCpEX/eqXtAQNd+tE5cFFqDGp+
	cpzpfIj1+cgN87nFQikrO5LVuKHu7R4vcyAnqRcRN9aFDjnkyF81W7p2fLVB2l/IrG1VyYkQKbpQi
	9zjhu8Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1kU0-001GnV-02; Thu, 16 Jun 2022 08:04:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1kNj-001ERy-Pe; Thu, 16 Jun 2022 07:57:37 +0000
X-UUID: df445648cc2e402cbabdf26321e7b0a7-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:edfd778c-c5ff-4f52-a86d-e96d3182fc54,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:f56175f6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: df445648cc2e402cbabdf26321e7b0a7-20220616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 809490919; Thu, 16 Jun 2022 00:57:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 00:57:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 16 Jun 2022 15:57:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 16 Jun 2022 15:57:17 +0800
Message-ID: <54879555b101b709ee7edd1adf346ba00c8996ef.camel@mediatek.com>
Subject: Re: [PATCH v11 10/12] drm/mediatek: dpi: Add dpintf support
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <ck.hu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 16 Jun 2022 15:57:17 +0800
In-Reply-To: <7d2a1d75-e400-71aa-7127-144e257f408d@collabora.com>
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
	 <20220613064841.10481-11-rex-bc.chen@mediatek.com>
	 <7d2a1d75-e400-71aa-7127-144e257f408d@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_005735_859154_1B2CB532 
X-CRM114-Status: GOOD (  34.18  )
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

On Mon, 2022-06-13 at 12:55 +0200, AngeloGioacchino Del Regno wrote:
> Il 13/06/22 08:48, Bo-Chen Chen ha scritto:
> > From: Guillaume Ranquet <granquet@baylibre.com>
> > 
> > dpintf is the displayport interface hardware unit. This unit is
> > similar
> > to dpi and can reuse most of the code.
> > 
> > This patch adds support for mt8195-dpintf to this dpi driver. Main
> > differences are:
> >   - Some features/functional components are not available for
> > dpintf
> >     which are now excluded from code execution once is_dpintf is
> > set
> >   - dpintf can and needs to choose between different clockdividers
> > based
> >     on the clockspeed. This is done by choosing a different clock
> > parent.
> >   - There are two additional clocks that need to be managed. These
> > are
> >     only set for dpintf and will be set to NULL if not supplied.
> > The
> >     clk_* calls handle these as normal clocks then.
> >   - Some register contents differ slightly between the two
> > components. To
> >     work around this I added register bits/masks with a DPINTF_
> > prefix
> >     and use them where different.
> > 
> > Based on a separate driver for dpintf created by
> > Jitao shi <jitao.shi@mediatek.com>.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > [Bo-Chen: Modify reviewers' comments.]
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dpi.c          | 115
> > ++++++++++++++++++--
> >   drivers/gpu/drm/mediatek/mtk_dpi_regs.h     |  13 +++
> >   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   4 +
> >   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
> >   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   3 +
> >   5 files changed, 126 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 6b8cf648a5b5..08c8f21b4421 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -71,6 +71,7 @@ struct mtk_dpi {
> >   	void __iomem *regs;
> >   	struct device *dev;
> >   	struct clk *engine_clk;
> > +	struct clk *pll_gate_clk;
> 
> You don't need this clock in this driver, at all.
> 
> `pll_gate` would be CLK_VDO0_DP_INTF0_DP_INTF (parent = CLK_TOP_EDP);
> 
> Currently, you're assigning CLK_TOP_EDP to "pixel", but you can, at
> this point,
> simply assign CLK_VDO0_DP_INTF0_DP_INTF to "pixel" instead... as when
> you call
> clk_prepare_enable() on it, that'll also take care of enabling its
> CLK_TOP_EDP
> parent for you.
> 
> You're not doing anything special if not taking care of
> enabling/disabling it.
> 
> Regards,
> Angelo
> 

Hello Angelo,

Thanks for advice. I can use your patch[1] to do this and verify ok.
I will remove pll_gate_clk in next version.

[1]: 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220614091020.21472-1-angelogioacchino.delregno@collabora.com/

BRs,
Bo-Chen


