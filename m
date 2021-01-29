Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB445C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 16:12:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DBC864DF1
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 16:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DBC864DF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mfthlpz4My3BSbqWVMV5phf92dx2R2xXS+AcNobPJfs=; b=DSYMjPS+JefE+fRM6SLmh75Vo
	DazZ7QggLkz7EDFsllVp1stgd/DX2n7MkEIEuICJAVtNsepQIKB52scnwrvrFkJoHHE78OdDLddst
	A2azuE8pCeHLBnh0TlUUiXPncgCaeK0RLu5YeMTVks4lf4/09fkqXzLgQiZxyTv6bR2Knh5JFT8+O
	i2u25YBOgXS3Bc3cPaUOjqIC+uCq17D6i2e+VI+vdHjBuXBCWXR0ygVuQlfatSKbNRYWJ3o38YPsr
	PstxQzUwLvevynfpoIAnuGgZm0Sd7Ojjpso9GgTIuL8AoZlD5Qh78R7qR1pebZFHqjzRX/sKTB3JX
	6zMx4t+fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5WO6-00035K-IS; Fri, 29 Jan 2021 16:12:46 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5WO0-00032g-Q1; Fri, 29 Jan 2021 16:12:42 +0000
Received: by mail-wr1-x430.google.com with SMTP id c12so9392341wrc.7;
 Fri, 29 Jan 2021 08:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vdbqnZSk7CbZMJVG2e0A3rtdEfoKL12MTAaUYphTsqg=;
 b=VawySmaIAVBFVRuZWE80H5V0QR1PSCu6jFhgaOWCTqJTwgik3KI9r5Cu30msAUanW6
 A51y6GarGkcWL5DCq4onpXM90PAca+iSRvoVZfsDGRRV2r46ylREYf9MqbxXWTspz3IR
 C3TqzixhoNvguu7n1/j+yTfQOzNOR/AylI5XOig5BFouw8EXq5VIdPXiuewAELPAi4e7
 16uOhk9nW7SZsnbf7EjM37De8HodjLNzDIHr1c+uTuRkkN5YrEQAdFitc9NSZtiAmt3m
 fZURZ0QvPOWWAxBOPUCYhS2FsM6vqOsFQy9CsBJt1DjQ6+SH3t8Ut5Z3wzn2fDbnqALx
 AoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vdbqnZSk7CbZMJVG2e0A3rtdEfoKL12MTAaUYphTsqg=;
 b=UF8+ETy3+FzPktjChLWbuv+pbxIVR7lWGHPy1at/5r80sj03gF1J9AqIzUpgxpM8ke
 /rrghjz8g3wqaoNa49NJTG6tu583AEMPWWGv0lLCsrqUYPE8k2qqodJmf46sICfbRQk/
 hK4bzq18H2N6xcYZYvg0XUF+py3IoSduaWcgNGuUuNap+dMLj/i1Et4Wky3E4b1YfJmj
 0XD/i1uv31uQKNQtwM1H0IxkRWJmhSDqfDsE9hObyzg2LjDMFfGnTbWhg1J2wM/HDMRi
 mQ7J34E3JII+nzv7dgoQUAH005gpLFJ4+Zb10MSF/OfbTC3dY0KvINgZwuJJPxnyZUhJ
 Lmqw==
X-Gm-Message-State: AOAM530XoD1bB+eJiX1NHiqqCZXHY7MKyRRd2iLczxamieWmeuiEJ/ZF
 2JeZe/xSwhVZIaeP7CLoTxmrqH3/XX8=
X-Google-Smtp-Source: ABdhPJyml1WnD+3oJvuT9Y+10ycOtjax9tnZWjZO2UBh5ha1mX7nWOQj9t6y1FS8lxX4J3krrNhCpA==
X-Received: by 2002:adf:9cc4:: with SMTP id h4mr5247863wre.403.1611936759093; 
 Fri, 29 Jan 2021 08:12:39 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id n15sm12701460wrx.2.2021.01.29.08.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 08:12:38 -0800 (PST)
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: mt8183-evb: add PWM support
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>
References: <20201209120322.137610-1-fparent@baylibre.com>
 <20201209120322.137610-2-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <2c7b3444-32b8-9f35-4ca3-e292206d7c02@gmail.com>
Date: Fri, 29 Jan 2021 17:12:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20201209120322.137610-2-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_111240_939560_7DEE5DAE 
X-CRM114-Status: GOOD (  17.57  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 09/12/2020 13:03, Fabien Parent wrote:
> Enable the pwm driver and set the pinctrl for PWM A line.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Applied to v5.11-next/dts64

Thanks

> ---
> 
> V2:
> 	* rename pwm0 to pwm1 since disp-pwm has been merged in v5.11 as pwm0
> 	* rename the pio node and labels to match the coding standard of this dts
> 
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> index cba2d8933e79..3249c959f76f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> @@ -344,6 +344,12 @@ pins_spi{
>  			bias-disable;
>  		};
>  	};
> +
> +	pwm_pins_1: pwm1 {
> +		pins_pwm {
> +			pinmux = <PINMUX_GPIO90__FUNC_PWM_A>;
> +		};
> +	};
>  };
>  
>  &spi0 {
> @@ -392,3 +398,9 @@ &spi5 {
>  &uart0 {
>  	status = "okay";
>  };
> +
> +&pwm1 {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_pins_1>;
> +	pinctrl-names = "default";
> +};
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
