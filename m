Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5475C433E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 02:42:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 738792177B
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 02:42:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tt7svRwA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ea7G4iYb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 738792177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=10Z/GJZixkdek9c+l0rtggrsRmJg822efGWhrAzNm+c=; b=tt7svRwAZ0zYfyK6V01T1lx9Y
	/Zw9Xo/K7QGkTJsBAdK55qjbJ135ZHBJ1ZvNzl9CW34yG6nojPgazMLqhM3dfIQb3W/yFHC23aRUY
	/xj/fYZJho4yVnF33YOUrFexBKqFPA/Y8J49ZOHFnG9cm1kzLZXwTEkaQOX86l8eofbJKX1bDIEyP
	s8G4Q0ONyzNcy9MrGKjSW+ylfEgyIJikWY6kRqp1NmmE3b7Waa3HlLEPhK0Pu7SxrXK16W1ZoD2aQ
	bMUH7PGLQ6620T/UHTQRV4NMacyR+FzwcG5AQL01uDedPR+FV9KT4ocC8JK81ETRagluTsYT/x6Uo
	uOYgu775A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxLkt-0006yu-D7; Mon, 20 Jul 2020 02:42:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxLkq-0006y5-HG; Mon, 20 Jul 2020 02:42:14 +0000
X-UUID: 8ceede4116cf45d5a4367eedbe2e868f-20200719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nRJbkNge/6U8QFSquZNdXuEsFfzsAfQcy/KuTN01eTU=; 
 b=ea7G4iYbNBu3rD8jiyz45OAz6Its0dU0WWe2z9PTPOezjKpWW7exsY8oxvfKObOiyQTFCs09f6H+8zjpIbqxSE23TEjvkcajTJz0zH33IG/MkyLnNQdtbvcEdRd4hJWh/Q2lNPpGjOuXRd0vO28gQkqFa31jxaQM4uqAq63OVg4=;
X-UUID: 8ceede4116cf45d5a4367eedbe2e868f-20200719
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1185206478; Sun, 19 Jul 2020 18:41:55 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 19 Jul 2020 19:32:00 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 20 Jul 2020 10:31:58 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 20 Jul 2020 10:31:57 +0800
Message-ID: <1595212256.17166.116.camel@mhfsdcap03>
Subject: Re: [V7, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 20 Jul 2020 10:30:56 +0800
In-Reply-To: <CAAFQd5A9L73et30Fr_91sqfQGue7Qo05yCchU_S6bh5H4sBiMQ@mail.gmail.com>
References: <20200505070451.GS9190@paasikivi.fi.intel.com>
 <1588688238.8804.150.camel@mhfsdcap03>
 <20200506112136.GV9190@paasikivi.fi.intel.com>
 <1588856325.8804.179.camel@mhfsdcap03>
 <CAAFQd5CXRD_j7Xkxb4=9kkd+pDy4W5pirAPSG8RsMVH6L-MU2w@mail.gmail.com>
 <20200507141147.GF9190@paasikivi.fi.intel.com>
 <CAAFQd5DgDk57MCc4vE9VmifZYjtO_SUFss+vc8W-28SFHbKDrA@mail.gmail.com>
 <1588920685.8804.230.camel@mhfsdcap03>
 <20200510223552.GA11272@paasikivi.fi.intel.com>
 <1589197265.8804.262.camel@mhfsdcap03>
 <20200715140110.GD16711@paasikivi.fi.intel.com>
 <CAAFQd5A9L73et30Fr_91sqfQGue7Qo05yCchU_S6bh5H4sBiMQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5B3CADBF14684A372A52AEA272B292F334E02DBD6C86090FC4E4B973B7A630D52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200719_224212_796741_420889FC 
X-CRM114-Status: GOOD (  37.66  )
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
Cc: Mark
 Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Shengnan
 Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?=
 <shengnan.wang@mediatek.com>, Louis Kuo <louis.kuo@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dongchun.zhu@mediatek.com, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing
 Bu <bingbu.cao@intel.com>, matrix.zhu@aliyun.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>, "list@263.net:IOMMU DRIVERS
 <iommu@lists.linux-foundation.org>, Joerg  Roedel <joro@8bytes.org>,
 " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sakari, Tomasz,

Thanks for the review.

On Thu, 2020-07-16 at 16:57 +0200, Tomasz Figa wrote:
> On Wed, Jul 15, 2020 at 4:01 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > hi Dongchun,
> >
> > On Mon, May 11, 2020 at 07:41:05PM +0800, Dongchun Zhu wrote:
> > > Hi Sakari,
> > >
> > > On Mon, 2020-05-11 at 01:35 +0300, Sakari Ailus wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Fri, May 08, 2020 at 02:51:25PM +0800, Dongchun Zhu wrote:
> > > > > Hi Sakari, Tomasz,
> > > > >
> > > > > On Thu, 2020-05-07 at 16:25 +0200, Tomasz Figa wrote:
> > > > > > On Thu, May 7, 2020 at 4:12 PM Sakari Ailus
> > > > > > <sakari.ailus@linux.intel.com> wrote:
> > > > > > >
> > > > > > > Hi Tomasz, Dongchun,
> > > > > > >
> > > > > > > On Thu, May 07, 2020 at 03:50:40PM +0200, Tomasz Figa wrote:
> > > > > > > > Hi Sakari and Dongchun,
> > > > > > > >
> > > > > > > > On Thu, May 7, 2020 at 3:00 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > > > > > > > >
> > > > > > > > > Hi Sakari,
> > > > > > > > >
> > > > > > > > > Thanks for the review.
> > > > > > > > >
> > > > > > > > > On Wed, 2020-05-06 at 14:21 +0300, Sakari Ailus wrote:
> > > > > > > > > > Hi Dongchun,
> > > > > > > > > >
> > > > > > > > > > On Tue, May 05, 2020 at 10:17:18PM +0800, Dongchun Zhu wrote:
> > > > > > > > > > > Hi Sakari,
> > > > > > > > > > >
> > > > > > > > > > > Thanks for the review.
> > > > > > > > > > >
> > > > > > > > > > > On Tue, 2020-05-05 at 10:04 +0300, Sakari Ailus wrote:
> > > > > > > > > > > > Hi Dongchun,
> > > > > > > > > > > >
> > > > > > > > > > > > On Thu, Apr 30, 2020 at 04:09:23PM +0800, Dongchun Zhu wrote:
> > > > > > > > > > > > > Add DT bindings documentation for Omnivision OV02A10 image sensor.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > > > > > > > > ---
> > > > > > > > > > > > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 148 +++++++++++++++++++++
> > > > > > > > > > > > >  MAINTAINERS                                        |   7 +
> > > > > > > > > > > > >  2 files changed, 155 insertions(+)
> > > > > > > > > > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > > > > > > > > >
> > > > > > > > > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > > > > > > > > > new file mode 100644
> > > > > > > > > > > > > index 0000000..2be4bd2
> > > > > > > > > > > > > --- /dev/null
> > > > > > > > > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > > > > > > > > > @@ -0,0 +1,148 @@
> > > > > > > > > > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > > > > > > > > > +# Copyright (c) 2020 MediaTek Inc.
> > > > > > > > > > > > > +%YAML 1.2
> > > > > > > > > > > > > +---
> > > > > > > > > > > > > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> > > > > > > > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +maintainers:
> > > > > > > > > > > > > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +description: |-
> > > > > > > > > > > > > +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> > > > > > > > > > > > > +  image sensor, which is the latest production derived from Omnivision's CMOS
> > > > > > > > > > > > > +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> > > > > > > > > > > > > +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> > > > > > > > > > > > > +  sensor output is available via CSI-2 serial data output.
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +properties:
> > > > > > > > > > > > > +  compatible:
> > > > > > > > > > > > > +    const: ovti,ov02a10
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +  reg:
> > > > > > > > > > > > > +    maxItems: 1
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +  clocks:
> > > > > > > > > > > > > +    items:
> > > > > > > > > > > > > +      - description: top mux camtg clock
> > > > > > > > > > > > > +      - description: devider clock
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +  clock-names:
> > > > > > > > > > > > > +    items:
> > > > > > > > > > > > > +      - const: eclk
> > > > > > > > > > > > > +      - const: freq_mux
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +  clock-frequency:
> > > > > > > > > > > > > +    description:
> > > > > > > > > > > > > +      Frequency of the eclk clock in Hertz.
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +  dovdd-supply:
> > > > > > > > > > > > > +    description:
> > > > > > > > > > > > > +      Definition of the regulator used as interface power supply.
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +  avdd-supply:
> > > > > > > > > > > > > +    description:
> > > > > > > > > > > > > +      Definition of the regulator used as analog power supply.
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +  dvdd-supply:
> > > > > > > > > > > > > +    description:
> > > > > > > > > > > > > +      Definition of the regulator used as digital power supply.
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +  powerdown-gpios:
> > > > > > > > > > > > > +    description:
> > > > > > > > > > > > > +      The phandle and specifier for the GPIO that controls sensor powerdown.
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +  reset-gpios:
> > > > > > > > > > > > > +    description:
> > > > > > > > > > > > > +      The phandle and specifier for the GPIO that controls sensor reset.
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +  rotation:
> > > > > > > > > > > > > +    description:
> > > > > > > > > > > > > +      Definition of the sensor's placement, valid values are 0 and 180.
> > > > > > > > > > > > > +    allOf:
> > > > > > > > > > > > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > > > > > > > > > > > +      - enum:
> > > > > > > > > > > > > +          - 0    # Sensor Mounted Upright
> > > > > > > > > > > > > +          - 180  # Sensor Mounted Upside Down
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +  ovti,mipi-tx-speed:
> > > > > > > > > > > > > +    description:
> > > > > > > > > > > > > +      Indication of MIPI transmission speed select.
> > > > > > > > > > > >
> > > > > > > > > > > > What exactly does this signify? And how do you come up with the number?
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Apologies for not addressing this number clear.
> > > > > > > > > > >
> > > > > > > > > > > From the datasheet, P1:0xA1 register represents TX_SPEED_AREA_SEL with
> > > > > > > > > > > the default val: 0x03.
> > > > > > > > > > > The description of this RW register is as below:
> > > > > > > > > > > Bit[2:0]: MIPI transmission speed select.
> > > > > > > > > > >
> > > > > > > > > > > Thus the enum should be definited as [ 0, 1, 2, 3, 4, 5, 6, 7 ].
> > > > > > > > > > > This would be fixed in next release.
> > > > > > > > > > >
> > > > > > > > > > > In the meantime, as the default val of P1:0xA1 is 0x03, we hope to keep
> > > > > > > > > > > that value if there is no setting for this private property in DT.
> > > > > > > > > > > The caller in driver would be updated like this in next release.
> > > > > > > > > > > if (ov02a10->mipi_clock_tx_speed)
> > > > > > > > > > >     ret = i2c_smbus_write_byte_data(...,...);
> > > > > > > > > >
> > > > > > > > > > How did you pick the value in the example? And why do you believe it is
> > > > > > > > > > specific to a platform, and not e.g. a sensor mode?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > We look into P1:0XA1, one register that defines MIPI transmission speed
> > > > > > > > > select.
> > > > > > > > > From the datasheet, we can get the possible values that could be set to
> > > > > > > > > P1:0xA1.
> > > > > > > > >
> > > > > > > > > Actually this register is an independent of sensor mode, it is just
> > > > > > > > > included in sensor mode's register setting table.
> > > > > > > > >
> > > > > > > > > In addition, this private DT Property is created to fix the MIPI test
> > > > > > > > > failure. The register values are adjusted and verified from vendor to
> > > > > > > > > make sensor signal meet MIPI specification.
> > > > > > > > >
> > > > > > > >
> > > > > > > > In theory the value could depend on the mode, because different link
> > > > > > > > rate could impose different requirements for the physical interface.
> > > > > > > > In practice, we haven't seen any hardware that would require different
> > > > > > > > values for different modes.
> > > > > > >
> > > > > > > The mode (possibly in conjunction with other information available to the
> > > > > > > driver via V4L2 fwnode interface) precisely defines the parameters of the
> > > > > > > CSI-2 bus --- apart from the possible exception of the bus timing related
> > > > > > > parameters but this is not supported by the name of the parameter.
> > > > > > >
> > > > > > > Therefore I don't see how this parameter, which supposedly is used to
> > > > > > > determine the CSI-2 transmissions speed, could be board specific and thus
> > > > > > > belong to DT.
> > > > > >
> > > > > > According to the very imprecise information I have access to, it is
> > > > > > not about the CSI-2 bus itself, but rather some internal parameter of
> > > > > > the sensor's CSI interface. Unfortunately there isn't much information
> > > > > > on what this value exactly controls...
> > > > > >
> > > > > > Best regards,
> > > > > > Tomasz
> > > > >
> > > > > Just got some feedback from OV vendor about this parameter.
> > > > >
> > > > > P1:0xA1 is the register to control D-PHY timing setting based on bclk.
> > > > > It is to adjust the MIPI clock voltage to improve the clock drive
> > > > > capability, and has no affect on the transmission speed of MIPI data.
> > > > >
> > > > > From vendor's perspective, P1:0xA1 depends upon the length of FPC of
> > > > > camera module that used on the board. Considering the physical
> > > > > connections for MIPI signals to user-facing camera are very different
> > > > > between our 2 projects, it can be very difficult to find universal SI
> > > > > parameters for both projects.
> > > >
> > > > Are you using different values for this parameter on these two projects?
> > > >
> > >
> > > Yes. We're actually assigning two different values to this property.
> > > One is 0x03, the other is 0x04.
> > >
> > > > >
> > > > > Thus here we create one new DT property to separate these tuning in
> > > > > driver, to be more like project-specific.
> > > > >
> > > > > More details about the register is as below.
> > > > > P1:0xA1 val: 0x03 default
> > > > > Case: 0  20MHz-30MHz
> > > > >       1  30MHz-50MHz
> > > > >       2  50MHz-75MHz
> > > > >       3  75MHz-100MHz   (default, old DB setting use)
> > > > >       4  100MHz-130MHz  (suggested, new DB setting use)
> > > > >       5  Manual
> > > > > So the value in the example should be [ 0, 1, 2, 3, 4, 5 ].
> > > > >
> > > > > Additionally, P1:0xA1 is recommended to be set as 0x04 in the newest DB
> > > > > setting. We would adjust the register in next release.
> > > >
> > > > Thank you for digging into the issue.
> > > >
> > > > Based on the above description, the parameter would depend on both the link
> > > > frequency and possibly also on wire length. I guess there's no harm from
> > > > using too strong drive, apart from perhaps power consumption? As in
> > > > principle this could be different for different sensor modes. Albeit I
> > > > don't remember seeing a sensor where such a parameter would have been
> > > > needed to be modified.
> > > >
> > >
> > > This may be related to something about sensor fine tuning.
> > > As OV vendor pointed out, the sensor chip provides such one property
> > > that user could adjust based on their specific project.
> > > Also, case 4 (0x04) setting is confirmed to have a little more power
> > > consumption than case 3 (0x03).
> >
> > Apologies for bringing back an old topic --- the driver supports just a
> > single mode, using a specific data rate.
> >
> > If another mode is added later on, will it continue to use the same value
> > for this? Based on the documentation, it seems that this is primarily
> > defined by the frequency of the bus, not by board design. Therefore putting
> > this to DT (and thus ignoring the frequency) appears wrong.
> 
> I don't think this is exactly implied by the frequency of the bus. The
> values there are recommended for given frequency ranges, but there are
> real cases where depending on the board different values are needed.
> 

Sorry for coming late.
For the reg P1: 0xA1, I re-confirmed the setting of the param with OVT.
The replies are as follow.
1. P1:0xA1 is one register to control D-PHY timing parameters based on
bclk. Its setting shall match the MIPI CSI-2 timing clock.
2. For one another scenario, if MIPI pixel rate(link frequency) differs
between scenarios, the setting of this parameter may also be different.
3. In one special case, we may also need to adjust the value, even for
the same scenario, such as the failure of a certain MIPI test.

From my perspective, temporally we don't plan to have a different
scenario for OV02A10, as the current resolution(1600x1200) is near to
the lower limit of most smart mobile devices.
In the meantime, considering the difference of the physical connections
for MIPI signals to user-facing camera between our 2 projects, it seems
to be very difficult to find universal SI parameters for both projects.
So for this case, I wonder whether we could reserve this private
property to maintain such flexibility.

> Best regards,
> Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
