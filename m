Return-Path: <SRS0=Z+8g=2H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9898C43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 03:24:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B5F02072B
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 03:24:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YDFknKXj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fdc0aNMB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B5F02072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKxtQ9AOAoKL5SrSlNC6JCsdVgXK9qxEvTVAANiu+EY=; b=YDFknKXjXl98gM
	WYF6PK4Oj3hzk2AMe4o7/3PeOACmgpJoCgdhWwrVnx2EgIzYSYeWmbvKp5gjPkclv5b6f2/wgf/J6
	MVpw10njHKFNYx1scjgvLyluJNxNe3GzAGioEV1Db2DZRBRGuLLCQFAXBtUWOQPllnsAZMNPys7aU
	LLFyr8TyTSCirvnBWofRNXKMgaopkTRAYqYu9tKOGLHmLHY81sQg1Eiu7k3LFW/sjqxMMsWNtkJzj
	9H2YZdoDlTsdlJK44Z4bzuzbBR5cUv/IO89DfEBrpuz82FYLYfWuNpAhhgwLd1MxJnzIJTr9BW+i8
	P4/vg/dPQspOiTn5T1HA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ih3T0-0000lX-LZ; Tue, 17 Dec 2019 03:24:10 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ih3Sx-0000kt-ND
 for linux-mediatek@lists.infradead.org; Tue, 17 Dec 2019 03:24:09 +0000
Received: by mail-ed1-x541.google.com with SMTP id dc19so6806741edb.10
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Dec 2019 19:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n0ZmwEm6Y6IwUNMyCmLhctNeiL5+CELSaD2v2htB66s=;
 b=fdc0aNMBWxJTW2PEAzGSAqifbgjBKEGNsA83zAQTv4XrOWu8k3huPlqJjfm6WWctrt
 m4CRNAl6K2fyr+zXGgjS4R9A+artZqjGeUxuOsfVu9vXMB6oyAdGC6KwqqnzjhPb5RtE
 J0ycsSMk8hWQiHfKoA7ZxyFv25arNi9EhcHWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n0ZmwEm6Y6IwUNMyCmLhctNeiL5+CELSaD2v2htB66s=;
 b=gbUTO1IjkhsWeuPJI3uIsRv+655rmX+ldYXzNlHKlRSE0q1vwUQzwh77lb0MnVBsBI
 MJC/hH3x1039gygQQjoXhPMla+hDALvmjXIejZ9zboUMNks6SU3346cwhem5sEEvFPb3
 xufhJg0kGQu0rby0T0QGdlZR80mbPiy266bifkKX10bk6ZUiQD6eicIhkLAxCzEVd9OA
 KYRlLrCIQp8pHLWybewo+Lx230WWNivE0i5VFYCHpGMakU8Uvs2BC8M7m426Wm5g19zv
 kqgj+3ut9tl4CnkvaJA0AIqw4rUX75FqAnd/jlUzfF3O65CwjcB9uLsga+pmQBYFsnKL
 0eZw==
X-Gm-Message-State: APjAAAVuU3Rh9BmGgSOvJ7luyqllahlnrrKunn65glBuAHCue/r14dtY
 ww0agyFGKHzAu0HYdGualuqtNkkiPduFug==
X-Google-Smtp-Source: APXvYqzSFkn9nuXCG3yyF/+BaxYcntoDIVRjOW0JSPV/RHsmBD+713hrB5EjlzBuBCJaFuHdOkSm4w==
X-Received: by 2002:a17:906:2acb:: with SMTP id
 m11mr2849707eje.180.1576553045932; 
 Mon, 16 Dec 2019 19:24:05 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49])
 by smtp.gmail.com with ESMTPSA id m1sm242999ejc.23.2019.12.16.19.24.05
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 19:24:05 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id d16so9684588wre.10
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Dec 2019 19:24:05 -0800 (PST)
X-Received: by 2002:adf:f803:: with SMTP id s3mr33909150wrp.7.1576552551964;
 Mon, 16 Dec 2019 19:15:51 -0800 (PST)
MIME-Version: 1.0
References: <20191211112849.16705-1-dongchun.zhu@mediatek.com>
 <20191211112849.16705-2-dongchun.zhu@mediatek.com>
In-Reply-To: <20191211112849.16705-2-dongchun.zhu@mediatek.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 17 Dec 2019 12:15:40 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AnWZqjQEVvw8gv7JzOBHxJvsOWaGrbY8CXQ_87ap-ahA@mail.gmail.com>
Message-ID: <CAAFQd5AnWZqjQEVvw8gv7JzOBHxJvsOWaGrbY8CXQ_87ap-ahA@mail.gmail.com>
Subject: Re: [V6,
 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To: Rob Herring <robh+dt@kernel.org>, Dongchun Zhu <dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_192407_760698_1EE1FF4A 
X-CRM114-Status: GOOD (  20.10  )
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
 srv_heupstream <srv_heupstream@mediatek.com>, shengnan.wang@mediatek.com,
 andriy.shevchenko@linux.intel.com, Louis Kuo <louis.kuo@mediatek.com>,
 Sj Huang <sj.huang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob, Dongchun,

On Wed, Dec 11, 2019 at 8:29 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Add DT bindings documentation for Omnivision OV02A10 image sensor.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../devicetree/bindings/media/i2c/ov02a10.txt      | 54 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 +++
>  2 files changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov02a10.txt b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> new file mode 100644
> index 0000000..18acc4f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> @@ -0,0 +1,54 @@
> +* Omnivision OV02A10 MIPI CSI-2 sensor
> +
> +Required Properties:
> +- compatible: shall be "ovti,ov02a10"
> +- clocks: reference to the eclk input clock
> +- clock-names: shall be "eclk"
> +- dovdd-supply: Digital I/O voltage supply, 1.8 volts
> +- avdd-supply: Analog voltage supply, 2.8 volts
> +- dvdd-supply: Digital core voltage supply, 1.8 volts
> +- powerdown-gpios: reference to the GPIO connected to the powerdown pin,
> +                  if any. This is an active low signal to the OV02A10.

On the hardware level this pin is active high, i.e. the device is
powered down when the signal is high.

> +- reset-gpios: reference to the GPIO connected to the reset pin, if any.
> +              This is an active high signal to the OV02A10.

On the hardware level this pin is active low, i.e. the device is held
in reset when the signal is low.

However, there is some confusion around how the polarity flag in the
GPIO specifier is supposed to be used.

As per [1],

"The gpio-specifier's polarity flag should represent the physical
level at the GPIO controller that achieves (or represents, for inputs)
a logically asserted value at the device. The exact definition of
logically asserted should be defined by the binding for the device."

In this case it sounds like "logically asserted" means the device is
powered down or held in reset, respectively, which would suggest that
the specifiers should have GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW
respectively. The latter would cause the GPIO subsystem to invert the
values set by the consumers, which would then be confusing from the
driver implementation point of view.

Should the pin be renamed to "nreset"? It would change the meaning of
"logically asserted" to "device is not held in reset" and so
GPIO_ACTIVE_HIGH (or 0) would be the right value to use.

[1] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/gpio/gpio.txt#L83

Best regards,
Tomasz

> +
> +Optional Properties:
> +- rotation: as defined in
> +           Documentation/devicetree/bindings/media/video-interfaces.txt,
> +           valid values are 0 (sensor mounted upright) and 180 (sensor
> +           mounted upside down).
> +
> +The device node shall contain one 'port' child node with an
> +'endpoint' subnode for its digital output video port,
> +in accordance with the video interface bindings defined in
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +Example:
> +&i2c4 {
> +       ov02a10: camera-sensor@3d {
> +               compatible = "ovti,ov02a10";
> +               reg = <0x3d>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&camera_pins_cam1_mclk_on>;
> +
> +               clocks = <&topckgen CLK_TOP_MUX_CAMTG2>,
> +                       <&topckgen CLK_TOP_UNIVP_192M_D8>;
> +               clock-names = "eclk", "freq_mux";
> +               clock-frequency = <24000000>;
> +
> +               dovdd-supply = <&mt6358_vcamio_reg>;
> +               avdd-supply = <&mt6358_vcama1_reg>;
> +               dvdd-supply = <&mt6358_vcn18_reg>;
> +               powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
> +               reset-gpios = <&pio 109 GPIO_ACTIVE_HIGH>;
> +               rotation = <180>;
> +
> +               port {
> +                       /* MIPI CSI-2 bus endpoint */
> +                       ov02a10_core: endpoint {
> +                               remote-endpoint = <&ov02a10_0>;
> +                               link-frequencies = /bits/ 64 <390000000>;
> +                       };
> +               };
> +       };
> +};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd5847e..92a868c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12130,6 +12130,13 @@ T:     git git://linuxtv.org/media_tree.git
>  S:     Maintained
>  F:     drivers/media/i2c/ov13858.c
>
> +OMNIVISION OV02A10 SENSOR DRIVER
> +M:     Dongchun Zhu <dongchun.zhu@mediatek.com>
> +L:     linux-media@vger.kernel.org
> +T:     git git://linuxtv.org/media_tree.git
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> +
>  OMNIVISION OV2680 SENSOR DRIVER
>  M:     Rui Miguel Silva <rmfrfs@gmail.com>
>  L:     linux-media@vger.kernel.org
> --
> 2.9.2

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
