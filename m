Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DA9C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 12:59:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD46E21D7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 12:59:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HnI7nK39";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JjfRZyMy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD46E21D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ttRMs0Rpb6C2zqclpq/BK2Mzy9SLHbnuPJG+PO25fDc=; b=HnI7nK39p1NgGbhvKzwuLshR3
	qxUHHKSkj+FRZp5ekQnu9njBdzs4xDn8d7fReB9P38XMy3hjn5HfguAC32jJu06VxYXnbEvzJV9+u
	T6FwGuj3noWaEB3ZgNY0pCqsqg2GXtxe8YbM+WJAziF1YdeGkqdhJj6vWaaZoptEoS+cD34RpUAq5
	OTQKNIFGSOMMPs7lrI5FlbIHBdSbB1A3wRy7MD53UnoZkA0UMutZARltbcg4QqWaz05coIoXWI9eg
	9YF0QaigndSEOChZ0exNB418waexgpdcSzzeijVYEZ4ppyp8k2znlRbflnyYnkGP3LHDLd3ZszIWg
	4MMM2mm/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfjWo-0002Pn-19; Thu, 19 Nov 2020 12:59:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfjWl-0002O6-25; Thu, 19 Nov 2020 12:59:08 +0000
X-UUID: 0bb33657af724380822bf3bdf701afe7-20201119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jtIPXLdRzRuqtAWsnlgJ678Skl74sQc1PCkrSIeeLWc=; 
 b=JjfRZyMyiqqLW2gQfa/o6j/BNQBKm6/cESXzVPrGtkQasFXhiYNRV6+qPu/oGN1ULJg27pyeZ451Hi6GXzT2RpNqFmImz4OK8Njpi/tyTJ4dqgs+ENND4AUnuOFQf1dmus/Iz+cwL7NMoOykZUKEDMCE9ofZMLRk2KC6iBoEOs0=;
X-UUID: 0bb33657af724380822bf3bdf701afe7-20201119
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1670620635; Thu, 19 Nov 2020 04:58:55 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 04:58:54 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 19 Nov 2020 20:58:45 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 Nov 2020 20:58:44 +0800
Message-ID: <1605790724.4733.107.camel@mhfsdcap03>
Subject: Re: [PATCH v15 1/2] media: dt-bindings: media: i2c: Document
 OV02A10 bindings
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 19 Nov 2020 20:58:44 +0800
In-Reply-To: <20201030162756.GR26150@paasikivi.fi.intel.com>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-2-dongchun.zhu@mediatek.com>
 <20201013161938.GE13341@paasikivi.fi.intel.com>
 <1602641418.4733.80.camel@mhfsdcap03>
 <20201014083139.GG13341@paasikivi.fi.intel.com>
 <CAAFQd5BVzN=49s4S98E9mGNuxzOt4633dAw9mbyu3Sr-rA61qw@mail.gmail.com>
 <20201019082759.GL13341@paasikivi.fi.intel.com>
 <CAAFQd5B9inO_-WJdJg_EMULw-e0EAAo8DXNgo5d+qrGvq6F8qQ@mail.gmail.com>
 <20201030162756.GR26150@paasikivi.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 35267B2D9D4741786357859B1F81D467D956B070A5A5332966B0F689BDE873402000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_075907_338624_C184AD9C 
X-CRM114-Status: GOOD (  46.14  )
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
 Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Shengnan
 Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?=
 <shengnan.wang@mediatek.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Tomasz Figa <tfiga@chromium.org>, Louis Kuo <louis.kuo@mediatek.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dongchun.zhu@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Cao Bing Bu <bingbu.cao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS
 <iommu@lists.linux-foundation.org>, Joerg  Roedel <joro@8bytes.org>,
 " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sakari,

On Fri, 2020-10-30 at 18:27 +0200, Sakari Ailus wrote:
> Hi Tomasz, Dongchun,
> 
> On Mon, Oct 19, 2020 at 09:20:15PM +0200, Tomasz Figa wrote:
> > On Mon, Oct 19, 2020 at 10:28 AM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > On Wed, Oct 14, 2020 at 01:48:00PM +0200, Tomasz Figa wrote:
> > > > On Wed, Oct 14, 2020 at 10:31 AM Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:
> > > > >
> > > > > On Wed, Oct 14, 2020 at 10:10:18AM +0800, Dongchun Zhu wrote:
> > > > > > Hello Sakari,
> > > > > >
> > > > > > Thanks for your timely review.
> > > > > >
> > > > > > On Tue, 2020-10-13 at 19:19 +0300, Sakari Ailus wrote:
> > > > > > > Hi Dongchun,
> > > > > > >
> > > > > > > On Tue, Oct 13, 2020 at 09:05:02PM +0800, Dongchun Zhu wrote:
> > > > > > > > Add YAML device tree binding for OV02A10 CMOS image sensor, and the
> > > > > > > > relevant MAINTAINERS entries.
> > > > > > > >
> > > > > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > > > ---
> > > > > > > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 162 +++++++++++++++++++++
> > > > > > > >  MAINTAINERS                                        |   7 +
> > > > > > > >  2 files changed, 169 insertions(+)
> > > > > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > > > >
> > > > > >
> > > > > > [snip]...
> > > > > >
> > > > > > > > +  ovti,mipi-clock-voltage:
> > > > > > > > +    description:
> > > > > > > > +      An array of 2-tuples items, and each item consists of link frequency and
> > > > > > > > +      MIPI clock voltage unit like <freq-kHz volt-unit>. Clock voltage unit is
> > > > > > > > +      dependent upon link speed, indicating MIPI transmission speed select that
> > > > > > > > +      controls D-PHY timing setting by adjusting MIPI clock voltage to improve
> > > > > > > > +      the clock driver capability.
> > > > > > > > +    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> > > > > > > > +    minItems: 2
> > > > > > > > +    default: [390000, 4]
> > > > > > >
> > > > > > > Why do you have the link frequency here as well?
> > > > > > >
> > > > > > > In principle this does belong to the endpoint as link frequencies are
> > > > > > > specific to that, but I don't mind; there's just a single port anyway.
> > > > > > >
> > > > > >
> > > > > > This is an optional property which we model as an array of <link speed,
> > > > > > clock voltage> pairs. An example to have all link speeds up to 390MHz
> > > > > > use the value 4 for current driver. If one wants to select different
> > > > > > voltage for different link, they could do so as well.
> > > > >
> > > > > If you think you'd need that, then you need to put this to the endpoint.
> > > >
> > > > The mipi-clock-voltage property is not a property of the endpoint. The
> > > > link frequency there does not set the link frequency - it only
> > > > specifies which link frequency the given voltage should be used for.
> > >
> > > If it is not bound to the endpoint --- that specifies the properties of the
> > > link --- then you could just put it to the driver, couldn't you?
> > >
> > > But earlier on, we established that this is specific to a given board, or a
> > > given link. Endpoints are used to describe connections that a device may
> > > have to other devices. Therefore their properties are different.
> > >
> > > The graph bindings allow for several endpoints on a single physical port,
> > > some may be disabled in that case. This is admittedly mostly done with
> > > CSI-2 receivers.
> > >
> > > Either way, putting this property to the device may affect how DT source is
> > > arranged for boards that have this device. Any similar configuration on
> > > other devices with multiple transmitters or receivers would be in endpoints
> > > anyway --- because they have to, so I don't see why bindings for this
> > > device should be different.
> > >
> > > If you put it to endpoint, the driver also doesn't need to match the link
> > > frequencies in kHz and Hz between the two properties, but just use the same
> > > index for both.
> > 
> > I agree in general, but I think in this case this is a device-specific
> > property and the sensor only has 1 CSI-2 interface, so maybe it
> > doesn't really matter?
> > 
> > Specifying frequency, voltage pairs is a common practice in other
> > bindings, such as the OPP bindings, by the way.
> > 
> > That said, if you insist, I'm fine with this being moved to the
> > endpoint node too.
> 
> Please, unless there are sound technical reasons to do otherwise.
> 

Sorry for the late reply.

In fact I'm still wonder whether 'MIPI clock voltage unit' here is a
very common or meaningful property that needs to be moved to the
endpoint data structure in v4l2 framework. Just because it relates to
link frequency?

In another words, if we set clock voltage as a separate property, as
patchset 13 or earlier version presents, is there no need to move the
position?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
