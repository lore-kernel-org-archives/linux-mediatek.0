Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6A9C47092
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 12:41:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 213B9613BA
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 12:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 213B9613BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2qo36zTazRWeu7w+fZQKNP+FRZxXPbBARdMCaWiQX/o=; b=JU5z8vS9BOhQeJxTaCXd4oGYMn
	uWo0cV9GwZK5FfB+iU4Q+xARXmRx36bGrtQnnq+oehAgphMwRa/m8jiQ/1UugiIGLntojvxtfvMgy
	AYOQNd1kNa9pKe2mw2Y1NHY3PvtPwpS79RTIhvvPm0864SUkiCsb5MnB22uM9CU7e17UhCX/CBv1t
	x6Oo+bTw0bV/ZZBqPncGtKMNu4MLAZwFQSgiqUXXWqzIb23U+G1gu8JD86xiudGhqHumiu54I7aSE
	qtisqG/hKBpChObQsQkapgjI87fKgqLEP0Bb+KVvDmDMGmfMygjXYF/G/9/2bOaZoqAHd9WzHtiTj
	vZyNLkNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loQB0-0048Np-56; Wed, 02 Jun 2021 12:40:50 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loPtw-0041Pl-2X; Wed, 02 Jun 2021 12:23:13 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 h5-20020a05600c3505b029019f0654f6f1so3127707wmq.0; 
 Wed, 02 Jun 2021 05:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xXTfKeisJ+d2G9OgHki0LrMi+N+ThHP407zug8OKubM=;
 b=C7IaWtyHWotLA3nR2EHAY8F5rSdnzjKCmjCsDd9VzLcMIbqehAmx+oFZfyOErOYwje
 07vftXUnuDJrX7PHt0HjpReCrLqdCUWnLP3ziYhOIXnlGsxICd9lpUv4X7LWzIe3d1a/
 TQPNZbsRI7T7CDtcdYa+9bMmOSp80pIUY3OFt6WiSbC8xCtqI0ANYbmfUf2qDpuA1sev
 AJdphGzG470UsFzROd1qE8hnnuxnRXtvuYEexEzoOw9rEnnTydEDtRqz9pZOyrNJbaei
 W5x2jzUoE8MSp0xqcbWQ876y3MNzs9esPtFqPmw92w7i5D4hmjAlXKIh/aIffYTvkH4A
 4j9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xXTfKeisJ+d2G9OgHki0LrMi+N+ThHP407zug8OKubM=;
 b=hzUsUzvJvF5f9LZoCeNS33H73qA3kzOY5/VBe0+0AOxMsWM7MZ6DIJZ3B5ecifMl7t
 o96P49li4dI6JZeipfEgd+NQfNw1b+FR4Hp4PGBEl7VroYZyy0BwyMMPgNoCLUC/nxPV
 RA8cA+TMUaXkzAHKlnHxaXkgplpa0He3M3RavHiKh2+1fBjOZu5ycJGkipJ1qQTBO5WY
 FWaQ9IrkjFC4D3VLVOK55wJd9l9MzxMOJ0Hgf5QCUMT1gxpAhzKLjsH+4xOeY/qD99PK
 5yfccIH6GRz5gnQT9VAk0S2oq60r8wZ1mbQNRL7V+XueryzjKxy4/nbeh0VRMWYUiG4r
 GUOA==
X-Gm-Message-State: AOAM531mBIcH21KoHihJUg/0sydwBci7DR1/T4RwhPLPSmuvfhevOhMQ
 DB6AtdH8EJ6vatIEaTWm/ms=
X-Google-Smtp-Source: ABdhPJysKE2gyVGbc/4vvjXVWq5HJ1UgNq7ruN5kz26olg90yWxtfinAk/bAf6HpX/vpIl7+7pN+Kg==
X-Received: by 2002:a05:600c:3545:: with SMTP id
 i5mr4819578wmq.43.1622636589361; 
 Wed, 02 Jun 2021 05:23:09 -0700 (PDT)
Received: from ziggy.stardust ([37.223.145.68])
 by smtp.gmail.com with ESMTPSA id n20sm2548429wmk.12.2021.06.02.05.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 05:23:08 -0700 (PDT)
Subject: Re: [PATCH v21 RESEND 4/4] arm64: dts: mt8183: add supply name for
 eeprom
To: Hsin-Yi Wang <hsinyi@chromium.org>, Wolfram Sang <wsa@kernel.org>,
 Jean Delvare <khali@linux-fr.org>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <20210527075556.1709140-1-hsinyi@chromium.org>
 <20210527075556.1709140-5-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e7db756c-2563-ee03-55ee-5e84e1444cb0@gmail.com>
Date: Wed, 2 Jun 2021 14:23:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210527075556.1709140-5-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_052312_170972_18BDF9E4 
X-CRM114-Status: GOOD (  16.12  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 27/05/2021 09:55, Hsin-Yi Wang wrote:
> Add supplies for eeprom for mt8183 boards.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Applied to v5.13-next/dts64

Thanks!

> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi | 4 ++++
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi | 4 ++++
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi  | 4 ++++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> index b442e38a3156..28966a65391b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> @@ -88,11 +88,13 @@ &i2c2 {
>  	pinctrl-0 = <&i2c2_pins>;
>  	status = "okay";
>  	clock-frequency = <400000>;
> +	vbus-supply = <&mt6358_vcamio_reg>;
>  
>  	eeprom@58 {
>  		compatible = "atmel,24c32";
>  		reg = <0x58>;
>  		pagesize = <32>;
> +		vcc-supply = <&mt6358_vcama2_reg>;
>  	};
>  };
>  
> @@ -101,11 +103,13 @@ &i2c4 {
>  	pinctrl-0 = <&i2c4_pins>;
>  	status = "okay";
>  	clock-frequency = <400000>;
> +	vbus-supply = <&mt6358_vcn18_reg>;
>  
>  	eeprom@54 {
>  		compatible = "atmel,24c32";
>  		reg = <0x54>;
>  		pagesize = <32>;
> +		vcc-supply = <&mt6358_vcn18_reg>;
>  	};
>  };
>  
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> index 2f5234a16ead..3aa79403c0c2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> @@ -62,11 +62,13 @@ &i2c2 {
>  	pinctrl-0 = <&i2c2_pins>;
>  	status = "okay";
>  	clock-frequency = <400000>;
> +	vbus-supply = <&mt6358_vcamio_reg>;
>  
>  	eeprom@58 {
>  		compatible = "atmel,24c64";
>  		reg = <0x58>;
>  		pagesize = <32>;
> +		vcc-supply = <&mt6358_vcamio_reg>;
>  	};
>  };
>  
> @@ -75,11 +77,13 @@ &i2c4 {
>  	pinctrl-0 = <&i2c4_pins>;
>  	status = "okay";
>  	clock-frequency = <400000>;
> +	vbus-supply = <&mt6358_vcn18_reg>;
>  
>  	eeprom@54 {
>  		compatible = "atmel,24c64";
>  		reg = <0x54>;
>  		pagesize = <32>;
> +		vcc-supply = <&mt6358_vcn18_reg>;
>  	};
>  };
>  
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> index fbc471ccf805..30c183c96a54 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> @@ -71,11 +71,13 @@ &i2c2 {
>  	pinctrl-0 = <&i2c2_pins>;
>  	status = "okay";
>  	clock-frequency = <400000>;
> +	vbus-supply = <&mt6358_vcamio_reg>;
>  
>  	eeprom@58 {
>  		compatible = "atmel,24c32";
>  		reg = <0x58>;
>  		pagesize = <32>;
> +		vcc-supply = <&mt6358_vcama2_reg>;
>  	};
>  };
>  
> @@ -84,11 +86,13 @@ &i2c4 {
>  	pinctrl-0 = <&i2c4_pins>;
>  	status = "okay";
>  	clock-frequency = <400000>;
> +	vbus-supply = <&mt6358_vcn18_reg>;
>  
>  	eeprom@54 {
>  		compatible = "atmel,24c32";
>  		reg = <0x54>;
>  		pagesize = <32>;
> +		vcc-supply = <&mt6358_vcn18_reg>;
>  	};
>  };
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
