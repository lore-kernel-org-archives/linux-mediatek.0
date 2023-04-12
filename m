Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6C2C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 13:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IsrkVPeKsaynFnbWlBbnoqSaEozGzCnZBk6Qj0AOkSA=; b=DzFC+gtpxucia53cuzxJ3Zw6Ud
	qUq5IO97Pdsk8Q44X7TARcjoSpVwu3OMqZ8Ap+NLmt4crgFaxE4ksmilrYVgqr5OhAlDLH21IrDx2
	jQjIaclc5uU4RZVqzQBWZgVklayThkHuJ/E/RgQgXrMvpYFXiAB9eDY/Tm7PDgrmqs5wf5yKD5Nrz
	5sV7gPlDEc/Vn5YTSythgaz37y2yAbFAEIuhyhQMNRUIBauylbdx+S4nEMYGElMlJiEjzSdFz6gpa
	ayGS/FEvTpyhpn/LeQfWqQqMAl02FB9aBaSsfalE53bODT8PnlBNBcWCgAFp/Lb5YnwHP1Zitws/F
	eFUfTwLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmaHb-003HdS-2L;
	Wed, 12 Apr 2023 13:13:07 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmaHW-003HN3-26
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Apr 2023 13:13:05 +0000
Received: by mail-wm1-x332.google.com with SMTP id l16so6032151wms.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Apr 2023 06:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681305170; x=1683897170;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IsrkVPeKsaynFnbWlBbnoqSaEozGzCnZBk6Qj0AOkSA=;
        b=ssqrDy/2cLPJMN/UfNNxohNjADmsWrmIPazYKu4Ca3VT51kMGJqUU1fvWcWP4RjuZo
         4dF+jf6yXYovywxAeb9lSaPiNCt6S4eT3K+uf9VRCmYJmFdY8L41VcIutelklqmDsd6V
         qEQiJk6+v2YoizYOHRkf0dteFBK+5GWCvEXstGpl1jIPIMOXUsz7nnNubKdh5OvNHnOL
         aDF6VeDl9OZ8cI5sC0EVKynLDlBXTOguFMXJZ/LRchX+pbtIPKdlFgmkzwneaoW2z/GQ
         VQFB2AhqMthknYvrUs8GSB/XmaDK1dHZobdQvl+1Y43TnONYn2GITk4eWX+S3A94HX6O
         2rYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681305170; x=1683897170;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsrkVPeKsaynFnbWlBbnoqSaEozGzCnZBk6Qj0AOkSA=;
        b=FlvcOJqLpShA8qjKVZOhCsWYf54ZuWoJhSA5wRFP14YVRKNfHhoJnpMBSrnuGGpeHE
         aWa4s9Hu4ILy+velaLwO1eDyj7lz/AMlkoRvNfrM3u8NETi/NJMrpYh/G39gfsqgJCTF
         U8GKGBp+Hn6bxhtv/+/F4C4cHsZ90d/OUpjqSjbJi81CFiMYf8ycOsk1sTrCI6RmehVT
         sZUqb8JlswovQUP2zaEYoiNCI9MqePmKFQdZ+38+lVf92fxUrhRn+i3tFewRBvM4UHMR
         TrxamozCi4vj+5B3IXkGo5XXXAih7bhv0ijYrsNd+U5av3AgLugpYA1HSjjoCSWmA45A
         uGEg==
X-Gm-Message-State: AAQBX9cD3aO1RN1p9ZYpmGSgdvAcpb8Xsr1gF8jA+YqQGCAEkThpilF6
	LLihJE0JWg5s0ne6km3tY7Wr9A==
X-Google-Smtp-Source: AKy350ZBjsJyLl7Rt2Og/2cr2DuEAVD7N0GXPO8YRPue1Xvb87vVf08FN6CXsl6Q/928lyD+Npa9JA==
X-Received: by 2002:a05:600c:2142:b0:3ef:62cd:1ef with SMTP id v2-20020a05600c214200b003ef62cd01efmr4545069wml.25.1681305170583;
        Wed, 12 Apr 2023 06:12:50 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id z12-20020a7bc7cc000000b003ee63fe5203sm2311867wmk.36.2023.04.12.06.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 06:12:50 -0700 (PDT)
Message-ID: <7e53c0b1-3aed-da08-5c57-800ac2277bc6@baylibre.com>
Date: Wed, 12 Apr 2023 15:12:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/27] dt-bindings: phy: mediatek,dsi-phy: Add compatible
 for MT6795 Helio X10
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-3-angelogioacchino.delregno@collabora.com>
 <20684378-cf3e-0299-d390-287b7bafbda5@baylibre.com>
 <eb770f19-ada5-81bb-5ea3-798edabca70f@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <eb770f19-ada5-81bb-5ea3-798edabca70f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_061302_755497_D794FADE 
X-CRM114-Status: GOOD (  15.36  )
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

On 12/04/2023 15:03, AngeloGioacchino Del Regno wrote:
> Il 12/04/23 14:59, Alexandre Mergnat ha scritto:
>> On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
>>> Add a compatible string for MediaTek Helio X10 MT6795: this SoC uses
>>> the same DSI PHY as MT8173.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml 
>>> b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
>>> index 26f2b887cfc1..a9f78344efdb 100644
>>> --- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
>>> @@ -24,6 +24,10 @@ properties:
>>>             - enum:
>>>                 - mediatek,mt7623-mipi-tx
>>>             - const: mediatek,mt2701-mipi-tx
>>> +      - items:
>>> +          - enum:
>>> +              - mediatek,mt6795-mipi-tx
>>> +          - const: mediatek,mt8173-mipi-tx
>>
>> AFAIK, it should be:
>>        - items:
>>            - const: mediatek,mt6795-mipi-tx
>>            - const: mediatek,mt8173-mipi-tx
>>
>> Since it isn't respected above for mt7623, it may be tolerated.
>> Please, take this comment as a suggestion, isn't a NAK from me.
>>
> 
> First of all, Thanks!
> I want to explain, though, the reason for that.
> 
> If you check all the commits, on some I did it as you just proposed, while
> on some others I did it with an enum before const: that's simply because I
> *totally expect* some to grow, while others (const - const) I was either
> unsure, or totally *not* expecting them to grow soon!


That's what I thought. IMHO, if someone add another compat later, he 
will be on charge to change the const by enum front of your 
"mediatek,mt6795-mipi-tx". But my opinion is probably not the most popular.

I will not make the same feedback for the other patches in this series.

-- 
Regards,
Alexandre


