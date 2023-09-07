Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B860EE14D3
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 08:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40Q52oR8Wtpzs5GSeHTErlcH6ivPbx6DwyAe/iaE0fQ=; b=tZcxg6awGZ7vnHnlcvLfZ0j32i
	5zAIy2bRqYLSgE9dId6pFacXd5A62rvscy6oJkqwwKLJiFLr/HP4AYg6Hkx10LVZrw5BsoUgOJhps
	rXTHcTnU49SKv7uhJowk0blDQ+ZI06SKfDnEAbIywDKEQnWwrZxlGEsV3Mp7d5v4/FRe0wAgKyscO
	C+F8hCM1TTXXTtXgPxUOHAU4imHwpRhWN0YQ33+Ju1eOF2JlOqgDGW2GAIYulH6gWDiRb6lq56lFd
	IUEtC8u/UpT7pzZOqI2qlZmNEpEmHRrx8U7Ht+zlRsXd8N05TzLC0oqM/Pf6hjPJnhVAuwaCOLl2+
	IJkwYV3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAOv-00Bao6-2s;
	Thu, 07 Sep 2023 08:30:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAOs-00Band-26;
	Thu, 07 Sep 2023 08:30:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D181E66072E3;
	Thu,  7 Sep 2023 09:30:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694075405;
	bh=EdQ9ASI8+iF8t5u8HGmRUqDa9g/nGIlcPEp4NR/29MA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cfkdhopb2O4/2hTFhZZuemvDZx5NWOEZ/XtEtWECmev2t3Ss2FaIJXXLASntsQXFX
	 gs/GQP6qP8CUdiGz+DdX/PpKOJ2OoTVPqq8lBysVuruhA68lkhBxNGHupKvbUDT6wD
	 /2feRHQ0EJRHs49z+kigbY1kwR+KEJA43JM3dSueXYX+uBn7DYQMeVJb4VoUg8ifup
	 7shMyDx2ny1PDi3Yoxh+GiFEUyvUB6HYDEZGcKfFTRpvI/UUN1nNI+v5+lcArOjSc+
	 s0NkDt2WFsJQu4z0C2zz4u+/qF1wUPdz4BkFE+F39lCmwql+fg3jCeST2RmpQ8lU2h
	 MromValbfAwAQ==
Message-ID: <0470ab6d-7bf9-8c21-6e34-19b4f9023f10@collabora.com>
Date: Thu, 7 Sep 2023 10:30:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt7622: fix memory node warning
 check
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 matthias.bgg@gmail.com, kernel@collabora.com
References: <20230814065042.4973-1-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230814065042.4973-1-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_013006_865721_09D50DA7 
X-CRM114-Status: GOOD (  15.27  )
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

Il 14/08/23 08:50, Eugen Hristev ha scritto:
> dtbs_check throws a warning at the memory node:
> Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
> 
> fix by adding the address into the node name.
> 
> Fixes: 0b6286dd96c0 ("arm64: dts: mt7622: add bananapi BPI-R64 board")
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 2 +-
>   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> index e4605d23fdc8..8220a4fd6319 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> @@ -73,7 +73,7 @@ led-1 {
>   		};
>   	};
>   
> -	memory {
> +	memory@40000000 {
>   		reg = <0 0x40000000 0 0x40000000>;
>   	};
>   
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> index dad8e683aac5..c435984ca767 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> @@ -55,7 +55,7 @@ key-wps {
>   		};
>   	};
>   
> -	memory {
> +	memory@40000000 {
>   		reg = <0 0x40000000 0 0x20000000>;
>   	};
>   



