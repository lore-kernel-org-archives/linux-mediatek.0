Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4362EE49AD
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 05:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SK7wXCHgjso+kauNiz/tvz/1bAcMDEpFaiHMZHqEM+k=; b=ww96KNQRCbrq/N9XMensPGacB9
	T9080KIQ7jJoKogo6vHG2x7k858TTNfJWfKRw3YgenK4yn9lNLq+b3cfBt7HXPZZRsYnJWKt7NbwM
	hpxK1L6kEsKJflPkDN9vYig29vh+o2Qczqxl53ceYOlvnqBGPo3GebeeykKbQBvMXtrWnuy6XrCQJ
	zoU1c+JtkJ7aZ7Woa+Ep+MxSnmuckqOxRcgRbuuQmSdi4iLyp+TqVYnYOcrbnHMQTBQUiOtZ0DjJX
	DKT3PQiBxHdZfQRqFg04+4BbK3wp9TY5wcaCoJf7wlTVSsTC5Wcjk7HZ6nSwzG46T9cKKDmGRkP42
	cmUpwyMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYgfz-00HJ5j-1B;
	Wed, 23 Aug 2023 05:45:07 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYgfw-00HJ5M-1V
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Aug 2023 05:45:06 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9a19bf6ab66so332317666b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Aug 2023 22:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692769503; x=1693374303;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SK7wXCHgjso+kauNiz/tvz/1bAcMDEpFaiHMZHqEM+k=;
        b=XXWoTLK8oWopT7hrMyLrF1Tc951LffRiahbWO9LGEAmGWNGaPdlaqQd7NZWY4TZFml
         xrzm/Wxfs5PzNComACBofjpGlPiuKNg1o/8Cu31/T9dD1ZsUh4heCRTehXmqqeWUaKQN
         S9WUEotmUQEEtGIRprSgX/7AHd4UPbH5PKOs+BwDb7nQyd8ekkmCTSkaGynkhkqSaWhk
         pnuNvpmGEsyBpEJ1XwvkpJgcl7RTSoDMmtzGEbdtCgFrybRi8T6CYao9w9AeEeojRoyq
         7j0VaES49WcDDj0DZtT45dFvS/FP2ZUdBD/QaIiSnJa5v+CaWxNRw0Bn6hyCkMR8DMBS
         OOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692769503; x=1693374303;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SK7wXCHgjso+kauNiz/tvz/1bAcMDEpFaiHMZHqEM+k=;
        b=KYgpEXWua6Vyy0mmhp9VUbFZBohMw4Kcn2c78YZ39uPVHbTT5o/lHPDrpwns50Dth2
         IfZvc0mmZCzmDXTpjH6NwNhC+Sx0eQ4mDjO8yUioNs7nFUEo8oWInEKEVCkObT3dr8ar
         /ghIvDUTrED8b3H3HhLr1U8Jdqe/BfQw+PPwoIrvm/ZYVs3gruA0mCv0tHMK9PmwpKsi
         aWpSIMOA2jihI0/p5DemUKeNLGIc6hA7jKqPOSnYZ5uJzuN5qsXzPXE/dEMWUh92fif7
         xYAUXNAxUsjz8xsOPaZ5n3ekIitLZOq68cLFer0giV/ukhp6rb5ifxP5IfamKe02gtyI
         D4+Q==
X-Gm-Message-State: AOJu0YyWaOYcwskkzOKia8UeEX+bDWNPxiv0ycKrIxR3CEzxzpTDXp7F
	isgi7JsVxgTncGmCIqfhsFCxPw==
X-Google-Smtp-Source: AGHT+IFMGuuVVuMGRrZ3AMvI32OaQC1nJmlAED9vkRKGPYle6Ytx2Hp3LIbMxpUCl2Sqis8RiHVmBg==
X-Received: by 2002:a17:906:2931:b0:99c:10e8:52d6 with SMTP id v17-20020a170906293100b0099c10e852d6mr8391665ejd.39.1692769503073;
        Tue, 22 Aug 2023 22:45:03 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id la14-20020a170906ad8e00b00982a92a849asm9340043ejb.91.2023.08.22.22.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 22:45:02 -0700 (PDT)
Message-ID: <c0289603-f498-2b6b-c45a-82ba400f2f58@linaro.org>
Date: Wed, 23 Aug 2023 07:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 05/11] regulator: dt-bindings: mediatek: Add MT6366
 PMIC
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Brown <broonie@kernel.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230822084520.564937-1-wenst@chromium.org>
 <20230822084520.564937-6-wenst@chromium.org>
 <337f20d5-4dfe-90ef-16b9-c10b14060b97@linaro.org>
 <60221aab-d8da-9f0b-057b-e8a28840849f@linaro.org>
 <CAGXv+5EiiDT_TWdyhrdq7HrBuMxpzZeKWNuhiVqJpmzcHEhaMA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGXv+5EiiDT_TWdyhrdq7HrBuMxpzZeKWNuhiVqJpmzcHEhaMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_224504_514935_B4BCE962 
X-CRM114-Status: GOOD (  25.44  )
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

On 23/08/2023 06:20, Chen-Yu Tsai wrote:
> On Wed, Aug 23, 2023 at 3:40 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 22/08/2023 21:39, Krzysztof Kozlowski wrote:
>>> On 22/08/2023 10:45, Chen-Yu Tsai wrote:
>>>> From: Zhiyong Tao <zhiyong.tao@mediatek.com>
>>>>
>>>> The MediaTek MT6366 PMIC is similar to the MT6358 PMIC. It is designed
>>>> to be paired with the MediaTek MT8186 SoC. It has 9 buck regulators and
>>>> 29 LDO regulators, not counting ones that feed internally and basically
>>>> have no controls. The regulators are named after their intended usage
>>>> for the SoC and system design, thus not named generically as ldoX or
>>>> dcdcX, but as vcn33 or vgpu.
>>>>
>>>> Add a binding document describing all the regulators and their supplies.
>>>>
>>>> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
>>>> [wens@chromium.org: major rework and added commit message]
>>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>>> ---
>>>> Changes since v1:
>>>> - Replaced underscores in supply names to hyphens
>>>> - Merged with MT6358 regulator binding
>>>> - Added MT6358 fallback compatible to MT6366 regulator
>>>>
>>>> Changes since Zhiyong's last version (v4) [1]:
>>>> - simplified regulator names
>>>> - added descriptions to regulators
>>>> - removed bogus regulators (*_sshub)
>>>> - merged vcn33-wifi and vcn33-bt as vcn33
>>>> - added missing regulators (vm18, vmddr, vsram-core)
>>>> - cut down examples to a handful of cases and made them complete
>>>> - expanded commit message a lot
>>>>
>>>> [1] https://lore.kernel.org/linux-arm-kernel/20220823123745.14061-1-zhiyong.tao@mediatek.com/
>>>>  .../regulator/mediatek,mt6358-regulator.yaml  | 227 +++++++++++++-----
>>>>  1 file changed, 168 insertions(+), 59 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
>>>> index 82328fe17680..b350181f33ff 100644
>>>> --- a/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
>>>> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
>>>> @@ -16,14 +16,18 @@ description: |
>>>>
>>>>  properties:
>>>>    compatible:
>>>> -    const: mediatek,mt6358-regulator
>>>> +    oneOf:
>>>> +      - const: mediatek,mt6358-regulator
>>>> +      - items:
>>>> +          - const: mediatek,mt6366-regulator
>>>> +          - const: mediatek,mt6358-regulator
>>>>
>>>>    vsys-ldo1-supply:
>>>>      description: Supply for LDOs vfe28, vxo22, vcn28, vaux18, vaud28, vsim1, vusb, vbif28
>>>>    vsys-ldo2-supply:
>>>> -    description: Supply for LDOs vldo28, vio28, vmc, vmch, vsim2
>>>> +    description: Supply for LDOs vldo28 (MT6358 only), vio28, vmc, vmch, vsim2
>>>>    vsys-ldo3-supply:
>>>> -    description: Supply for LDOs vcn33, vcama1, vcama2, vemc, vibr
>>>> +    description: Supply for LDOs vcn33, vcama[12] (MT6358 only), vemc, vibr
>>>>    vsys-vcore-supply:
>>>>      description: Supply for buck regulator vcore
>>>>    vsys-vdram1-supply:
>>>> @@ -43,75 +47,138 @@ properties:
>>>>    vsys-vs2-supply:
>>>>      description: Supply for buck regulator vs2
>>>>    vs1-ldo1-supply:
>>>> -    description: Supply for LDOs vrf18, vefuse, vcn18, vcamio, vio18
>>>> +    description: Supply for LDOs vrf18, vefuse, vcn18, vcamio (MT6358 only), vio18
>>>>    vs2-ldo1-supply:
>>>> -    description: Supply for LDOs vdram2
>>>> +    description: Supply for LDOs vdram2, vmddr (MT6366 only)
>>>>    vs2-ldo2-supply:
>>>>      description: Supply for LDOs vrf12, va12
>>>>    vs2-ldo3-supply:
>>>> -    description: Supply for LDOs vsram-gpu, vsram-others, vsram-proc11, vsram-proc12
>>>> -  vs2-ldo4-supply:
>>>> -    description: Supply for LDO vcamd
>>>> -
>>>> -patternProperties:
>>>> -  "^buck_v(core|dram1|gpu|modem|pa|proc1[12]|s[12])$":
>>>> -    description: Buck regulators
>>>> -    type: object
>>>> -    $ref: regulator.yaml#
>>>> -    unevaluatedProperties: false
>>>> -
>>>> -  "^ldo_v(a|rf)12":
>>>> -    description: LDOs with fixed 1.2V output and 0~100/10mV tuning
>>>> -    type: object
>>>> -    $ref: regulator.yaml#
>>>> -    unevaluatedProperties: false
>>>> -
>>>> -  "^ldo_v((aux|cn|io|rf)18|camio)":
>>>> -    description: LDOs with fixed 1.8V output and 0~100/10mV tuning
>>>> -    type: object
>>>> -    $ref: regulator.yaml#
>>>> -    unevaluatedProperties: false
>>>> -
>>>> -  "^ldo_vxo22":
>>>> -    description: LDOs with fixed 2.2V output and 0~100/10mV tuning
>>>> -    type: object
>>>> -    $ref: regulator.yaml#
>>>> -    unevaluatedProperties: false
>>>> -
>>>> -  "^ldo_v(aud|bif|cn|fe|io)28":
>>>> -    description: LDOs with fixed 2.8V output and 0~100/10mV tuning
>>>> -    type: object
>>>> -    $ref: regulator.yaml#
>>>> -    unevaluatedProperties: false
>>>> -
>>>> -  "^ldo_vusb":
>>>> -    description: LDOs with fixed 3.0V output and 0~100/10mV tuning
>>>> -    type: object
>>>> -    $ref: regulator.yaml#
>>>> -    unevaluatedProperties: false
>>>> -
>>>> -  "^ldo_vsram_(gpu|others|proc1[12])$":
>>>> -    description: LDOs with variable output
>>>> -    type: object
>>>> -    $ref: regulator.yaml#
>>>> -    unevaluatedProperties: false
>>>> -
>>>> -  "^ldo_v(cama[12]|camd|cn33|dram2|efuse|emc|ibr|ldo28|mc|mch|sim[12])$":
>>>> -    description: LDOs with variable output and 0~100/10mV tuning
>>>> -    type: object
>>>> -    $ref: regulator.yaml#
>>>> -    unevaluatedProperties: false
>>>
>>> I don't understand. You just added it and it is already wrong? Please,
>>> do not add code which is clearly incorrect.
>>
>> Sent too early - anyway properties cannot be defined in allOf:. That's
>> not the place for them and there is no single reason for it. From which
>> regulator binding you got this example?
> 
> None. It was simply a way I figured out when I was reading up on JSON
> schema syntax. I wanted to split the definitions cleanly, since they
> are very different. And with "unevaluatedProperties: false" in the base
> schema it did seem to work, successfully evaluating existing device trees
> and producing errors when extra properties were added, or if types didn't
> match up.

If they are very different, this should not have been one binding. There
is little benefit of that.

> 
> Now that you mention it, I suppose the preferred way to write it is to
> have all the properties in the base schema, then negate the ones that
> don't belong in the allOf: section? It just seems really repetitive given
> the child node names for the chip variants are completely different. OOTH
> I guess it would produce better error messages.


For regular cases yes, but not if devices differ so much.

Best regards,
Krzysztof


