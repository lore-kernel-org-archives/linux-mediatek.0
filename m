Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C733CAC58F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 14:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Ug4rvDJVrD/KFt1LWLn8j4wXGstlIATd7OgVTytDCs=; b=n8h8Ahff3w2BkO
	/4SCBNjTc/tKWkRXOJYa/mndQUxk72TT7jJxUEdrrAJY4X1EG4HBKyPSWHwNNERW8GZZn6oFpFfbT
	DwjHvehwhncliEm/C6mL7Jqwb4YI5MApEhTI9kYgj2s41isut+KJnPNxUONlCJgIZevnTsl2ZV2Q0
	WMRyNrjpp6cRlgNlHZnL81RCsP4Uco2/RtLuVxuRDSj8KRUBhcdy8UXjrlmOHM1p/p1m2urcde8Ur
	U6uXKCtghUM0Su6xJCXXy+v8sFpjfIZzxMQLxil5EJp0uqMWB+YMgbcysG5e9EXgQQkYuykYqAzLq
	XZMnQ88ctTwKrZdzvr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4gP-00000009r5G-1f2c;
	Fri, 12 Sep 2025 14:23:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4gM-00000009r2v-45rn
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Sep 2025 14:23:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45de287cc11so17011955e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Sep 2025 07:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757687001; x=1758291801; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ug4rvDJVrD/KFt1LWLn8j4wXGstlIATd7OgVTytDCs=;
        b=l/qs77zk4FcLgIouMzTacbxnaGGPZry7aRTZcw3n+h9wP5W1w2fSRHkganhTqRWayT
         VjPGOuUDhhxjmLqHtBeyQobDyz/dGVgdoWgotKBOorRybqJWANfqoeaiIBeJhimfxdVF
         5KwI9d8t+m6eH9PGDYvcU74hEgz4946Tb04Kljx6YrHtU4sC1jSNAuuq2WSP8Rj4AnH1
         lDJNtp979lCEA8tGwBN8kNXFPBjRZDe3EtFqcN8clOd/q9GxqmQiASwyDHYQb4RRF23L
         n4vyUSWHKT8nPs2iYPZ1Akj7ZCyNU7vdOiT+I2zVfkVOOBg+0kRHCN72yHTkvxZ+/bHa
         kpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757687001; x=1758291801;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ug4rvDJVrD/KFt1LWLn8j4wXGstlIATd7OgVTytDCs=;
        b=FbidYIzPa2mWaN0nn1E62sdh1VAer4jAA2v8CDTarFuCxwE+8H7PJRqgej9P97SYhs
         yTdDoGAndz+K34hV+DXq7SFxTqMBzr6R9TllLs7OAhBIONdzWSvBp8wsiM8rqmvmN50l
         L5W/XBc3hUq8Nd1tPUe+B/1P49U50SavmfppTA1+9o6/BDw9E+a2pD5MrqHMYFRswreI
         WBbqG+I891xDjm666R7XiKbposzhALr0Is0ozOC5EnhT4SSHiRfUQJcnelbNpa2pLlNd
         yXE8LmGOZPrwwuKKTkMEm5yZ4qgI7PLMM0PHWZW4feAIo2gw7/BE1Ycnw+jnZKAxIfIG
         fcsw==
X-Forwarded-Encrypted: i=1; AJvYcCV21iRzTRRzL93IXo6DCQRLg5RtX8k6VOiumtZ+Zp5RuMxfcf/o3dvsG6zjsEeQbBnwcSMp39X6TtTHpWCcYw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy55mVGOkvmI47sKfGNsIguzgdYwAbt0v24GP0xBHgQQ0bRJCrv
	OVUQ2hjyAz9rVJHzM8JFIxoZ3r1tLwcujOAfEt6Xnz5Ksy+bOEZjfP8m
X-Gm-Gg: ASbGnctYa8cgA6T9YaCRQvI4Risab3YpnFJCiLRwjXN0QdzPbq0ZjWNG9MYIhE562xS
	BH42NE4hCyetbc+l1R4sS7+to+1KerJVlyYgMyLQ/Y73YEqgnwV6hSb+1NSComl7D8jx1p4H6AE
	XcdzLkI1hAP9jZNGuPOpcBtjW8B8sumdNn4TdNScsx1oP+EiHP96EJkJ5hN92QJ30OMsSDU+Gjl
	2t/rT9Ucr3xqzQout+4HppFdtKlIouznBIMB1Z/fmt+wD5PaUau0qCnbTfdECJkjv0WW3vq4DSt
	kf0tj0MWISscxkZanWHqxL3PjxLCm1xbaUHx03abwXhqnv16jQ7tNbtckcSN0Snk5KcsPDpGmNc
	+VnSwZ3y13mZU6nKgIQyQ9iMBe6UGOhWYvrsDooYAwg==
X-Google-Smtp-Source: AGHT+IE5UXOItxjbn0zFICANNc5GuRpVNR7hiqiKPBU9+i1k2C8vaMc+CHm3lHcY/3oRsKpLL3Rr0Q==
X-Received: by 2002:a05:600c:468a:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-45f2126253emr34464315e9.8.1757687000920;
        Fri, 12 Sep 2025 07:23:20 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e016b5a2esm67200825e9.13.2025.09.12.07.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:23:18 -0700 (PDT)
Message-ID: <30468c15-16bf-4c20-bef3-35d58b9a31b1@gmail.com>
Date: Fri, 12 Sep 2025 16:23:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/38] arm64: dts: mediatek: mt8395-kontron-i1200: Fix
 MT6360 regulator nodes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-38-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-38-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072323_075840_4438C1B1 
X-CRM114-Status: GOOD (  13.13  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 24/07/2025 10:39, AngeloGioacchino Del Regno wrote:
> All of the MT6360 regulator nodes were wrong and would not probe
> because the regulator names are supposed to be lower case, but
> they are upper case in this devicetree.
> 
> Change all nodes to be lower case to get working regulators.
> 
> Fixes: 94aaf79a6af5 ("arm64: dts: mediatek: add Kontron 3.5"-SBC-i1200")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   .../mediatek/mt8395-kontron-3-5-sbc-i1200.dts    | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> index 4985b65925a9..d16f545cbbb2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> @@ -352,7 +352,7 @@ regulator {
>   			LDO_VIN2-supply = <&vsys>;
>   			LDO_VIN3-supply = <&vsys>;
>   
> -			mt6360_buck1: BUCK1 {
> +			mt6360_buck1: buck1 {
>   				regulator-name = "emi_vdd2";
>   				regulator-min-microvolt = <600000>;
>   				regulator-max-microvolt = <1800000>;
> @@ -362,7 +362,7 @@ MT6360_OPMODE_LP
>   				regulator-always-on;
>   			};
>   
> -			mt6360_buck2: BUCK2 {
> +			mt6360_buck2: buck2 {
>   				regulator-name = "emi_vddq";
>   				regulator-min-microvolt = <300000>;
>   				regulator-max-microvolt = <1300000>;
> @@ -372,7 +372,7 @@ MT6360_OPMODE_LP
>   				regulator-always-on;
>   			};
>   
> -			mt6360_ldo1: LDO1 {
> +			mt6360_ldo1: ldo1 {
>   				regulator-name = "mt6360_ldo1"; /* Test point */
>   				regulator-min-microvolt = <1200000>;
>   				regulator-max-microvolt = <3600000>;
> @@ -380,7 +380,7 @@ mt6360_ldo1: LDO1 {
>   							   MT6360_OPMODE_LP>;
>   			};
>   
> -			mt6360_ldo2: LDO2 {
> +			mt6360_ldo2: ldo2 {
>   				regulator-name = "panel1_p1v8";
>   				regulator-min-microvolt = <1800000>;
>   				regulator-max-microvolt = <1800000>;
> @@ -388,7 +388,7 @@ mt6360_ldo2: LDO2 {
>   							   MT6360_OPMODE_LP>;
>   			};
>   
> -			mt6360_ldo3: LDO3 {
> +			mt6360_ldo3: ldo3 {
>   				regulator-name = "vmc_pmu";
>   				regulator-min-microvolt = <1800000>;
>   				regulator-max-microvolt = <3300000>;
> @@ -396,7 +396,7 @@ mt6360_ldo3: LDO3 {
>   							   MT6360_OPMODE_LP>;
>   			};
>   
> -			mt6360_ldo5: LDO5 {
> +			mt6360_ldo5: ldo5 {
>   				regulator-name = "vmch_pmu";
>   				regulator-min-microvolt = <3300000>;
>   				regulator-max-microvolt = <3300000>;
> @@ -404,7 +404,7 @@ mt6360_ldo5: LDO5 {
>   							   MT6360_OPMODE_LP>;
>   			};
>   
> -			mt6360_ldo6: LDO6 {
> +			mt6360_ldo6: ldo6 {
>   				regulator-name = "mt6360_ldo6"; /* Test point */
>   				regulator-min-microvolt = <500000>;
>   				regulator-max-microvolt = <2100000>;
> @@ -412,7 +412,7 @@ mt6360_ldo6: LDO6 {
>   							   MT6360_OPMODE_LP>;
>   			};
>   
> -			mt6360_ldo7: LDO7 {
> +			mt6360_ldo7: ldo7 {
>   				regulator-name = "emi_vmddr_en";
>   				regulator-min-microvolt = <1800000>;
>   				regulator-max-microvolt = <1800000>;


