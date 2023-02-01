Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F5EC636D3
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 10:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LinfPfwdc69r+5MS9+W8GWtbQTG5CSXHZBHVy7HHbcc=; b=xTr7sexBYEzekZfXmYwjQT5ccr
	V7RPRyGoxzQ3OKEWiob1BdCkdCM7qAz8eHBcghFS9dQYmVz9OJNmKtjXMIITrU8Gyr1Ned0nhdftI
	RrCjf+6JtU58LqUo0FNDs33UJs+2U9np3L2u66J2s1BqkT+VoFR8YC6Y/jVrWWdjPFk9iFlc+UXTV
	l6Ni1/CV9ROrhdxDUYzNAcHMGZ2/hPVd3XBtTWJFsLhcjAyP7ep0yDR5rnsRHbb+rJu8OPvv3pvKC
	DghabD+hD1SlP4IXGdihO1CBI+Maeww0X32v3Uh/TKS4AsG5/S58aSsWJILWVjwF3VCDmfgFc9u1i
	nEP8+40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNAnk-00BMh6-UM; Wed, 01 Feb 2023 10:57:16 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNAnX-00BMYv-Pl; Wed, 01 Feb 2023 10:57:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso1079135wms.4;
        Wed, 01 Feb 2023 02:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LinfPfwdc69r+5MS9+W8GWtbQTG5CSXHZBHVy7HHbcc=;
        b=d9PgESiUcaaRDq+WJ3qIgUQfDcb66ZTE97cDw7SP6ZgJ3dD3SeK72xuDAnSYhmTgnq
         /wpB10A26l+EJ3cf+WDXXjHtkOZQX+0iGr4nLsuWOH6fZ3ADULkg0w6ayIs+izB5KSi3
         BilQgqt1RChReSbl/E+QB82h9uyKf+ipLBKu2aLDxw1DHdtsRaKE6d9prSeFiURA7Sds
         UpTOPVYZicbDAuMSU2Ajfb77KnWRDP3xSOClB6BFn7p2uYWGHRq8sf2qLel5NtGxWeRV
         1Vpiht2CFIr3Y0u6shqlmXHt0q7gl47P+Hfu4euynXC9rExcBXgf1ooc3cr52Ta87HJ0
         3F/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LinfPfwdc69r+5MS9+W8GWtbQTG5CSXHZBHVy7HHbcc=;
        b=fdukEhgCCIHzl1gKb4jgczt8hUybrZeEid4zT74W2nM673kawHPLwOUKOP03I1CRW5
         0TqtPygkNlhIxKfBhlrwKe/UAIfUYF7p6yBP+zBPKcuGkiSD9/rquiZ9r92/HZ2KOYID
         tIzEV0qGn0xBdZvEGbvYRkKZK2uy+Da8qeegEYHyx9nMm+PRxfGdE11HaGpIbQdBYNKH
         ozUDY8QUEvFK9VigXCzJY8DH/eA2mmab4mjWIAEkd+FJ75cN+xFXbsO0x5RocslyUATC
         TDduAWteT4pKPHHP6cgNWcGXsE1m3yOV0dkokLyfNSeINqoDKTqg/YN/kUSQF0rLdT32
         0PTA==
X-Gm-Message-State: AO0yUKUQnTnRwXVlhWdHvPn7WCd5MNY0bUXtAebbuM3bfTnQJ91bbGON
	FMDFSG0EHibi/dZ62tHlQ3c=
X-Google-Smtp-Source: AK7set/YIe/I+C+MEjw/u4XskuAdX7Srwo/ASJLfYgnYv2wbXKrk75N0foIaGyXaEO3k+QVkOVLCEQ==
X-Received: by 2002:a05:600c:601b:b0:3dc:557f:6129 with SMTP id az27-20020a05600c601b00b003dc557f6129mr1566953wmb.2.1675249016755;
        Wed, 01 Feb 2023 02:56:56 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l16-20020a1c7910000000b003dc1d668866sm1357736wme.10.2023.02.01.02.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 02:56:56 -0800 (PST)
Message-ID: <f5e283bf-2cd2-779e-eb2d-ef36f4780153@gmail.com>
Date: Wed, 1 Feb 2023 11:56:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 1/2] arm64: dts: mediatek: mt7622: Add missing
 pwm-cells to pwm node
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 krzysztof.kozlowski+dt@linaro.org
Cc: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 robh+dt@kernel.org, john@phrozen.org, sean.wang@mediatek.com,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20221128112028.58021-1-angelogioacchino.delregno@collabora.com>
 <20221128112028.58021-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221128112028.58021-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_025703_880281_2DEEF8DD 
X-CRM114-Status: GOOD (  14.02  )
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



On 28/11/2022 12:20, AngeloGioacchino Del Regno wrote:
> Specify #pwm-cells on pwm@11006000 to make it actually usable.
> 
> Fixes: ae457b7679c4 ("arm64: dts: mt7622: add SoC and peripheral related device nodes")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt7622.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index 146e18b5b1f4..f321c6d0fd7c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -435,6 +435,7 @@ uart3: serial@11005000 {
>   	pwm: pwm@11006000 {
>   		compatible = "mediatek,mt7622-pwm";
>   		reg = <0 0x11006000 0 0x1000>;
> +		#pwm-cells = <2>;
>   		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_LOW>;
>   		clocks = <&topckgen CLK_TOP_PWM_SEL>,
>   			 <&pericfg CLK_PERI_PWM_PD>,

