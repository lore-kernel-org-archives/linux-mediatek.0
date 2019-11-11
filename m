Return-Path: <SRS0=Eirx=ZD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0BA4C17443
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 07:01:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 960852067B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 07:01:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jczu7WG1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YMByG+QA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 960852067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9+IIru5MCXWy9rE2aZNNF3+wFTSp1J9j6sfsdZPKK8=; b=jczu7WG1g3ogOo
	21WrnlWwN2WaVsBNmZm2GR0d0SDsBhrP5wJ09sPLGfp78RHn8H7BW4IlVOLZRmLhOw/a1Bku93BWe
	tB+LbzsMMSMsqdqEXhegYjssme5/gzZIEg2Kkc4+rCrNJFbTlY1mUgGRGymSgPbYzvaNWhby8V8ff
	Q2140GEZLftNquO52rhR1Xaw4yNaj/jP8YvFeFdkm74+s9dyzUk22D0STO9QWPCl3Hll+zuclX+C0
	0yv0NLJgTv9E6j3jCX/nY6zYpONvdWL+3/sSTA44+wAhV9YHdwbDufUWrB07Judp9KCukCAg3iXf1
	j0hyM4tGUu8QKKodPakw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU3hg-0006MH-3r; Mon, 11 Nov 2019 07:01:36 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU3hc-0006LD-EP
 for linux-mediatek@lists.infradead.org; Mon, 11 Nov 2019 07:01:34 +0000
Received: by mail-ed1-x542.google.com with SMTP id x11so11057025eds.13
 for <linux-mediatek@lists.infradead.org>; Sun, 10 Nov 2019 23:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F3TxF+AJbjTFe9CSJ0NILNUnMGyyn7tR/jfpwQuTY6o=;
 b=YMByG+QA9BSSONXzijgH3lT/HJSfJ63osPgOWzCWCYvhB/KtuJhyoZum3mgB+NjmrG
 rJWRy9UXVTVCcWOm/sEn21bSpo0SlcT++UxUxkrfFLaNJgvrQEbXDbDcFcFKygsgPy+6
 Vcou70IW3wEv489ErEOzEfURMA/ZBjdNOisUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F3TxF+AJbjTFe9CSJ0NILNUnMGyyn7tR/jfpwQuTY6o=;
 b=UuiFyOVsdg+Jes7hvZn6yn2a9UKxPyP1WIIawG6wbD6T7J86FKaS2xZyr723JCvKaW
 VkS+0AcX7xbuh4c2kU5FvYBIOxiBgnVu8WZBJtF25HloCwSCr0joNNksVQp94Pt1BpUI
 ytTXFVp9jNeMybRBC7cICd1gOzWnMC5PQi+QBxY/Pl6xB/2adDN1lSjvWL/yIk5AEI9q
 s2/yfgiJ5PIQ3n38XI48lth4ASIDRsn45MM1rJc1+YKGNryfsSZe3qyok9Jq8MBiaTeX
 +iyc2Us2BJsDBXqlm8O8s/sRDqH5dKtUfvpFwry3eYXjp4eWty58pyOMz1Mge+AqrmC5
 lVeQ==
X-Gm-Message-State: APjAAAUeytiswT2kXnw2Sr9avuEIO9uhUHYRI7PiDbcoSabPNtRminoC
 mKn63iMsma8wskq1cNa0y0w0RP91radj1g==
X-Google-Smtp-Source: APXvYqyzfnVUXlF7alrHKd1koIMhiXsMIH+lwhQe9x1S8pQBhp2xViZ78W7sSv6dAoAW3b5X0jNGDg==
X-Received: by 2002:aa7:cf97:: with SMTP id z23mr24875377edx.245.1573455689475; 
 Sun, 10 Nov 2019 23:01:29 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53])
 by smtp.gmail.com with ESMTPSA id i26sm452646edq.27.2019.11.10.23.01.27
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Nov 2019 23:01:28 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id a15so13312602wrf.9
 for <linux-mediatek@lists.infradead.org>; Sun, 10 Nov 2019 23:01:27 -0800 (PST)
X-Received: by 2002:a05:6000:1206:: with SMTP id
 e6mr5641649wrx.113.1573455687257; 
 Sun, 10 Nov 2019 23:01:27 -0800 (PST)
MIME-Version: 1.0
References: <20191017084033.28299-1-xia.jiang@mediatek.com>
 <20191017084033.28299-6-xia.jiang@mediatek.com>
 <20191023103945.GA41089@chromium.org>
 <1571906317.6254.64.camel@mhfsdcap03>
 <CAAFQd5DUF90daBAe96Vu46z9HD43AYG+9rK-_r_aWYey8GxpmQ@mail.gmail.com>
 <1572229558.27439.6.camel@mhfsdcap03>
In-Reply-To: <1572229558.27439.6.camel@mhfsdcap03>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 11 Nov 2019 16:01:13 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DWZXru=a6JvTD8M1aJw8c48MK-vLPXvOmt-O4gVoPGVQ@mail.gmail.com>
Message-ID: <CAAFQd5DWZXru=a6JvTD8M1aJw8c48MK-vLPXvOmt-O4gVoPGVQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] media: platform: Add jpeg dec/enc feature
To: Xia Jiang <xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_230132_510539_43963E52 
X-CRM114-Status: GOOD (  33.47  )
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
Cc: linux-devicetree <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Rick Chang <rick.chang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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

Hi Xia,

On Mon, Oct 28, 2019 at 11:26 AM Xia Jiang <xia.jiang@mediatek.com> wrote:
>
> On Thu, 2019-10-24 at 18:23 +0900, Tomasz Figa wrote:
> > On Thu, Oct 24, 2019 at 5:38 PM Xia Jiang <xia.jiang@mediatek.com> wrote:
> > >
> > > On Wed, 2019-10-23 at 19:39 +0900, Tomasz Figa wrote:
> > > > Hi Xia,
> > > >
> > > > On Thu, Oct 17, 2019 at 04:40:38PM +0800, Xia Jiang wrote:
> > > > > Add mtk jpeg encode v4l2 driver based on jpeg decode, because that jpeg
> > > > > decode and encode have great similarities with function operation.
> > > > >
> > > > > Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> > > > > ---
> > > > > v4: split mtk_jpeg_try_fmt_mplane() to two functions, one for encoder,
> > > > >     one for decoder.
> > > > >     split mtk_jpeg_set_default_params() to two functions, one for
> > > > >     encoder, one for decoder.
> > > > >     add cropping support for encoder in g/s_selection ioctls.
> > > > >     change exif mode support by using V4L2_JPEG_ACTIVE_MARKER_APP1.
> > > > >     change MTK_JPEG_MAX_WIDTH/MTK_JPEG_MAX_HEIGH from 8192 to 65535 by
> > > > >     specification.
> > > > >     move width shifting operation behind aligning operation in
> > > > >     mtk_jpeg_try_enc_fmt_mplane() for bug fix.
> > > > >     fix user abuseing data_offset issue for DMABUF in
> > > > >     mtk_jpeg_set_enc_src().
> > > > >     fix kbuild warings: change MTK_JPEG_MIN_HEIGHT/MTK_JPEG_MAX_HEIGHT
> > > > >                         and MTK_JPEG_MIN_WIDTH/MTK_JPEG_MAX_WIDTH from
> > > > >                         'int' type to 'unsigned int' type.
> > > > >                         fix msleadingly indented of 'else'.
> > > > >
> > > > > v3: delete Change-Id.
> > > > >     only test once handler->error after the last v4l2_ctrl_new_std().
> > > > >     seperate changes of v4l2-ctrls.c and v4l2-controls.h to new patch.
> > > > >
> > > > > v2: fix compliance test fail, check created buffer size in driver.
> > > > > ---
> > > > >  drivers/media/platform/mtk-jpeg/Makefile      |   5 +-
> > > > >  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 731 +++++++++++++++---
> > > > >  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   | 123 ++-
> > > > >  .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h |   7 +-
> > > > >  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 175 +++++
> > > > >  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h |  60 ++
> > > > >  .../platform/mtk-jpeg/mtk_jpeg_enc_reg.h      |  49 ++
> > > > >  7 files changed, 1004 insertions(+), 146 deletions(-)
> > > > >  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > > > >  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
> > > > >  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_reg.h
> > > > >
> > > >
> > > > First of all, thanks for the patch!
> > > >
> > > > Please check my comments below.
> > > >
> > > > My general feeling about this code is that the encoder hardware block is
> > > > completely orthogonal from the decoder block and there is very little code
> > > > reuse from the original decoder driver.
> > > >
> > > > Moreover, a lot of existing code now needs if (decoder) { ... } else {... }
> > > > segments, which complicates the code.
> > > >
> > > > Would it perhaps make sense to instead create a separate mtk-jpeg-enc
> > > > driver?
> > > >
> > > Dear Tomasz,
> > >
> > > Thanks for your comments.
> > >
> > > My reasons about the architecture of jpeg enc driver are as follows:
> > >
> > > The first internal design and realization of jpeg enc driver was a
> > > separate driver, but found that mtk_jpeg_core.c and mtk_jpeg_enc_core.c
> > > have lots of reuse.Because that  the core.c mainly contains realization
> > > of v4L2 ioctl functions and some logic which are high similarity between
> > > encoder and decoder.
> > >
> > > The jpeg encoder and decoder are two independent hardwares exactly, so
> > > the code about hardware specification(register setting) are
> > > separated(mtk_jpeg_enc_hw.c and mtk_jpeg_dec_hw.c).
> > >
> > > As for 17 existing code segments contain if(decoder){} else {}, they are
> > > not complicated IMHO.The complicated(multilayer nested) functions are
> > > separated in V4 version as Hans recommendation.
> > >
> > > By the way,the upstreamed module s5p-jpeg
> > > (https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/s5p-jpeg/jpeg-core.c#L1998) also use encoder and decoder mode in the common core.c, but their encoder and decoder are the same hardware.Maybe our jpeg enc and dec are designed into one hardware in the future.In that case the current architecture is more compatible.
> > >
> > > So I prefer the current design.
> > >
> >
> > Would you be able to give some numbers to show the code reuse to
> > justify using the same driver? From my observation, a new driver would
> > result in a significantly cleaner code. If there is a further hardware
> > architecture change, that would likely require another driver, because
> > it wouldn't be compatible with existing programming model anyway.
> >
> > Regardless of that, if we end up with reusing the same driver, I'd
> > like you to fix the issues existing in the current base before adding
> > the encoder functionality.
> Dear Tomasz,
> I've counted about 1000 lines of code that can be reused.The reused code
> is 75 percent of the original code.
>
> If you agree to reuse the same driver,I will fix the issues existing in
> the current driver.

Sorry, I was out of the office.

Okay, let's reuse the driver. I guess the hardware programming part
itself is smaller than the V4L2 boiler plate needed for it and that's
where the 1000 lines of code comes from.

The first step I'd suggest then would be running the latest
v4l2-compliance, from the master branch of v4l2-utils [1] and making
sure there are no issues.

Then check if any comments I posted to the new code added by your
patch apply to the existing code as well and fixing those issues in a
prerequisite patches, at the beginning of the series.

[1] https://git.linuxtv.org/v4l-utils.git/

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
