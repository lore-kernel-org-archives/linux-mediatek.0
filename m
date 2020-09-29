Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92718C4727C
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 13:57:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA367206B7
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 13:57:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qfxq+xUp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="owyxPAUU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA367206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6+0bh3O2HSVD+4MSVccqBjcJhT5pT70TNl4ORIvie+I=; b=qfxq+xUpNoq/+lNRRdmreQXeb
	wq6ZAzzeG2qDLcf44A2RWyVKOWa1WiQgeY1cfKcnqGA8/RPrya7LfVH/gvXhEhgsttK0mWd1qDwBX
	ngo0F8aHYEvbf3HYubqdlLHpSEBHrUcVYWUkKbfbK5Uwh9uoDLaEQqYPEpMLIrGkmaVOY94gtYsvS
	ahm3ibJWqgG8SHw3dimAjQExnoewhqtK+DJWKRWdaValSWwYymUkb7FcQzGpp2QxmIclhIMQFZqhd
	h+k63cSCRd8iEG6TSjuhyVhlhJW2OuRtoy3hnPTE6fPRFNhB5UkIeLfoDWT4k8veRM6SKeS7FRIgm
	3uLUMGE4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNG7h-0000xB-Ug; Tue, 29 Sep 2020 13:56:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNG7C-0000ig-1W; Tue, 29 Sep 2020 13:56:24 +0000
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 22BCC20848;
 Tue, 29 Sep 2020 13:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601387780;
 bh=uRJnlxyDIqK1z0xXEQyA0WTBRacwx7hXWOOlHUk7db8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=owyxPAUUGklTGXbl9zzQmLxVPE6CKVkrTZntI27qfpCMh/Cr8YtrB82pi8hfW1y7/
 7LYjgghWALjXNhMPKoos3YBmO2VJTCDC1KNZgoi/RgrkKoeWpx1rUAagjFYsdYVKY9
 a2MkVT/H3ebKkcNFbYLidoIqOiS0iUmpEsqJM+rQ=
Received: by mail-oi1-f174.google.com with SMTP id n2so5536817oij.1;
 Tue, 29 Sep 2020 06:56:20 -0700 (PDT)
X-Gm-Message-State: AOAM532ahk3xbLCeXSfPHMt2x9X6H98IY+Gp4su3984iIsvrGYyfWCNf
 XqBcC+PGVRWCRkijpHrqvP+jpoUyK7+cKCCkMw==
X-Google-Smtp-Source: ABdhPJyZwlJWIDEVgF/lxBVWBxEh8NZUj9WkweYpi7M6hWCdX840Y3vhe88h8a44y5ld4Bh1pVSLqF/8s8tezFZzpYw=
X-Received: by 2002:a05:6808:10e:: with SMTP id
 b14mr2734685oie.152.1601387779028; 
 Tue, 29 Sep 2020 06:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200928063950.64722-1-chunfeng.yun@mediatek.com>
 <20200928181247.GA3008733@bogus> <1601359599.29336.49.camel@mhfsdcap03>
In-Reply-To: <1601359599.29336.49.camel@mhfsdcap03>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Sep 2020 08:56:07 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+UxJAGv4+om1BFAJbq1VETnY4UvpqgGs3mSP8e1kkFmQ@mail.gmail.com>
Message-ID: <CAL_Jsq+UxJAGv4+om1BFAJbq1VETnY4UvpqgGs3mSP8e1kkFmQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: add properties for hard wired devices
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_095622_322292_0833FA63 
X-CRM114-Status: GOOD (  23.72  )
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 29, 2020 at 1:09 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Mon, 2020-09-28 at 13:12 -0500, Rob Herring wrote:
> > On Mon, Sep 28, 2020 at 02:39:50PM +0800, Chunfeng Yun wrote:
> > > Add some optional properties which are needed for hard wired devices
> > >
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > ---
> > >  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > > index 7263b7f2b510..1194a82887e7 100644
> > > --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > > @@ -22,6 +22,17 @@ properties:
> > >      description:
> > >        Name specifier for the USB PHY
> > >
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 0
> > > +
> > > +patternProperties:
> > > +  "^hub|device@[0-9a-f]+$":
> >
> > Could be any class of device, so '@[0-9a-f]+$'
> You mean we will use different standard node name for each usb class?
> e.g.
> Use 'ethernet@*' for a usb ethernet adapter, and use 'camera@*' for a
> usb camera sensor?

Yes.

> > > +    type: object
> > > +    description: The hard wired USB devices. See usb/usb-device.txt
> >
> > Ideally, we'd convert usb-device.txt to schema and reference it here.
> Ok, I'll try to do it.
>
> BTW: Does the compatible support pattern? Is there any example I can
> refer to?

Yes, use 'pattern' keyword.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
