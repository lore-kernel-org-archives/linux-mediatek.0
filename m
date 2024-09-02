Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6795CD13CF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 16:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Kv/apDvPrExBQ5X/4dafVzGVDaldCIfwo7y23syOH4=; b=TC/pROVflUOfXZUKkn5bJRFv5I
	Vney4Z9JfdrZj+ukNa1VJyXTct/uO2N+lm3c3iKQEWRj/TDLTuitOeD1w42R+nls6L0UkmIbBtcee
	mD/6Tr/WLiqMb/4fEsJeezl6obO+g5bUHBpRdU0DmIpJJbDHvgrAOZtRD1sioavXklL3KejHE0TR0
	5QKQeJEZDf5LrCCEx6OFdfkdGv7e7xKx8tNhlrdANglbjQBcBeRQ1mfsG0s0yO3n7/n4Ks7F/aCyU
	T1HAbFHfy2vkmjRtlCaPGdzPVOL6OF5Bg35i4immGi7RLTdgNuslJ/oW4byk3D7PGvhvpoVZM/2cI
	oHc1YSww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl9Xd-0000000Ex1j-0HDH;
	Mon, 02 Sep 2024 16:04:33 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl9Wf-0000000EwpQ-1nPU;
	Mon, 02 Sep 2024 16:03:34 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5c09fd20eddso4045195a12.3;
        Mon, 02 Sep 2024 09:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725293011; x=1725897811; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+Kv/apDvPrExBQ5X/4dafVzGVDaldCIfwo7y23syOH4=;
        b=M2ZWYTsvAqM1kU/0O1exG6zeN9fXeeNIF3rE4gX7PD3HKSxC/UeVgd4hW3HAkpV/iY
         F/P0pIEu1vKZWhGm2r/fEy62zJ68HwSsvDoZaD6Yh1jC2b/tUB/Gv2/RAT2NGBqJXOMi
         FIGRgnWe1frtgYkgBWsWJVARZgk7WxQd+O3U8mTtuiptcBgzfkSZf08OnntJkr/CXaxD
         +X0DlieL/U5qkvba8RSGk83lhZyk3GBe6aqX2sHJXRanvxPlMzYMkdGMjABLnzan7Wa9
         CxDFpsVFLUf8mXY3yBVPedCAWDhhdEbExet8VWOS1QoUigSHsBOehmHLtmylFNTByIkU
         lnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725293011; x=1725897811;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Kv/apDvPrExBQ5X/4dafVzGVDaldCIfwo7y23syOH4=;
        b=BZLIO58ZV4UW+TGCoNO5Ta0sys4ElxPcLaC5pRbasBQE0R02hxfl9ljGzMCDBEZ8J9
         8zA4v3nd1FiK42/vM8YrEFXLFhT+akVGXaHf5LlEjRKOrZ3aWy2kKzhtuBaZG6SX9r8v
         S6fFkiAPLDUjnNhfgayamdr6gDm2ADO86QVScX4dfHa9RKxEFZYkLBwLfNts0ED33JNi
         PRZjOsNZ3I4OzxenOl+LYDAx0pl2qpqdjEJVDPqOtVV9BfYBYFmzGqziHxZCPqsTttWb
         w5ZIgoGyDo0HnC7BBWo6JXxqR1S2EYRqbm9HwiUufiA5J4J2VIv1habPsgobpkYVEhe6
         8e3w==
X-Forwarded-Encrypted: i=1; AJvYcCVvWlVldzvdlvD6vexx0r2N4p7ymcY+7K0M6PpnLSNCsFCqOzwR56Rv1RR/YMr3o04Biy2nONF/o0/QnpPhG9qU@lists.infradead.org, AJvYcCXdAIilP9KyCWUhal+V4OwPL8gWuO7QjyhV3U+PYeMVNmO/ndl8ySf8caibeRTA96CGtCJNc4GtL5kbJfWZ2k4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3M7cTz77qs4VySoX4SQP4+bFnWxZp6M3PdIRWR82HQMm+lZpT
	soncaP5KyWc8JB2bB2QDY3yftvn5i/lQqVXVNvtHM6x/jlpCmUKR
X-Google-Smtp-Source: AGHT+IFwZe3vVzPMqvX+UqTwajDfeT9bDtU/z3lfwpijGNagFI21EwhcugsW/nwlZeHUF+s2trUicw==
X-Received: by 2002:a05:6402:27d1:b0:5c0:b333:b2e1 with SMTP id 4fb4d7f45d1cf-5c21ed52b96mr11240428a12.20.1725293010839;
        Mon, 02 Sep 2024 09:03:30 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226ccfe84sm5359695a12.71.2024.09.02.09.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 09:03:29 -0700 (PDT)
Message-ID: <bb0dba5a-68e9-4c03-bbea-6788f4cc7d16@gmail.com>
Date: Mon, 2 Sep 2024 18:03:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186-corsola: Disable DPI display
 interface
To: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Stephen Boyd <swboyd@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, stable@vger.kernel.org
References: <20240821042836.2631815-1-wenst@chromium.org>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240821042836.2631815-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_090333_507217_81BAE9CD 
X-CRM114-Status: GOOD (  19.82  )
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



On 21/08/2024 06:28, Chen-Yu Tsai wrote:
> The DPI display interface feeds the external display pipeline. However
> the pipeline representation is currently incomplete. Efforts are still
> under way to come up with a way to represent the "creative" repurposing
> of the DP bridge chip's internal output mux, which is meant to support
> USB type-C orientation changes, to output to one of two type-C ports.
> 
> Until that is finalized, the external display can't be fully described,
> and thus won't work. Even worse, the half complete graph potentially
> confuses the OS, breaking the internal display as well.
> 
> Disable the external display interface across the whole Corsola family
> until the DP / USB Type-C muxing graph binding is ready.
> 
> Reported-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> Closes: https://lore.kernel.org/linux-mediatek/38a703a9-6efb-456a-a248-1dd3687e526d@gmail.com/
> Fixes: 8855d01fb81f ("arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel / Tentacool")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Applied, thanks

> ---
> Stephen has recently posted the "platform/chrome: Add DT USB/DP
> muxing/topology support" patch series, which is now up to v3 [1].
> More work based on this series is needed for the DP bridge drivers.
> 
> [1] https://lore.kernel.org/dri-devel/20240819223834.2049862-1-swboyd@chromium.org/
> ---
>   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> index 0c4a26117428..682c6ad2574d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> @@ -353,7 +353,8 @@ &dpi {
>   	pinctrl-names = "default", "sleep";
>   	pinctrl-0 = <&dpi_pins_default>;
>   	pinctrl-1 = <&dpi_pins_sleep>;
> -	status = "okay";
> +	/* TODO Re-enable after DP to Type-C port muxing can be described */
> +	status = "disabled";
>   };
>   
>   &dpi_out {

