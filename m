Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9ECDC64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 09:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlVMDbUQRVURw1Z70bXW+19enGc0jucKYpS2P6DNpDU=; b=yz8qyC9FkgkLyTH9sszMF+wsdO
	lYewrE8+YUnttXWdtVBklTVcWJ51adVNOPGf+3IVZ6f6mgP53c5p9I8O7W6sC+zFj7JW3UWCVnzlu
	2OcTRWBpsucM42wpgY0GhZ9wN2kEdzAAnAoFxZELfqkie6sQMruDc2FN1x90kiOg18L/m+4Jl5uhG
	BVPgyQ1S2evh07Ip8Ut5RECIi46xZQrXWx0oMkvrVq8zM2/4vqFSTWPz4EJxURmRPTDC9z3LNzPIs
	XOqUKYul9MZYIKkVi5eTbF/RTAVw+OnLiifaBotRtF4zo0lY0OIOw0AbgHn9lJ7FDMXjsOGMPv3Vs
	ay/p73/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paZKw-00E18F-6h; Fri, 10 Mar 2023 09:46:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paZKl-00E14C-D2; Fri, 10 Mar 2023 09:46:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AEC9A660305B;
	Fri, 10 Mar 2023 09:46:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678441601;
	bh=HxvEW4kpMKirQlHHWsuDOAOqCEYgv8lxN0TWIGQVEBI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XDf5AC/d8cr83nZOhzyatXkW6DXH384345+3/ZzDL+5wV2e/PdrnNN2LCohdjxJue
	 62Uw0St/zP2zuK4cxGc1LE04Lt35HYs1gS3tfJFKKJDJ6zP2Y4UhdEsIVCz9UYz67F
	 +5tdlpNmGZmJD3n5zsRqjOvrUlgtlSOcl1ac+dIJoyEBAEM2uwLrOB09DKVjv4qgDk
	 Yr4A/wnahZ9uzdt1hxtclCbXLwjOUDptreNjD4rvFVCdeVQ3nRvwc2L5DkweAu5jNB
	 19WukUduzdVF92Qo6P13+5YR5y2gf6YQPcrUo6q9s8CR/oMdJtH9YCDp5txEz2pWmn
	 d7o+3AWce9KQw==
Message-ID: <6e08d78f-ef4c-b228-f7d2-d63767ea87b8@collabora.com>
Date: Fri, 10 Mar 2023 10:46:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 03/18] dt-bindings: pinctrl: mediatek,mt8365-pinctrl:
 add drive strength property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 devicetree@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
 <20230203-evk-board-support-v2-3-6ec7cdb10ccf@baylibre.com>
 <3b7c6f28-57bd-33de-5531-8c4eae8cf6eb@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <3b7c6f28-57bd-33de-5531-8c4eae8cf6eb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_014643_602655_8243DCCB 
X-CRM114-Status: GOOD (  17.74  )
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

Il 10/03/23 09:32, Krzysztof Kozlowski ha scritto:
> On 07/03/2023 14:17, Alexandre Mergnat wrote:
>> This SoC is able to drive the following output current:
>> - 2 mA
>> - 4 mA
>> - 6 mA
>> - 8 mA
>> - 10 mA
>> - 12 mA
>> - 14 mA
>> - 16 mA
>>
>> Then drive-strength property is set with enum to reflect its HW capability.
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
>> index 4b96884a1afc..101871ec6693 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
>> @@ -79,6 +79,9 @@ patternProperties:
>>   
>>             bias-pull-down: true
>>   
>> +          drive-strength:
>> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
> 
> Isn't this conflicting with mediatek,drive-strength-adv? Your commit msg
> suggests you add a missing property, but I would say nothing was missing
> here.
> 
> You need review from (pinctrl) Mediatek maintainers how the bindings for
> all Mediateks are organized.

Hello Krzysztof,

mediatek,drive-strength-adv *shall not exist*, that was an unnecessary property
that leaked upstream from downstream kernels and there's no reason to use it.

Upstream, we have drive-strength-microamp and mediatek,rsel-resistance-in-si-unit.

Since mediatek,mt8365-pinctrl.yaml got picked with that property already, I have
nothing to complain about this specific commit... drive-strength does not conflict
with the mediatek,drive-strength-adv property, as the "adv" is for microamp
adjustments.

You can pick it, it's fine.

Anyway, Alexandre: can you please perform a cleanup to the MT8365 pinctrl binding?
The cleanup means you're setting mediatek,drive-strength-adv as deprecated and
adding the right properties (...and possibly changing the devicetrees to use it).

For more information, you can look at commit history for the (unfortunately, named
incorrectly) MT8195 pinctrl documentation: bindings/pinctrl/pinctrl-mt8195.yaml
where we performed the same cleanup that I'm asking you to do, except we didn't
have to set any property as deprecated because there was *no devicetree upstream*
that was actually using that property (hence not an ABI breakage).

Cheers!
Angelo

