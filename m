Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A21C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 13:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXjpXLe9mgiApgIbTmRMbphiVnCRik02qaboGCfPONQ=; b=UG5/xX7zh6oozLdz0jQUzPLX4b
	e0YT2Bz75EzogGS12oNxqZxNuQvLjxAWbCR87hDk5Iy++d++Y6NXU3gcXHbwrwFGgWMtnSDzkm46Y
	SsLFZ64qbAr+H96FgTHEAaMhwzMjlj2xxxUM8rj4VYgBMDIZOcmMo8O+6mQ4XBnhf7G0pwV2YyDWu
	YjT16V2pQSnlN/tMY21Oo9Gn4IX+/hpghlpgk/quuXezbpLySH9G4KBsuZuDkv0rdGL11gTZlgIc3
	HyXZtts8a4yA2jtaVEYrg7kDQ0628Ib7yEHphZOExT7zZtalcPCf2UKiDav5vElWBJal34UkzlSjj
	cLtKHlAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7yt3-00ExK5-AM; Wed, 21 Dec 2022 13:11:57 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7yqn-00EwJA-PU; Wed, 21 Dec 2022 13:09:41 +0000
Received: by mail-wr1-x433.google.com with SMTP id m14so14860785wrh.7;
        Wed, 21 Dec 2022 05:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXjpXLe9mgiApgIbTmRMbphiVnCRik02qaboGCfPONQ=;
        b=M7178wDTVfuF1NioRuQyTx5mcAuQtYNPlvTKzXMfRbtojUvkbjYVuMBJOYcMBKcwDs
         wkRevUabFeyaKAPghZinbZqelErbpnOIXkqqSFGtw+o88FJm6JWuLDk0Gng//EZHgzrA
         Zkrl0cR4G9LPbVmuojoU3EOjV91BkpCHmub59lPCpKrzSiOQrlLMGRrxxKM4bMhMFYsq
         cmViJyryZRwl2Pd4ZNdl0c6PlBT3ArVs1pGY3nlTll30ctSejlbR9QZ8duwcXalw8Pgq
         UB9u7VowEnlfB9hUhnEuAgXoASTyQEEJo1HX+0oJCXPZStgx6iVmdZ/blXx1h4K9ui4U
         3tGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXjpXLe9mgiApgIbTmRMbphiVnCRik02qaboGCfPONQ=;
        b=BOkaWh6JrmHGS8BgYm67wr6J7NkMUf+Q0ldOWkfGex4O01a23bae1jyDHGAHwCzfCS
         K8vveEXa1kc6TLC/2Mv0m9g/rTI7AjgEdt4iaa7RU2wwB6PEtfDZf60+HPKm3QhbgcJC
         jEu4mMSyBuOfe1alU9Yrv/vyld5eKHsBHhisv1thvfqNHDhCeHF9JLZSRbV6cFSfN7yr
         pBeVqLado8GkFLet+gcQyz2GA0ILwWK7PE1dVQ1nTi6RnTtWHPFpOqAOP6plX1sjwBdU
         mbR5AjGeqg81w9QAnu3v0R3gwTBEBf/f3KpJMxBEDiUqMoSZ4m1nKfp27zyL5NTqSQae
         yLQA==
X-Gm-Message-State: AFqh2kp2VU4gBOnJUx8D66fZ306aM66sW/YHFXzkvzwy0RV4RiloJdQ/
	49W9u1DBmJJNb3thDQOO1LI=
X-Google-Smtp-Source: AMrXdXt34seS76I5wKWpG0iDY/k47uo19TsAkkzErrtNF9fHlYY/F4sERUh6Vm+TsdJq+xb44K/8mg==
X-Received: by 2002:adf:ee12:0:b0:242:61ab:5973 with SMTP id y18-20020adfee12000000b0024261ab5973mr1225372wrn.11.1671628173445;
        Wed, 21 Dec 2022 05:09:33 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id d1-20020adffbc1000000b002364c77bcacsm15264996wrs.38.2022.12.21.05.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 05:09:32 -0800 (PST)
Message-ID: <6b650bcd-d063-9998-442a-3705c0654d73@gmail.com>
Date: Wed, 21 Dec 2022 14:09:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186: Add crypto support for eMMC
 controller
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20221221104856.28770-1-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221221104856.28770-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_050937_952738_09C3649F 
X-CRM114-Status: GOOD (  14.90  )
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



On 21/12/2022 11:48, Allen-KH Cheng wrote:
> For crypto support, add a crypto clock of the inline crypto engine and
> expand the register size in the eMMC controller.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index c326aeb33a10..88b6191e1aa0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -662,12 +662,13 @@
>   		mmc0: mmc@11230000 {
>   			compatible = "mediatek,mt8186-mmc",
>   				     "mediatek,mt8183-mmc";
> -			reg = <0 0x11230000 0 0x1000>,
> +			reg = <0 0x11230000 0 0x10000>,
>   			      <0 0x11cd0000 0 0x1000>;
>   			clocks = <&topckgen CLK_TOP_MSDC50_0>,
>   				 <&infracfg_ao CLK_INFRA_AO_MSDC0>,
> -				 <&infracfg_ao CLK_INFRA_AO_MSDC0_SRC>;
> -			clock-names = "source", "hclk", "source_cg";
> +				 <&infracfg_ao CLK_INFRA_AO_MSDC0_SRC>,
> +				 <&infracfg_ao CLK_INFRA_AO_MSDCFDE>;
> +			clock-names = "source", "hclk", "source_cg", "crypto";
>   			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH 0>;
>   			assigned-clocks = <&topckgen CLK_TOP_MSDC50_0>;
>   			assigned-clock-parents = <&apmixedsys CLK_APMIXED_MSDCPLL>;

