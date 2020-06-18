Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00D0C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 12:35:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 767BD20884
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 12:35:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DLmGWp1w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h1N4X47a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 767BD20884
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t1wqyBrA7Cq/AjBviRkSn/PkeQGuYUSPRP4eIOATvpk=; b=DLmGWp1wiaT0gX
	i4apPu/RZ5t8GF+lop4u+bLgFOeRTSak2GWJFOhc0jUONNFPZc5TiRBJ/Acb2XRfVl/NDXP7uQIgR
	KVuVNQV5LIWN/Mjon4F32TaZywp/7Fs1nDadpHJFvpbUX3fjpL2k9zoKMsNvivDNcSgwEfcutftJB
	WJC2awmQYbZ7Q6qEjhg5N8A6uloZ0LdZO0unDPW1h54baGAbNcuCIRUPlSzEx9u2zzb4gDRr20m5Q
	yj74yRBADpDKBkqaisFU9mGGbBgOtVrZ6saFbaAJAlQwTReFVlTz6SKyb9xGsmCYrbyzHGp4YWCNA
	NVizNn2zZ4HIPeFK/6AQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jltlM-0007RK-Mn; Thu, 18 Jun 2020 12:35:24 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jltl5-0005NM-N8
 for linux-mediatek@lists.infradead.org; Thu, 18 Jun 2020 12:35:09 +0000
Received: by mail-ej1-x641.google.com with SMTP id o15so6188886ejm.12
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2020 05:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=abF6OHbZnM7Q08OSXibHTxV15MlmdycHsIUv8D1tav8=;
 b=h1N4X47aPUwFQwS2Mc5NzhUIk+Bs+X6bsXwxwA2AzzEY+0YaOIwLv36kv2NTGtQKgk
 Io6/9xE4BPRlAhQEAlqdq1+Yw0CvLAcXYane9bTsjd5HKbUOChp/YES+P3hEi4ES2ndB
 uW/W6wCFtAAluYTlm8iFGgu5akQ7Jb3f+w2Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=abF6OHbZnM7Q08OSXibHTxV15MlmdycHsIUv8D1tav8=;
 b=fprBnEflF7GvDtQfao4c2aThQ4+rN1todGWVHExititc/Tw1AfXIRGP5srKPVe4225
 ZULIyK4FVBb3qkBh2N8pUGH/9nNyCGYT117iRlUI11rhGeLSQlFZp3QR+L200cplOAJ9
 zi7moGZxiWsW4PwX3CVSaAZPoZtBiXdQKkadSCdxA2zw9RcvVgIXRnh16X9m1QwISLGq
 9p14npS76adYrbG/1JTUNW4rXEljurMw7D/cRq/I349kQDhwpLqHaAds02Ur8v7f9oQE
 peNECAmUniiGpcYdvdmJahw1IhLPQR2CSzTLTSLWQKJT5mmn89VQmgtnHPnbyxS3tGp5
 8Y1g==
X-Gm-Message-State: AOAM530RBFidrdA5TaKalM2bEOb/vS7XGvxir/FpJqtlBf1W04eiRbl2
 SYMK9n7mh8GtGP4RgSkk+/2VAq2Nh6+E+g==
X-Google-Smtp-Source: ABdhPJzNsQJJm8VT+apHTmMcUKEH8e+5s24wCxW2P3BxDeLl2ACROy3acgx9M7GJaJr5TvsS8uzqeg==
X-Received: by 2002:a17:906:9382:: with SMTP id l2mr3968675ejx.8.1592483703456; 
 Thu, 18 Jun 2020 05:35:03 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52])
 by smtp.gmail.com with ESMTPSA id bt11sm2040386edb.48.2020.06.18.05.35.01
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 05:35:02 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id d128so5477237wmc.1
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2020 05:35:01 -0700 (PDT)
X-Received: by 2002:a1c:4189:: with SMTP id o131mr3620052wma.183.1592483701237; 
 Thu, 18 Jun 2020 05:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-12-xia.jiang@mediatek.com>
 <20200521160046.GJ209565@chromium.org> <1592451616.15355.25.camel@mhfsdcap03>
In-Reply-To: <1592451616.15355.25.camel@mhfsdcap03>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 18 Jun 2020 14:34:50 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Axc7RKcY_p-368GC7awx=SRKDTxxjjCibPwSOQ2FXpsA@mail.gmail.com>
Message-ID: <CAAFQd5Axc7RKcY_p-368GC7awx=SRKDTxxjjCibPwSOQ2FXpsA@mail.gmail.com>
Subject: Re: [PATCH v8 11/14] media: dt-bindings: Add jpeg enc device tree
 node document
To: Xia Jiang <xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_053507_756680_15E93BFD 
X-CRM114-Status: GOOD (  28.31  )
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
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <yong.wu@mediatek.com>,
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

On Thu, Jun 18, 2020 at 5:43 AM Xia Jiang <xia.jiang@mediatek.com> wrote:
>
> On Thu, 2020-05-21 at 16:00 +0000, Tomasz Figa wrote:
> > Hi Xia,
> >
> > On Fri, Apr 03, 2020 at 05:40:30PM +0800, Xia Jiang wrote:
> > > Add jpeg enc device tree node document
> > >
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> > > ---
> > > v8: no changes
> > >
> > > v7: no changes
> > >
> > > v6: no changes
> > >
> > > v5: no changes
> > >
> > > v4: no changes
> > >
> > > v3: change compatible to SoC specific compatible
> > >
> > > v2: no changes
> > > ---
> > >  .../bindings/media/mediatek-jpeg-encoder.txt  | 37 +++++++++++++++++++
> > >  1 file changed, 37 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> > >
> >
> > Thank you for the patch. Please see my comments inline.
> Dear Tomasz,
>
> Sorry for missing this message. Replied below.
> >
> > > diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> > > new file mode 100644
> > > index 000000000000..fa8da699493b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> > > @@ -0,0 +1,37 @@
> > > +* MediaTek JPEG Encoder
> > > +
> > > +MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
> > > +
> > > +Required properties:
> > > +- compatible : should be one of:
> > > +               "mediatek,mt2701-jpgenc"
> > > +               ...
> >
> > What does this "..." mean?
> "..." means that compatible name is not just "mediatek,mt2701-jpgenc",
> different project has different compatible name(for example the MT8173's
> compatible name may be "mediatek,mt8173-jpgenc").

The bindings need to list all the currently defined compatible strings
explicitly.

> >
> > > +               followed by "mediatek,mtk-jpgenc"
> > > +- reg : physical base address of the JPEG encoder registers and length of
> > > +  memory mapped region.
> > > +- interrupts : interrupt number to the interrupt controller.
> > > +- clocks: device clocks, see
> > > +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> > > +- clock-names: must contain "jpgenc". It is the clock of JPEG encoder.
> >
> > nit: In principle the clocks should be named after the function the clock
> > performs on the consumer side, i.e. the JPEG block in this case, I guess
> > here it's just a generic clock that does everything, but I guess it comes
> > from somewhere. Is it the AHB clock or something? In that case it would
> > normally be called "ahb".
> I have confirmed with hardware designer that the jpeg clock is not AHB
> clock,it follows subsys clock(because 2701 is the old IC,I didn't get
> the source name).It has the same source with venc clock.We can see that
> the clocks = <imgsys CLK_IMG_VENC>, Should I name it "venc" or the
> orignal "jpgenc"?

The clock name of the device-side bindings is the name of the input of
the device itself, no matter where the clock comes from in the SoC. I
guess if there is no specific purpose of this clock, "jpgenc" is as
good as any other name (e.g. "clock"), so feel free to keep it.

> >
> > > +- power-domains: a phandle to the power domain, see
> > > +  Documentation/devicetree/bindings/power/power_domain.txt for details.
> > > +- mediatek,larb: must contain the local arbiters in the current SoCs, see
> > > +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> > > +  for details.
> >
> > I believe this isn't necessary anymore, because larbs are added
> > automatically by the MTK IOMMU driver using device links. +CC Yong who
> > worked on that.
> Yes,I have confirmed with Yong that he will help me to modify this.Is it
> ok that I keep the orignal larb code?

I guess it depends on the order of landing the patches. If we intend
to land this series before the larb removal series, the binding should
stay as is. If the other way around, this should be removed. Please
coordinate with Yong.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
