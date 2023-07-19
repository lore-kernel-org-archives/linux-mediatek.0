Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E86EEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 07:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1F6spgT01cJPBCB3Tn0je0IXcdxHMOvG9t8sThgywzE=; b=ljBVi4o0MUqPHGMperJbbdegBF
	N+oYEgRw+HPw3z7lv/zHLpaNH1gS7n0OmgGMShtB54r6TTgAsuo6tBH4yZ4mHUrlFARgpdT6/uMaC
	ypMQc3eFzRVKKML8fuW2ULUeHbgVwBEVBxf3moL0x+gCKgSeHoaz1Vzehp8M/+2Wfr7yWiw6BS/C2
	aZtPqSjoFHbRyN3YgQt8/sC7iV+A4EJMD7VhWVcvi+3yywJ7vKDO4bUyqJEhmW8k7htzPpWdK7Dsz
	boi62T97dpV0hKFQXNzWpF/32CExwP9vXWJPiX72OLA8ceMZ7mUl58Y5huGVMiE0DqvQEF5HjrawR
	Gn66QMZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1Ps-0063jY-2O;
	Wed, 19 Jul 2023 07:16:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1Pf-0063cv-2U;
	Wed, 19 Jul 2023 07:15:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C08E56606F57;
	Wed, 19 Jul 2023 08:15:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689750954;
	bh=iewCcJUfElKKyjKf+NtkxBXYK+aTi5ddhmCEGbtXwRo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CM02QOPvcLxFcvDvKyuF+x7VBYLxDtdnZm3Em+Bksi1sPDcNkt/XxQZ4hiJR7jRqy
	 TkKx+HXvjGq/V1CIeYfoyQbKbAe57STrM6IeCXHpu45xzhJRic4prMgktjJewSYRTa
	 LKMOS2vo8jeQby3ka1XLMt/D004KpXLXiBrFEmnvr9gBiv8KlM0U9e48FmLJlTHAOL
	 DrcgsmaS7mbINDeUziq/ecF1pL0HkU2u5VS+76uzig/1Pf007F4ndac0eajmEj9M1i
	 3pV66jrFxzVUYxUxoYrCCQYMz723TP8lVwRF8s+/wnm3RpVlo0Oush32HclBZ+iFSr
	 L6tkPq7uOnayw==
Message-ID: <ae40d54a-1599-a954-b18f-263196766a2d@collabora.com>
Date: Wed, 19 Jul 2023 09:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 3/4] dt-bindings: soc: mediatek: pwrap: Modify
 compatible for MT8188
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
References: <20230718110947.13426-1-jason-ch.chen@mediatek.com>
 <20230718110947.13426-4-jason-ch.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230718110947.13426-4-jason-ch.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_001555_937967_2620FA46 
X-CRM114-Status: GOOD (  18.01  )
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

Il 18/07/23 13:09, Jason-ch Chen ha scritto:
> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
> 
> The reason for changing the patch was that while MT8188 uses the same
> pwrap as MT8195, the original code was only applicable to 'compatible =
> "mediatek,mt8188-pwrap"'. To resolve the DTBS check warning that
> '['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too
> long', it is necessary to modify the code.
> 
> Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>

The original binding allowed only "mediatek,mt8188-pwrap", while we need
to specify

compatible = "mediatek,mt8188-pwrap", "mediatek,mt8195-pwrap", "syscon";

for this node, as MT8188's PWRAP is fully compatible with MT8195 as it is
the very same IP, hence:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Regards,
Angelo

> ---
>   .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml    | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> index a06ac2177444..4737e5f45d54 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> @@ -41,7 +41,6 @@ properties:
>                 - mediatek,mt8173-pwrap
>                 - mediatek,mt8183-pwrap
>                 - mediatek,mt8186-pwrap
> -              - mediatek,mt8188-pwrap
>                 - mediatek,mt8195-pwrap
>                 - mediatek,mt8365-pwrap
>                 - mediatek,mt8516-pwrap
> @@ -50,6 +49,11 @@ properties:
>                 - mediatek,mt8186-pwrap
>                 - mediatek,mt8195-pwrap
>             - const: syscon
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-pwrap
> +          - const: mediatek,mt8195-pwrap
> +          - const: syscon
>   
>     reg:
>       minItems: 1



