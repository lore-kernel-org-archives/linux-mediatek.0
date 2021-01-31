Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D76C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 14:54:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0F3B64E27
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 14:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0F3B64E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0Pqtw8r27KqC7lHLZtSkuCcizvLguTpEmLtriSDzNsA=; b=j898xkxZuTFMvJsqH3FSakStM
	Te2NIujb4LgeJM+SvVunlBLv4mzDNIoCsALIcdFdjjbZSQp5HxtQHi+p8LoQONSrBzT07Pj6nSPQU
	y2T+y/O7u8gZuDoGs1+UJwUadAohVkYHNghUk5D8HH7hJKWniQ42V7zcfNU+0YqJPQnoN1RlO6Uyb
	vaHYP0tVSctwNR5Vk44aZh5BXt4GQJwYR4qo3Q/jX730ysdT95fsIy62I5eKaPslNcDm0L2dUGOlt
	c3FnZHXmVLyajIop8eLA4tJElklGoxYUVmEutpu2QuUASDP1k9uDt0oJjMXoSGFm73qTuWF6Xu4nD
	gN3JJMtfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6E7V-00016S-KB; Sun, 31 Jan 2021 14:54:33 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6E7T-000165-TZ; Sun, 31 Jan 2021 14:54:32 +0000
Received: by mail-wr1-x436.google.com with SMTP id 6so13805546wri.3;
 Sun, 31 Jan 2021 06:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WkJeFPw2kQQYHxR9X8QVdj9OOIogYHSGaWROQp6d23w=;
 b=qAwxHB4OJZlkt7/CPjTCYo6CtGO7S/7mZXEp2zMkfCcGo6xRAAB+laUFvPRmVamoJ3
 0IPPFq0o6NNSlu96vVQh6i1Nkjj3I06oTrz0OlBjCsMkn2tCdv9OTmlL+iYtyyd7zYm0
 syjj1KcONDNeS6HJWFbqh56V+UpM1ygGP9yd2v5bIhuA0FDwbCWUXNs5/RQ4EPKyyWeN
 IoFQfBJsWE3psQkQZBgVkwGP5jTSyGGNbR6EVfK1gsjMiZ/rJx3WxK2ViAGL7Znrg2OU
 rIbQmrGFwxHUn5qOXt0IZIA46U/AfHeLwIZVCOTMKNloO4XzMlk5EmjHnaB/d08ynQkt
 3D9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WkJeFPw2kQQYHxR9X8QVdj9OOIogYHSGaWROQp6d23w=;
 b=njrBfoKnQ+ebIVjFATfHnoV9ZfTZCOzFOHyLQ6AkxX+5nh6LFUGOX03+n9EF4J9Y3n
 c+30qEhGnlXqnpMIFtipi7szOt5ZXExM9JT4s3qsTDQcF7TvKWJARf5EpJSGTJJa9INf
 GcSZAscykp9P7dSl0mg17HHR8byZLaw4PKgk3A7IHq2JTCy+PEGcrhJMWrdXdk8uIL9X
 oidbHy5F0sJAA0m/RjZ+s+HFWLpmmS2D6k1upe8DVuPg2OYLXxI0lFLzysVhsiBDwC7f
 nid8tbZsUu9ZjIKcqAY33MUTvpBo+Utd2p6WDrgJLIG4BqIvmJ+PdUejrq/8k3kqhXZl
 tZ8w==
X-Gm-Message-State: AOAM533N6BVV66EfbGZd+U5vgAS6niQ/tAwEqU/M1NIGYKSBpBEG9aGU
 Smb8pvUdkDAXcp/EGF8noOU=
X-Google-Smtp-Source: ABdhPJyPJoHnFnU9o8NjgJCD2yBaBGx2MRUsaYHuoUq3BmTa4p8Vbt9wj2k3kE4ie+qGvWgXRchg2A==
X-Received: by 2002:adf:fc8a:: with SMTP id g10mr14323248wrr.189.1612104870716; 
 Sun, 31 Jan 2021 06:54:30 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id s25sm17872026wmj.24.2021.01.31.06.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 06:54:30 -0800 (PST)
Subject: Re: [PATCH v4 1/3] arm64: dts: mt8183: config dsi node
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
References: <20210113110400.616319-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <5c30dc00-2d0e-8538-fe55-c57e70d46b70@gmail.com>
Date: Sun, 31 Jan 2021 15:54:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210113110400.616319-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_095432_034673_E9655B7E 
X-CRM114-Status: GOOD (  18.47  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 13/01/2021 12:03, Hsin-Yi Wang wrote:
> Config dsi node for mt8183 kukui. Set panel and ports.
> 
> Several kukui boards share the same panel property and only compatible
> is different. So compatible will be set in board dts for comparison
> convenience.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> ---

Whole series applied to v5.11-next/dts64

Thanks!

> change:
> v4: add backlight and enable mipi_tx0
> ---
>  .../mediatek/mt8183-kukui-krane-sku176.dts    |  5 +++
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 42 +++++++++++++++++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
> index 47113e275cb52..721d16f9c3b4f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
> @@ -16,3 +16,8 @@ / {
>  	model = "MediaTek krane sku176 board";
>  	compatible = "google,krane-sku176", "google,krane", "mediatek,mt8183";
>  };
> +
> +&panel {
> +        status = "okay";
> +        compatible = "boe,tv101wum-nl6";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index bf2ad1294dd30..da1e947587074 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -249,6 +249,36 @@ &cpu7 {
>  	proc-supply = <&mt6358_vproc11_reg>;
>  };
>  
> +&dsi0 {
> +	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	panel: panel@0 {
> +		/* compatible will be set in board dts */
> +		reg = <0>;
> +		enable-gpios = <&pio 45 0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&panel_pins_default>;
> +		avdd-supply = <&ppvarn_lcd>;
> +		avee-supply = <&ppvarp_lcd>;
> +		pp1800-supply = <&pp1800_lcd>;
> +		backlight = <&backlight_lcd0>;
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dsi_out>;
> +			};
> +		};
> +	};
> +
> +	ports {
> +		port {
> +			dsi_out: endpoint {
> +				remote-endpoint = <&panel_in>;
> +			};
> +		};
> +	};
> +};
> +
>  &i2c0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c0_pins>;
> @@ -290,6 +320,10 @@ &i2c6 {
>  	clock-frequency = <100000>;
>  };
>  
> +&mipi_tx0 {
> +	status = "okay";
> +};
> +
>  &mmc0 {
>  	status = "okay";
>  	pinctrl-names = "default", "state_uhs";
> @@ -547,6 +581,14 @@ pins_clk {
>  		};
>  	};
>  
> +	panel_pins_default: panel_pins_default {
> +		panel_reset {
> +			pinmux = <PINMUX_GPIO45__FUNC_GPIO45>;
> +			output-low;
> +			bias-pull-up;
> +		};
> +	};
> +
>  	pwm0_pin_default: pwm0_pin_default {
>  		pins1 {
>  			pinmux = <PINMUX_GPIO176__FUNC_GPIO176>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
