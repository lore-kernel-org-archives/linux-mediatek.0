Return-Path: <SRS0=HtVu=YQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F71ACA9EB9
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 22:56:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3FB920663
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 22:56:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bPnGnCTc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEKPr5N2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3FB920663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jY2fqZQpU2la6aN5Xt9pwYEWsn0TNNvuqpvRMiE3PPI=; b=bPnGnCTch1tDR9
	h+Ah09VMXX2/9R/FizU6JzWuxSVV3mKwzugLKGSLOPCFhqrToo4CqdIGpveLPolI1y2VjBZJAqCGB
	WmJwpG7XckmvqI2+aqzQnE4XlpW03DQHanuhI00BmIfW/BH3VB3tuIHmahhzr+y3/9sc/l3kDMJFv
	+CwkVh+GQydWeDPCNtccvyurW5O3UQuXWt3+SVlCe/dYYQqVaMaj5KJ7xrcwzp87CyeUCNJ35xe+E
	AnwlxeJL6eViyLTl80uyEPW9XLZj2df73vB9Zaj71Dj1C+GE8ButN/klKoZaHuTXhJwCquhZaGzZ5
	Plf2P783xuSvNyKT10NA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNPYN-0006Nl-Lp; Wed, 23 Oct 2019 22:56:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNPYA-0006Db-Ie; Wed, 23 Oct 2019 22:56:21 +0000
Received: from mail-yw1-f42.google.com (mail-yw1-f42.google.com
 [209.85.161.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8AE282084C;
 Wed, 23 Oct 2019 22:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571871377;
 bh=LhcrwyC5PZJloPX3jFhnfrduPAW8ErL0lMICTFLMMe0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FEKPr5N2JCYWNSiyISiceh+xZCp4T71Q3Po7Ky4T6gFGRtpvdViVF7xmqTSYCBLl5
 /0l+w5j5gT8omSw9W1gzO/nYbezt7OcLBs2y9vN+EYjeIUF4tLusPrm98OYivPxEDl
 Dr3liqNTOym28LQ2P+7mXcKiewau21GT3XuEDaiY=
Received: by mail-yw1-f42.google.com with SMTP id s6so7995841ywe.5;
 Wed, 23 Oct 2019 15:56:17 -0700 (PDT)
X-Gm-Message-State: APjAAAUQoQ5BEV+qfX8h5/OJOBWYNeaPd/FWi0oRwFPg3DTKvQj3lO/x
 +66XaGjCzn/afWwKTYpzKO+P8GtkdmbLXGItug==
X-Google-Smtp-Source: APXvYqz8tk6cy33E2kjPb39rGitBh+OZdCbHVzL15q8iWarg/LpfsD8EOA+hxKTc+k0xKkmN+I8Mi6KKtv6gFF41Jc4=
X-Received: by 2002:a0d:d307:: with SMTP id v7mr4908901ywd.507.1571871376689; 
 Wed, 23 Oct 2019 15:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-6-robh@kernel.org>
 <1cbca96c-19dd-1d15-949c-7fbcc15369b4@gmail.com>
 <CAL_JsqL6G=F45G+-QXF6T1269f9YquXfYtjoUkCpAoNartxM=Q@mail.gmail.com>
 <1571864784.19128.8.camel@mtksdaap41>
In-Reply-To: <1571864784.19128.8.camel@mtksdaap41>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Oct 2019 17:56:02 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJJ2ET2oCCkE=fqk7PWTWp3xiMRiMM_AmxRDws-NaKoOg@mail.gmail.com>
Message-ID: <CAL_JsqJJ2ET2oCCkE=fqk7PWTWp3xiMRiMM_AmxRDws-NaKoOg@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/mediatek: Convert to use CMA helpers
To: CK Hu <ck.hu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_155618_661172_A05E6F27 
X-CRM114-Status: GOOD (  25.22  )
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
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Yannick Fertre <yannick.fertre@st.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Ulrich Hecht <uli@fpond.eu>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Philippe Cornu <philippe.cornu@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 23, 2019 at 4:06 PM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Rob:
>
> On Wed, 2019-10-23 at 12:42 -0500, Rob Herring wrote:
> > On Tue, Oct 22, 2019 at 12:07 PM Matthias Brugger
> > <matthias.bgg@gmail.com> wrote:
> > >
> > > Hi Rob,
> > >
> > > On 21/10/2019 23:45, Rob Herring wrote:
> > > > The only reason the Mediatek driver doesn't use the CMA helpers is it
> > > > sets DMA_ATTR_NO_KERNEL_MAPPING and does a vmap() on demand. Using
> > > > vmap() is not even guaranteed to work as DMA buffers may not have a
> > > > struct page. Now that the CMA helpers support setting
> > > > DMA_ATTR_NO_KERNEL_MAPPING as needed or not, convert Mediatek driver to
> > > > use CMA helpers.
> > > >
> > > > Cc: CK Hu <ck.hu@mediatek.com>
> > > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > > Cc: David Airlie <airlied@linux.ie>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > Cc: linux-mediatek@lists.infradead.org
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > > ---
> > >
> > > I tested this on my Chromebook with some patches on top of v5.4-rc1 [1], which
> > > work. If I add your patches on top of that, the system does not boot up.
> > > Unfortunately I don't have a serial console, so I wasn't able to see if there is
> > > any error message.
> >
> > Thanks for testing. I'm based on drm-misc-next, but don't see anything
> > obvious there that would matter. There are some mmap changes, but I
> > think they shouldn't matter.
> >
> > Did you have fbcon enabled? That may give more clues about where the problem is.
>
> There are priv->dma_dev for dma device, but it is not drm device. In
> mt8173.dtsi [1], there are mmsys device and ovl device, mmsys device is
> drm device and ovl device is mmsys's sub device which provide dma
> function, so ovl is the priv->dma_dev. I think your patch directly use
> drm device for dma operation and this would cause dma function fail.
> Please use priv->dma_dev for dma operation.

Right, thanks for catching that. Either we'll need to make CMA GEM
object have a struct device ptr or adjust the drm_device.dev to have
the necessary DMA setup.

One question though, why do you use CMA when you have an IOMMU? That's
not optimal as CMA size may be limited. Or you don't always have an
IOMMU?

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
