Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81B9C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 02:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlPzLGpmgNRlFL0JUMEWUMIjTIqCJVvNroVLdGPggLo=; b=Kkldl9ATD+XN7rCIXv6twri0Wy
	lejsGBowOvyzgP908jcLKtVGu3pFuhzCR4piySNo5IAcB9gdt37+PKWyerUPloWFQ7xCzrSOECRRL
	tNzFb0kMM+icXiV1o/OM5q+eV7pN1I9oWjX2KC4o9nMr5qlrZc/PaAhoUcdoWJkuFgJN6rv0pyPZk
	qIoVnOreWa0FjxrGPI3rvhx4pp08sWJ9KuXjfmEIBz2XeolFU572KNjMLm7XJty1v9+e60QZF7tlD
	3SponxSYQdS7uYecmV9L0Q2xXdF2453OMet4jJ+SV3Ru0QIj4N/kpFTaqoFTJnUV5MDrMvDBC/sYn
	X0+7CWQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQgCd-00A0xi-Rj; Wed, 24 Aug 2022 02:33:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQgCS-00A0wE-It; Wed, 24 Aug 2022 02:33:02 +0000
X-UUID: d73ccdc785b049a8965168466e490db5-20220823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=KlPzLGpmgNRlFL0JUMEWUMIjTIqCJVvNroVLdGPggLo=;
	b=jJ2Oh27Xo7OitJ0TGPqFHvRYBLz05e0sIFLjCwHg76CBsx1MKd5XyOuiWvO6kr6dTWY3/njrSKrrjxX+Rkzqgg8395xFfNTxQu2aXTE/02Pz12PNmPwTEWt8tiURSXH7PVOMjkbitEIW0W8mfDYxDl9opZq1BcLw3z+dYyMefjY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:3305fe1f-76b0-42a2-a623-80cd89489bb2,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:50431c68-a9d9-4672-a3c8-12721739a220,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d73ccdc785b049a8965168466e490db5-20220823
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1976395257; Tue, 23 Aug 2022 19:29:44 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 24 Aug 2022 09:59:09 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 24 Aug 2022 09:59:08 +0800
Message-ID: <447770ead17338241849dbbb2281fa8b4e31aefa.camel@mediatek.com>
Subject: Re: [PATCH v3,2/2] drm: mediatek: Adjust the dpi output format to
 MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <jason-jh.lin@mediatek.com>,
	<yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jitao Shi
	<jitao.shi@mediatek.com>
Date: Wed, 24 Aug 2022 09:59:21 +0800
In-Reply-To: <20220823201622.meedlqvmixf5ukdf@notapiano>
References: <1661235517-23699-1-git-send-email-xinlei.lee@mediatek.com>
	 <1661235517-23699-3-git-send-email-xinlei.lee@mediatek.com>
	 <20220823201622.meedlqvmixf5ukdf@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_193300_639768_5E1B1908 
X-CRM114-Status: GOOD (  29.03  )
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

On Tue, 2022-08-23 at 16:16 -0400, Nícolas F. R. A. Prado wrote:
> On Tue, Aug 23, 2022 at 02:18:37PM +0800, xinlei.lee@mediatek.com
> wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Dpi output needs to adjust the output format to dual edge for
> > MT8186.
> > Because MT8186 HW has been modified at that time, SW needs to
> > cooperate.
> > And the register (MMSYS) reserved for dpi will be used for output
> > format control (dual_edge/single_edge).
> > 
> > Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > ---
> 
> [..]
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> 
> [..]
> >   * @yuv422_en_bit: Enable bit of yuv422.
> >   * @csc_enable_bit: Enable bit of CSC.
> >   * @pixels_per_iter: Quantity of transferred pixels per iteration.
> > + * @rgb888_dual_enable: Control output format for mt8186.
> 
> Let's not mention mt8186 in the description to keep the property
> generic. Also,
> this description should say what having 'rgb888_dual_enable = true'
> indicates
> about the hardware (in this case mt8186) and it currently doesn't.
> 
> Let's take a step back. What does 'dual enable' mean in this context
> and how
> does it relate to 'dual edge' and the dpi output format? By answering
> those
> questions we can find a description (and maybe variable name) that
> makes more
> sense.
> 
> >   */
> 
> [..]
> > @@ -449,6 +454,9 @@ static void mtk_dpi_dual_edge(struct mtk_dpi
> > *dpi)
> >  		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
> >  			     dpi->output_fmt ==
> > MEDIA_BUS_FMT_RGB888_2X12_LE ?
> >  			     EDGE_SEL : 0, EDGE_SEL);
> > +	if (dpi->conf->rgb888_dual_enable)
> > +		mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev,
> > DPI_RGB888_DDR_CON,
> > +					     DPI_FORMAT_MASK, NULL);
> 
> This if block should be further indented.
> 
> >  	} else {
> >  		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE,
> > 0);
> >  	}
> 
> [..]
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > @@ -235,4 +235,8 @@
> >  #define MATRIX_SEL_RGB_TO_JPEG		0
> >  #define MATRIX_SEL_RGB_TO_BT601		2
> >  
> > +#define DPI_FORMAT_MASK			0x1
> > +#define DPI_RGB888_DDR_CON		BIT(0)
> > +#define DPI_RGB565_SDR_CON		BIT(1)
> 
> I'm not sure if it would make more sense to have these definitions in
> the mmsys
> header since they're configurations of a register in mmsys'
> iospace... I think
> we can keep them here but at least add a comment above:
> 
> /* Values for DPI configuration in MMSYS address space */
> 
> Thanks,
> Nícolas

Hi Nícolas:
Thanks for your careful review!
I will modify the description of this member variable and add the
hardware state corresponding to the software setting.
(eg. rgb888_dual_enable = true the hardware output rgb888_dual_edge
format data)

Your suggestion is very necessary, maybe my name is not accurate
enough, this flag is to enable RGB888_dual_edge format output. 
Would it be better for the variable to be called
RGB888_dual_edge_enable then?

Also I'll fix the code formatting issues
and add descriptions to the mmsys registers in the mtk_dpi_regs.h file.

Best Regards!
xinlei


