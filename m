Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EA6CA101F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 14:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jnkM+AnZyhps3qygpz2dIT80TKNeLfoU88kbfoaXJwA=; b=OXibc2x6dpqYvs
	T9BI9fG/BOJ3IPZ53ScW8aTRK8jCf12SwM4DwaqXdgd8pIx4bg3kCELWQfpFsI6c/f1Vt5FNcDRZ7
	I0B3FLsPuOWBY8zfCn+sD/Fx9ZnUliCCqCVgUZD6b8K+2+QcQ4j0a6vFwTpE/Hr0Q3qgx2ALUX/Ku
	AxhlLxYAAngBsNyNGxJFbqWFO115fFmIya4aJwkShiOQXSq+GxrAw77Ka2I7wLnhnFqYQJUlxr4Ft
	mYvB/sC2ldaIBfYftJ/nymtN7RazkY5ypgSXFdcfft3y+EwOjq74opl+Fzz+yzHu8TrsoUVnaBGq7
	ozBkVJ8VZ8Z1lhx7sSqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4l1-00000009tR8-44N0;
	Fri, 12 Sep 2025 14:28:11 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4kz-00000009tNh-2nxG
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Sep 2025 14:28:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so17804515e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Sep 2025 07:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757687288; x=1758292088; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jnkM+AnZyhps3qygpz2dIT80TKNeLfoU88kbfoaXJwA=;
        b=S3eEC7zi/dNCc0gbLY4gk2k+ooWDrCW+vaDZWd0fMH9pSeqAX6TeQ/Gq0WxY0DzZ1o
         aiAU3CDfckDZxr3v3ztayYf0/jQGUokcdOlaCf43kRVB12faw9qI7qRuCA4Ze/Gzyx+w
         V1hE1BhYtW8NC5fb+nD0XzuN3d9EkiH8i+urUDcespooA4/04mNX7p1nRk36hTO6c+NF
         0d7Jmg2TOh42t7H+MdwvDT6ur3BkjXLjsYXrBcQVkPLPRAyfrlcRDpUkW3K/K7D5TyeP
         Skr884vwuynfa7kCqAUnA5TKdbxUCJkqOT1SVKv+2lK3BwuvEjn6DIajK1bqhrEOkGHu
         1x+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757687288; x=1758292088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnkM+AnZyhps3qygpz2dIT80TKNeLfoU88kbfoaXJwA=;
        b=q9bYY3OBlhPgtEOUU89itt+wFaVAMOHTalSsvUzYWPN6Z01K04eBy+OR/XlZkmFPJD
         cd7/nvHcaBt1iiplIf9BQ/OM7F29sBskqqpgzqWKMpSLHtGapjyy5eM/ebEB0lyVce9b
         ZpXkZyOrFuBjzkJ6GcrnVyPOCUH087SjfVquUkBuwryI2ch5r0xNFeX2BXasM36A6JzQ
         HqpnFb0/ZKQ4+NS7CZYwj1G96DEZ2Rhyg3Z8LiHCgO+9irehAiRkUAbs3J6NEsMdSUhv
         Cfs4mp8bLAvLGjsW40N3pMZOjw46gvZsWsfxvu0TmdPryOy1dCETUVrEpNqZHrgIcvxO
         AMjw==
X-Forwarded-Encrypted: i=1; AJvYcCWHSW3Wzi+eiYdqmTH15ujNKZXR0OmavRmCSgRKZXarI+Ik3g8XA2TCM6+9YHWC1h/9oyFi1BNHwk3mA1xamw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUE1+pmXa7bcnc2TW++ZKYLgjB5Ozy9sz+B9C2XsNlQcOGapny
	D9U73HlBA+QbbJMmak5XzB6lFoAojL1u8Cu6U0uEAR3wq7aIuChUyGCO
X-Gm-Gg: ASbGnctQ3EnA+5LZcm5scfsdW7jJhft1RIYIBdPTvx/aqItCtp7O7q2rac8Vt2qJcjJ
	OFHoLtPPRBFq/OvTBgdntlbT8tV5VJojPPetjP3rofD5qkfCPdta0Q0eCHVGqEJ6wFOqouY0mPg
	NtNvIs/2Ai4AX/iwYfo7s/rHrLJJVkGe8aRkA3hCrAteLevRaNbIvfSgGlpqn4Fu5N0bwieiflU
	W2PaTJYiSsCojVqHx4NNkEd4JT98Vo23hIBeO6SOBVF8t2cXYetSBr07KkUh8ePymsqfqUT+aDQ
	lqu32Y2xhi9FiqW9VeYwfwccxmAYuSq8rsGIPk7N/8bNh8JvWbebbBLfBlnLOUfat0pS9/wSUqJ
	N4N8rQWDpPAmcKDdnjipKwWdslt4k+N4F9S+iggVerQ==
X-Google-Smtp-Source: AGHT+IGDvV53/LNE/OpdCCjsAZPEbICrc+wJ2bgnqrFTzigP/wpDBOWh7QRU2BBuWo1pqbgZm/YfGQ==
X-Received: by 2002:a05:600c:1c19:b0:45d:d259:9a48 with SMTP id 5b1f17b1804b1-45f2128cba7mr31759255e9.9.1757687287618;
        Fri, 12 Sep 2025 07:28:07 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b27b6sm67769045e9.16.2025.09.12.07.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:28:06 -0700 (PDT)
Message-ID: <3de4b03d-4940-4d96-bf20-5bb45f1cc5a5@gmail.com>
Date: Fri, 12 Sep 2025 16:13:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/38] arm64: dts: mediatek: acelink-ew-7886cax: Remove
 unnecessary cells in spi-nand
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-27-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-27-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072809_740756_F935E2BE 
X-CRM114-Status: GOOD (  13.26  )
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
> There is no need to specify #address-cells and #size-cells in a
> node that has only one non-addressable subnode, and this is the
> case of the flash@0 node in this devicetree, as it has only one
> "partitions" subnode.
> 
> Remove those to suppress an avoid_unnecessary_addr_size warning.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> index 08b3b0827436..30805a610262 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> @@ -98,8 +98,6 @@ &spi0 {
>   	flash@0 {
>   		compatible = "spi-nand";
>   		reg = <0>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
>   		spi-max-frequency = <52000000>;
>   		spi-rx-bus-width = <4>;
>   		spi-tx-bus-width = <4>;


