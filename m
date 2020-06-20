Return-Path: <SRS0=iUBX=AB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CF2C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jun 2020 08:10:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8866720890
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jun 2020 08:10:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ttPSyp+b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="D4QugH2K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8866720890
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=izX0o4DmLuWpOlgnVI402ThAxrkXkCpZ4tAaeTHjC1g=; b=ttPSyp+bxGuqo+
	CizwkxoDptgbk5KASnMOldttVN3+6VQqJQVjaQAFCuKskgWB0wISkTsfu0fF8cbdWhPJxf6NIBWz9
	bYa5Pn5lcsLnoPVZgjT7WII/2jU/IAOYooeIaZuAxjAf2Sx5VQwsZzL/YtAW7fgQW5X/UGEEPLOzH
	2RzxIPtzSMhEVsr8qksKJsSpBX9trI2w8ZZ3gNIEP+siPVKg1xitudNrr3SzgbOYsBKIYPBmCNB28
	3HKeWFK1AbyW9nNS7OuK3To5NURKktYRXsWNppMD0Km0ZvCHyF+MGjz5aCgTuB58Q+R7I2uRiOkFQ
	khHQ/q+89DgptMM8gy0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmYZk-00085Y-48; Sat, 20 Jun 2020 08:10:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmYZg-0006wP-PP; Sat, 20 Jun 2020 08:10:06 +0000
X-UUID: c7eafeab8af74e4e89fdac868c8c3364-20200620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LuqsD+9fiN2lbFcHMP7DdOurh+jzglg3Fw7+z8J7wlk=; 
 b=D4QugH2KtbTPIDAo/1AKY0beehS7jeHrNHQzdcRxFjyhimScv9Z9akH2ZvErns9qbRVqSsnwFRfd3li3eoabtLWz2Uy1tm3XCpUBcz9u7/WxgrfyJ5nKA+uB5QzPpi7u8Ezlil7RJvrLC/BDWsIKAIH/cIycz2WGpeEX4J6Hg48=;
X-UUID: c7eafeab8af74e4e89fdac868c8c3364-20200620
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 414303590; Sat, 20 Jun 2020 00:09:51 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 20 Jun 2020 00:59:58 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 20 Jun 2020 15:59:54 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 20 Jun 2020 15:59:54 +0800
Message-ID: <1592639841.8804.720.camel@mhfsdcap03>
Subject: Re: [PATCH V10 1/2] media: dt-bindings: media: i2c: Document
 OV02A10 bindings
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Sat, 20 Jun 2020 15:57:21 +0800
In-Reply-To: <20200618191332.GB73379@chromium.org>
References: <20200615122937.18965-1-dongchun.zhu@mediatek.com>
 <20200615122937.18965-2-dongchun.zhu@mediatek.com>
 <20200618191332.GB73379@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 63B8FA9AB489015592CF4E8009CC603B34CB263B9B48686989F7BDC7D8E93AB32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200620_011004_840672_2F8F5EF2 
X-CRM114-Status: GOOD (  20.34  )
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
Cc: mark.rutland@arm.com, drinkcat@chromium.org,
 andriy.shevchenko@linux.intel.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linus.walleij@linaro.org,
 shengnan.wang@mediatek.com, louis.kuo@mediatek.com, bgolaszewski@baylibre.com,
 sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 dongchun.zhu@mediatek.com, sakari.ailus@linux.intel.com,
 matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tomasz,

Thanks for the review.

On Thu, 2020-06-18 at 19:13 +0000, Tomasz Figa wrote:
> Hi Dongchun,
> 
> On Mon, Jun 15, 2020 at 08:29:36PM +0800, Dongchun Zhu wrote:
> > Add DT bindings documentation for Omnivision OV02A10 image sensor.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 171 +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 +
> >  2 files changed, 178 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > 
> 
> Thank you for the patch. Please see my comments inline.
> 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > new file mode 100644
> > index 0000000..f84be1b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > @@ -0,0 +1,171 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (c) 2020 MediaTek Inc.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> > +
> > +maintainers:
> > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > +
> > +description: |-
> > +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> > +  image sensor, which is the latest production derived from Omnivision's CMOS
> > +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> > +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> > +  sensor output is available via CSI-2 serial data output.
> > +
> > +properties:
> > +  compatible:
> > +    const: ovti,ov02a10
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: top mux camtg clock
> > +      - description: divider clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: eclk
> > +      - const: freq_mux
> > +
> > +  clock-frequency:
> > +    description:
> > +      Frequency of the eclk clock in Hertz.
> > +
> > +  dovdd-supply:
> > +    description:
> > +      Definition of the regulator used as Digital I/O voltage supply.
> > +
> > +  avdd-supply:
> > +    description:
> > +      Definition of the regulator used as Analog voltage supply.
> > +
> > +  dvdd-supply:
> > +    description:
> > +      Definition of the regulator used as Digital core voltage supply.
> > +
> > +  powerdown-gpios:
> > +    description:
> > +      Must be the device tree identifier of the GPIO connected to the
> > +      PD_PAD pin. This pin is used to place the OV02A10 into Standby mode
> > +      or Shutdown mode. As the line is active low, it should be
> > +      marked GPIO_ACTIVE_LOW.
> 
> This line is not active low. It needs to be high for the powerdown mode
> to be active.
> 

Sorry, I made a misunderstanding of the real meaning of 'line active'.
For PD_PAD pin, 'effective' means 'sensor is shut down'.
Yes, it's a 'shut down' signal, not a 'enable' signal.

> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    description:
> > +      Must be the device tree identifier of the GPIO connected to the
> > +      RST_PD pin. If specified, it will be asserted during driver probe.
> > +      As the line is active high, it should be marked GPIO_ACTIVE_HIGH.
> 
> This line is not active high. It needs to be low for the reset to be
> active.
> 

Fixed in next release.

> Best regards,
> Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
