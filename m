Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6264C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 12:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9NXku2pSRV2wSCRtuxBqdlKYT3KNs95Y1/l9wS3vzw=; b=Cx6rDJgIX6Y1a9QHri5ZVeZlFX
	wCPL37c2qMRj2RnVc6O8uCsENyJB3+GKuXl+c1SRXPlT6cY0AJbG80MYA/0zf9XdnGx5oDlPSL2sK
	d/KIJYrSnv/eXTYj3P/2p46NL/4aLphZpqTBHtFFeWL7oFJlETPwdiSdr6hrM7qSEE+Coviwbr7pC
	OO4q+ddkSdWy1E28OkcTXHYUISY15+wykU0gUNxs5pXeXMzEZIKhalrMUpNNlRqN7byUD0GOl1qXu
	ent2pU6JmPb3Kyd7m5WOOUCfH+Cf2GDmzoXjCr3Z4D2zNYBxXe6bimUV8jU0waHoH743cd13CXrFx
	j+JwYf8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZq9-003CBb-2V;
	Wed, 12 Apr 2023 12:44:45 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZq7-003C8h-1N;
	Wed, 12 Apr 2023 12:44:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id m8so20156643wmq.5;
        Wed, 12 Apr 2023 05:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681303479; x=1683895479;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H9NXku2pSRV2wSCRtuxBqdlKYT3KNs95Y1/l9wS3vzw=;
        b=OyUCjn9d2mWZw6/j9UH76T6MvVfV73nrX7flAEHmexvlXuDR1A3kUxIjr+44xDCrDR
         k//7Zw99Qqcchw/qWW0ytKHFb8rCDg0FSSOQiwNs2dwvTwNVjp8nk0Cu2NfAfjmw9Zc8
         5uzci64ZRXvrjB0zjvaimqizCRF1+OKTRXwW/zN3C0pT8ZwRwRaQ6Xx/6f+OROOMWKG6
         cMyn8GGHWv15mf6E752bYcMrKPUww+r3RV4+3atyPQuSPI9VETbjjn0N4Uxt2Pn/UyoH
         ccqI2akgk2fhK3+m1y6MYcSTCHHj84THPSfcHDOGBvGTZqhWb9Y2KoXB3FK5Oj3oqwwm
         pI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681303479; x=1683895479;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H9NXku2pSRV2wSCRtuxBqdlKYT3KNs95Y1/l9wS3vzw=;
        b=C1wj9Nv6NwLBAGQdk7s7cEnkrgfFXnDTq+soUojDsLUX6tm3VDFvuTxORske6suNjz
         8H+FW8Mk+Ac/T7PsINrXpSCbcXxULnrPEx1mnRhH3XcbtizkHEUj9XRp5UxurcNirDVK
         rKj6EOQsaAH1Gc0ekzLwMNPe/06MfdTJJ4t+vnBhkNKDxdaRy2jWOz3NepyOCQqN0EGQ
         ouSfZdtPFMOL6jcpjhN3hfeIAKG698peXTXtD1dpGELzJrSHdDSvFvPPb73F/zHwzldF
         LDMm/Gqb+D8w7N3Qi4y4W785tSZaIvu8yxn2yy4636CQCZV0oJhIa5Qq+8hE1KX+wpFx
         2EtQ==
X-Gm-Message-State: AAQBX9ctrfKCaVNmIfUGE6WeawF7mCmMyKeWE0DIUsCjelXXbYe/zEuY
	7VtMj4nZ63BCL5al4TymdPM=
X-Google-Smtp-Source: AKy350Z9J6ofOu5x2SAuA+Yid54vROa2O2IpNFieU9+eQdR2LmXWIs2SlT696xFupy+hn+OrZ4Z+vg==
X-Received: by 2002:a1c:f20b:0:b0:3ed:418a:ec06 with SMTP id s11-20020a1cf20b000000b003ed418aec06mr11959758wmc.28.1681303479096;
        Wed, 12 Apr 2023 05:44:39 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p23-20020a1c7417000000b003f0824e8c92sm2294201wmc.7.2023.04.12.05.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 05:44:38 -0700 (PDT)
Message-ID: <d892f4d4-f311-4795-ded4-6b735739dd94@gmail.com>
Date: Wed, 12 Apr 2023 14:44:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 26/27] arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch
 BMA255 Accelerometer
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-27-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-27-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_054443_465370_02D27162 
X-CRM114-Status: GOOD (  12.59  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add the BMA255 Accelerometer on I2C3 and its pin definitions.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts   | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> index 155a573eac4c..0b0519f6b2f1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> @@ -68,6 +68,13 @@ &i2c1 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&i2c1_pins>;
>   	status = "okay";
> +
> +	accelerometer@10 {
> +		compatible = "bosch,bma255";
> +		reg = <0x10>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&accel_pins>;
> +	};
>   };
>   
>   &i2c2 {
> @@ -247,6 +254,14 @@ pins-irq {
>   		};
>   	};
>   
> +	accel_pins: accelerometer-pins {
> +		pins-irq {
> +			pinmux = <PINMUX_GPIO12__FUNC_GPIO12>;
> +			bias-pull-up;
> +			input-enable;
> +		};
> +	};
> +
>   	i2c0_pins: i2c0-pins {
>   		pins-bus {
>   			pinmux = <PINMUX_GPIO45__FUNC_SDA0>,

