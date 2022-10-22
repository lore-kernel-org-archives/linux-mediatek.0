Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859D0C04A95
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Oct 2022 10:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dM4knmEbXoLi8Z8yhKlsNzUq6m5aHXU9IxgQE5YBYsI=; b=PBxjuPqye0fEkepaY7+62fCLEI
	D+hYKwXzFmUWGH5sRGFRGPdLITeWJ2ymKBPq5yZehQYQALWBsXjbhoa/+2J3p2hWNmhsyT7FSfZnO
	JqFTOY6tEEg1MW2dgnqCYUKcw2eof4WyVBd1T8n0Ep0LHMKpVzURTc1sd06M3HmoRJJf2nOUxyVpU
	JodddnseBuv3owdEHk6KusHK2MGGgVHR0dGt858BemrFkfJxmV8HoY5Xy7UHmIiQ3RwxTDVjqDbPO
	8E32wNGJU7F7V79sZXogpOlkHE1nFs+rEH0xVb9zlU0jqxfwJ5ctt10YMYKhHF1mJ3/97ikRQStqv
	DZpXPEiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omBv3-00CFpW-CV; Sat, 22 Oct 2022 10:39:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omBus-00CFlT-1d; Sat, 22 Oct 2022 10:39:48 +0000
X-UUID: 14851c1ed5454a7b80642082c824a70b-20221022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=dM4knmEbXoLi8Z8yhKlsNzUq6m5aHXU9IxgQE5YBYsI=;
	b=tUMYCKd9MtUWGWC3wnXC4Ikdc6lUQjLeGv13Aq8Yb7Ov0sW5+8hhvy/XlcePFOTg4c0AxgMdg1M6+rI4DvTc21vKENRrmJO0NvbAaSnNee4w+p92tRp3eoMIQHAC4uu+rghAGy3Bo6ngU7ZCjd13Wl9p5+hDkyBf9J3opUVSzSE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:689b61f5-71c1-4cf1-b9d3-13794ce8ff43,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:bd07c26c-89d3-4bfa-baad-dc632a24bca3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 14851c1ed5454a7b80642082c824a70b-20221022
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1229349660; Sat, 22 Oct 2022 03:39:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 22 Oct 2022 17:59:30 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sat, 22 Oct 2022 17:59:30 +0800
Message-ID: <a9e4a225a1f713d9d0909c3e77a997f358829feb.camel@mediatek.com>
Subject: Re: [PATCH v12,1/3] soc: mediatek: Add all settings to
 mtk_mmsys_ddp_dpi_fmt_config func
From: xinlei.lee <xinlei.lee@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <jason-jh.lin@mediatek.com>,
	<chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Sat, 22 Oct 2022 17:59:37 +0800
In-Reply-To: <20221021151423.6lube6aqtqahwpwf@notapiano>
References: <1666147936-27368-1-git-send-email-xinlei.lee@mediatek.com>
	 <1666147936-27368-2-git-send-email-xinlei.lee@mediatek.com>
	 <20221020163310.tpkjvr7pe5vhwylh@notapiano>
	 <28c0e6890daeb6bf17779243b23f60fa138b2fd2.camel@mediatek.com>
	 <20221021151423.6lube6aqtqahwpwf@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_033946_125311_8010204C 
X-CRM114-Status: GOOD (  70.10  )
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

On Fri, 2022-10-21 at 11:14 -0400, Nícolas F. R. A. Prado wrote:
> On Fri, Oct 21, 2022 at 07:59:02PM +0800, xinlei.lee wrote:
> > On Thu, 2022-10-20 at 12:33 -0400, Nícolas F. R. A. Prado wrote:
> > > Hi,
> > > 
> > > On Wed, Oct 19, 2022 at 10:52:14AM +0800, xinlei.lee@mediatek.com
> > > wrote:
> > > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > > 
> > > > The difference between MT8186 and other ICs is that when
> > > > modifying
> > > > the
> > > > output format, we need to modify the mmsys_base+0x400 register
> > > > to
> > > > take
> > > > effect.
> > > > So when setting the dpi output format, we need to call
> > > > mmsys_func
> > > > to set
> > > 
> > > mmsys_func isn't something that exists in the code. Instead
> > > mention
> > > the actual
> > > function name: mtk_mmsys_ddp_dpi_fmt_config.
> > > 
> > > > it to MT8186 synchronously.
> > > 
> > > 
> > > Here, before saying that the commit adds all the settings for
> > > dpi,
> > > you could
> > > have mentioned that the previous commit lacked those, to make it
> > > clearer:
> > > 
> > > Commit a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to
> > > dpi
> > > output for MT8186")
> > > lacked some of the possible output formats and also had a wrong
> > > bitmask.
> > > 
> > > 
> > > > Adding mmsys all the settings that need to be modified with dpi
> > > > are
> > > > for
> > > > mt8186.
> > > 
> > > This sentence I would change to the following one:
> > > 
> > > Add the missing output formats and fix the bitmask.
> > > 
> > > 
> > > Finally, you're also making the function more HW-agnostic
> > > (although
> > > in my
> > > opinion this could've been a future separate commit), so it's
> > > worth
> > > mentioning
> > > it here:
> > > 
> > > While at it, also update mtk_mmsys_ddp_dpi_fmt_config() to use
> > > generic formats,
> > > so that it is slightly easier to extend for other platforms.
> > > 
> > > > 
> > > > Fixes: a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to
> > > > dpi
> > > > output for MT8186")
> > > 
> > > The fixes tag should be kept in a single line, without wrapping.
> > > 
> > > > 
> > > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > > Reviewed-by: AngeloGioacchino Del Regno <
> > > > angelogioacchino.delregno@collabora.com>
> > > > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > > > ---
> > > >  drivers/soc/mediatek/mt8186-mmsys.h    |  8 +++++---
> > > >  drivers/soc/mediatek/mtk-mmsys.c       | 27
> > > > ++++++++++++++++++++
> > > > ------
> > > >  include/linux/soc/mediatek/mtk-mmsys.h |  7 +++++++
> > > >  3 files changed, 33 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/soc/mediatek/mt8186-mmsys.h
> > > > b/drivers/soc/mediatek/mt8186-mmsys.h
> > > > index 09b1ccbc0093..035aec1eb616 100644
> > > > --- a/drivers/soc/mediatek/mt8186-mmsys.h
> > > > +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> > > > @@ -5,9 +5,11 @@
> > > >  
> > > >  /* Values for DPI configuration in MMSYS address space */
> > > >  #define MT8186_MMSYS_DPI_OUTPUT_FORMAT		0x400
> > > > -#define DPI_FORMAT_MASK					
> > > > 0x1
> > > > -#define DPI_RGB888_DDR_CON				BIT(0)
> > > > -#define DPI_RGB565_SDR_CON				BIT(1)
> > > > +#define DPI_FORMAT_MASK					
> > > > GENMASK
> > > > (1, 0)
> > > > +#define DPI_RGB888_SDR_CON				0
> > > > +#define DPI_RGB888_DDR_CON				1
> > > > +#define DPI_RGB565_SDR_CON				2
> > > > +#define DPI_RGB565_DDR_CON				3
> > > 
> > > These defines should all have a MT8186_ prefix. This will avoid
> > > confusions now
> > > that mtk_mmsys_ddp_dpi_fmt_config() is being made more platform-
> > > agnostic.
> > > 
> > > >  
> > > >  #define MT8186_MMSYS_OVL_CON			0xF04
> > > >  #define MT8186_MMSYS_OVL0_CON_MASK			0x3
> > > > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > > > b/drivers/soc/mediatek/mtk-mmsys.c
> > > > index d2c7a87aab87..205f6de45851 100644
> > > > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > > > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > > > @@ -238,12 +238,27 @@ static void mtk_mmsys_update_bits(struct
> > > > mtk_mmsys *mmsys, u32 offset, u32 mask,
> > > >  
> > > >  void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
> > > >  {
> > > > -	if (val)
> > > > -		mtk_mmsys_update_bits(dev_get_drvdata(dev),
> > > > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > > > -				      DPI_RGB888_DDR_CON,
> > > > DPI_FORMAT_MASK);
> > > > -	else
> > > > -		mtk_mmsys_update_bits(dev_get_drvdata(dev),
> > > > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > > > -				      DPI_RGB565_SDR_CON,
> > > > DPI_FORMAT_MASK);
> > > > +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> > > > +
> > > > +	switch (val) {
> > > > +	case MTK_DPI_RGB888_SDR_CON:
> > > > +		mtk_mmsys_update_bits(mmsys,
> > > > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > > > +				      DPI_FORMAT_MASK,
> > > > DPI_RGB888_SDR_CON);
> > > > +		break;
> > > > +	case MTK_DPI_RGB565_SDR_CON:
> > > > +		mtk_mmsys_update_bits(mmsys,
> > > > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > > > +				      DPI_FORMAT_MASK,
> > > > DPI_RGB565_SDR_CON);
> > > > +		break;
> > > > +	case MTK_DPI_RGB565_DDR_CON:
> > > > +		mtk_mmsys_update_bits(mmsys,
> > > > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > > > +				      DPI_FORMAT_MASK,
> > > > DPI_RGB565_DDR_CON);
> > > > +		break;
> > > > +	case MTK_DPI_RGB888_DDR_CON:
> > > > +	default:
> > > > +		mtk_mmsys_update_bits(mmsys,
> > > > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > > > +				      DPI_FORMAT_MASK,
> > > > DPI_RGB888_DDR_CON);
> > > > +		break;
> > > > +	}
> > > 
> > > To be honest I don't really see the point of making the function
> > > slightly more
> > > platform-agnostic like this. With a single platform making use of
> > > it
> > > it's just
> > > an unneeded extra abstraction, and it could easily be done when a
> > > second
> > > platform starts requiring this as well...
> > > 
> > > In any case,
> > > 
> > > Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > > 
> > > Thanks,
> > > Nícolas
> > > 
> > > >  }
> > > 
> > > [..]
> > 
> > Hi Nícolas:
> > 
> > Thanks for your detailed reply and correction.
> > Before sending out the next edition, I have two questions I would
> > like 
> > to confirm with you in response to your responses:
> > 1.While at it, also update mtk_mmsys_ddp_dpi_fmt_config() to use 
> > generic formats, so that it is slightly easier to extend for other 
> > platforms.
> > => This is to make this mtk_mmsys_ddp_dpi_fmt_config() func more 
> > general? 
> > This function may only be used by MT8186, because only MT8186
> > has 
> > corresponding modifications on HW, and enables the registers
> > reserved 
> > in mmsys for dpi use to control the output format. Because this 
> > register is not defined for other ic, I added control to this
> > function 
> > call in mtk_dpi.c. If you think there are other ways to make it
> > look 
> > more generic, where should I correct it?
> 
> You already made the mtk_mmsys_ddp_dpi_fmt_config() more generic by
> making it's
> format parameter decoupled from its register representation on
> MT8186, that is,
> MTK_DPI_RGB888_SDR_CON instead of DPI_RGB888_SDR_CON.
> 
> I wasn't asking for any code modification on that comment, I was
> suggesting you
> add this sentence in the commit message, so it reflects the changes
> you're
> already doing.
> 
> To be extra clear, I was suggesting you update the commit message to
> the
> following:
> 
>   The difference between MT8186 and other ICs is that when modifying
> the output
>   format, we need to modify the mmsys_base+0x400 register to take
> effect. So when
>   setting the dpi output format, we need to call
> mtk_mmsys_ddp_dpi_fmt_config to
>   set it to MT8186 synchronously.
>   
>   Commit a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to dpi
> output for
>   MT8186") lacked some of the possible output formats and also had a
> wrong
>   bitmask.
>   
>   Add the missing output formats and fix the bitmask.
>   
>   While at it, also update mtk_mmsys_ddp_dpi_fmt_config() to use
> generic formats,
>   so that it is slightly easier to extend for other platforms.
>   
>   Fixes: a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to dpi
> output for MT8186")
> 
> > 
> > 2. These definitions should all have a MT8186_ prefix. This will
> > avoid 
> > confusion as mtk_mmsys_ddp_dpi_fmt_config() becomes more platform 
> > independent.
> > 
> > Honestly, I don't really see the point of making the feature
> > platform-
> > agnostic like this. Using it on a single platform is just an extra 
> > abstraction that isn't needed, when a second platform starts
> > needing 
> > it too, it can be done easily...
> > 
> > => My understanding here is that prefixing variables with labels
> > is 
> > more conducive to making functions generic, and can be reused if
> > there 
> > is such a situation in the future. I understand the importance of 
> > keeping the function platform agnostic, but as mentioned, it may
> > only 
> > be used by the MT8186 if there are special cases where other ICs
> > may 
> > rely on mtk_mmsys_update_bits to create new functions.
> 
> What I'm saying is that, even though you've made the function receive
> a generic
> format as a parameter, like MTK_DPI_RGB888_SDR_CON, at this point in
> time
> MT8186 is the only SoC that has a register in mmsys for it, so the
> values
> 
> DPI_FORMAT_MASK
> DPI_RGB888_SDR_CON
> DPI_RGB888_DDR_CON
> DPI_RGB565_SDR_CON
> DPI_RGB565_DDR_CON
> 
> are really all MT8186-specific, at least at this point. Leaving them
> without the
> MT8186_ can give the false impression that they're already used
> elsewhere. Also
> it's really easy to mistake them for the generic ones (like
> MTK_DPI_RGB888_SDR_CON). MT8186_MMSYS_DPI_OUTPUT_FORMAT already has
> the MT8186_
> prefix, so I'm really just saying that the other ones should have as
> well.
> 
> If/when the same address, mask or values for this register start
> being used on a
> different SoC, then you can remove the prefix and move it to the mtk-
> mmsys.h
> generic header.
> 
> But for now adding the prefixes will avoid confusion and make it
> clear this is
> MT8186 specific.
> 
> Thanks,
> Nícolas

Hi Nícolas:

Thanks for the detailed explanation and correction, I understand that 
these values in the mt8186-mmsys.h file should be given:
DPI_FORMAT_MASK
DPI_RGB888_SDR_CON
DPI_RGB888_DDR_CON
DPI_RGB565_SDR_CON
DPI_RGB565_DDR_CON

Add the prefix of MT8186_ to avoid confusion, it does look generic in 
the mtk_mmsys_update_bits() function.

Thanks again for your suggestion, I will revise it in the next edition.

Best Regards!
xinlei


