Return-Path: <SRS0=0J5R=7B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE496C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 03:12:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90FE720758
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 03:12:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Avk9b6OR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="F8dSsK/7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90FE720758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7tZgU+fRKpzbQxM7NTORR83cR87gOURE8hOUz8fNCDk=; b=Avk9b6ORpleCmJ
	zRO81W0zdsX6dz8bQVq8Pje2PmU16NM66gHeERo367Xchck8oKEaujk/AQJx+sLeX7L2B1E+bbMsy
	hN72DmamULKUcqecXs8+yZQwW1Df9C/iINDXumSled+BnCbJ/ikXeRKQJTK7smJTXRTpyHWk4slCm
	K7SQl8ALP9+jgsZdFfhR+l9WJ9QHtBPLj4n8b3D63Ms+r15wqC1wRFA296Lesd9ndUowEKhehSFf9
	X8Z6ejJdQB3zSvZZWdQo0Df69u3/sj2dkgytT6AquphmAuQaiFfueRPkJYAvFOZ3oJ29KYasaCair
	VbdfTDdFNYTaxAL3ewDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jasg3-00029G-Va; Tue, 19 May 2020 03:12:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jasfz-00028j-Ba; Tue, 19 May 2020 03:12:22 +0000
X-UUID: b889564de63b4083ac0bfc008d8a26d4-20200518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=r8eGAgqgE0pJRDFIe1Bekk6atwC/VS0Nd4EW/+LDtrk=; 
 b=F8dSsK/7FlMDsw7B1Znb8w/TMPhbawPSg+hm71SluQmc2fMPKkv+SAlo2MlXQBEos8kZxNw+jsUMjqkZyan0956GhRNEXZ3daEgYhHtA0DZ/lFRzmb3sXixMu6qXJOp5C7+YcwQlYVuaMJpakcX/DFyyvHR7BzvigU/9TwlyQF8=;
X-UUID: b889564de63b4083ac0bfc008d8a26d4-20200518
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 792296670; Mon, 18 May 2020 19:11:37 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 May 2020 20:12:12 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 19 May 2020 11:12:09 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 May 2020 11:12:08 +0800
Message-ID: <1589857839.8804.368.camel@mhfsdcap03>
Subject: Re: [V6, 1/2] media: dt-bindings: media: i2c: Document DW9768 bindings
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 19 May 2020 11:10:39 +0800
In-Reply-To: <20200518143148.GA18032@bogus>
References: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
 <20200518132731.20855-2-dongchun.zhu@mediatek.com>
 <CAAFQd5Byvc8Fb0f3_81xSKsuyvsQJm-8g8y1Kx2aUcC=PwpS7w@mail.gmail.com>
 <20200518143148.GA18032@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 10BF97F5F2B8C09090C06F8889D22CE821A519C8A6B26C57BE0218C418F075C12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_201220_219195_53970B24 
X-CRM114-Status: GOOD (  24.59  )
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Louis Kuo <louis.kuo@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Shengnan
 Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?=
 <shengnan.wang@mediatek.com>, Tomasz Figa <tfiga@chromium.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing
 Bu <bingbu.cao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS
 <iommu@lists.linux-foundation.org>, Joerg  Roedel <joro@8bytes.org>,
 " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tomasz, Rob,

Thanks for the timely review and good suggestions.

On Mon, 2020-05-18 at 08:31 -0600, Rob Herring wrote:
> On Mon, May 18, 2020 at 04:12:28PM +0200, Tomasz Figa wrote:
> > Hi Dongchun,
> > 
> > On Mon, May 18, 2020 at 3:29 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > >
> > > Add DeviceTree binding documentation for Dongwoon Anatech DW9768 voice
> > > coil actuator.
> > 
> > Thanks for the patch. Please see my comments below.
> > 
> > >
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > 
> > This version includes significant changes, so the reviewed-by tag
> > shouldn't have been carried out.
> > 

Sorry, this is my fault.
In fact, I've struggled with it at the beginning.
Yes, you are right.
Now the new version of patch-set includes huge changes relative to the
last edition.
It would be removed in next release.

> > > ---
> > >  .../bindings/media/i2c/dongwoon,dw9768.yaml        | 105 +++++++++++++++++++++
> > >  MAINTAINERS                                        |   7 ++
> > >  2 files changed, 112 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> > > new file mode 100644
> > > index 0000000..b909e83
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> > > @@ -0,0 +1,105 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +# Copyright (c) 2020 MediaTek Inc.
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9768.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Dongwoon Anatech DW9768 Voice Coil Motor (VCM) Lens Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > +
> > > +description: |-
> > > +  The Dongwoon DW9768 is a single 10-bit digital-to-analog (DAC) converter
> > > +  with 100 mA output current sink capability. VCM current is controlled with
> > > +  a linear mode driver. The DAC is controlled via a 2-wire (I2C-compatible)
> > > +  serial interface that operates at clock rates up to 1MHz. This chip
> > > +  integrates Advanced Actuator Control (AAC) technology and is intended for
> > > +  driving voice coil lenses in camera modules.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      # for DW9768 VCM
> > > +      - dongwoon,dw9768
> > > +      # for GT9769 VCM
> > > +      - giantec,gt9769
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  vin-supply:
> > > +    description:
> > > +      Definition of the regulator used as I2C I/O interface power supply.
> > > +
> > > +  vdd-supply:
> > > +    description:
> > > +      Definition of the regulator used as VCM chip power supply.
> > > +
> > > +  dongwoon,aac-mode:
> > > +    description:
> > > +      Indication of AAC mode select.
> > > +    allOf:
> > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > +      - enum:
> > > +          - 0    #  Direct (default)
> 
> Default can be expressed as 'default: 0'.
> 

Thanks for the reminder.
Next release I'd try to write DT property "dongwoon,aac-mode" like this:
dongwoon,aac-mode:
  description:
    Indication of AAC mode select.
  allOf:
    - $ref: "/schemas/types.yaml#/definitions/uint32"
    - enum:
        - 0  # Direct
        - 1  # AAC2 (operation time# 0.48 x Tvib)
        - 2  # AAC3 (operation time# 0.70 x Tvib)
        - 3  # AAC4 (operation time# 0.75 x Tvib)
        - 5  # AAC8 (operation time# 1.13 x Tvib)
      default: 0

> > > +          - 1    #  AAC2 (operation time# 0.48 x Tvib)
> > > +          - 2    #  AAC3 (operation time# 0.70 x Tvib)
> > > +          - 3    #  AAC4 (operation time# 0.75 x Tvib)
> > > +          - 4    #  Reserved
> > > +          - 5    #  AAC8 (operation time# 1.13 x Tvib)
> > > +          - 6    #  Reserved
> > > +          - 7    #  Reserved
> > 
> > I'll ultimately leave it to DT maintainers, but is there any reason to
> > define the reserved values?
> 
> No.
> 
> > 
> > > +
> > > +  dongwoon,aac-timing:
> > > +    description:
> > > +      Indication of AAC Timing count, unit of 0.1 milliseconds.
> 
> Why not just use standard units (-us)?
> 

That sounds nice.
I'd re-write the description like this in next release:
dongwoon,aac-timing:
  description:
    Number of AAC Timing count that controlled by one 6-bit period
    of vibration register AACT[5:0], the unit of which is 100us.
  allOf:
    - $ref: "/schemas/types.yaml#/definitions/uint32"
    - minimum: 0x00
    - maximum: 0x3F
    - default: 0x20

> > > +      Valid values vary from 0 to 63 (default 32).
> 
> Looks like constraints.
> 

Yes. This property is controlled by one 6-bit reg.
So here we need to constrain the data set to a narrow range.

> > > +    allOf:
> > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > +
> > > +  dongwoon,clock-dividing-rate:
> > > +    description:
> > > +      Indication of VCM internal clock dividing rate select, as one multiple
> > > +      factor to calculate VCM ring periodic time Tvib.
> > > +    allOf:
> > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > +      - enum:
> > > +          - 0    #  Dividing Rate -  2
> > > +          - 1    #  Dividing Rate -  1 (default)
> > > +          - 2    #  Dividing Rate -  1/2
> > > +          - 3    #  Dividing Rate -  1/4
> > > +          - 4    #  Dividing Rate -  8
> > > +          - 5    #  Dividing Rate -  4
> > > +          - 6    #  Dividing Rate -  Reserved
> > > +          - 7    #  Dividing Rate -  Reserved
> > 
> > Ditto.
> > 

Thanks for kindly reminder.
Reserved values would be removed in next release.
Like this:
dongwoon,clock-dividing-rate:
  description:
    Indication of VCM internal clock dividing rate select, as one    
    multiplier to calculate VCM ring periodic time Tvib.
  allOf:
    - $ref: "/schemas/types.yaml#/definitions/uint32"
    - enum:
        - 0   #  Dividing Rate -  2
        - 1   #  Dividing Rate -  1
        - 2    #  Dividing Rate -  1/2
        - 3    #  Dividing Rate -  1/4
        - 4    #  Dividing Rate -  8
        - 5    #  Dividing Rate -  4
      default: 1

> > Best regards,
> > Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
