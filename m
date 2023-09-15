Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C3CEE644B
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 09:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WT9d8Z3py/xusEJ10qOtfIS1jT2wzW1D4rM9KQKJOE=; b=nTWHgt3pxIZx/zXxHwLWiu/oK5
	lb2SqHmuauXoXZS8HChbb8PYnAM73nyu8DQq6MUr+NvqauqEYhckVuIwCLG/29CVcer4whBk5ud5v
	WPCbqkJyGbSbUMU9m+h6CpP/R5CHcXb2kFRGBbk0exH9FRw9qgwTpaUmJu+P6LupuL+D0ZbzdCiIN
	AMKHTFtXqIbXlpKCQCHDfxWPNyQXplSB9Nx7de9pP+urmELfW+Hxzef5hZk/cNjPjAKEOZBQwq59T
	mJ9TQTCOHrNcb16R0r6Sl4lrZjIaNExk3+HOojdpgvGUqtZIOvV0R5Rbs1kd9BKPBoG8oQ9TVx4bd
	O/6wPpWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh53Y-00AH4i-0k;
	Fri, 15 Sep 2023 09:24:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh53V-00AH3v-1A;
	Fri, 15 Sep 2023 09:24:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8E05366072F9;
	Fri, 15 Sep 2023 10:24:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694769844;
	bh=mhYU2dTqP/Di35yOWqzCvi5rnNihke8nVgNOY3LOpdU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ggH9xcwdfV/qtrkUdkW/3y6ZC05u7ljr5RP4vNL0yu8hViqfNTy7Uf39cXdk2j0MH
	 6fuLSe671hDpmswDpUiGM6ANdCBWskvlj2nXVMLZGm+YiY3tqg3U2xZ4DB9cqgsQRQ
	 Bg0FSX9hgbX5d9Uo0Eb+gKyYdpu2k4TdEkLFP35tWwtPLcWIDvtAWEhmSpeRrJONTy
	 Rmt9cF+eF19+0xzkBmXeKpHDpCwm5ZHs2kJyYGt8RuaeurBwRBD1Bly5lh50D1/Vm/
	 6n2Ld1u0Z9XGirJ3lEbguc3UL007MRXlw6bxfFP4wdNj512AOqpgHu3PRYunEe8O4G
	 8fl+S1f6pgwhw==
Message-ID: <33c8f603-fc73-7067-ed3d-6bb973d9655c@collabora.com>
Date: Fri, 15 Sep 2023 11:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1 1/2] dt-bindings: soc: mediatek: add mt8188 svs
 dt-bindings
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Mark Tseng <chun-jen.tseng@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Lu <roger.lu@mediatek.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230915075003.1552-1-chun-jen.tseng@mediatek.com>
 <20230915075003.1552-2-chun-jen.tseng@mediatek.com>
 <bf87aa29-ea42-f811-7ae9-3888336989fb@collabora.com>
In-Reply-To: <bf87aa29-ea42-f811-7ae9-3888336989fb@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_022405_521886_0346FEF2 
X-CRM114-Status: GOOD (  11.99  )
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

Il 15/09/23 11:22, AngeloGioacchino Del Regno ha scritto:
> Il 15/09/23 09:50, Mark Tseng ha scritto:
>> Add mt8188 svs compatible in dt-bindings.
>>
>> Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
> 
> This commit does not apply. Please always develop and test on upstream.
> 

Actually, I'm sorry, it's *me* checking the wrong kernel tree here.
This commit is fine.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Sorry again,
Angelo

>> ---
>>   Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml 
>> b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
>> index f21eb907ee90..7eda63d5682f 100644
>> --- a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
>> +++ b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
>> @@ -22,6 +22,7 @@ properties:
>>     compatible:
>>       enum:
>>         - mediatek,mt8183-svs
>> +      - mediatek,mt8188-svs
>>         - mediatek,mt8192-svs
>>     reg:
> 
> 



