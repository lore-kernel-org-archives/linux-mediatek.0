Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6FDFA3746
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 11:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQLem0H5xR7gHFsoayzHMPC1GWFG8EEy54uIDYEfoL8=; b=xn9Z5tcPnKjq2xAksciARzz2D1
	QlkmbREr4I3fPWSTHFr7Zjp99O2AWpHlDZXiuzW4A66biIxHf1O8XBHzuU5eOtqL0d8syzwNidgmS
	vXlTLFGB8mjI5acqA6tult+fr1Kd/6iPCQ+hlbq8SpFp19HqzUktQrWeJJ+jDiyidi639I/8hm48w
	CEdDK3/GED47PfcwgqTxuNJNGZHB+L7i68v21TtLKa/vO0tUrXH2ltnOJg0mkPwzyfJGj/d5gyEIh
	pSXwkAHtgBh6/HlUw6tu/Ss0No5dcUrbeqjYgSy9u5SzF7WamztcydFRpeSxvoZnwqf3kMqQiewH/
	edou6c+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp4Yq-0000000Fk6Q-1jkv;
	Fri, 13 Sep 2024 11:34:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp4YB-0000000Fk2S-1KPR;
	Fri, 13 Sep 2024 11:33:20 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42cb7a2e4d6so17923555e9.0;
        Fri, 13 Sep 2024 04:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726227196; x=1726831996; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zQLem0H5xR7gHFsoayzHMPC1GWFG8EEy54uIDYEfoL8=;
        b=XE6mr6Pt9RPDnJg7MZ17+glN8DB5aGACUCvEYWU8W3DjX3JwJyVCCQ/osSJvYva+da
         M78Fmq54pXWSqHvC03IyqXHoVymL4xl648A6N2Y8lo2k/owc4blnoO6BwBekFAAq/EOc
         eiEuFKvTvTL0F+cFu9+AFZjqrva8uJqh9o1xFfQJUsCtUpwLrJrbexPmyGYAe6GjWU9X
         lE6SzigWvKdmC0gad1WXhejaR4ishzWaH2QUGn7FsLZsiuSppqNCZbceNf/7+QHpMbX4
         gaR/iqRDBCfgNpZQfYszzF9+UdI9h2mg+TPEmX0bAMei46NqMBPVWq3F5Uu8RAeH7A9u
         /6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726227196; x=1726831996;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQLem0H5xR7gHFsoayzHMPC1GWFG8EEy54uIDYEfoL8=;
        b=aMDGBSklf/fKnbWRS2S98FphDXoguDsT4Dgdiej4RrZ2DbZJALcelZeG8/9l2kCqQ2
         FqLLk2SJNy0NzzfLu+5VRpzXdOujz9PWsiSvY6F1ya0/GVgmqPhkLPCLuOzdQY8MGdms
         FfnDPbF5HkOMAOiuxJK3ZLYRF5LemTVBPBZ64WYJPpj4ki/BSekR2ujSvlzDZBwBkD5O
         aU0wmpQPbvdqH6CqtV8G2vBgKtlbjKcgDFavjmr8bbB6HB/KIhAJoFEUKkXS9xFCzZ2F
         hGjs6dgV7a0QT+JDdmpcZH5qL74k4e6/utUZAtfJd1Dkofr3LTqQ6EihdVgiukrRcPqu
         YbpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm7c69KwtGS5zhyi0bvdXU3JPsfAQaG33K9AA4x4hfVp9pQVwZQWhUeJiyfnozXzgQ+cWZkmKPYJI+1DwRi/NX@lists.infradead.org
X-Gm-Message-State: AOJu0YybiZe45atGFB19Y0Oa5NuhBdByBrtQDK3bK46vdh7IL2ARnj0v
	+arMQ7m5znSQbjbXh5o+u0bR6ebnmYTdAqTbyW5k+Eyx4Q0HABXO
X-Google-Smtp-Source: AGHT+IFQ1q+OqvVOZ5k4N0i7cfvN+WZFlk5LgixAIqWSWnoJv18qnXA8hM/I/zfHYp2Jq9+1yoNEUw==
X-Received: by 2002:a5d:59a5:0:b0:374:c614:73df with SMTP id ffacd0b85a97d-378c2d5b43emr4176583f8f.57.1726227195199;
        Fri, 13 Sep 2024 04:33:15 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.162.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b17b136sm22116535e9.40.2024.09.13.04.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 04:33:14 -0700 (PDT)
Message-ID: <e820d20b-3a5f-46bb-8293-d1e85098aaf2@gmail.com>
Date: Fri, 13 Sep 2024 13:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt8192-asurada-spherion: Add Synaptics
 trackpad support
To: Pin-yen Lin <treapking@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240912154451.3447081-1-treapking@chromium.org>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240912154451.3447081-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_043319_391830_DFA2B52F 
X-CRM114-Status: GOOD (  15.48  )
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



On 12/09/2024 17:44, Pin-yen Lin wrote:
> Some spherion variants use Synaptics trackpad at address 0x2c in the
> I2C2 bus with the generic HID-over-i2c driver, and this cannot be
> distinguished from the firmware compatible string.
> 
> Support both trackpads in the same devicetree by moving the trackpad
> pinctrl property to i2c2 and adding the node for Synaptics trackpad.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> 
>   .../boot/dts/mediatek/mt8192-asurada-spherion-r0.dts  | 11 +++++++++++
>   arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi      |  4 +---
>   2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
> index 29aa87e93888..8c485c3ced2c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
> @@ -79,3 +79,14 @@ headset-codec {
>   &touchscreen {
>   	compatible = "elan,ekth3500";
>   };
> +
> +&i2c2 {
> +	/* synaptics touchpad */
> +	trackpad@2c {
> +		compatible = "hid-over-i2c";
> +		reg = <0x2c>;
> +		hid-descr-addr = <0x20>;
> +		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
> +		wakeup-source;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> index 08d71ddf3668..8dda8b63765b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> @@ -335,14 +335,12 @@ &i2c2 {
>   	clock-frequency = <400000>;
>   	clock-stretch-ns = <12600>;
>   	pinctrl-names = "default";
> -	pinctrl-0 = <&i2c2_pins>;
> +	pinctrl-0 = <&i2c2_pins>, <&trackpad_pins>;
>   
>   	trackpad@15 {
>   		compatible = "elan,ekth3000";
>   		reg = <0x15>;
>   		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&trackpad_pins>;
>   		vcc-supply = <&pp3300_u>;
>   		wakeup-source;
>   	};

