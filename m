Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B66BEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 08:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGkAyY8X81UfW+Q+1Xjcx1FjSslng/Yp1V9DoGWXvVk=; b=AIlUU1/fjJSEmKrsVSORM9SAfB
	nvujFx5CZX89F325yJFUvj4kegqtxr86H5T7w4sxopQgfbFuSV9a5z+dDJ8CGAqBLXdfo/HJA3U6u
	YT0O6yaS5m/nBAnxr2eNJ0WSv9iM9HEUPGJCvZIQWZ8KFE1DS6kIrxg87ifcEBk2rGH66ppOhOAJu
	2XhA9YoKfjPeQtGhGO7yV+7NQpO74LtXvKsOvBO/vL6CwI9IM3TQXDuoLZ491O+z7k880bCcUS6Vj
	tXP0FNfNFRTqA316pUJJAPqVrSh2JyV41aLrNizWodmTERD0lCJmmUOMVfoDnyWG940cQaYGWkR0z
	eLGPRQIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxXf-00F9MX-0Q;
	Wed, 05 Jul 2023 08:07:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxXb-00F9IF-05;
	Wed, 05 Jul 2023 08:07:12 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A4E66606FAB;
	Wed,  5 Jul 2023 09:07:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688544423;
	bh=HzEPqtQdkHcMDXqsi87KYzHjHJ+6zKcJherW9BF/ljQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h7A4QOraU/u5oUyt9/KFqEDOQBWIHvzhlh75jpyLxh9/Vxx2oeSMH8KqZPzURStzp
	 PoNlr8LOVYyKpja7XnbMl26bExT1Y3m//cCTZH/u03oF6MeuFA2GtQI7JeFZaJfrdV
	 U+8HvjrLdifCqPL1qM3iRW1crIG57JuKAq4yjHs+kFjRoGq3bqNwz7TKIldsBPuEQN
	 ib4lJNVROtbDV1ySUBeQ3PNKJofN7//K9xjAAdpr8m0gCppMI8Tmo6V8r5Sqia2Y8L
	 8oDRNTLtIANAj1uOfduNsjgkrzckQ1R5SqmqwPfjO1ojgRVPQrE1pAeWq7JNwkDwsa
	 QeQNzSRX6wsdA==
Message-ID: <2742ada7-b7ad-b51f-0de6-bf0ba37d51e4@collabora.com>
Date: Wed, 5 Jul 2023 10:07:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] dt-bindings: arm: Add compatible for MediaTek MT8188
Content-Language: en-US
To: Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?=
 <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230705065744.25848-1-jason-ch.chen@mediatek.com>
 <20230705065744.25848-2-jason-ch.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230705065744.25848-2-jason-ch.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_010711_195255_33DCE20E 
X-CRM114-Status: GOOD (  13.66  )
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

Il 05/07/23 08:57, Jason-ch Chen ha scritto:
> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
> 
> This commit adds dt-binding documentation for the MediaTek MT8188
> reference board.
> 
> Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index ae12b1cab9fb..4f4910d7a1e9 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -163,6 +163,10 @@ properties:
>             - enum:
>                 - mediatek,mt8186-evb
>             - const: mediatek,mt8186
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-evb
> +          - const: mediatek,mt8188
>         - items:
>             - enum:
>                 - mediatek,mt8192-evb


