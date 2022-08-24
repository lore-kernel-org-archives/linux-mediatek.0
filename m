Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A122C00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 15:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cCal1NlY5iCONceHnRgYdME0cISiYloZaI9u8qShIU=; b=NohqMoSukxvyx6X5ltkJVIkhYq
	h/7SnAiw87u0uWydU4mtkzkB6EW8+eb9++uPnIANNL/TkzF5DXWar0Gf80KvzFXm9JsHVx1+VukB1
	WKK9kxvrDZOoCFIiQt4Gcy3S8UG61hnsD/hGQ6BxDVesfKR9yR4mH6phlhqHxt3yD1B4v4mm75cp0
	270bJjZTQpD+TdHJ+4EyyZJ61XcxS103aHYygP0xfsc+uf9LSFOmGd8xj5UtqiKoSrMtgytLM6dC1
	SuAFNp/duKjrJLSRDvwDtTotMENgGxlT7BmFoi5g6SujNyCHH1PCNC6o7bP7FprlWT3aoHuT2RSrM
	pBNx+aiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQsYl-00E909-7S; Wed, 24 Aug 2022 15:44:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQsYW-00E8u9-R6; Wed, 24 Aug 2022 15:44:41 +0000
Received: from notapiano (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CD5F56601DAD;
	Wed, 24 Aug 2022 16:44:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661355863;
	bh=0KfOfe64bh2HPU69YxftLTc3R28G0Jq8SAkkUg1ockU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZRfz46UHhuBFS9V7XPVAuwYelv6ZwNZobLuDdHRFWyo+IcdyurTkYrhkEWVsVlDVa
	 PKK78GlcDoiiESJVtvCAE/GOzmEdbDpFz8mOKYQtdV5qnBci3RFtl0FGCxRPU4dDEh
	 ZzaB3gsEYUYrJk2RPteZLgQIJbNwK9isq+NTNW+0rd1s3ti60CKWP1A79lyRlJSjBH
	 ELAaGrDN1uMwFaRpow2Rfk6er64w6RmL+4q4j47ggW81mF9LYSSDn9UG4kMD4C5LxW
	 v1DQI3pd8dYia0iH33rIv/TfZF+JI1PXd726ywZf3koEaPRuuJNF8qG84UWACV5Vfv
	 myDFu6lKYEKUA==
Date: Wed, 24 Aug 2022 11:44:17 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "xinlei.lee" <xinlei.lee@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
	daniel@ffwll.ch, matthias.bgg@gmail.com, rex-bc.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
	yongqiang.niu@mediatek.com, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v3,2/2] drm: mediatek: Adjust the dpi output format to
 MT8186
Message-ID: <20220824154417.5cbfsgqjwajvplvk@notapiano>
References: <1661235517-23699-1-git-send-email-xinlei.lee@mediatek.com>
 <1661235517-23699-3-git-send-email-xinlei.lee@mediatek.com>
 <20220823201622.meedlqvmixf5ukdf@notapiano>
 <447770ead17338241849dbbb2281fa8b4e31aefa.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <447770ead17338241849dbbb2281fa8b4e31aefa.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_084437_167436_111F1F77 
X-CRM114-Status: GOOD (  39.20  )
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

On Wed, Aug 24, 2022 at 09:59:21AM +0800, xinlei.lee wrote:
> On Tue, 2022-08-23 at 16:16 -0400, Nícolas F. R. A. Prado wrote:
> > On Tue, Aug 23, 2022 at 02:18:37PM +0800, xinlei.lee@mediatek.com
> > wrote:
> > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > 
> > > Dpi output needs to adjust the output format to dual edge for
> > > MT8186.
> > > Because MT8186 HW has been modified at that time, SW needs to
> > > cooperate.
> > > And the register (MMSYS) reserved for dpi will be used for output
> > > format control (dual_edge/single_edge).
> > > 
> > > Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > 
> > > ---
> > 
> > [..]
> > > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > 
> > [..]
> > >   * @yuv422_en_bit: Enable bit of yuv422.
> > >   * @csc_enable_bit: Enable bit of CSC.
> > >   * @pixels_per_iter: Quantity of transferred pixels per iteration.
> > > + * @rgb888_dual_enable: Control output format for mt8186.
> > 
> > Let's not mention mt8186 in the description to keep the property
> > generic. Also,
> > this description should say what having 'rgb888_dual_enable = true'
> > indicates
> > about the hardware (in this case mt8186) and it currently doesn't.
> > 
> > Let's take a step back. What does 'dual enable' mean in this context
> > and how
> > does it relate to 'dual edge' and the dpi output format? By answering
> > those
> > questions we can find a description (and maybe variable name) that
> > makes more
> > sense.
> > 
> > >   */
> > 
> > [..]
> > > @@ -449,6 +454,9 @@ static void mtk_dpi_dual_edge(struct mtk_dpi
> > > *dpi)
> > >  		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
> > >  			     dpi->output_fmt ==
> > > MEDIA_BUS_FMT_RGB888_2X12_LE ?
> > >  			     EDGE_SEL : 0, EDGE_SEL);
> > > +	if (dpi->conf->rgb888_dual_enable)
> > > +		mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev,
> > > DPI_RGB888_DDR_CON,
> > > +					     DPI_FORMAT_MASK, NULL);
> > 
> > This if block should be further indented.
> > 
> > >  	} else {
> > >  		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE,
> > > 0);
> > >  	}
> > 
> > [..]
> > > --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > > @@ -235,4 +235,8 @@
> > >  #define MATRIX_SEL_RGB_TO_JPEG		0
> > >  #define MATRIX_SEL_RGB_TO_BT601		2
> > >  
> > > +#define DPI_FORMAT_MASK			0x1
> > > +#define DPI_RGB888_DDR_CON		BIT(0)
> > > +#define DPI_RGB565_SDR_CON		BIT(1)
> > 
> > I'm not sure if it would make more sense to have these definitions in
> > the mmsys
> > header since they're configurations of a register in mmsys'
> > iospace... I think
> > we can keep them here but at least add a comment above:
> > 
> > /* Values for DPI configuration in MMSYS address space */
> > 
> > Thanks,
> > Nícolas
> 
> Hi Nícolas:
> Thanks for your careful review!
> I will modify the description of this member variable and add the
> hardware state corresponding to the software setting.
> (eg. rgb888_dual_enable = true the hardware output rgb888_dual_edge
> format data)
> 
> Your suggestion is very necessary, maybe my name is not accurate
> enough, this flag is to enable RGB888_dual_edge format output. 
> Would it be better for the variable to be called
> RGB888_dual_edge_enable then?

The thing is, we also output in rgb888 dual edge format on mt8183 and mt8192,
and therefore set DDR_EN in mtk_dpi_dual_edge(), right? But, as you said, we
don't need to enable this new rgb888_dual_enable variable on those platforms,
only on mt8186. So that's why I don't think the current name/description is
suitable. If the variable only needs to be set on mt8186, it should have a name
and description that shows what is different between mt8186 and the others. But
without containing the "mt8186" name, since this might happen on other SoCs
later on.

My understanding is that even though both mt8186 and mt8192 output in the rgb888
dual edge format, only mt8186 is able to configure the edge setting in MMSYS (so
on mt8192 it would be hardwired to dual edge and not possible to change). So
what I propose is

Name: edge_cfg_in_mmsys

Description: "If the edge configuration for DPI's output needs to be set in MMSYS"

But maybe since you know the hardware, you might be able to find an even better
name/description.

Thanks,
Nícolas

