Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF05C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 11:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4VXbJEHeIKsxV2etXdXC9p74o9+DjjUHAD3709lTso=; b=X9zApGR3MvJc3xUW7N25Ujkb59
	i6eXSiFzNDW0yXcaXWlKtOfA9bKnuxSYHptIUuax8W4xdln/t3sOh1oJdt4+C2w7OOOoYTHqXWXTY
	RyR9Txjy4eqTyEyof/ZcemUVUTUePMjzin1gB8fWszFL9LWJzcx1Z6urNEadmA+jBjNNghauVGT63
	zS/MoaGcvO+AlyWfngYThUm8tdukMV+HJjkfcb7ZA6PN3UE9qqdHYIzbNPmyHDq9dbqx3DvabuMhp
	5sUmTFfkyVFHoJst38fIIlp90I6iUL1qrO5RTVQZkTprTkoL63v9ymJsLauWIQG38uvANkT5agG5N
	8dnsocqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68q6-00ESjY-Ra; Fri, 16 Dec 2022 11:25:18 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68pV-00ESSi-KM; Fri, 16 Dec 2022 11:24:42 +0000
Received: by mail-wr1-x435.google.com with SMTP id h12so2145523wrv.10;
        Fri, 16 Dec 2022 03:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W4VXbJEHeIKsxV2etXdXC9p74o9+DjjUHAD3709lTso=;
        b=K7M2M+rnek8TsNzxL6ToBmEA11M3fhHINdOlnI8lFu9ZTErErwxUfXbk6k5Ru80qU/
         D1Bjj+o9ySUzVezoLXlPciNiRhHChqvHdsy3ebTncTSyHLabX3D7Z6umY+rUgKpQOOxD
         Ei8ppSoC9lUsLBZzMcNRnEDN5mZiljHqzIf0Ca4KMmSJ6nEzVI4OTZPmqo34JY+OtJvb
         jE3irjg6TltoO32Eh0HzMQ8lJgSlsZuHHkNG5+Ihumc1vXAxBjti52GmDjMktNR5H4AX
         exPGX0JFUGeEkbzhgehWpqzQMVo59nt7TzCx5ycRclXgeHlJyOoyEU5rxiVSu/2TrKZJ
         icNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W4VXbJEHeIKsxV2etXdXC9p74o9+DjjUHAD3709lTso=;
        b=H9+UiFktqhfzehYV7UK1Hvd+LgSNPzYTvtg+u3CAgK0eRf4xAwBArPTu+EEoWQgvNA
         4nUFJaneMh/q4plyqfYlSlnWBkAM+VYAgasRUbveaRLEpd9PVCYwGlHva3fGFC5crq2I
         U5fJJrhbYYcc2BAmpWqXUOl3ehSLKwba4tWYdmXBU1HfGaXy6EEjcoBrnzwFoCfOSdpC
         SlR4KwbvI46o/S9Jal27RpHDeHOQZlzIuaBTolDxGT63QFX0B3kBMNH8VW8QsRJVadtE
         xPuoZUZRHRdUJUjFTDqQLJrGgD/g4Fh5ePb9d28CCcDTLIi4le7XA+9yNQVMTUxapDFI
         0buw==
X-Gm-Message-State: ANoB5pn5CbJAdqrSG+1ljvuzgVvtWtdFwEEFrG4T3zWbwHgiT6c2ih9j
	b5zRwUO3UwAVmjeKJtCYJII=
X-Google-Smtp-Source: AA0mqf4SMH1j0IY24v9NVD4Fb4t/t5rk7U6fmdMg4y7MdplN62WS3Wir4dKDp2SDEt0uAZBmKOwwpA==
X-Received: by 2002:adf:f145:0:b0:242:486:5037 with SMTP id y5-20020adff145000000b0024204865037mr20176287wro.32.1671189879020;
        Fri, 16 Dec 2022 03:24:39 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l17-20020a5d5611000000b002424b695f7esm1998289wrv.46.2022.12.16.03.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:24:38 -0800 (PST)
Message-ID: <fb69f5da-1ea8-a0f3-1c3f-8269ad693f4e@gmail.com>
Date: Fri, 16 Dec 2022 12:24:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 8/9] arm/arm64: dts: mediatek: Fix existing NAND
 controller node name
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221209064317.2828-1-xiangsheng.hou@mediatek.com>
 <20221209064317.2828-9-xiangsheng.hou@mediatek.com>
 <3729df62-8d39-db47-0b57-2bef37cc5830@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <3729df62-8d39-db47-0b57-2bef37cc5830@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_032441_704708_70D09E0A 
X-CRM114-Status: GOOD (  12.58  )
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



On 13/12/2022 10:42, AngeloGioacchino Del Regno wrote:
> Il 09/12/22 07:43, Xiangsheng Hou ha scritto:
>> Change the existing node name in order to match NAND controller DT
>> bindings.
>>
>> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
>> ---
>>   arch/arm/boot/dts/mt2701.dtsi             | 2 +-
>>   arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 2 +-
>>   arch/arm64/boot/dts/mediatek/mt7622.dtsi  | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>
> 
> Splitting this in two commits, one for ARM and one for ARM64 would probably
> be better, but since I don't have strong opinions on that...

Yes please split this up.

Thanks!

> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> 

