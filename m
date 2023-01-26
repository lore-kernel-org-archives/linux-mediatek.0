Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8D5C05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhouNw3IZj+0qfRSizZm4RYM+Wc2mkA2I42ElWlMfk0=; b=yHVC0hL7wdvt12DKfdlLIolTFK
	8cH1Pc0Z43sR/bxHvi7E48qtmUEsLWZDzEMYAP7MWdCb772+9M3hVGv61mqQGSyUUbAK9PEXAwm5K
	VVV9ty8qEtiKiuJ49LoaGhOy+AufAPVfD71BE9Otmbu+6z9ckU632aFMF4XbATJlFTpS5MpzbkjLb
	c5/MiwWOaF2xzM2p3MOvFSKEYYfv/HZsOqBYzrEuwZO4H9/Eks7FpYQNzX9Z+cdsvB0jBbkImQoWj
	HzG+eOrthPcH0wOBixJlTqhaNhm0i0F+3fsZOJR8BBX1CzrgjdfQnblbV8zJw97vb7U7MQXlctRAP
	E1ZYzyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4Gp-00BYKb-4k; Thu, 26 Jan 2023 15:34:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4G7-00BXy6-8d; Thu, 26 Jan 2023 15:33:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7C93C66018E4;
	Thu, 26 Jan 2023 15:33:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674747227;
	bh=VnYSm26lDjICpca46d2eb6U+0j18mBaNjiTo5MgOy4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=atQpLK2zMnpEBIfIlflQpObHLU42AH/Wn7iusq6aqTlmUu6cjjl0IBEV0aHmiN4Ep
	 gY5FCtFYMbjCNjQO7zrslGyQO2lROC7eAcVcR3BJWrioq06mkW6g0HTQQPZ6SrzAPB
	 KfYOOAMv5T01Ka+CIoHXVv7irJ80exyDOO+fx4Sub/L1DJRzD7/UcdlXLdLZ4jROBj
	 SaITmcxYb7AkeqoBcUYewXXq86LcP3HulhJ9C3OjWfDFlWt1Q7a9/U+yy/EAJs3hfx
	 kBlrtDH+HxXDZ97dP8m62frujitf9Q4v8Tp5SezPWGD4tPkkgY/i2iqjqNy1xdq7Wd
	 XL/kC3G3gthyw==
Message-ID: <07eb3c04-c365-4ab2-7137-5fb37e4505c3@collabora.com>
Date: Thu, 26 Jan 2023 16:33:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: mediatek,mt8186-fhctl: Support
 MT6795, MT8173/92/95
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, sboyd@kernel.org
Cc: mturquette@baylibre.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 edward-jw.yang@mediatek.com, johnson.wang@mediatek.com, wenst@chromium.org,
 miles.chen@mediatek.com, chun-jie.chen@mediatek.com,
 rex-bc.chen@mediatek.com, jose.exposito89@gmail.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20230126085321.87267-1-angelogioacchino.delregno@collabora.com>
 <20230126085321.87267-3-angelogioacchino.delregno@collabora.com>
 <4bcf8191-fe6a-7229-9ebe-a79cebdce87e@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <4bcf8191-fe6a-7229-9ebe-a79cebdce87e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_073351_577384_BCE5A3BF 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

Il 26/01/23 16:32, Krzysztof Kozlowski ha scritto:
> On 26/01/2023 09:53, AngeloGioacchino Del Regno wrote:
>> MT6795, MT8173, MT8192 and MT8195 support Frequency Hopping: add the
>> compatibles for them.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
> 
> ... but you already had here an ack.
> 

Honest thanks for that. I'm sorry for missing it.

Regards,
Angelo

> Best regards,
> Krzysztof
> 
> 


