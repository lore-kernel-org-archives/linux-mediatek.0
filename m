Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C4DC433E7
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 11:54:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5AF620848
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 11:54:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IqkmHONF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D5mF2XYQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5AF620848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5/FJevUMmRRtj45ZYZ7ucXTPkm6xARH7nBfXpWAIRAc=; b=IqkmHONFCSsQ4mkUCiQ7mMm75
	VEPyycNj2UwLlt+6wG+YAa3OWnKh9/shcosOpFypxnuke8/mve5Pn6gP5WuVDmRWZaVDv0QaMrVfU
	Nu3jep90hf/+7N/WPWUEAi8+QLRr40bReNpxwz/cy0EQ5xZRT0KGD1wT57WiDbCJvBd2IrtxgshNu
	mnoLnHK7PvJr11CzOMl8zqz35akqnjSiSZRSB3TkCl/OXj1Dp2GO6xK43dGOWTIn2A19zu+/iwBYu
	AGCM5BAJA+Aw88MXh2hsftSHq0fuc1Z3onpFMb2wfJ3lC957nSbzl/oURtplJDTkGRV9kwGdtUCZT
	j9j55uG9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSfMc-0001Uc-Vo; Wed, 14 Oct 2020 11:54:39 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSfMY-0001Tv-Lb
 for linux-mediatek@lists.infradead.org; Wed, 14 Oct 2020 11:54:35 +0000
Received: by mail-lf1-x143.google.com with SMTP id 77so3381289lfl.2
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2020 04:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gJmE+QzQPKhmVzRh7Mt/ZkUz7d1ef3q7Sc2eKrUP1ek=;
 b=D5mF2XYQNP+94me/VxKUFpADGfBIU3L6stuWHfhcFjpvl8cFllEzVr2R8gPiy6Y7H5
 7Jn3E05QFxVTs6FWqON6/czE5exVhvHc+PXVrpU6cNV+QSHwvK363vZMM69bEwZ7xq1k
 1wMTxa2lATKEQ127Aj9A7/xrT5lOpm18mHUOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gJmE+QzQPKhmVzRh7Mt/ZkUz7d1ef3q7Sc2eKrUP1ek=;
 b=uiKxKoq7/c/FhF0rrNvb4Svql6TtwxyzFgLt/qDaHu750JcD87aywU0cd8EYqsjOlJ
 E54n/Igl67/C4Bxa2TqlhVBwz/cvNyW8QzElIZPkZF5VdspUk0iGsPE+8raCcE5V+mFp
 rY9P0mFv/FY6R64JeZpZePzh6JQZBLySm1I8crLor6tJ6YvccXaglTCWY528fgZkRwgf
 014va7Bjglfc8GHEnXUrw4ms7f0nfNce4bMkkV/fE1jx02bwZQIBUlYf8VZoeUEJUTQU
 BkvVrNf3d7ge8T3BbhIGIspc7KjQOySP39FgnwgK0znQbT0wZx0YsxFA53R/L4h0wSXy
 8h6A==
X-Gm-Message-State: AOAM530s/IhiEG1mZGDkrHcr7tub8+i2F3wqRP4XSMAV15RF32Q5tBDn
 MsJTa1wRTQwdzy4eKWdtbofJl/QNG/p7BA==
X-Google-Smtp-Source: ABdhPJww+/cvW3aTEyG+z5QAtL9jOi1cO+KdSxlLrIyhPZGBXHayjnkhd6v8Sz6LkicB1DDEMoOTuQ==
X-Received: by 2002:a19:407:: with SMTP id 7mr1180119lfe.291.1602676471441;
 Wed, 14 Oct 2020 04:54:31 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171])
 by smtp.gmail.com with ESMTPSA id 72sm1078154lfd.52.2020.10.14.04.54.31
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2020 04:54:31 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id m20so2878354ljj.5
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2020 04:54:31 -0700 (PDT)
X-Received: by 2002:adf:ab05:: with SMTP id q5mr4966749wrc.32.1602676092220;
 Wed, 14 Oct 2020 04:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-2-dongchun.zhu@mediatek.com>
 <20201013161938.GE13341@paasikivi.fi.intel.com>
 <1602641418.4733.80.camel@mhfsdcap03>
 <20201014083139.GG13341@paasikivi.fi.intel.com>
In-Reply-To: <20201014083139.GG13341@paasikivi.fi.intel.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 14 Oct 2020 13:48:00 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BVzN=49s4S98E9mGNuxzOt4633dAw9mbyu3Sr-rA61qw@mail.gmail.com>
Message-ID: <CAAFQd5BVzN=49s4S98E9mGNuxzOt4633dAw9mbyu3Sr-rA61qw@mail.gmail.com>
Subject: Re: [PATCH v15 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
To: Sakari Ailus <sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_075434_737115_060E950A 
X-CRM114-Status: GOOD (  28.84  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= <shengnan.wang@mediatek.com>,
 Louis Kuo <louis.kuo@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 14, 2020 at 10:31 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Wed, Oct 14, 2020 at 10:10:18AM +0800, Dongchun Zhu wrote:
> > Hello Sakari,
> >
> > Thanks for your timely review.
> >
> > On Tue, 2020-10-13 at 19:19 +0300, Sakari Ailus wrote:
> > > Hi Dongchun,
> > >
> > > On Tue, Oct 13, 2020 at 09:05:02PM +0800, Dongchun Zhu wrote:
> > > > Add YAML device tree binding for OV02A10 CMOS image sensor, and the
> > > > relevant MAINTAINERS entries.
> > > >
> > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > ---
> > > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 162 +++++++++++++++++++++
> > > >  MAINTAINERS                                        |   7 +
> > > >  2 files changed, 169 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > >
> >
> > [snip]...
> >
> > > > +  ovti,mipi-clock-voltage:
> > > > +    description:
> > > > +      An array of 2-tuples items, and each item consists of link frequency and
> > > > +      MIPI clock voltage unit like <freq-kHz volt-unit>. Clock voltage unit is
> > > > +      dependent upon link speed, indicating MIPI transmission speed select that
> > > > +      controls D-PHY timing setting by adjusting MIPI clock voltage to improve
> > > > +      the clock driver capability.
> > > > +    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> > > > +    minItems: 2
> > > > +    default: [390000, 4]
> > >
> > > Why do you have the link frequency here as well?
> > >
> > > In principle this does belong to the endpoint as link frequencies are
> > > specific to that, but I don't mind; there's just a single port anyway.
> > >
> >
> > This is an optional property which we model as an array of <link speed,
> > clock voltage> pairs. An example to have all link speeds up to 390MHz
> > use the value 4 for current driver. If one wants to select different
> > voltage for different link, they could do so as well.
>
> If you think you'd need that, then you need to put this to the endpoint.

The mipi-clock-voltage property is not a property of the endpoint. The
link frequency there does not set the link frequency - it only
specifies which link frequency the given voltage should be used for.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
