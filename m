Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC805C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 10:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Q7o0BZ1dLMGbG9DC61jXPbfaTmriB02FvX/7pmT2qc=; b=Am7ll+VUO5ACoK
	vB9JJL0Fx8qDDiO5XpOLed5966oHG0q6dhS3tWWpLjQ0UmEHTT1ulm679sur5vhQUDSB+822EzRm7
	pfLjRU0gygOZK8IRDz/Saz7RJDbJhp3A6sAXNWLSCgz3N58GQJom2nsXw9JzJY1pj4Ra+DrsJFqV+
	M2VOmm3BG/On2wx6pWFVKXddZYBRrferM0UioF9OPNBmj+JhZ2kbYQec/bLKf6Nbr4aH3VLaakYl/
	ZCbgvrtGSO15Rt8N75HOSheTkBVS4rcnF7uRbg0G3EygFseCjLu6JvYA3f8acO4fGWP3uM9/Z5/Lx
	GBIU91lEQpPQZaX7pC4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBwlu-002zvE-4C; Mon, 24 Jan 2022 10:40:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBwlq-002zuA-Ag; Mon, 24 Jan 2022 10:40:25 +0000
X-UUID: a015877f57fa4db99b6b19aa1293e5d8-20220124
X-UUID: a015877f57fa4db99b6b19aa1293e5d8-20220124
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 518866613; Mon, 24 Jan 2022 03:40:19 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Jan 2022 02:40:17 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 24 Jan 2022 18:40:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 24 Jan 2022 18:40:15 +0800
Message-ID: <2404cea17479df35b5a5d55a923a96b10ebae909.camel@mediatek.com>
Subject: Re: [PATCH v21 5/8] soc: mediatek: SVS: add debug commands
From: Roger Lu <roger.lu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guenter Roeck
 <linux@roeck-us.net>
Date: Mon, 24 Jan 2022 18:40:15 +0800
In-Reply-To: <47bcbffc-42f6-335e-dfab-990e0ab5f103@collabora.com>
References: <20220107095200.4389-1-roger.lu@mediatek.com>
 <20220107095200.4389-6-roger.lu@mediatek.com>
 <47bcbffc-42f6-335e-dfab-990e0ab5f103@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_024022_409768_45C58D0F 
X-CRM114-Status: GOOD (  30.32  )
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

Hi AngeloGioacchino,

Sorry for the late reply and thanks for the advice.

On Fri, 2022-01-07 at 15:34 +0100, AngeloGioacchino Del Regno wrote:
> Il 07/01/22 10:51, Roger Lu ha scritto:
> > The purpose of SVS is to help find the suitable voltages
> > for DVFS. Therefore, if SVS bank voltages are concerned
> > to be wrong, we can adjust SVS bank voltages by this patch.
> > 
> > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-svs.c | 321 ++++++++++++++++++++++++++++++++-
> >   1 file changed, 318 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> > index 042c6e8e9069..93cdaecadd6d 100644
> > --- a/drivers/soc/mediatek/mtk-svs.c
> > +++ b/drivers/soc/mediatek/mtk-svs.c
> 
> ..snip..
> 
> > @@ -605,6 +896,16 @@ static void svs_set_bank_phase(struct svs_platform
> > *svsp,
> >   	}
> >   }
> >   
> > +static inline void svs_save_bank_register_data(struct svs_platform *svsp,
> > +					       enum svsb_phase phase)
> > +{
> > +	struct svs_bank *svsb = svsp->pbank;
> > +	enum svs_reg_index rg_i;
> > +
> 
> I think that it'd be a good idea to add an `enable` parameter, so that we
> don't always do a register dump; after all, this is a debugging feature and
> it's going to be completely irrelevant to the user, so keeping this disabled
> by default would ensure to get no performance degradation (even if small)
> unless really wanted.
> 
> So, in this case, here we'd have
> 
> 	if (!svsp->debug_enabled)
> 		return;

Thanks for pointing out the concern. Excuse us, we really need this to be
enabled by default. If we add a enable flag here, we'll face below problems and
make debug more difficult.

1. If we enable it afterward by cmd, init0[1~2] registers' data cannot be
recorded expectedly because the init flow has been finished already and won't be
run anymore. So, it doesn't work by using cmd to enable the flag.
2. If we add a enable flag here, it means we have to re-build the kernel load in
order to enable this flag. However, we cannot re-build the kernel load and needs
to debug directly sometimes. It's a sad situation... :(

> 
> > +	for (rg_i = DESCHAR; rg_i < SVS_REG_MAX; rg_i++)
> > +		svsb->reg_data[phase][rg_i] = svs_readl_relaxed(svsp, rg_i);
> > +}
> > +
> 
> Of course, this implies adding a new debugfs entry to enable/disable the
> debugging.
> Everything else looks good :)

Oh, excuse us, we have to keep the old design for better instant support and
thanks for the understanding.

> >   static inline void svs_error_isr_handler(struct svs_platform *svsp)
> >   {
> >   	struct svs_bank *svsb = svsp->pbank;
> > @@ -619,6 +920,8 @@ static inline void svs_error_isr_handler(struct
> > svs_platform *svsp)
> >   		svs_readl_relaxed(svsp, SMSTATE1));
> >   	dev_err(svsb->dev, "TEMP = 0x%08x\n", svs_readl_relaxed(svsp, TEMP));
> >   
> > +	svs_save_bank_register_data(svsp, SVSB_PHASE_ERROR);
> > +
> >   	svsb->mode_support = SVSB_MODE_ALL_DISABLE;
> >   	svsb->phase = SVSB_PHASE_ERROR;

[snip]



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
