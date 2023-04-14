Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED49C77B70
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 10:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/1Rrq6ub5iVfN9FeT2otXgTHenu1AJtgKyZFEEHtFA=; b=uzomPJR4Wz1Kuka7i2pUiX5XfU
	rjHNfEwFAglOmKmVYI+eyYFzebY7kH54r08exTkawG32XpSdeD9zR2BHSUN3FEvlmO28ilYYOF0fg
	A26VX0MAa5UPIzC1BMycAVBXo3m+fBmD0J865PYsJV6MaB8zAAB2UV/66F8Pg3aSZf0M+U70Bo/g6
	OKHy/wACdkBMFt4HazTecLLFRIh26vuanNQHmypl1ExSlQ+b/2kNf/yKAucWxB4883zzCSAFP+Bj0
	P5cGQUgBQl9qcgGIJ23uNgEdwpMTU0TWjWowSMwNfOZKijDMRI/2bfHsYu16htHLiJKYuP8epSk0z
	OFzs1kkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnGd5-00977F-0H;
	Fri, 14 Apr 2023 10:26:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnGd1-00973m-1G;
	Fri, 14 Apr 2023 10:26:04 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 227E5660321F;
	Fri, 14 Apr 2023 11:26:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681467961;
	bh=mNoM/ta8cg4ngqxg7oipt2WWk68MhPf2irdlQ2bTH6c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HWaowAFI7MZZLy46RcM67hcrKHR7EFPgMqFHgvDEIAiWxpvjNQicUt31wS4wYDL1S
	 1KaDj/aqxFkJEeq8RwQxDv4iWZzhP5+BuJxaGDFTauwzHvJBay7+0AlEpI4hi2S2WT
	 8rB98KbBmtvP6fj7GoWG/FROcIKx2n+XiN5KBI7sj2xzE5hpGwMgpWbRB83wQ9s6Zu
	 RNpJkWLksBfef+SsnXarFVl1bPEzxQJWSpshnHOEDjJ1/tkYDqZe9CGGGXBfwgHl8k
	 cUvig8zyWy3zW5Dg58B8CVzegX5HKHhQRhIgzyDe+cANCSJ4z+VhzYfo/Vc0yR6bUB
	 +8AotLP+x+XDA==
Message-ID: <13fe3e54-caa5-098c-0a86-3d2f8475c23f@collabora.com>
Date: Fri, 14 Apr 2023 12:25:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek
 MT6795
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, chunkuang.hu@kernel.org,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 houlong.wei@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org,
 kernel@collabora.com, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
 <aaeeb18d-f8e8-d6c1-1272-e5b797554b9e@linaro.org>
 <20230414083019.cpomx37tax4ibe5u@pengutronix.de>
 <f8a4fd52-52b6-dded-c8b7-864be549e2ad@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <f8a4fd52-52b6-dded-c8b7-864be549e2ad@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_032603_567311_8C2DA4F6 
X-CRM114-Status: GOOD (  17.70  )
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

Il 14/04/23 10:34, Krzysztof Kozlowski ha scritto:
> On 14/04/2023 10:30, Uwe Kleine-König wrote:
>> On Fri, Apr 14, 2023 at 10:21:05AM +0200, Krzysztof Kozlowski wrote:
>>> On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
>>>> Add a compatible string for MediaTek Helio X10 MT6795's display PWM
>>>> block: this is the same as MT8173.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>   Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
>>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>>>> index 0088bc8e7c54..153e146df7d4 100644
>>>> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>>>> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>>>> @@ -22,7 +22,9 @@ properties:
>>>>             - mediatek,mt8173-disp-pwm
>>>>             - mediatek,mt8183-disp-pwm
>>>>         - items:
>>>> -          - const: mediatek,mt8167-disp-pwm
>>>> +          - enum:
>>>> +              - mediatek,mt6795-disp-pwm
>>>> +              - mediatek,mt8167-disp-pwm
>>>
>>> This does not look correct. You do not add compatible, you replace
>>> breaking all mt8167-disp-pwm. At least it looks like this from context.
>>
>> I thought the old semantic to be:
>>
>> 	"mediatek,mt8167-disp-pwm"
>>
>> and the new
>>
>> 	"mediatek,mt6795-disp-pwm" or "mediatek,mt8167-disp-pwm"
>>
>> . What am I missing?
> 
> The new is ok for mt6795 but it is not valid for mt8167.
> 

Sorry, why is it not valid for MT8167?

This is changing the doc from:

OLD:
       - items:
           - const: mediatek,mt8167-disp-pwm
           - const: mediatek,mt8173-disp-pwm
NEW:

       - items:
           - enum:
               - mediatek,mt6795-disp-pwm
               - mediatek,mt8167-disp-pwm
           - const: mediatek,mt8173-disp-pwm

For me, that's totally valid, as the old semantic was:

compatible = "mediatek,mt8167-disp-pwm", "mediatek,mt8173-disp-pwm";

...and the new semantic is .. the same; this commit only *adds* the
possibility to get a

compatible = "mediatek,mt6795-disp-pwm", "mediatek,mt8173-disp-pwm";

without breaking anything.

Regards,
Angelo

