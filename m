Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D0EC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 15:34:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51CFB20878
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 15:34:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hG8xzne1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51CFB20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YpF+7DVS04Qh2DJvIHyn+3iKflzhahz1JAoPGd+8dqQ=; b=hG8xzne1vXp/3v/b0r+70Fohj
	7ksedfpDgW5293fOrFZqu0zqxaJ29OWuR5CC3X2NDOnvTlCpAj3QG8EAF5vI1ahotCYOUdjQRCe9a
	1EsV7kzyggJfJR65T5AHAxxUPV1KZyv3/Bdttio4lcGKbvnVGRK6IZpBzx8j/9j5cjsMYxqC3EXxP
	zx1BEend0hSa1EsdpRKwj42B8KnYxapMyv6wEyzm6xO1AqfJMG7ZjEj4Mlr9IR6IWBFdLfZ4LE7Yg
	aMlo1WDyhUeFvhME85oOrWcr9wJWQLqUesFsRhGgkNwJb4Gu8HLBFkTqM5LFNwNUCad9CSM1G1RQ2
	ljpB/3hUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRzq8-0000eV-2M; Mon, 12 Oct 2020 15:34:20 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRzpz-0000ZW-OM; Mon, 12 Oct 2020 15:34:14 +0000
Received: by mail-oi1-f193.google.com with SMTP id 16so19080373oix.9;
 Mon, 12 Oct 2020 08:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yH7pwuj6aDPry47UxD5seXqTX0RCln/LrihgtVI0KrI=;
 b=kROI9YHMRbFp8PCtTrtFN4YLwVTM/bQT42kNKSUtzKWNhRaerPqm1BXJC2OnUKX4bN
 BxCFKbrFuiaMC2bTt6Cn8JSneujuXKPjhkV4f39tebz7OCyAapzOKvLaqKgj1sUr65d6
 ys1+jJfLLAf7NYPHIqVVkx978H4EkIuzKJ+bY2nIIwJJUfULeCH7qw/O+7nOm/uiDRrk
 5WSuuDmfIrPXVuYQftoccbk1VcLCIgizYWlGrDXCFx7CO5LI9i99HhqrYHMuQBAA+Pkb
 DS4r+ce6bhEjp5lX2jo8khOxSChEdKhIdBBWx1DqZvjCWJ0L3GpbgJl2AM4q53iazqqj
 5Dow==
X-Gm-Message-State: AOAM531wOPu3sEyD+gwUjk8L44avCoOhSXl9cQqaZ0I3ZsHMH1uyDUI8
 1qTKgJbgLcITEgh6J0Zu3w==
X-Google-Smtp-Source: ABdhPJxdhAZwzIPrUakClUoKKQgxW4+bRdUuktTipl2x2JvJ74I2wXS5IDDG8BnmrxssZxJf8oQDcA==
X-Received: by 2002:aca:f40b:: with SMTP id s11mr10554362oih.66.1602516849115; 
 Mon, 12 Oct 2020 08:34:09 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p4sm1065874oib.9.2020.10.12.08.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:08 -0700 (PDT)
Received: (nullmailer pid 1589228 invoked by uid 1000);
 Mon, 12 Oct 2020 15:34:07 -0000
Date: Mon, 12 Oct 2020 10:34:07 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: convert usb-device.txt to YAML
 schema
Message-ID: <20201012153407.GA1588894@bogus>
References: <3db52d534065dcf28e9a10b8129bea3eced0193e.1602318869.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3db52d534065dcf28e9a10b8129bea3eced0193e.1602318869.git.chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_113411_822364_59E9ADA6 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 10 Oct 2020 16:43:11 +0800, Chunfeng Yun wrote:
> Convert usb-device.txt to YAML schema usb-device.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: new patch suggested by Rob
> ---
>  .../devicetree/bindings/usb/usb-device.txt    | 102 --------------
>  .../devicetree/bindings/usb/usb-device.yaml   | 129 ++++++++++++++++++
>  2 files changed, 129 insertions(+), 102 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/usb-device.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-device.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.example.dt.yaml: cec@100: compatible:0: 'amlogic,meson-gx-ao-cec' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.example.dt.yaml: cec@100: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/st,stm32-cec.example.dt.yaml: cec@40006c00: compatible:0: 'st,stm32-cec' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/st,stm32-cec.example.dt.yaml: cec@40006c00: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.example.dt.yaml: ec@0: compatible:0: 'google,cros-ec-spi' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.example.dt.yaml: ec@0: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.example.dt.yaml: dcdc@1100: compatible:0: 'qcom,pm8150b-vbus-reg' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.example.dt.yaml: dcdc@1100: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.example.dt.yaml: ec@0: compatible:0: 'google,cros-ec-spi' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.example.dt.yaml: ec@0: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/dac/lltc,ltc1660.example.dt.yaml: dac@0: compatible:0: 'lltc,ltc1660' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/dac/lltc,ltc1660.example.dt.yaml: dac@0: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.example.dt.yaml: dac@40017000: compatible:0: 'st,stm32h7-dac-core' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.example.dt.yaml: dac@40017000: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.example.dt.yaml: dac@1: compatible:0: 'st,stm32-dac' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.example.dt.yaml: dac@1: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.example.dt.yaml: dac@2: compatible:0: 'st,stm32-dac' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.example.dt.yaml: dac@2: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.example.dt.yaml: adc@0: compatible:0: 'microchip,mcp3911' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.example.dt.yaml: adc@0: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/ingenic,adc.example.dt.yaml: adc@10070000: compatible:0: 'ingenic,jz4740-adc' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/ingenic,adc.example.dt.yaml: adc@10070000: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/adi,ad7192.example.dt.yaml: adc@0: compatible:0: 'adi,ad7192' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/adi,ad7192.example.dt.yaml: adc@0: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.example.dt.yaml: adc@12d10000: compatible:0: 'samsung,exynos-adc-v1' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.example.dt.yaml: adc@12d10000: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.example.dt.yaml: adc@126c0000: compatible:0: 'samsung,exynos3250-adc' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.example.dt.yaml: adc@126c0000: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/adi,ad7923.example.dt.yaml: adc@0: compatible:0: 'adi,ad7928' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/adi,ad7923.example.dt.yaml: adc@0: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/maxim,max1241.example.dt.yaml: adc@0: compatible:0: 'maxim,max1241' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/maxim,max1241.example.dt.yaml: adc@0: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/adi,ad9467.example.dt.yaml: adc@0: compatible:0: 'adi,ad9467' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/adi,ad9467.example.dt.yaml: adc@0: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.example.dt.yaml: adc@40012000: compatible:0: 'st,stm32f4-adc-core' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.example.dt.yaml: adc@40012000: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.example.dt.yaml: adc@0: compatible:0: 'st,stm32f4-adc' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.example.dt.yaml: adc@0: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.example.dt.yaml: adc@48003000: compatible:0: 'st,stm32mp1-adc-core' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.example.dt.yaml: adc@48003000: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.example.dt.yaml: adc@0: compatible:0: 'st,stm32mp1-adc' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.example.dt.yaml: adc@0: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/adi,ad7292.example.dt.yaml: adc@0: compatible:0: 'adi,ad7292' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/adi,ad7292.example.dt.yaml: adc@0: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/adi,ad7606.example.dt.yaml: adc@0: compatible:0: 'adi,ad7606-8' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/adi,ad7606.example.dt.yaml: adc@0: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/adi,ad7780.example.dt.yaml: adc@0: compatible:0: 'adi,ad7780' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/adi,ad7780.example.dt.yaml: adc@0: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/maxim,max1238.example.dt.yaml: adc@36: compatible:0: 'maxim,max1238' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/maxim,max1238.example.dt.yaml: adc@36: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/maxim,max1363.example.dt.yaml: adc@36: compatible:0: 'maxim,max1363' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/maxim,max1363.example.dt.yaml: adc@36: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/ti,ads8688.example.dt.yaml: adc@0: compatible:0: 'ti,ads8688' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/ti,ads8688.example.dt.yaml: adc@0: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/lltc,ltc2496.example.dt.yaml: adc@0: compatible:0: 'lltc,ltc2496' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/lltc,ltc2496.example.dt.yaml: adc@0: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.example.dt.yaml: adc@2f: compatible:0: 'adi,ad7091r5' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.example.dt.yaml: adc@2f: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/adi,ad7124.example.dt.yaml: adc@0: compatible:0: 'adi,ad7124-4' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/adi,ad7124.example.dt.yaml: adc@0: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.example.dt.yaml: adc@3100: compatible:0: 'qcom,spmi-vadc' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.example.dt.yaml: adc@3100: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.example.dt.yaml: adc@10: 'compatile' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-device.yaml


See https://patchwork.ozlabs.org/patch/1379982

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
