Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87783C4320A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 07:27:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2C976108D
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 07:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2C976108D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7LJkeiFJcy/ttYLTSULa3x3+FbD6ipULdCD42RjLF2w=; b=mYQfAwtrD8G8cJ
	8mgTHLPJgoPhoZCs6qwmxe0xEBWCTUQ4ISV2kMjIjxz16YMiYxzAREiXRQ2j+LGF7aqXaF19fdx7r
	avrOU2OXFld0yAOvli0rs3NzZjm7G8nU4AdkIrL0vqu2t5kig6YxNMkW4BHc39UQCJ4ohRsBfj/3Y
	0m/n6p6ERaMvAc6TtNKGCBPa6ZxZ+lSz73zfd93YvkXAiD/kxGGxdqL/6YFFLLVZNUvHrDfI3uPZc
	yRDDHMtHkVNX5aXhCR1U6Wi4Ad8ia8dDeCrSXgG32tIjjFgHEOx2YAgWtY9TqIEE5VuxwGxt1Xxl2
	ngvHn0kIjbCd77z/WKPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGFyU-004VAL-R6; Wed, 18 Aug 2021 07:26:58 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGFyQ-004V9N-9G
 for linux-mediatek@lists.infradead.org; Wed, 18 Aug 2021 07:26:56 +0000
Received: by mail-wr1-x42d.google.com with SMTP id q6so1919505wrv.6
 for <linux-mediatek@lists.infradead.org>; Wed, 18 Aug 2021 00:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GS53dtkSshsWU0pVEuBPMNBIV+APKbgrHvnwbGn/3sI=;
 b=wUAFXLP7N/3NrkHAyZL3s132TwORCZb2Yasjm6SF4+ENfHJw630p79P5rnaT/TiNPz
 ahuhHSKQak4G8VrlvJivcPjqBrh7ED3u4wIMhuAvwdMA5byrIogU9DuE/6W7yL0E1Epk
 Pes++NSdTTotfcp4WEH1ndL0aggIqfvFApo+5Cp60Zxot9KTCUhJYsvLBfrAOKGQ6m9J
 Zy+3d1dR49jlM69gcONakVGqaQMgz/OFd3ssOnrcAV1fpGmNbblLutj342BCFtVL+DkK
 Vnu6QuzaoLvrUk6YiOjh05z84zKqSrumX73bmgAYqolmhzqhhuVh2lJEXj4X1aZIVVJW
 QrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GS53dtkSshsWU0pVEuBPMNBIV+APKbgrHvnwbGn/3sI=;
 b=h5XjSIsOkdz9I4PFWsJr5OdvSGJt/Q91Dun4GWTldcYuaCrgj+PcPv/fc+oNCYCjE/
 dJEtdbv0eoiOLDqtCkKO4VfdxfLR7QQ3Zqc1hRAqd5BiNfmVjhhbqb3/l30EnNDLERrT
 FM2kOClf73cCddaRuzX/w4ZIB7bQANUk7HQDoyR8QLQXPgmmBJjDFMpAdnkOiMl3EtKq
 koF/18g13aZ5FbrNCG9S0wzn7PjX6L77K10jM8qj+w3ofc9FWueBLiNE48m9oCki0yeI
 2Kp5+XYpDjmwcVYByNlDr/h+ckeiwx8wbTtH1PNIVZZhqn5Q1HghTlPeSh9+jasiqpkm
 WgGw==
X-Gm-Message-State: AOAM532MvNoMVcmLaF7LnMqRV9hmGp+/rOhET+rKMLi/JrLLanHNPfE7
 1rya3gr5KxkEj0aiiYZat1E7Dg==
X-Google-Smtp-Source: ABdhPJzrPi5e48Mr13B77OJiauHWNOs1hURKk05xXQW1uKoPxv5uzRIX1HpIvMfMIvO7bQHzZDUOjA==
X-Received: by 2002:adf:e507:: with SMTP id j7mr8921378wrm.113.1629271611907; 
 Wed, 18 Aug 2021 00:26:51 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id q17sm4832717wrr.91.2021.08.18.00.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:26:51 -0700 (PDT)
Date: Wed, 18 Aug 2021 09:26:50 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 2/5] drm/mediatek: dpi: Add dpintf support
Message-ID: <20210818072650.wtarykc4rihtio4k@blmsp>
References: <20210816192523.1739365-1-msp@baylibre.com>
 <20210816192523.1739365-3-msp@baylibre.com>
 <1629193844.19746.2.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1629193844.19746.2.camel@mtksdaap41>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_002654_440635_534D0B19 
X-CRM114-Status: GOOD (  29.10  )
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

Hi,

On Tue, Aug 17, 2021 at 05:50:44PM +0800, CK Hu wrote:
> Hi, Markus:
> 
> On Mon, 2021-08-16 at 21:25 +0200, Markus Schneider-Pargmann wrote:
> > dpintf is the displayport interface hardware unit. This unit is similar
> > to dpi and can reuse most of the code.
> > 
> > This patch adds support for mt8195-dpintf to this dpi driver. Main
> > differences are:
> >  - Some features/functional components are not available for dpintf
> >    which are now excluded from code execution once is_dpintf is set
> >  - dpintf can and needs to choose between different clockdividers based
> >    on the clockspeed. This is done by choosing a different clock parent.
> >  - There are two additional clocks that need to be managed. These are
> >    only set for dpintf and will be set to NULL if not supplied. The
> >    clk_* calls handle these as normal clocks then.
> >  - Some register contents differ slightly between the two components. To
> >    work around this I added register bits/masks with a DPINTF_ prefix
> >    and use them where different.
> > 
> > Based on a separate driver for dpintf created by
> > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c      | 282 ++++++++++++++++++++----
> >  drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  12 +
> >  2 files changed, 247 insertions(+), 47 deletions(-)
> > 
> 
> [snip]
> 
> >  
> > +static void mtk_dpi_set_pixel_clk_parent(struct mtk_dpi *dpi,
> > +					 unsigned int factor)
> > +{
> > +	struct clk *new_parent;
> > +
> > +	switch (factor) {
> > +	case 16:
> > +		new_parent = dpi->tvd_clks[MTK_DPI_TVDPLL_D16].clk;
> > +		break;
> > +	case 8:
> > +		new_parent = dpi->tvd_clks[MTK_DPI_TVDPLL_D8].clk;
> > +		break;
> > +	case 4:
> > +		new_parent = dpi->tvd_clks[MTK_DPI_TVDPLL_D4].clk;
> > +		break;
> > +	case 2:
> > +		new_parent = dpi->tvd_clks[MTK_DPI_TVDPLL_D2].clk;
> > +		break;
> > +	default:
> > +		new_parent = NULL;
> > +	}
> > +	if (new_parent)
> > +		clk_set_parent(dpi->pixel_clk, new_parent);
> 
> I prefer that dpi->pixel_clk provide set_rate() interface, and let clock
> driver to control the parent of dpi->pixel_clk.

Good point, will do that, thanks.

Best,
Markus

> 
> Regards,
> CK
> 
> > +}
> > +
> >  static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
> >  				    struct drm_display_mode *mode)
> >  {
> > @@ -465,6 +568,8 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
> >  	drm_display_mode_to_videomode(mode, &vm);
> >  	pll_rate = vm.pixelclock * factor;
> >  
> > +	mtk_dpi_set_pixel_clk_parent(dpi, factor);
> > +
> >  	dev_dbg(dpi->dev, "Want PLL %lu Hz, pixel clock %lu Hz\n",
> >  		pll_rate, vm.pixelclock);
> >  
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
