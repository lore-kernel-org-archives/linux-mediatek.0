Return-Path: <SRS0=2GrF=5Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A901EC2BA2B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 13:04:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79D5920B1F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 13:04:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WplwxkzI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ObAiM6H2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79D5920B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=indYlSSBcZZgedDpaHc1glebeKjfQXL+hataoYW7iF8=; b=WplwxkzIkkEA37
	qrlBhCnmN0HwiGYYKd7h+VsS3mfbUfwvAou2lnqdCq0CVYDjxySeO2jjhWkFd7TFJFBjcXpxJR+6j
	+7cUS2OhWR5lrmBK+aj2k/iQ/Hajt1Vy4ZnXWrP4aXpbXh47tIgf1vG+Srd/yjyr3QkBJ+A9VxCgY
	eV9eSBLw/qCQCprAWAWoEti6l72642tRZIeqNnVGR5BF0+W1jcIL4pRrvFfKaBtbnBIrjSiZBQwHo
	KiU9rCdAzEVkE1XTxBuWs/Fl3lOmlv49yDp70vGQItWZ+O05XYB7/oH9wNnAfYUu5qR/AG1n2Q3Cz
	9Yls4DhuNTCHgk42wvjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMWqa-00005O-PT; Thu, 09 Apr 2020 13:03:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMWqW-0008WF-I7; Thu, 09 Apr 2020 13:03:55 +0000
X-UUID: 84f59fdee31e4b8d81642e588f6f738b-20200409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=toLJInywXK6opnZ9NQoaexPTPfGfMFROYJqBdUiWjVU=; 
 b=ObAiM6H2A3KbPYrKpHKsdxNiO1NIGi7CFBtud+OyGe0JmryAtxAqiGx8Op4jsuFhF7GObjzV1tpeUkt1A7MU9ppNKhlXA/qiod7hAWk7xCIzRNdFh1f1DGW5DZdD6EwMIrYOJR16RAhIgRc3erLt/leKOWUbNj+Y+wGULb8s2Nc=;
X-UUID: 84f59fdee31e4b8d81642e588f6f738b-20200409
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1639735493; Thu, 09 Apr 2020 05:03:19 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Apr 2020 06:03:40 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 9 Apr 2020 21:03:37 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 9 Apr 2020 21:03:37 +0800
Message-ID: <1586437408.8804.62.camel@mhfsdcap03>
Subject: Re: [V6, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "Rob
 Herring" <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 <broonie@kernel.org>
Date: Thu, 9 Apr 2020 21:03:28 +0800
In-Reply-To: <CAAFQd5DHL3mXZGHW+XWMXTVfekamEvaEv3bLZt4Bg2UpKPohmA@mail.gmail.com>
References: <20191211112849.16705-1-dongchun.zhu@mediatek.com>
 <20191211112849.16705-2-dongchun.zhu@mediatek.com>
 <CAAFQd5AnWZqjQEVvw8gv7JzOBHxJvsOWaGrbY8CXQ_87ap-ahA@mail.gmail.com>
 <CAAFQd5DHL3mXZGHW+XWMXTVfekamEvaEv3bLZt4Bg2UpKPohmA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BB954F30AA652C663C9BBEEA6647A034795B55269FF6686A12EE0CB199AD81932000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200409_060352_608717_6344BB25 
X-CRM114-Status: GOOD (  29.20  )
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
 srv_heupstream <srv_heupstream@mediatek.com>, linux-gpio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Shengnan
 Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?=
 <shengnan.wang@mediatek.com>, Louis Kuo <louis.kuo@mediatek.com>,
 Sj Huang <sj.huang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "list@263.net:IOMMU DRIVERS
 <iommu@lists.linux-foundation.org>, Joerg  Roedel <joro@8bytes.org>,
 " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Mauro, Sakari, Rob,

On Wed, 2020-04-08 at 14:49 +0200, Tomasz Figa wrote:
> On Tue, Dec 17, 2019 at 4:15 AM Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > Hi Rob, Dongchun,
> >
> > On Wed, Dec 11, 2019 at 8:29 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > >
> > > Add DT bindings documentation for Omnivision OV02A10 image sensor.
> > >
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  .../devicetree/bindings/media/i2c/ov02a10.txt      | 54 ++++++++++++++++++++++
> > >  MAINTAINERS                                        |  7 +++
> > >  2 files changed, 61 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov02a10.txt b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > > new file mode 100644
> > > index 0000000..18acc4f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > > @@ -0,0 +1,54 @@
> > > +* Omnivision OV02A10 MIPI CSI-2 sensor
> > > +
> > > +Required Properties:
> > > +- compatible: shall be "ovti,ov02a10"
> > > +- clocks: reference to the eclk input clock
> > > +- clock-names: shall be "eclk"
> > > +- dovdd-supply: Digital I/O voltage supply, 1.8 volts
> > > +- avdd-supply: Analog voltage supply, 2.8 volts
> > > +- dvdd-supply: Digital core voltage supply, 1.8 volts
> > > +- powerdown-gpios: reference to the GPIO connected to the powerdown pin,
> > > +                  if any. This is an active low signal to the OV02A10.
> >
> > On the hardware level this pin is active high, i.e. the device is
> > powered down when the signal is high.
> >
> > > +- reset-gpios: reference to the GPIO connected to the reset pin, if any.
> > > +              This is an active high signal to the OV02A10.
> >
> > On the hardware level this pin is active low, i.e. the device is held
> > in reset when the signal is low.
> >
> > However, there is some confusion around how the polarity flag in the
> > GPIO specifier is supposed to be used.
> >
> > As per [1],
> >
> > "The gpio-specifier's polarity flag should represent the physical
> > level at the GPIO controller that achieves (or represents, for inputs)
> > a logically asserted value at the device. The exact definition of
> > logically asserted should be defined by the binding for the device."
> >
> > In this case it sounds like "logically asserted" means the device is
> > powered down or held in reset, respectively, which would suggest that
> > the specifiers should have GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW
> > respectively. The latter would cause the GPIO subsystem to invert the
> > values set by the consumers, which would then be confusing from the
> > driver implementation point of view.
> >
> > Should the pin be renamed to "nreset"? It would change the meaning of
> > "logically asserted" to "device is not held in reset" and so
> > GPIO_ACTIVE_HIGH (or 0) would be the right value to use.
> >
> > [1] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/gpio/gpio.txt#L83
> 
> + Bartosz, Linus, Sakari and the linux-gpio ML for a broader audience.
> 
> Would appreciate some feedback on what's the proper way of defining
> GPIO polarity. Thanks!
> 
> Best regards,
> Tomasz
> 

I have another question about OV02A10 CMOS sensor dt-binding.
As its text documentation was already reviewed by Rob on earlier
version:
https://patchwork.linuxtv.org/patch/59787/
I wonder whether we need to convert it to DT in YAML.
In fact, I just submitted one conversion version.
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2143922

Unluckily make dt_binding_check still report errors temporarily.
It seems there is something wrong with the port property in DT.
Could anyone help provide some tips?
$make dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml: ignoring,
error in schema: properties: port: patternProperties: endpoint
warning: no schema found in file:
Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
make[2]: *** [Documentation/devicetree/bindings/processed-schema.yaml]
Error 255
make[1]: *** [dt_binding_check] Error 2
make: *** [sub-make] Error 2

In addition, as OV02A10 use one private property to distinguish
different projects that adopting different register settings,
I would appreciate the feedback on how to add private property to DT in
YAML.

> >
> > Best regards,
> > Tomasz
> >
> > > +
> > > +Optional Properties:
> > > +- rotation: as defined in
> > > +           Documentation/devicetree/bindings/media/video-interfaces.txt,
> > > +           valid values are 0 (sensor mounted upright) and 180 (sensor
> > > +           mounted upside down).
> > > +
> > > +The device node shall contain one 'port' child node with an
> > > +'endpoint' subnode for its digital output video port,
> > > +in accordance with the video interface bindings defined in
> > > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > +
> > > +Example:
> > > +&i2c4 {
> > > +       ov02a10: camera-sensor@3d {
> > > +               compatible = "ovti,ov02a10";
> > > +               reg = <0x3d>;
> > > +               pinctrl-names = "default";
> > > +               pinctrl-0 = <&camera_pins_cam1_mclk_on>;
> > > +
> > > +               clocks = <&topckgen CLK_TOP_MUX_CAMTG2>,
> > > +                       <&topckgen CLK_TOP_UNIVP_192M_D8>;
> > > +               clock-names = "eclk", "freq_mux";
> > > +               clock-frequency = <24000000>;
> > > +
> > > +               dovdd-supply = <&mt6358_vcamio_reg>;
> > > +               avdd-supply = <&mt6358_vcama1_reg>;
> > > +               dvdd-supply = <&mt6358_vcn18_reg>;
> > > +               powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
> > > +               reset-gpios = <&pio 109 GPIO_ACTIVE_HIGH>;
> > > +               rotation = <180>;
> > > +
> > > +               port {
> > > +                       /* MIPI CSI-2 bus endpoint */
> > > +                       ov02a10_core: endpoint {
> > > +                               remote-endpoint = <&ov02a10_0>;
> > > +                               link-frequencies = /bits/ 64 <390000000>;
> > > +                       };
> > > +               };
> > > +       };
> > > +};
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index bd5847e..92a868c 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -12130,6 +12130,13 @@ T:     git git://linuxtv.org/media_tree.git
> > >  S:     Maintained
> > >  F:     drivers/media/i2c/ov13858.c
> > >
> > > +OMNIVISION OV02A10 SENSOR DRIVER
> > > +M:     Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > +L:     linux-media@vger.kernel.org
> > > +T:     git git://linuxtv.org/media_tree.git
> > > +S:     Maintained
> > > +F:     Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > > +
> > >  OMNIVISION OV2680 SENSOR DRIVER
> > >  M:     Rui Miguel Silva <rmfrfs@gmail.com>
> > >  L:     linux-media@vger.kernel.org
> > > --
> > > 2.9.2

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
