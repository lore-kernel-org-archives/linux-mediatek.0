Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43294C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 15:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1FV8N2HvEmnCxkKHNnzHPV+zvFf6/k8QMPZ9Vrzt3o=; b=QFF3eaesWwUo1QYwEfPCp5PS0K
	wQCXVz7TqJYO4220hV3EkxUBTtwG1j+WL9lt/3OPeBo6DRM9uuxTTjmBRx0Z9aTA0oqFgXgbugzhE
	osfMYom0g/Qxpt0LY0NwCOehP3uZAwo4DVo6GikUiyHZw30Uuqha3P0B3CXsG41OQwAD5/7mK6eFz
	yg7n7fBRYUgvYae1vIWVjy104lpvEFSvm4BUpvkunttHbSKwwDyNGnB/kCelP5S82VVaOxiYCrjNo
	XNyMSTyMtgiAFJumOrWCklEqzMZDNzLbEFLoB8KQ0cTqA6c42/5mgJ5Xzs3r1WQbiG/xaxpIp51jU
	iOrulrIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oltjQ-008eaX-7W; Fri, 21 Oct 2022 15:14:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oltjE-008eXu-9F; Fri, 21 Oct 2022 15:14:34 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E43C6660253A;
	Fri, 21 Oct 2022 16:14:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666365268;
	bh=WdAyMq9HWMH1DV/m+ouWfIuqmg+VXHtw3JJQiHsJ+BY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z528/1yFK9NTNJR5xIJjMAESvHZQZ50JDXqwpyHzj0FJRQ9I9x0B48BivdAfLpgxT
	 hyAi0ZjR+jtIOyTT4BFmpQDHlw9lkmLKDFeSldEU2lsvKvJM6pt7rsHIsq93j+jmcR
	 H1wqpYgreqKO8JJYCj2tmCesGTDsUgrP0LhJuiY1y1WL0pFRhdEHTXryOEHhGIpOW7
	 sqK4HIaozGvr1ul5GragRWIS1alBalIKsCUWLsEPx+G6NOIVnKYLS+kXbMhrgkIRT9
	 3vTwUuNdcYKttDLKXjKqYsdGGDFZUK90d5aKSwifI7rS4dFtPD4JkKOveGZyurCngn
	 kzAStZZB8Dr5Q==
Date: Fri, 21 Oct 2022 11:14:23 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "xinlei.lee" <xinlei.lee@mediatek.com>
Cc: matthias.bgg@gmail.com, rex-bc.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
	daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v12,1/3] soc: mediatek: Add all settings to
 mtk_mmsys_ddp_dpi_fmt_config func
Message-ID: <20221021151423.6lube6aqtqahwpwf@notapiano>
References: <1666147936-27368-1-git-send-email-xinlei.lee@mediatek.com>
 <1666147936-27368-2-git-send-email-xinlei.lee@mediatek.com>
 <20221020163310.tpkjvr7pe5vhwylh@notapiano>
 <28c0e6890daeb6bf17779243b23f60fa138b2fd2.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28c0e6890daeb6bf17779243b23f60fa138b2fd2.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_081432_688044_EF5D0B7E 
X-CRM114-Status: GOOD (  58.94  )
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

On Fri, Oct 21, 2022 at 07:59:02PM +0800, xinlei.lee wrote:
> On Thu, 2022-10-20 at 12:33 -0400, Nícolas F. R. A. Prado wrote:
> > Hi,
> > 
> > On Wed, Oct 19, 2022 at 10:52:14AM +0800, xinlei.lee@mediatek.com
> > wrote:
> > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > 
> > > The difference between MT8186 and other ICs is that when modifying
> > > the
> > > output format, we need to modify the mmsys_base+0x400 register to
> > > take
> > > effect.
> > > So when setting the dpi output format, we need to call mmsys_func
> > > to set
> > 
> > mmsys_func isn't something that exists in the code. Instead mention
> > the actual
> > function name: mtk_mmsys_ddp_dpi_fmt_config.
> > 
> > > it to MT8186 synchronously.
> > 
> > 
> > Here, before saying that the commit adds all the settings for dpi,
> > you could
> > have mentioned that the previous commit lacked those, to make it
> > clearer:
> > 
> > Commit a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to dpi
> > output for MT8186")
> > lacked some of the possible output formats and also had a wrong
> > bitmask.
> > 
> > 
> > > Adding mmsys all the settings that need to be modified with dpi are
> > > for
> > > mt8186.
> > 
> > This sentence I would change to the following one:
> > 
> > Add the missing output formats and fix the bitmask.
> > 
> > 
> > Finally, you're also making the function more HW-agnostic (although
> > in my
> > opinion this could've been a future separate commit), so it's worth
> > mentioning
> > it here:
> > 
> > While at it, also update mtk_mmsys_ddp_dpi_fmt_config() to use
> > generic formats,
> > so that it is slightly easier to extend for other platforms.
> > 
> > > 
> > > Fixes: a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to dpi
> > > output for MT8186")
> > 
> > The fixes tag should be kept in a single line, without wrapping.
> > 
> > > 
> > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > Reviewed-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > > ---
> > >  drivers/soc/mediatek/mt8186-mmsys.h    |  8 +++++---
> > >  drivers/soc/mediatek/mtk-mmsys.c       | 27 ++++++++++++++++++++
> > > ------
> > >  include/linux/soc/mediatek/mtk-mmsys.h |  7 +++++++
> > >  3 files changed, 33 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/soc/mediatek/mt8186-mmsys.h
> > > b/drivers/soc/mediatek/mt8186-mmsys.h
> > > index 09b1ccbc0093..035aec1eb616 100644
> > > --- a/drivers/soc/mediatek/mt8186-mmsys.h
> > > +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> > > @@ -5,9 +5,11 @@
> > >  
> > >  /* Values for DPI configuration in MMSYS address space */
> > >  #define MT8186_MMSYS_DPI_OUTPUT_FORMAT		0x400
> > > -#define DPI_FORMAT_MASK					0x1
> > > -#define DPI_RGB888_DDR_CON				BIT(0)
> > > -#define DPI_RGB565_SDR_CON				BIT(1)
> > > +#define DPI_FORMAT_MASK					GENMASK
> > > (1, 0)
> > > +#define DPI_RGB888_SDR_CON				0
> > > +#define DPI_RGB888_DDR_CON				1
> > > +#define DPI_RGB565_SDR_CON				2
> > > +#define DPI_RGB565_DDR_CON				3
> > 
> > These defines should all have a MT8186_ prefix. This will avoid
> > confusions now
> > that mtk_mmsys_ddp_dpi_fmt_config() is being made more platform-
> > agnostic.
> > 
> > >  
> > >  #define MT8186_MMSYS_OVL_CON			0xF04
> > >  #define MT8186_MMSYS_OVL0_CON_MASK			0x3
> > > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > > b/drivers/soc/mediatek/mtk-mmsys.c
> > > index d2c7a87aab87..205f6de45851 100644
> > > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > > @@ -238,12 +238,27 @@ static void mtk_mmsys_update_bits(struct
> > > mtk_mmsys *mmsys, u32 offset, u32 mask,
> > >  
> > >  void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
> > >  {
> > > -	if (val)
> > > -		mtk_mmsys_update_bits(dev_get_drvdata(dev),
> > > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > > -				      DPI_RGB888_DDR_CON,
> > > DPI_FORMAT_MASK);
> > > -	else
> > > -		mtk_mmsys_update_bits(dev_get_drvdata(dev),
> > > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > > -				      DPI_RGB565_SDR_CON,
> > > DPI_FORMAT_MASK);
> > > +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> > > +
> > > +	switch (val) {
> > > +	case MTK_DPI_RGB888_SDR_CON:
> > > +		mtk_mmsys_update_bits(mmsys,
> > > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > > +				      DPI_FORMAT_MASK,
> > > DPI_RGB888_SDR_CON);
> > > +		break;
> > > +	case MTK_DPI_RGB565_SDR_CON:
> > > +		mtk_mmsys_update_bits(mmsys,
> > > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > > +				      DPI_FORMAT_MASK,
> > > DPI_RGB565_SDR_CON);
> > > +		break;
> > > +	case MTK_DPI_RGB565_DDR_CON:
> > > +		mtk_mmsys_update_bits(mmsys,
> > > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > > +				      DPI_FORMAT_MASK,
> > > DPI_RGB565_DDR_CON);
> > > +		break;
> > > +	case MTK_DPI_RGB888_DDR_CON:
> > > +	default:
> > > +		mtk_mmsys_update_bits(mmsys,
> > > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > > +				      DPI_FORMAT_MASK,
> > > DPI_RGB888_DDR_CON);
> > > +		break;
> > > +	}
> > 
> > To be honest I don't really see the point of making the function
> > slightly more
> > platform-agnostic like this. With a single platform making use of it
> > it's just
> > an unneeded extra abstraction, and it could easily be done when a
> > second
> > platform starts requiring this as well...
> > 
> > In any case,
> > 
> > Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> > Thanks,
> > Nícolas
> > 
> > >  }
> > 
> > [..]
> 
> Hi Nícolas:
> 
> Thanks for your detailed reply and correction.
> Before sending out the next edition, I have two questions I would like 
> to confirm with you in response to your responses:
> 1.While at it, also update mtk_mmsys_ddp_dpi_fmt_config() to use 
> generic formats, so that it is slightly easier to extend for other 
> platforms.
> => This is to make this mtk_mmsys_ddp_dpi_fmt_config() func more 
> general? 
> This function may only be used by MT8186, because only MT8186
> has 
> corresponding modifications on HW, and enables the registers reserved 
> in mmsys for dpi use to control the output format. Because this 
> register is not defined for other ic, I added control to this function 
> call in mtk_dpi.c. If you think there are other ways to make it look 
> more generic, where should I correct it?

You already made the mtk_mmsys_ddp_dpi_fmt_config() more generic by making it's
format parameter decoupled from its register representation on MT8186, that is,
MTK_DPI_RGB888_SDR_CON instead of DPI_RGB888_SDR_CON.

I wasn't asking for any code modification on that comment, I was suggesting you
add this sentence in the commit message, so it reflects the changes you're
already doing.

To be extra clear, I was suggesting you update the commit message to the
following:

  The difference between MT8186 and other ICs is that when modifying the output
  format, we need to modify the mmsys_base+0x400 register to take effect. So when
  setting the dpi output format, we need to call mtk_mmsys_ddp_dpi_fmt_config to
  set it to MT8186 synchronously.
  
  Commit a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to dpi output for
  MT8186") lacked some of the possible output formats and also had a wrong
  bitmask.
  
  Add the missing output formats and fix the bitmask.
  
  While at it, also update mtk_mmsys_ddp_dpi_fmt_config() to use generic formats,
  so that it is slightly easier to extend for other platforms.
  
  Fixes: a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to dpi output for MT8186")

> 
> 2. These definitions should all have a MT8186_ prefix. This will avoid 
> confusion as mtk_mmsys_ddp_dpi_fmt_config() becomes more platform 
> independent.
> 
> Honestly, I don't really see the point of making the feature platform-
> agnostic like this. Using it on a single platform is just an extra 
> abstraction that isn't needed, when a second platform starts needing 
> it too, it can be done easily...
> 
> => My understanding here is that prefixing variables with labels is 
> more conducive to making functions generic, and can be reused if there 
> is such a situation in the future. I understand the importance of 
> keeping the function platform agnostic, but as mentioned, it may only 
> be used by the MT8186 if there are special cases where other ICs may 
> rely on mtk_mmsys_update_bits to create new functions.

What I'm saying is that, even though you've made the function receive a generic
format as a parameter, like MTK_DPI_RGB888_SDR_CON, at this point in time
MT8186 is the only SoC that has a register in mmsys for it, so the values

DPI_FORMAT_MASK
DPI_RGB888_SDR_CON
DPI_RGB888_DDR_CON
DPI_RGB565_SDR_CON
DPI_RGB565_DDR_CON

are really all MT8186-specific, at least at this point. Leaving them without the
MT8186_ can give the false impression that they're already used elsewhere. Also
it's really easy to mistake them for the generic ones (like
MTK_DPI_RGB888_SDR_CON). MT8186_MMSYS_DPI_OUTPUT_FORMAT already has the MT8186_
prefix, so I'm really just saying that the other ones should have as well.

If/when the same address, mask or values for this register start being used on a
different SoC, then you can remove the prefix and move it to the mtk-mmsys.h
generic header.

But for now adding the prefixes will avoid confusion and make it clear this is
MT8186 specific.

Thanks,
Nícolas

