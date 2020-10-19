Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA2FC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 19:20:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DC752225A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 19:20:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uyKWzhkb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ayFfmURn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DC752225A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YXuuiykFIJImEQgOS8jeu4n2vKEUhasCQu5OF4+7tUY=; b=uyKWzhkbdR/dJJcS96MPeSQJS
	2cgfOifxMnlNMF6PXpVhndz64jfghkiK7R5Pm/1D+BkRfBHx1RMW2C01qeCwOCkSGwFgvlZVA74VM
	9ywXnZ+RGnJbw8OiuQUjqi59U+Z5bq0pwPz363FemeEDIhbnWG1tuy8tMqHF9U8Ig6XH/pb+lgVXB
	Mr00cdlgAh8QniCrvlmrXQgGr0FvtnkZfYi/brXzmHt3PnJLhk5QrPHwe6rdo2+4Z8GDn6jcOZhxU
	cfpre1UoYiBCLN2RfgDU4sexQTRM4twRGNE7Ylb6JVnqc3PDr/aNSYHt3uDX+g0mRCnzqisUUeTv4
	FzftE1auQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUahz-0006CY-S1; Mon, 19 Oct 2020 19:20:39 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUahu-0006BF-9b
 for linux-mediatek@lists.infradead.org; Mon, 19 Oct 2020 19:20:35 +0000
Received: by mail-ej1-x642.google.com with SMTP id a3so603000ejy.11
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Oct 2020 12:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MbpPIoPzTpMpNm1nC5xfdtc0dU2BeKn/AYB4IBKnH4g=;
 b=ayFfmURnpiUCCBhURRXNsWakezv/PyUrpMyAVQ4638TzOxFw8XxEhjedRoM+UanEEH
 GL+mqAHg53prCECXVrHNs69s00f3k6eXPOLsfNBbpIPH2V/V7p5BoJVKInrUd0gf84mh
 AudndqJCfYHFqVLkiOZ6FU0m3wQsVAZawLToQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MbpPIoPzTpMpNm1nC5xfdtc0dU2BeKn/AYB4IBKnH4g=;
 b=UgQNLeU1JgkkjMisyzZmnPgB7pAMByYz0hAuUtOwTwCMsohe9bWScZt1+HIccjd4LY
 xQUEjDhKn+8ArDlfNUQdr1KuYxMHGPeSyDMC7FZ9uZtZ58b/t7D4Wzr2KOIJv/yijECB
 Z5U5FP28Vyy0obMpM2fED2PIg5xLpRPGgWBS9miRHzVW9yTvY3Q7hKfWdTmRx5EO3zez
 mIKZIytB35acjCP+DPjac/yYAertk01BJUJENKwB3v0I5lTrGT+hB3sLv9pi83EO6YUY
 Fkz//BITlkLb3qba0x/okbzksiDkbzD5XLyyFEjL3oqfTQZhWUlR8QUaMDi1AqJob4BM
 EjHg==
X-Gm-Message-State: AOAM530na/Mq0u2mh7QNqt1MJilFxDS5Np5w91VTYThTLlOwB/YW6E6y
 eKbLXnUafoOirFBSF7cpTBEV6NajseBYArzl
X-Google-Smtp-Source: ABdhPJzgyiMTYIQ/kiHzq4/eFmT2eBPSVinV+dmjl5SA48jrUkM4Fqz+KAOTsV6yeZ9IVPgQno7gZg==
X-Received: by 2002:a17:907:3393:: with SMTP id
 zj19mr1395249ejb.258.1603135230870; 
 Mon, 19 Oct 2020 12:20:30 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42])
 by smtp.gmail.com with ESMTPSA id b13sm791302edk.22.2020.10.19.12.20.26
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 12:20:27 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id i1so1019009wro.1
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Oct 2020 12:20:26 -0700 (PDT)
X-Received: by 2002:adf:ab05:: with SMTP id q5mr829770wrc.32.1603135226373;
 Mon, 19 Oct 2020 12:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-2-dongchun.zhu@mediatek.com>
 <20201013161938.GE13341@paasikivi.fi.intel.com>
 <1602641418.4733.80.camel@mhfsdcap03>
 <20201014083139.GG13341@paasikivi.fi.intel.com>
 <CAAFQd5BVzN=49s4S98E9mGNuxzOt4633dAw9mbyu3Sr-rA61qw@mail.gmail.com>
 <20201019082759.GL13341@paasikivi.fi.intel.com>
In-Reply-To: <20201019082759.GL13341@paasikivi.fi.intel.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 19 Oct 2020 21:20:15 +0200
X-Gmail-Original-Message-ID: <CAAFQd5B9inO_-WJdJg_EMULw-e0EAAo8DXNgo5d+qrGvq6F8qQ@mail.gmail.com>
Message-ID: <CAAFQd5B9inO_-WJdJg_EMULw-e0EAAo8DXNgo5d+qrGvq6F8qQ@mail.gmail.com>
Subject: Re: [PATCH v15 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
To: Sakari Ailus <sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_152034_365385_ED2A490D 
X-CRM114-Status: GOOD (  41.88  )
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

On Mon, Oct 19, 2020 at 10:28 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Wed, Oct 14, 2020 at 01:48:00PM +0200, Tomasz Figa wrote:
> > On Wed, Oct 14, 2020 at 10:31 AM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > On Wed, Oct 14, 2020 at 10:10:18AM +0800, Dongchun Zhu wrote:
> > > > Hello Sakari,
> > > >
> > > > Thanks for your timely review.
> > > >
> > > > On Tue, 2020-10-13 at 19:19 +0300, Sakari Ailus wrote:
> > > > > Hi Dongchun,
> > > > >
> > > > > On Tue, Oct 13, 2020 at 09:05:02PM +0800, Dongchun Zhu wrote:
> > > > > > Add YAML device tree binding for OV02A10 CMOS image sensor, and the
> > > > > > relevant MAINTAINERS entries.
> > > > > >
> > > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > ---
> > > > > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 162 +++++++++++++++++++++
> > > > > >  MAINTAINERS                                        |   7 +
> > > > > >  2 files changed, 169 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > >
> > > >
> > > > [snip]...
> > > >
> > > > > > +  ovti,mipi-clock-voltage:
> > > > > > +    description:
> > > > > > +      An array of 2-tuples items, and each item consists of link frequency and
> > > > > > +      MIPI clock voltage unit like <freq-kHz volt-unit>. Clock voltage unit is
> > > > > > +      dependent upon link speed, indicating MIPI transmission speed select that
> > > > > > +      controls D-PHY timing setting by adjusting MIPI clock voltage to improve
> > > > > > +      the clock driver capability.
> > > > > > +    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> > > > > > +    minItems: 2
> > > > > > +    default: [390000, 4]
> > > > >
> > > > > Why do you have the link frequency here as well?
> > > > >
> > > > > In principle this does belong to the endpoint as link frequencies are
> > > > > specific to that, but I don't mind; there's just a single port anyway.
> > > > >
> > > >
> > > > This is an optional property which we model as an array of <link speed,
> > > > clock voltage> pairs. An example to have all link speeds up to 390MHz
> > > > use the value 4 for current driver. If one wants to select different
> > > > voltage for different link, they could do so as well.
> > >
> > > If you think you'd need that, then you need to put this to the endpoint.
> >
> > The mipi-clock-voltage property is not a property of the endpoint. The
> > link frequency there does not set the link frequency - it only
> > specifies which link frequency the given voltage should be used for.
>
> If it is not bound to the endpoint --- that specifies the properties of the
> link --- then you could just put it to the driver, couldn't you?
>
> But earlier on, we established that this is specific to a given board, or a
> given link. Endpoints are used to describe connections that a device may
> have to other devices. Therefore their properties are different.
>
> The graph bindings allow for several endpoints on a single physical port,
> some may be disabled in that case. This is admittedly mostly done with
> CSI-2 receivers.
>
> Either way, putting this property to the device may affect how DT source is
> arranged for boards that have this device. Any similar configuration on
> other devices with multiple transmitters or receivers would be in endpoints
> anyway --- because they have to, so I don't see why bindings for this
> device should be different.
>
> If you put it to endpoint, the driver also doesn't need to match the link
> frequencies in kHz and Hz between the two properties, but just use the same
> index for both.

I agree in general, but I think in this case this is a device-specific
property and the sensor only has 1 CSI-2 interface, so maybe it
doesn't really matter?

Specifying frequency, voltage pairs is a common practice in other
bindings, such as the OPP bindings, by the way.

That said, if you insist, I'm fine with this being moved to the
endpoint node too.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
