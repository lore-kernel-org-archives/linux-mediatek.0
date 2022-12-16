Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82C7C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 11:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAWXZ5dwyU4nYzKu6dG0EcB7QJGqDFnb5rKrT6m3dlQ=; b=O24lKh2ar6th9VEXkStEm/eBpB
	BKC86ksx7CAuX3OLSlI0rjiLUpHO/WrMClqxLxrls2631PBJazMzoPrvQ1HSiyiJPPug16JSTLBrN
	IWHA5kGksoh8qFT/UMeVuyiVldiYMvqbtWvlD3F54IJnSKkNGV2CIL/VyaUm9zGedDvQibrDFCO2P
	24k4NIgfD8Jf+ADXMjD13RBT2WdgdXXDwOLgDENeBeH2mfilKP0eOo3i4HyEN2zCxNd3c4wR0EIvj
	/qJa4t094P7K0cMXUE+aXhNjAkRmSXPpGkCjxW9WBx3PFvqE0VGKUEKtALNa+YNNWQHS9eP5/Hk4E
	9W3PdC0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68p7-00ESGc-Q9; Fri, 16 Dec 2022 11:24:17 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68om-00ES38-T9; Fri, 16 Dec 2022 11:23:58 +0000
Received: by mail-wr1-x434.google.com with SMTP id co23so2178490wrb.4;
        Fri, 16 Dec 2022 03:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VAWXZ5dwyU4nYzKu6dG0EcB7QJGqDFnb5rKrT6m3dlQ=;
        b=YIIoVlfk6+N9Dbv6UCADP+/Bd66InxDSiBgDL/pp4oE2qCfDcfYSu69isft+voaHrE
         Ywpy6B2xaM3+ri25Rvxc6rNCqM/je85KxvHRRDR73dNAlcS9UyFF9AQekXDYCn33UpMA
         G0RHJkKnoZjmsBoUn0h0n/UZNvW8+rXW9kxCknJiLigfPguCoRPvv2inPOGJuSp8EeqH
         kirpg1188XOrFMgC1+dg9pEY1RkQ3YeCQleVpuJuwZsqyut5k4aKqO0bv789stxc+IHP
         89CUQ46QffrANtTdFgQ6nbWJ1lKAFiSZjinsKgDF3jjVx54Z/l5o8V/y5ExMl+GN+rSt
         9wzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VAWXZ5dwyU4nYzKu6dG0EcB7QJGqDFnb5rKrT6m3dlQ=;
        b=RgmwKtTVF69pdPuN6YfjzJKvSPrEJoxGB3hPK6qkIS7wUoApqVQbq6+45enOXC45+i
         uYz03O5NSUMuwQTqj/CiIwzI3fzdBiPpsNx6s+xGPq8RDShH4UUi2CmJSxukZJVISlmC
         kknmWKh3Uc1urrRrOZzi6P0dqBl+pm8KN6GtAVIFXTMkHS5lepLMa+TpeVI2h8IQBHsN
         UzjOLay6RE2FOZUk8i/0stiM6waevgj1rH8HiQDYVKmHbh5Az0i0isofDWeyh1BGkRqn
         PSvbjZe0k8lKJR+FPmDN7feukRLfDDk7y8D5s3Xyx0aoPWkJeQOv+29HQ7Z0twIjLAMQ
         wFjg==
X-Gm-Message-State: ANoB5pkUzPreyPCZPUxadqvZvHO+Y4uMJRrKhR3Bp1T6fTQAJmQrylD/
	tpT3uiYOfLB5qTBHkhoS24k=
X-Google-Smtp-Source: AA0mqf48S1sZqP77x7fQ3pVk52VBeYECSdS87vyjHpCEQNGm5ug0+c7NB5eA1qSwlxtF3t3FplvarQ==
X-Received: by 2002:a5d:4242:0:b0:242:5ed6:a09f with SMTP id s2-20020a5d4242000000b002425ed6a09fmr19661776wrr.44.1671189822253;
        Fri, 16 Dec 2022 03:23:42 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id f4-20020a5d58e4000000b002425be3c9e2sm1985229wrd.60.2022.12.16.03.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:23:41 -0800 (PST)
Message-ID: <bfdb30b7-8540-15e9-678c-3bf0541425b4@gmail.com>
Date: Fri, 16 Dec 2022 12:23:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 01/10] arm64: dts: mt8183: Fix Mali GPU clock
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, wenst@chromium.org,
 miles.chen@mediatek.com, rex-bc.chen@mediatek.com, nfraprado@collabora.com,
 chun-jie.chen@mediatek.com, jose.exposito89@gmail.com,
 drinkcat@chromium.org, weiyi.lu@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220927101128.44758-1-angelogioacchino.delregno@collabora.com>
 <20220927101128.44758-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220927101128.44758-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_032356_984517_86A524E1 
X-CRM114-Status: GOOD (  17.39  )
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



On 27/09/2022 12:11, AngeloGioacchino Del Regno wrote:
> From: Chen-Yu Tsai <wenst@chromium.org>
> 
> The actual clock feeding into the Mali GPU on the MT8183 is from the
> clock gate in the MFGCFG block, not CLK_TOP_MFGPLL_CK from the TOPCKGEN
> block, which itself is simply a pass-through placeholder for the MFGPLL
> in the APMIXEDSYS block.
> 
> Fix the hardware description with the correct clock reference.
> 
> Fixes: a8168cebf1bc ("arm64: dts: mt8183: Add node for the Mali GPU")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Both patches applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index a70b669c49ba..402136bfd535 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1678,7 +1678,7 @@ gpu: gpu@13040000 {
>   				<GIC_SPI 278 IRQ_TYPE_LEVEL_LOW>;
>   			interrupt-names = "job", "mmu", "gpu";
>   
> -			clocks = <&topckgen CLK_TOP_MFGPLL_CK>;
> +			clocks = <&mfgcfg CLK_MFG_BG3D>;
>   
>   			power-domains =
>   				<&spm MT8183_POWER_DOMAIN_MFG_CORE0>,

