Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A0FC433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 08:28:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B78562224D
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 08:28:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KSXmAn+8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B78562224D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FreFB+fYWsXmpiIt0OJdSkgwz6Qs1IIFMe1N2J0PJak=; b=KSXmAn+8BRRcvE0eBRmI8asyN
	wqUb2oyiBpPMjaA17RKOl2SqwYODv2UbCIR8QstTDHkmbiHXkkOq4XHAKHj8lntgOYE0tnjVyCtSz
	yHvuP9PBi07jcrWaXm4FyEktEnRsTxE9I1JJvGu9vehFdgLAHyKNqXNCLYw92TQYbvE7d++QcG7+E
	DBujGYV73uMFzktnq6RSh8mWuKOw8I6VDP+HJaD/zcaCU6OpNRXhQ4ZaoK9naqxuJHL7DmBIAga5G
	1bAhKA1/7MGX/rPuQo1A3JFTvsh/0/ilOeFPstxRyU+l0VqQAjmQde1s3a+9hAdbasmE+YK5EG9EB
	VJWDmyBdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUQWc-0002Va-Aa; Mon, 19 Oct 2020 08:28:14 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUQWW-0002Th-6d; Mon, 19 Oct 2020 08:28:09 +0000
IronPort-SDR: LcW4oYYAyNt/oX5eIDuHHJ57TijA/hYI4vVVxbFnvLmOeNzJ5fY6XEQkeMLsQJ1bwK4bacd1/x
 ei4yceLPJzwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="164374155"
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; d="scan'208";a="164374155"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 01:28:05 -0700
IronPort-SDR: 7hd6gBsRojzneDl5TKwHIK6LJCq55SCXURVXu2vXcJY3K50M2ynAVZ8ttNVMi6CtTXtEFnN//z
 AAYBPnh1EGkw==
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; d="scan'208";a="352912315"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 01:28:01 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 7EB5D206F1; Mon, 19 Oct 2020 11:27:59 +0300 (EEST)
Date: Mon, 19 Oct 2020 11:27:59 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v15 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20201019082759.GL13341@paasikivi.fi.intel.com>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-2-dongchun.zhu@mediatek.com>
 <20201013161938.GE13341@paasikivi.fi.intel.com>
 <1602641418.4733.80.camel@mhfsdcap03>
 <20201014083139.GG13341@paasikivi.fi.intel.com>
 <CAAFQd5BVzN=49s4S98E9mGNuxzOt4633dAw9mbyu3Sr-rA61qw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAFQd5BVzN=49s4S98E9mGNuxzOt4633dAw9mbyu3Sr-rA61qw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_042808_453217_C2AB6C05 
X-CRM114-Status: GOOD (  37.98  )
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
 Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= <shengnan.wang@mediatek.com>,
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

If it is not bound to the endpoint --- that specifies the properties of the
link --- then you could just put it to the driver, couldn't you?

But earlier on, we established that this is specific to a given board, or a
given link. Endpoints are used to describe connections that a device may
have to other devices. Therefore their properties are different.

The graph bindings allow for several endpoints on a single physical port,
some may be disabled in that case. This is admittedly mostly done with
CSI-2 receivers.

Either way, putting this property to the device may affect how DT source is
arranged for boards that have this device. Any similar configuration on
other devices with multiple transmitters or receivers would be in endpoints
anyway --- because they have to, so I don't see why bindings for this
device should be different.

If you put it to endpoint, the driver also doesn't need to match the link
frequencies in kHz and Hz between the two properties, but just use the same
index for both.

-- 
Sakari Ailus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
