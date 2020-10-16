Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666B2C433E7
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 17:21:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D947420704
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 17:21:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wznyYf3i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D947420704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V9/MEVQCUqdxA2u1ViTILqHm8FZ7Q32wpVlyjK3d8kc=; b=wznyYf3iaWRDVxS2xrg3AjCo8
	7o+4ZDZI9USAHzTtVBw1ylN+4gY/BMKi33q92BHig8Mmd7qSQ16/643R4pxcRVmIIIzEIp9PJtLho
	TS/wrs+bB64Ock4p5jPTFEoFlCydk/qLnnohHMWi4oy0W25trJlUZKoHGVmyuzICPbPvMOI5sPHe/
	T86g5u8qM1H+u98OzgEs2o3CjW4gkks7Qwv8A3aXPh9SspKPHkiIldpY0Ax8VwewsXdy3PYj50IlU
	c58CqnSMuOaPJ8v6WCzlqkk8KooyPDoSIhIhyiFlWVZSED7P3zIcgxxVwn5eJOxLU6JSh+OlRfWKl
	B5xXdk1SA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTTQ8-0006nW-1X; Fri, 16 Oct 2020 17:21:36 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTTQ4-0006mj-IE; Fri, 16 Oct 2020 17:21:33 +0000
Received: by mail-ot1-f66.google.com with SMTP id f10so3081146otb.6;
 Fri, 16 Oct 2020 10:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cuu3XyjKtEmeq+Akh/2IqEbAQRGMvswQSSuIN5iYFL8=;
 b=SDD6FCa2QB9xillk0FEQ8akuU8I4ykKbIVnVyipbimE/0UxwtQnV9zopxyUasP6N0m
 9OWk0VAe0Fa6S1jwHdOPmUiwnc595Wx52uP87poYXMdsL0ffd76k7NWkearK3Z8jv+qc
 O2fei2NIWqPsWPYLC6h7iGTPgtTV8C/kP2udXu6uEGdWOzF2zfBYJKK1q0BhVsRV7yZy
 ZCq6SrHHSWxiIls0EyCuwolI1CdGctwcmycR3wIwhZRNRYmSHLsZyYwBP6CFHKkZuJ2o
 CC3H2ARdvMTkcjNiJsaif/2PqOjXNV1hyYQ/VJ/lKliNi2GVmBhO5/ddiO3BwygkTSh6
 M2vw==
X-Gm-Message-State: AOAM533ct0TyAO6CKQX5WLLR85qmV90HBUF8xuKWt3bO7XxvuSR/if3h
 l/GitMpdM/zNvvMS5DZeuQ==
X-Google-Smtp-Source: ABdhPJxp6hO1e2GFF+46cRfsByTXMzBlFBNBzxrIs7A5OIEpQioC0M9ZdrZj4e5mZiyAKdN2X7X3Fg==
X-Received: by 2002:a9d:73c6:: with SMTP id m6mr3381977otk.105.1602868891876; 
 Fri, 16 Oct 2020 10:21:31 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c18sm1226145oib.34.2020.10.16.10.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 10:21:31 -0700 (PDT)
Received: (nullmailer pid 1602664 invoked by uid 1000);
 Fri, 16 Oct 2020 17:21:29 -0000
Date: Fri, 16 Oct 2020 12:21:29 -0500
From: Rob Herring <robh@kernel.org>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v15 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20201016172129.GA1598042@bogus>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-2-dongchun.zhu@mediatek.com>
 <20201013161938.GE13341@paasikivi.fi.intel.com>
 <1602641418.4733.80.camel@mhfsdcap03>
 <20201014083139.GG13341@paasikivi.fi.intel.com>
 <CAAFQd5BVzN=49s4S98E9mGNuxzOt4633dAw9mbyu3Sr-rA61qw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAFQd5BVzN=49s4S98E9mGNuxzOt4633dAw9mbyu3Sr-rA61qw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_132132_608367_22B8D964 
X-CRM114-Status: GOOD (  30.14  )
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
 linux-devicetree <devicetree@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= <shengnan.wang@mediatek.com>,
 Louis Kuo <louis.kuo@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 14, 2020 at 01:48:00PM +0200, Tomasz Figa wrote:
> On Wed, Oct 14, 2020 at 10:31 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > On Wed, Oct 14, 2020 at 10:10:18AM +0800, Dongchun Zhu wrote:
> > > Hello Sakari,
> > >
> > > Thanks for your timely review.
> > >
> > > On Tue, 2020-10-13 at 19:19 +0300, Sakari Ailus wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Tue, Oct 13, 2020 at 09:05:02PM +0800, Dongchun Zhu wrote:
> > > > > Add YAML device tree binding for OV02A10 CMOS image sensor, and the
> > > > > relevant MAINTAINERS entries.
> > > > >
> > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > ---
> > > > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 162 +++++++++++++++++++++
> > > > >  MAINTAINERS                                        |   7 +
> > > > >  2 files changed, 169 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > >
> > >
> > > [snip]...
> > >
> > > > > +  ovti,mipi-clock-voltage:
> > > > > +    description:
> > > > > +      An array of 2-tuples items, and each item consists of link frequency and
> > > > > +      MIPI clock voltage unit like <freq-kHz volt-unit>. Clock voltage unit is
> > > > > +      dependent upon link speed, indicating MIPI transmission speed select that
> > > > > +      controls D-PHY timing setting by adjusting MIPI clock voltage to improve
> > > > > +      the clock driver capability.
> > > > > +    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> > > > > +    minItems: 2
> > > > > +    default: [390000, 4]
> > > >
> > > > Why do you have the link frequency here as well?
> > > >
> > > > In principle this does belong to the endpoint as link frequencies are
> > > > specific to that, but I don't mind; there's just a single port anyway.
> > > >
> > >
> > > This is an optional property which we model as an array of <link speed,
> > > clock voltage> pairs. An example to have all link speeds up to 390MHz
> > > use the value 4 for current driver. If one wants to select different
> > > voltage for different link, they could do so as well.
> >
> > If you think you'd need that, then you need to put this to the endpoint.
> 
> The mipi-clock-voltage property is not a property of the endpoint. The
> link frequency there does not set the link frequency - it only
> specifies which link frequency the given voltage should be used for.

Seems to me it's in the right place.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
