Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9670CD31A26
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jan 2026 08:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OC/Dw/aj2c+iGoV4mMFgj1KT3b4DGhGfHvAlSHugi9I=; b=qNr5tnideBV/5pSFg0K71qA4lB
	RzLP97XnrUvzTfP/rGXqV04iGweMfXGXsyTgQ0AztQ9jaI1GncAKXBZIq7tKgvZ7lmmt5vh7lfzfp
	T/fc0rOdnaL2Kdh1v6HYNkXJugmsxiR6NBX2rtuVZ/+yY3ABGgzPD6J95CiOblJ5+HlJnK78YlHQR
	gP5/+YwNRw7UBVkX/aQvmIrwl9RcmEsXNAO5i8E6gQhB3mB/cIdqca3eDpQm+nd3aZZg5OijQC3Kl
	nyh+9W4brZzAEiUy9dWVDGluTneBBduyNmm9zsKhP6fKD9E84sJoW4rNHcGJLvAIElr9R2AKpc5I4
	wBZ7ZhGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfw2G-00000008IGT-1ktE;
	Wed, 14 Jan 2026 08:15:24 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfw2D-00000008IF8-2taw
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Jan 2026 08:15:23 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so62583135e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Jan 2026 00:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768378520; x=1768983320; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OC/Dw/aj2c+iGoV4mMFgj1KT3b4DGhGfHvAlSHugi9I=;
        b=inV/uPUe85cggbmy2o02hYvBOcBWXFSTNiSb0HGTcm/9wXiM6od7AFCWhKBoYiSWkM
         6m5lZVX47kKMLC3oMuDyzwOWrncQzx6wP4P2RwzRckf+nXhOoGsnrPltwaPuLu9qSdGq
         5BWGyp5gG2Nd6CC9XgwKH6pKEhq4BNYf1bgseIzRrFx+oINEOcwMHiKyo5XDulWGircl
         kP7b2m+wVyenUxEM5QM+xU7UZMW33ybzL1gjgRZklxkBpPuhRl67ozwoDbfBh/5mwgVU
         qzNuQ0XETmlyAkQ8hiPpBspu7dRIJCl6BDDC9oLqdlKDptb1NuGAEDpqvO4p2tRMKa9X
         XYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768378520; x=1768983320;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OC/Dw/aj2c+iGoV4mMFgj1KT3b4DGhGfHvAlSHugi9I=;
        b=HIHhTUH5ObdxNW9Ner/Y6i7LmOprugCE42/KhrvagcJDlNHtS0/6CrVTpW01TNx8xB
         KZqWuQTg/ZcJ6lgG7QJXaSEOspBaSUh/7hgmcpOaHFCcEUySMGBGzONXfQ1i+4kyhrM2
         GOj8esoBaWI3aZ6WbfK90m3hW0fW7OzPd8WilEehJNs4D0QiCh2yYgv/Nx5WI9YXqkOP
         0iNYQ6LSJtktB+MLpaJ/VP7OsX5CaLQ5xDQMgL0dllBRUeNN2B1QteNDoIzdLiZ4RS0b
         e+BF9+ur/Ak806YX5ZJ+g10ouL3cWIIBhmkk89BoJVXKsKBnlvSZFkZ9rrbhLIf7dZHv
         q8YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrG9785QCh1hw5xxgMq4au2PKOy72HcF0g5pbPbK9UT9qko0IGxBDRUbQEejs3m7ElFTrSQieQeWwjh7658Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl4WfDS+nBDCA+9Zf/NzYS4Y1Zc4zPpa5REf35R4psAj/ZJ78a
	tImoP5UnQqoRX+1dxBlBQ8VvjxlYyoYpqqr4qTvujSfbnigRWnhWV0cf
X-Gm-Gg: AY/fxX7NcGfGdepwWF8Jujc5PkB3RV9VdpVx/aQ6ZH20BggxiClz8p+TyYuAIlDxGM1
	gDYtgIi1I4szGTR7mxqjm6GmcoJC5gjBjpT8R1FLO1KKIHS28GaAZ+QnHf6OITuqBX8a4UXEqgu
	pkv7uuNo3lTTBfyNIImgoHf1yPDvxmRXuB6iXmOtJHs8n/B+p9ShB79raYwwSTJlrl+Q00lk2F7
	bqaeONoAadQUMryjwz9ISaZmcinfcDxvo9MQigleAujlI1GYWpaJgnlh95yXpLXeSJF8wPf7iNJ
	E3pJ9m/g1P4hKijqVbLgGMuwpuFS5c3BiMhEXquzGUUQ1lS8GPwqfzMetd0iLgi5nrNcaJnraCs
	Vsm5EL9dlrXSe8vDywS3D7mN2lp6Uk24js7eZ2bjlS9FAEyyRaPre31Xp4oZQou4Gy+0F7PAdUr
	D3ClH6Fp+IHiAQlZwTyubNF3to+2nY98V4rwipxYdLB9b38hK+m/xkx11n7bYIPm9l7R0=
X-Received: by 2002:a05:600c:314e:b0:477:9cdb:e337 with SMTP id 5b1f17b1804b1-47ee47bc03dmr11164035e9.7.1768378519599;
        Wed, 14 Jan 2026 00:15:19 -0800 (PST)
Received: from [192.168.1.27] (84.121.134.198.dyn.user.ono.com. [84.121.134.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee563ce5fsm15437185e9.13.2026.01.14.00.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 00:15:18 -0800 (PST)
Message-ID: <46785ec4-d222-4897-8427-82e3d3b1dbca@gmail.com>
Date: Wed, 14 Jan 2026 09:15:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173-evb: Add interrupts to
 DA9211 regulator
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20260113110026.37032-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20260113110026.37032-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_001521_752784_7998D3A8 
X-CRM114-Status: GOOD (  11.68  )
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

On 13/1/26 12:00, AngeloGioacchino Del Regno wrote:
> Add the required pinmux and assign the right interrupts-extended
> to the DA9211 regulator (PIO pin 15).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> index 51118a4149d8..1049877e6cda 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> @@ -117,6 +117,7 @@ &i2c1 {
>   	buck: da9211@68 {
>   		compatible = "dlg,da9211";
>   		reg = <0x68>;
> +		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
>   
>   		regulators {
>   			da9211_vcpu_reg: BUCKA {
> @@ -179,6 +180,13 @@ pins1 {
>   		};
>   	};
>   
> +	i2c1_pins_a: i2c1-pins {
> +		pins-da9211 {
> +			pinmux = <MT8173_PIN_15_EINT15__FUNC_GPIO15>;
> +			bias-pull-up;
> +		};
> +	};
> +
>   	mmc0_pins_default: mmc0-default-pins {
>   		pins-cmd-dat {
>   			pinmux = <MT8173_PIN_57_MSDC0_DAT0__FUNC_MSDC0_DAT0>,


