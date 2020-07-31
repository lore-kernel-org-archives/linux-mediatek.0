Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 994E6C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 12:49:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63B5F21744
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 12:49:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CFwMnRrz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M+csR49i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63B5F21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c6a4aU7mOSl28KOvtZe5tGokWmHh/eHEe3c1SdxVO9g=; b=CFwMnRrzDSyCosBij677LRhtN
	EqlNjV/HhByRQwJD6sxAn8IA9u6Ywt4LRNBEcJke1vown2sND1KpiWyP+9wYfsLeXFlxBOFBM8Ars
	QCKAeniPasvmtmOBtnXRKWGwkTm6sdk3mpoKJbmN6A/GfEUqqG4FjPEihrdinw0+pfVPf0wZfJKjT
	AHL3HmMN/AwNjS9HiVnHJ3NtHexXPzsjGrq3fVayR34j3oiUqzZQIwmfYi4fBQaUJNnmIqrZYjcwS
	cN2cYyE6Jg/RV4KP4EZzuQOXYRZdlstAISPn7wQ2M/svMmh2iQtZA3JweBRu9jAyB2a9s6CpAZhSk
	Rhy1h2O4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1UTT-000067-7s; Fri, 31 Jul 2020 12:49:23 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1UTP-0008WB-4Z
 for linux-mediatek@lists.infradead.org; Fri, 31 Jul 2020 12:49:20 +0000
Received: by mail-ej1-x641.google.com with SMTP id kq25so18350521ejb.3
 for <linux-mediatek@lists.infradead.org>; Fri, 31 Jul 2020 05:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oKmO2ZAvewEBOR4kyQ9VDj8a4Brdi56V8Gl0PxTOBWk=;
 b=M+csR49iDfxo6UoiXSocjp8GH38x/wp8SHIku/n1gRdFm7qloMmf72l2fFrkx2nHna
 vo9sUTwCKgwQ8pb5XQez3od4wwkP50GX0j5bBNqFwXIe4MebvxsiEKV08LeITrovK9zx
 G2SD+Fjj4b33BOJZoNLjiQtoU3DeWwnfhzlfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oKmO2ZAvewEBOR4kyQ9VDj8a4Brdi56V8Gl0PxTOBWk=;
 b=YDIc6k+/TxBEdiba6oZSvbSPCAEhQYUSBeYTRa3slLrQ20cg84/La5HxcBiShT01rv
 OlXNBPXBt1RjczYDw2LGxdyW7XpQHCOG6U+f+6y0fYmDOvb6yYPhsrq8ffQj75IW12Rf
 o/UnMOj0xphYvSc0wM4LZ0jbwB8Rh3PZLBo3fmnjMNYh3JllpdQYvDaBU7aV9G4ml3Q8
 h3gPcE6ae7ib7rp0pUaWrFLLkOMr04tg+gMBkg3DDCTZ1FImEZgmeCGYaNpDLlblsHuO
 FWi7FSX7X3aFddDfQFh+zpktmgs8b9jamDMMNGDVyT3RLSlGZ18YYroBtDPSALAX1jC5
 77LQ==
X-Gm-Message-State: AOAM532RIBeWQZCPNh6hC6MShw/UsvB5Pn1WEYec654oOrnHBfmjXJUt
 WBSQ0Ap6RN3mmEZG2NzsouZMxgfOJixSBA==
X-Google-Smtp-Source: ABdhPJylz3XhojHhv+eEoDscHP5DlrPop6GYEa1SADBMNEOii8mLMNMQ988JIJwXs6EKPR1bFu6a+g==
X-Received: by 2002:a17:906:d217:: with SMTP id
 w23mr4070796ejz.292.1596199757674; 
 Fri, 31 Jul 2020 05:49:17 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53])
 by smtp.gmail.com with ESMTPSA id f21sm9321164edv.66.2020.07.31.05.49.15
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 05:49:15 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id t14so3940446wmi.3
 for <linux-mediatek@lists.infradead.org>; Fri, 31 Jul 2020 05:49:15 -0700 (PDT)
X-Received: by 2002:a7b:cf08:: with SMTP id l8mr3555747wmg.183.1596199754613; 
 Fri, 31 Jul 2020 05:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
 <20200723030451.5616-23-xia.jiang@mediatek.com>
 <20200730163419.GA3779380@chromium.org> <1596165602.17247.10.camel@mhfsdcap03>
In-Reply-To: <1596165602.17247.10.camel@mhfsdcap03>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 31 Jul 2020 14:49:03 +0200
X-Gmail-Original-Message-ID: <CAAFQd5C4hpz8DR101WYQ=9xeq3=yMbtbCasAUqGPpg9fLNORgA@mail.gmail.com>
Message-ID: <CAAFQd5C4hpz8DR101WYQ=9xeq3=yMbtbCasAUqGPpg9fLNORgA@mail.gmail.com>
Subject: Re: [PATCH v10 22/28] media: platform: Change the call functions of
 getting/enable/disable the jpeg's clock
To: Xia Jiang <xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_084919_274992_D9FE4C56 
X-CRM114-Status: GOOD (  32.63  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 linux-devicetree <devicetree@vger.kernel.org>, mojahsu@chromium.org,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Rick Chang <rick.chang@mediatek.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?= <maoguang.meng@mediatek.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 31, 2020 at 5:20 AM Xia Jiang <xia.jiang@mediatek.com> wrote:
>
> On Thu, 2020-07-30 at 16:34 +0000, Tomasz Figa wrote:
> > Hi Xia,
> >
> > On Thu, Jul 23, 2020 at 11:04:45AM +0800, Xia Jiang wrote:
> > > Use the generic of_property_* helpers to get the clock_nums and clocks
> > > from device tree.
> > > Use the generic clk_bulk_* helpers to enable and disable clocks.
> > >
> > > Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> > > ---
> > > v10: new add patch
> > > ---
> > >  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 47 +++++++++++++++----
> > >  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  8 ++--
> > >  2 files changed, 42 insertions(+), 13 deletions(-)
> > >
> >
> > Thank you for the patch. Please see my comments inline.
> >
> > > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > > index 7881e9c93df7..921ed21f7db3 100644
> > > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > > @@ -783,14 +783,15 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
> > >     ret = mtk_smi_larb_get(jpeg->larb);
> > >     if (ret)
> > >             dev_err(jpeg->dev, "mtk_smi_larb_get larbvdec fail %d\n", ret);
> > > -   clk_prepare_enable(jpeg->clk_jdec_smi);
> > > -   clk_prepare_enable(jpeg->clk_jdec);
> > > +
> > > +   ret = clk_bulk_prepare_enable(jpeg->num_clks, jpeg->clks);
> > > +   if (ret)
> > > +           dev_err(jpeg->dev, "Failed to open jpeg clk: %d\n", ret);
> > >  }
> > >
> > >  static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
> > >  {
> > > -   clk_disable_unprepare(jpeg->clk_jdec);
> > > -   clk_disable_unprepare(jpeg->clk_jdec_smi);
> > > +   clk_bulk_disable_unprepare(jpeg->num_clks, jpeg->clks);
> > >     mtk_smi_larb_put(jpeg->larb);
> > >  }
> > >
> > > @@ -939,6 +940,7 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
> > >  {
> > >     struct device_node *node;
> > >     struct platform_device *pdev;
> > > +   int ret, i;
> > >
> > >     node = of_parse_phandle(jpeg->dev->of_node, "mediatek,larb", 0);
> > >     if (!node)
> > > @@ -952,12 +954,39 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
> > >
> > >     jpeg->larb = &pdev->dev;
> > >
> > > -   jpeg->clk_jdec = devm_clk_get(jpeg->dev, "jpgdec");
> > > -   if (IS_ERR(jpeg->clk_jdec))
> > > -           return PTR_ERR(jpeg->clk_jdec);
> > > +   jpeg->num_clks =
> > > +           of_property_count_strings(jpeg->dev->of_node, "clock-names");
> > > +
> > > +   if (jpeg->num_clks > 0) {
> > > +           jpeg->clks = devm_kcalloc(jpeg->dev, jpeg->num_clks,
> > > +                                     sizeof(struct clk_bulk_data),
> > > +                                     GFP_KERNEL);
> > > +           if (!jpeg->clks)
> > > +                   return -ENOMEM;
> > > +   } else {
> > > +           dev_err(&pdev->dev, "Failed to get jpeg clock count\n");
> > > +           return -EINVAL;
> > > +   }
> > > +
> > > +   for (i = 0; i < jpeg->num_clks; i++) {
> > > +           ret = of_property_read_string_index(jpeg->dev->of_node,
> > > +                                               "clock-names", i,
> > > +                                               &jpeg->clks->id);
> >
> > The names of the clocks must be explicitly specified in the driver, as per
> > the DT bindings.
> Dear Tomasz,
>
> Thank you for your reply.
> You mean that I should keep the v9 version about names of the clocks in
> the match data.
> The v10 version about the names of the clocks follows the upstreamed
> mtk_venc/vdec.I think that this method is more generic. For example,when
> other project has more clocks, we can get the names of clocks from dtsi
> without changing the driver code.
> What about your further opinion?

The problem with that method is that one can put any random names in
the DT and the driver will happily accept them, without any
correctness checking. Moreover, if the other project has more clocks,
it already requires a different compatible string in the DT bindings,
so the kernel needs to be changed anyway.

Actually this is something that needs to be fixed in the mtk_venc/vdec
driver as well. I believe someone just overlooked it when the driver
was being reviewed.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
