Return-Path: <SRS0=Kof6=5Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF00C2D0EA
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Apr 2020 12:56:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA4B72074F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Apr 2020 12:56:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JAJwTI7m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iuHWZKg+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA4B72074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hp3uKw9hLVDrJswREcD/dnkopfn33wqzfqJlQditlA8=; b=JAJwTI7mN908ud
	bLDm6cBBma4VkyBN4De4e+05jkhkUeG8OY2gf+2+g1a+sWC4F5wQoZ+coNf/dxPa8F6GOpKrXv1eg
	FeLIOxl4KYuk2opnXN8rrVv6n5/QxEZlDk0+i+e5Q9tYGdEejJAsiHJkttTOE0bs+0m/oG+q0efZ4
	iBZ/MO2Z3dZKqOluluTli22C/+Woft3HjEEY7H5mYvh2tkEyyRbd4KP3wYFt5DX3rsCNN6NSG1cgv
	DPIU4ot67RJZJniyXO9ZqEbOJt335LLi4qzX1TWjKRysonaGTKzu7kFdpoKEbS2rR41RjkhSXVe4o
	4ABwKxpSqBNSI76ZkMEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMAFo-0007B7-Nl; Wed, 08 Apr 2020 12:56:28 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMAFl-0007Ac-Ih
 for linux-mediatek@lists.infradead.org; Wed, 08 Apr 2020 12:56:27 +0000
Received: by mail-ed1-x544.google.com with SMTP id e5so8440113edq.5
 for <linux-mediatek@lists.infradead.org>; Wed, 08 Apr 2020 05:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ImZqh6xFyWTP+hCLRseUGFfjvuATFwSzoN2jRckYzSk=;
 b=iuHWZKg+pIWEBlsACAQ4YXH2mS3QrCGDdCd463hpF4FaNiGuk9aFm0zDBV3zdeafgR
 3ZnImtuZ+wyMDDvmkR249YelH0aLXKbisp8ztrr4A0fBNyuZV+ObuE3T8OiMRRi340IU
 wd7vqFZZ9kxtDpuz9bj10oUv10rucFw5JlYIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ImZqh6xFyWTP+hCLRseUGFfjvuATFwSzoN2jRckYzSk=;
 b=JMW6CB+UvAreMhXvOD/+/Bkrj3StpYbWAORHzrNiUodHqhPAmeAV2/RCGxu+AzJQTG
 a3MnfYHSe+2/B19lQwXVfoztYMgQLPJT3zyWJvzVM7OEAObmOohuY1pam25F47/Nm9Bg
 U6oESc03Er5i2/5YD4z5V3vGnsVPTLmQGuANpB/+oJnupb+2DxEUEK/OYwWuF84a1Tss
 9h+VCXbrPW5neo3QqjHhlbOIJYMYZ7rCoPEA9l31oLHqiCtAvuIpj+0yfuAd5elycd/N
 dpQRXoWvrtB8c8hejrDCSk64ybavhXtoZJfu7L1AWFC78KJCMI91eSk/3ImgmW/dZ+WE
 uErw==
X-Gm-Message-State: AGi0PuY9qKGoquLvgAfGZPXvaSSe951FxuGI4qlEzV3rjk35rQpjzzf7
 FGMuoSO3RvMbITr1SYwqKY+ywOJR9TvBIQ==
X-Google-Smtp-Source: APiQypIMFm2ri8oA+C9F+M8FOZr5yjzliom3SNbgrJor0mIWB1ENucCwW2HVephOUbdPUt6bzvan1A==
X-Received: by 2002:aa7:c74a:: with SMTP id c10mr2182466eds.210.1586350583350; 
 Wed, 08 Apr 2020 05:56:23 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49])
 by smtp.gmail.com with ESMTPSA id i3sm3441892ejr.19.2020.04.08.05.56.22
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2020 05:56:23 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id v8so11790wma.0
 for <linux-mediatek@lists.infradead.org>; Wed, 08 Apr 2020 05:56:22 -0700 (PDT)
X-Received: by 2002:a7b:c38b:: with SMTP id s11mr4529806wmj.55.1586350155398; 
 Wed, 08 Apr 2020 05:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191211112849.16705-1-dongchun.zhu@mediatek.com>
 <20191211112849.16705-2-dongchun.zhu@mediatek.com>
 <CAAFQd5AnWZqjQEVvw8gv7JzOBHxJvsOWaGrbY8CXQ_87ap-ahA@mail.gmail.com>
In-Reply-To: <CAAFQd5AnWZqjQEVvw8gv7JzOBHxJvsOWaGrbY8CXQ_87ap-ahA@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 8 Apr 2020 14:49:04 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DHL3mXZGHW+XWMXTVfekamEvaEv3bLZt4Bg2UpKPohmA@mail.gmail.com>
Message-ID: <CAAFQd5DHL3mXZGHW+XWMXTVfekamEvaEv3bLZt4Bg2UpKPohmA@mail.gmail.com>
Subject: Re: [V6,
 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To: Rob Herring <robh+dt@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200408_055625_641281_B7E0CD80 
X-CRM114-Status: GOOD (  26.22  )
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
 =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= <shengnan.wang@mediatek.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Louis Kuo <louis.kuo@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
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

On Tue, Dec 17, 2019 at 4:15 AM Tomasz Figa <tfiga@chromium.org> wrote:
>
> Hi Rob, Dongchun,
>
> On Wed, Dec 11, 2019 at 8:29 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> >
> > Add DT bindings documentation for Omnivision OV02A10 image sensor.
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  .../devicetree/bindings/media/i2c/ov02a10.txt      | 54 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  7 +++
> >  2 files changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov02a10.txt b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > new file mode 100644
> > index 0000000..18acc4f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > @@ -0,0 +1,54 @@
> > +* Omnivision OV02A10 MIPI CSI-2 sensor
> > +
> > +Required Properties:
> > +- compatible: shall be "ovti,ov02a10"
> > +- clocks: reference to the eclk input clock
> > +- clock-names: shall be "eclk"
> > +- dovdd-supply: Digital I/O voltage supply, 1.8 volts
> > +- avdd-supply: Analog voltage supply, 2.8 volts
> > +- dvdd-supply: Digital core voltage supply, 1.8 volts
> > +- powerdown-gpios: reference to the GPIO connected to the powerdown pin,
> > +                  if any. This is an active low signal to the OV02A10.
>
> On the hardware level this pin is active high, i.e. the device is
> powered down when the signal is high.
>
> > +- reset-gpios: reference to the GPIO connected to the reset pin, if any.
> > +              This is an active high signal to the OV02A10.
>
> On the hardware level this pin is active low, i.e. the device is held
> in reset when the signal is low.
>
> However, there is some confusion around how the polarity flag in the
> GPIO specifier is supposed to be used.
>
> As per [1],
>
> "The gpio-specifier's polarity flag should represent the physical
> level at the GPIO controller that achieves (or represents, for inputs)
> a logically asserted value at the device. The exact definition of
> logically asserted should be defined by the binding for the device."
>
> In this case it sounds like "logically asserted" means the device is
> powered down or held in reset, respectively, which would suggest that
> the specifiers should have GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW
> respectively. The latter would cause the GPIO subsystem to invert the
> values set by the consumers, which would then be confusing from the
> driver implementation point of view.
>
> Should the pin be renamed to "nreset"? It would change the meaning of
> "logically asserted" to "device is not held in reset" and so
> GPIO_ACTIVE_HIGH (or 0) would be the right value to use.
>
> [1] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/gpio/gpio.txt#L83

+ Bartosz, Linus, Sakari and the linux-gpio ML for a broader audience.

Would appreciate some feedback on what's the proper way of defining
GPIO polarity. Thanks!

Best regards,
Tomasz

>
> Best regards,
> Tomasz
>
> > +
> > +Optional Properties:
> > +- rotation: as defined in
> > +           Documentation/devicetree/bindings/media/video-interfaces.txt,
> > +           valid values are 0 (sensor mounted upright) and 180 (sensor
> > +           mounted upside down).
> > +
> > +The device node shall contain one 'port' child node with an
> > +'endpoint' subnode for its digital output video port,
> > +in accordance with the video interface bindings defined in
> > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> > +
> > +Example:
> > +&i2c4 {
> > +       ov02a10: camera-sensor@3d {
> > +               compatible = "ovti,ov02a10";
> > +               reg = <0x3d>;
> > +               pinctrl-names = "default";
> > +               pinctrl-0 = <&camera_pins_cam1_mclk_on>;
> > +
> > +               clocks = <&topckgen CLK_TOP_MUX_CAMTG2>,
> > +                       <&topckgen CLK_TOP_UNIVP_192M_D8>;
> > +               clock-names = "eclk", "freq_mux";
> > +               clock-frequency = <24000000>;
> > +
> > +               dovdd-supply = <&mt6358_vcamio_reg>;
> > +               avdd-supply = <&mt6358_vcama1_reg>;
> > +               dvdd-supply = <&mt6358_vcn18_reg>;
> > +               powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
> > +               reset-gpios = <&pio 109 GPIO_ACTIVE_HIGH>;
> > +               rotation = <180>;
> > +
> > +               port {
> > +                       /* MIPI CSI-2 bus endpoint */
> > +                       ov02a10_core: endpoint {
> > +                               remote-endpoint = <&ov02a10_0>;
> > +                               link-frequencies = /bits/ 64 <390000000>;
> > +                       };
> > +               };
> > +       };
> > +};
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index bd5847e..92a868c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12130,6 +12130,13 @@ T:     git git://linuxtv.org/media_tree.git
> >  S:     Maintained
> >  F:     drivers/media/i2c/ov13858.c
> >
> > +OMNIVISION OV02A10 SENSOR DRIVER
> > +M:     Dongchun Zhu <dongchun.zhu@mediatek.com>
> > +L:     linux-media@vger.kernel.org
> > +T:     git git://linuxtv.org/media_tree.git
> > +S:     Maintained
> > +F:     Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > +
> >  OMNIVISION OV2680 SENSOR DRIVER
> >  M:     Rui Miguel Silva <rmfrfs@gmail.com>
> >  L:     linux-media@vger.kernel.org
> > --
> > 2.9.2

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
