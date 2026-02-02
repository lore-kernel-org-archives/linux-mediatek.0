Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9A6E7DF11
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Feb 2026 17:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idcn5ztOB8vCVixROzXdUZZgLSFHdenUmBztFP1iIws=; b=VoVzTn/sNoflfzCy+0fgUEbZ8y
	wSFUutSu4zjWNXUDCmWdku80Yo8+fF5xX1tXY25hnjA9hzdJbYIURnhlrsWPSyxdgDem6XXb10T/u
	E4Xo0BMThNqBo10WuyYl7vzMbQjvb3B83fqn/MPrQqpdragn4LRIn9dxxxaBuqpwOjCMwwlLLQb8p
	mCsdRSDK9hJM5ZR/RJn1iq76dAIk/SfPJsVF2QDlRdBtoGl7/1dVtDUbS3Zf6t06pHAc00iWirA8Z
	LLofc6xcdFUjAIh3yNppDOqTbam4nm0wCY0/wkAwiYESWXMMaEbGs9of2LTbUphGVp3D39gLvTalI
	5tJVDUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxbK-00000005Lyr-3HDL;
	Mon, 02 Feb 2026 17:20:38 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxbF-00000005LxX-0x7F
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Feb 2026 17:20:35 +0000
Received: by mail-ot1-x342.google.com with SMTP id 46e09a7af769-7cfd04f1be8so2003327a34.2
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Feb 2026 09:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770052832; x=1770657632; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=idcn5ztOB8vCVixROzXdUZZgLSFHdenUmBztFP1iIws=;
        b=HDJSKUtpodUNT5zlXf5kro5WkuEPLwYO4ut49FNb1Wq/+eKig/XePsGNjaAhV1Efri
         KaCX90wzfkRf91Yp0BIo4/FcgBUSXP0PDC6gm1yMu/F6ww9eMRVBl9+3imA/XP1+LWmE
         P9UED/VGiE1H4wwSsx9j3e3sCDOvGiE4XTgTYSXsXnMohEvtbk11WDwI2DbjlbcDEMSb
         wdQBEoAyeFZGtciYhajI0EMT72URF8Tv28Z943n84ZAWzO8h4DaiQoWoIK97c4YTICfV
         09UAtK0nd6C4iK67yq7X2lLxbT9AGwhx684fR7kbZr+WUg3dRv+aoLAT16iNHys66F54
         5SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770052832; x=1770657632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idcn5ztOB8vCVixROzXdUZZgLSFHdenUmBztFP1iIws=;
        b=CzMSlCnUp2MMtroiAiaid5TauZOmzosOIiruR8ohbfhboTZtch1l2Pznj5GIfqWbZV
         KVAVLTwv74/PNsdDH8RchNDGDG7m8OUSItvEpIRkK4PyQlzSqfusqjh4N6ATS+hop395
         1GA3rpJyf5uGMTPOvPS4ROALvz2MZPK/mysZphYBbnd3/0euAyTVpjWYjV074ziCG+/4
         g3oUdzkELGrZjUm1dv3Vhkty+Sllo/6NYtRwFQIrapLjjddTtJ+504A/sOZEG3/eofsy
         kSNZy6cuNHm+vh32ipGKowFAG2tcCrytTltW1vZl627JdYQP9HRWAUDjDm9ZgGe3buge
         qOWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbghS/n+IHR/Gv6kSgO1fpXCfkNi8+8T8osk+Z+c7SB5fnHk+ed+x7bBdkjJKiArpmRrVHOhDfaIKXkqmzCg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuwktUUr/VDvkKCcInuQyLvQ/qrhpxkAh88IHFyvId2O5kNwdB
	Mukx5Trz1uq234FlCjpKMS3OU3wkNG2eFEmM/N+bSmJRksbfhDuAiv/fSLdRLuXVxoY=
X-Gm-Gg: AZuq6aIntry6HFRPQdNogyWeUSO8BQ4vm/NX0kHPka5GklHfF4dhZrKd14eivDHcnIA
	D+zToEPWn8RAb8zXPjBx1YBYn5oN1gsBc2GkoUPMGeEgNJ8efv4zlCx1O5yJND+bjmfTFZ0JONy
	vzACjxO0PEjFVNOoy88EoWsCU+8A4sDh9QA214uZ4ZzK/5QGs3XU/LbgXa2lPeTsQ/uzzdtwnEI
	9kAYgTCnMMs5/u4R+CXZr7o4qi3DDa4hW3Zc12yXHrfZsyFbux+UsVslJN1yJ/MzYBPlO+4jbkm
	BNjYs9WoStqeB/TojTeTRHENP/B7vo7JbyX2dIC0SPiUURxWFCr5as9aDCE3N0PzXVYiIt7OxZS
	kGTUjZbdcg/Co2gKrmMa0Zr+LLjbArU3TrUoUtiIzlc9aAFXwjQWSgwhbsvNLL2aJuq4h78zfNq
	0wB/i1PEdJ9s+CXwdjJRl0DsEhYdSws0W83OXpcFoLRe4w6GX1IJkAheyN5zs0
X-Received: by 2002:a05:6830:6584:b0:7cf:e41d:f0b0 with SMTP id 46e09a7af769-7d1a5341a34mr6832027a34.18.1770052832041;
        Mon, 02 Feb 2026 09:20:32 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:3695:6954:27c2:42ef? ([2600:8803:e7e4:500:3695:6954:27c2:42ef])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d18c7ffcc7sm10907066a34.23.2026.02.02.09.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 09:20:31 -0800 (PST)
Message-ID: <25bc9ae2-5c27-407a-aae4-6c619367664a@baylibre.com>
Date: Mon, 2 Feb 2026 11:20:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8365: Describe infracfg-nao
 as a pure syscon
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
 <20250502-mt8365-infracfg-nao-compatible-v1-2-e40394573f98@collabora.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250502-mt8365-infracfg-nao-compatible-v1-2-e40394573f98@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_092033_274087_71CE5393 
X-CRM114-Status: GOOD (  23.32  )
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

On 5/2/25 11:43 AM, Nícolas F. R. A. Prado wrote:
> The infracfg-nao register space at 0x1020e000 has different registers
> than the infracfg space at 0x10001000, and most importantly, doesn't
> contain any clock controls. Therefore it shouldn't use the same
> compatible used for the mt8365 infracfg clocks driver:
> mediatek,mt8365-infracfg. Since it currently does, probe errors are
> reported in the kernel logs:
> 
>   [    0.245959] Failed to register clk ifr_pmic_tmr: -EEXIST
>   [    0.245998] clk-mt8365 1020e000.infracfg: probe with driver clk-mt8365 failed with error -17
> 
> This register space is used only as a syscon for bus control by the
> power domain controller, so in order to properly describe it and fix the
> errors, set its compatible to a distinct compatible used exclusively as
> a syscon, drop the clock-cells, and while at it rename the node to
> 'syscon' following the naming convention.
> 
> Fixes: 6ff945376556 ("arm64: dts: mediatek: Initial mt8365-evk support")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index e6d2b3221a3b7a855129258b379ae4bc2fd05449..49ad4dee9c4cf563743dc55d5e0b055cfb69986a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -495,10 +495,9 @@ iommu: iommu@10205000 {
>  			#iommu-cells = <1>;
>  		};
>  
> -		infracfg_nao: infracfg@1020e000 {
> -			compatible = "mediatek,mt8365-infracfg", "syscon";
> +		infracfg_nao: syscon@1020e000 {
> +			compatible = "mediatek,mt8365-infracfg-nao", "syscon";
>  			reg = <0 0x1020e000 0 0x1000>;
> -			#clock-cells = <1>;
>  		};
>  
>  		rng: rng@1020f000 {
> 

Reviewed-by: David Lechner <dlechner@baylibre.com>

It looks like this never got picked up. I noticed this was a problem in U-Boot
because it was registering this as a clock provider. And I sent a similar patch
[1] recently that has also not been acted on yet. I prefer this patch since it
also fixes the node name to use a standard name. Who should be responsible for
actually picking up the patch?

[1]: https://lore.kernel.org/linux-mediatek/20251216-mtk-fix-infracfg_nao-compatibile-v1-1-d339b151ac81@baylibre.com/


