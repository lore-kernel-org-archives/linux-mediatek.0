Return-Path: <SRS0=VWIa=CK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94494C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 16:16:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 651BC2065F
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 16:16:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q3K+i5Gn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 651BC2065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9Eo5bt3pmH3zvPId7NNMUg9TUeuKQWAA6pT6c/ZwASU=; b=Q3K+i5Gn7jM0bVeQueyBWuK3A
	L7JLWcYWCjHtNO8pMU2dWEUNQcsRwEKonVc0Xm/y4vGm4pkgc1lHCvVXNaznOSIipS68QKUO7KAn7
	CUNDIY/4iE5AaLmefT+5FDdM0B9i9eJTCA/6Cus3C7ss51i6T7mnK63etgm0Zrpj02lAAymtykvdK
	pULaiKIe1I6A9kSUEdNW8UqfC96Pixxq1SbWXw6AweImcK49e9mXoR/8kb4MJQ2Fvyh7PjgO/5Zy3
	m1tSohbMyWQSXbQHTISxsZkwxfqtUxbu0hBPG7qIofBkMIZc0v1dUbWcRF9ccs3eJIdJOa4Dpas9Y
	OTnSxMbfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD8xY-0008OH-T2; Tue, 01 Sep 2020 16:16:36 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD8xT-0008MC-EB; Tue, 01 Sep 2020 16:16:32 +0000
IronPort-SDR: OBJqX4LdeuDtwaRs1nKqShuVuerrMuiHNBo0FmTvt87jGt+9Tu/GU2TEeB4LOPoUUCdmhG2auD
 HBYKEV5Z6AwA==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="156458765"
X-IronPort-AV: E=Sophos;i="5.76,379,1592895600"; d="scan'208";a="156458765"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 09:16:28 -0700
IronPort-SDR: os/5uSk7qU9bcGqgGXd4PdXIh6WoxaIsSvv9gEkE3JPhUNZHceJ/kFaVaXVYHhU4P1Ra/sXUxS
 RnykPD2yvawg==
X-IronPort-AV: E=Sophos;i="5.76,379,1592895600"; d="scan'208";a="283440642"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 09:16:24 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id E27B3215E4; Tue,  1 Sep 2020 19:16:22 +0300 (EEST)
Date: Tue, 1 Sep 2020 19:16:22 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH v13 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200901161622.GA32646@paasikivi.fi.intel.com>
References: <20200710101850.4604-1-dongchun.zhu@mediatek.com>
 <20200710101850.4604-2-dongchun.zhu@mediatek.com>
 <CAAFQd5BB3c9nvruY0jcVbRZtbUyiFj0v8=D6KA7EPtN4rz=+wA@mail.gmail.com>
 <20200831160644.GL31019@paasikivi.fi.intel.com>
 <1598970937.4733.21.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598970937.4733.21.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_121631_671946_102A0598 
X-CRM114-Status: GOOD (  46.22  )
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
 srv_heupstream <srv_heupstream@mediatek.com>,
 Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= <shengnan.wang@mediatek.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Tomasz Figa <tfiga@chromium.org>, Louis Kuo <louis.kuo@mediatek.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 matrix.zhu@aliyun.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg  Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 01, 2020 at 10:35:37PM +0800, Dongchun Zhu wrote:
> Hi Tomasz, Sakari,
> 
> Thanks for digging into the imperfections.
> 
> On Mon, 2020-08-31 at 19:06 +0300, Sakari Ailus wrote:
> > Hi Tomasz,
> > 
> > Thanks for dressing this into words.
> > 
> > On Mon, Aug 31, 2020 at 01:44:27PM +0200, Tomasz Figa wrote:
> > > Hi Dongchun,
> > > 
> > > On Fri, Jul 10, 2020 at 12:19 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > > >
> > > > Add YAML device tree binding for OV02A10 CMOS image sensor,
> > > > and the relevant MAINTAINERS entries.
> > > >
> > > > Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > ---
> > > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 172 +++++++++++++++++++++
> > > >  MAINTAINERS                                        |   7 +
> > > >  2 files changed, 179 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > new file mode 100644
> > > > index 0000000..3a916cc
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > @@ -0,0 +1,172 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +# Copyright (c) 2020 MediaTek Inc.
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> > > > +
> > > > +maintainers:
> > > > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > +
> > > > +description: |-
> > > > +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> > > > +  image sensor, which is the latest production derived from Omnivision's CMOS
> > > > +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> > > > +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> > > > +  sensor output is available via CSI-2 serial data output.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: ovti,ov02a10
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description: top mux camtg clock
> > > > +      - description: divider clock
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: eclk
> > > > +      - const: freq_mux
> > > 
> > > Why do we have two clocks here? Looking at the example suggests that
> > > they may be the clocks of the SoC that the integration was done with.
> > > However, the binding must only define the aspects of the particular
> > > device, i.e. this sensor.
> > > 
> > > I suppose we should only have "eclk" here and it should be described
> > > as "external clock for the sensor".
> > > 
> 
> I cannot agree with you more, it would be fixed in next release.
> 
> > > > +
> > > > +  clock-frequency:
> > > > +    description:
> > > > +      Frequency of the eclk clock in Hertz.
> > > 
> > > nit: maybe Hz?
> > > 
> 
> Both shall be okay, let's use Hz instead, which seems to be more simple.
> 
> > > > +
> > > > +  dovdd-supply:
> > > > +    description:
> > > > +      Definition of the regulator used as Digital I/O voltage supply.
> > > > +
> > > > +  avdd-supply:
> > > > +    description:
> > > > +      Definition of the regulator used as Analog voltage supply.
> > > > +
> > > > +  dvdd-supply:
> > > > +    description:
> > > > +      Definition of the regulator used as Digital core voltage supply.
> > > > +
> > > > +  powerdown-gpios:
> > > > +    description:
> > > > +      Must be the device tree identifier of the GPIO connected to the
> > > > +      PD_PAD pin. This pin is used to place the OV02A10 into standby mode
> > > > +      or shutdown mode. As the line needs to be high for the powerdown mode
> > > > +      to be active, it should be marked GPIO_ACTIVE_HIGH.
> > > > +    maxItems: 1
> > > > +
> > > > +  reset-gpios:
> > > > +    description:
> > > > +      Must be the device tree identifier of the GPIO connected to the
> > > > +      RST_PD pin. If specified, it will be asserted during driver probe.
> > > > +      As the line needs to be low for the reset to be active, it should be
> > > > +      marked GPIO_ACTIVE_LOW.
> > > > +    maxItems: 1
> > > > +
> > > > +  rotation:
> > > > +    description:
> > > > +      Definition of the sensor's placement.
> > > > +    allOf:
> > > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > > +      - enum:
> > > > +          - 0    # Sensor Mounted Upright
> > > > +          - 180  # Sensor Mounted Upside Down
> > > > +        default: 0
> > > > +
> > > > +  ovti,mipi-tx-speed:
> > > > +    description:
> > > > +      Indication of MIPI transmission speed select, which is to control D-PHY
> > > > +      timing setting by adjusting MIPI clock voltage to improve the clock
> > > > +      driver capability.
> > > 
> > > The description says that the value adjusts "MIPI clock voltage".
> > > Should the property be renamed to "ovti,mipi-clock-voltage"?
> > > 
> 
> Sure, mipi-clock-voltage seems more clear, perfect naming :-)
> 
> > > > +    allOf:
> > > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > > +      - enum:
> > > > +          - 0    #  20MHz -  30MHz
> > > > +          - 1    #  30MHz -  50MHz
> > > > +          - 2    #  50MHz -  75MHz
> > > > +          - 3    #  75MHz - 100MHz
> > > > +          - 4    # 100MHz - 130MHz
> > > > +        default: 3
> > > > +
> > > 
> > > I've discussed this on IRC with Sakari. It sounds like this works as
> > > is for us because the driver currently only supports 1 mode, always
> > > running the link at 390 MHz. This won't scale if one intends to add
> > > more modes, because DT can't be expected to be updated when the driver
> > > changes. The two are expected to be separate and backwards compatible.
> > > 
> > > I think we could model this in DT as an array of <link speed, clock
> > > voltage> pairs. Similarly to the OPP bindings [1]. An example to have
> > > all link speeds up to 390 MHz use the value 4:
> > > 
> > > ovti,mipi-clock-voltages = <
> > >               /* KHz         clock voltage unit */
> > >                  390000    4
> > > >;
> > > 
> > > if one wants to select different voltage for different link, they
> > > could do so as well. With the example below, the driver should
> > > configure "3" for link frequencies <= 150 MHz and "4" for > 150 MHz <=
> > > 390 MHz. Link frequencies > 390 MHz should be disallowed.
> > > 
> > > ovti,mipi-clock-voltages = <
> > >               /* KHz         clock voltage unit */
> > >                  150000    3
> > >                  390000    4
> > > >;
> > > 
> > > What do you think?
> > 
> 
> So now we define the MIPI clock voltage (unit) as one function of link
> frequency?
> 
> For current sensor mode (1600x1200, 390MHz link frequency), we then
> shall always use the value 4 to configure the MIPI transmission speed
> selection (P1:0xA1). Am I correct in thinking that?
> 
> > One more note on my proposal: use the index of the link frequency to access
> > the ovti,mipi-clock-voltages array. That should be more simple for the
> > driver, as the driver is expected to use only link frequencies listed in DT
> > bindings anyway.
> > 
> 
> Good idea! That's exactly what I mean.
> Just submitted one draft change to handle the new property in DT.
> @Sakari @Tomasz please help to review it.
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2387980/1/drivers/media/i2c/ov02a10.c#883

Please send it to the list.

-- 
Sakari Ailus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
