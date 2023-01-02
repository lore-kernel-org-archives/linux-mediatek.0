Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5A4C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jan 2023 15:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:MIME-Version:In-Reply-To:
	References:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iM4yyBhiPXK8XnnSv/ow1N2yZTje0oJaNZH/BHWGTE8=; b=PYKLUd4ZnCDVwvM78HdCDU0gQ0
	aXk2/9ytTe21979PTR+fjiPUctNbz0VoCqoRzu6N2uqzYr/IKN63BwsBT6RuPJntkuxdDKgo5gEz5
	RtlT+aQVLebisgcSxVwdxg7NwlXYTwzoT5b+QGPd/wUHH0rOXBCMirjyKxQhBab/E1PtZdMAmtoc2
	TDMr0M9d1RAxGO5ibAxYEhSfYs9amwHhc1QszXtQQD0HXHKEJ+6IzbVBB8LCDZT5donOFl0q8m9Sv
	OZaeuoV3Z+GZbPzoycehXLqmQkLdyuajL+RIkKlG11RcBl+VGhlQNoGVdiFoOgUNh7qO4+6oejXPO
	v0ABvUMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCMbS-00C8LP-Ob; Mon, 02 Jan 2023 15:19:54 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCMaq-00C7uQ-NI
	for linux-mediatek@lists.infradead.org; Mon, 02 Jan 2023 15:19:22 +0000
Received: by mail-qv1-xf35.google.com with SMTP id m12so13357975qvq.13
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Jan 2023 07:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:in-reply-to:references:user-agent:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iM4yyBhiPXK8XnnSv/ow1N2yZTje0oJaNZH/BHWGTE8=;
        b=8D4A86KeqD9b9tfCngSktp4trTppQ3bSXKvBUgMuVP5/Eqk6IiDkRHIvgrOd0KnUwQ
         nDQRkrJRq1pzIipS/+bAd3QDVPC9t7loNSs7FmhKp7Ub7tM1F2ozkfsC2boTvMmOYai5
         37xO8lAfkg9g5igl7WcATloz1G7zwdORUz8V2dx11A+B8O5tSRJ+wHxZByAyAnIheLQF
         1uUmhatKaxZ40k7ZOkObYgq3LKmGEA1o/aNRzJFkFpeIUFRU810nlDGdibkboGEckvho
         sVori8GHxVtA2i3rUCG6GZGQZmtk3tyRGsEkXPnM9csH8sQZJxpO05iQuXsSoUfPYi0T
         iTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:in-reply-to:references:user-agent:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iM4yyBhiPXK8XnnSv/ow1N2yZTje0oJaNZH/BHWGTE8=;
        b=7AqAqL4SDcdFyM10m0u+8bmvADxlx6swfLHYOV/o5WakPPyArWkJ0ZIVKKKFYBGXq+
         eUcqhyKYX0dN0am2AgSfDAYb2+ewb9bfHkbk4PdyBOfHRR+xufb4/I5ufHr/LIYZN9kX
         U/iOidLEyeNHuv1Z6YCdP6ofUrVIZ6A4mw2hsKNOZJpPOkzsb97ev+nuVz+I7PrHFLyP
         6shlxlB7n0FvgS5xaNFPKefW83TKVn4TJ50lSGCKBb9NLJqAtyGCPfFhQz2S1vk94m1/
         P8p6Mo4T/CyKyq6eKwAW7/KpPZa0JL0Q/f9NJReZX9tPffaz9zBfMp5y0/46v0UeL1VM
         tK1w==
X-Gm-Message-State: AFqh2krccktX3hC36OvOBJvgYefa68rPGQ6GSHJCavN7gKRok50jwNm0
	w92Z4K8gqMVTgVgH4o1VxbeUSYRBHOnmaDXB+iYsAg==
X-Google-Smtp-Source: AMrXdXts8BrSbkC+KOmKv6kEo+vb2pdbKNhL2j8VTSD7dxzDetsFkCpJzR5IklYb+fpl6LsTEJl6k+jBkwUPcBvXQXE=
X-Received: by 2002:a0c:ed46:0:b0:524:dace:4594 with SMTP id
 v6-20020a0ced46000000b00524dace4594mr1918940qvq.108.1672672747966; Mon, 02
 Jan 2023 07:19:07 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Jan 2023 15:19:07 +0000
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v3-0-a803f2660127@baylibre.com> <20220919-v3-2-a803f2660127@baylibre.com>
 <7da1e73a0cca6867a060d5b69d45e8d4dfc89748.camel@mediatek.com>
 <CABnWg9tf8Sx8S0d8mGowZ80YmZLz6cX2iyxZyKYCGbH_RKMKyA@mail.gmail.com> <187044b3-b154-256a-c107-3dc9de57d60b@collabora.com>
In-Reply-To: <187044b3-b154-256a-c107-3dc9de57d60b@collabora.com>
MIME-Version: 1.0
Date: Mon, 2 Jan 2023 15:19:07 +0000
Message-ID: <CABnWg9tRveoZb8e7zGkGqb0MMoJiTxfS1NeJDtfFqMYsf-zJcg@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] dt-bindings: display: mediatek: add MT8195 hdmi bindings
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"oul@kernel.org" <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>, 
	"obh+dt@kernel.org" <robh+dt@kernel.org>, "kishon@ti.com" <kishon@ti.com>, 
	Chunfeng Yun <Chunfeng.Yun@mediatek.com>, 
	"hunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, 
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "atthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	".zabel@pengutronix.de" <p.zabel@pengutronix.de>, "irlied@gmail.com" <airlied@gmail.com>, 
	"zysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Mac Shen <Mac.Shen@mediatek.com>, 
	"vicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"zysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>, Stuart Lee <Stuart.Lee@mediatek.com>, 
	"i-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"nux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"inux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_071917_013193_C1CAD6C0 
X-CRM114-Status: GOOD (  14.73  )
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

On Mon, 02 Jan 2023 15:14, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 02/01/23 14:38, Guillaume Ranquet ha scritto:
>> On Mon, 26 Dec 2022 06:18, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck.hu@me=
diatek.com> wrote:
>>> Hi, Guillaume:
>>>
>>> On Fri, 2022-11-04 at 15:09 +0100, Guillaume Ranquet wrote:
>>>> Add mt8195 SoC bindings for hdmi and hdmi-ddc
>>>>
>>>> On mt8195 the ddc i2c controller is part of the hdmi IP block and
>>>> thus has no
>>>> specific register range, power domain or interrupt, making it simpler
>>>> than its the legacy "mediatek,hdmi-ddc" binding.
>>>>
>>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>>> ---
>>>>
>>>
>>> [snip]
>>>
>>>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-
>>>> hdmi-ddc.yaml
>>>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-
>>>> hdmi-ddc.yaml
>>>> new file mode 100644
>>>> index 000000000000..2dc273689584
>>>> --- /dev/null
>>>> +++
>>>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-
>>>> hdmi-ddc.yaml
>>>> @@ -0,0 +1,51 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id:
>>>> https://urldefense.com/v3/__http://devicetree.org/schemas/display/medi=
atek/mediatek,mt8195-hdmi-ddc.yaml*__;Iw!!CTRNKA9wMg0ARbw!wwVQuq5lzW0lvUFUk=
VXPWT8cIu96xdkn4tMams1E55qyxEZmgV1i0WfpOlq57w$
>>>>
>>>> +$schema:
>>>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.ya=
ml*__;Iw!!CTRNKA9wMg0ARbw!wwVQuq5lzW0lvUFUkVXPWT8cIu96xdkn4tMams1E55qyxEZmg=
V1i0WdSGOSxzw$
>>>>
>>>> +
>>>> +title: Mediatek HDMI DDC for mt8195
>>>> +
>>>> +maintainers:
>>>> +  - CK Hu <ck.hu@mediatek.com>
>>>> +  - Jitao shi <jitao.shi@mediatek.com>
>>>> +
>>>> +description: |
>>>> +  The HDMI DDC i2c controller is used to interface with the HDMI DDC
>>>> pins.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - mediatek,mt8195-hdmi-ddc
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: ddc
>>>> +
>>>> +  mediatek,hdmi:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +    description:
>>>> +      A phandle to the mt8195 hdmi controller
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - clocks
>>>> +  - clock-names
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>> +    hdmiddc0: i2c {
>>>> +      compatible =3D "mediatek,mt8195-hdmi-ddc";
>>>> +      mediatek,hdmi =3D <&hdmi0>;
>>>> +      clocks =3D <&clk26m>;
>>>> +      clock-names =3D "ddc";
>>>> +    };
>>>
>>> I think we should not have a virtual device. This ddc is part of
>>> mt8195-hdmi device, so just keep mt8195-hdmi, and let mt8195-hdmi
>>> driver to probe the sub driver of ddc driver.
>>>
>>> Regards,
>>> CK
>>
>> Hi CK,
>>
>> Thx for your input.
>> Though I would strongly prefer to keep the ddc as a separate "virtual de=
vice".
>>
>> It aligns better with the goal of reusing as much code as possible
>> from the HDMI V1 IP,
>> which is something you have been advocating since V1 of this patch
>> quite some time ago
>> and has shaped this patch.
>>
>> To me we are in a state that is clean and avoids branching in the hdmi
>> common code.
>> Would you reconsider and allow the use of that virtual device?
>>
>> Thx,
>> Guillaume.
>>
>
>You can as well keep the DDC as a separated driver, but register in the HD=
MI v1 and
>v2 driver at probe time.
>
>Doing that, you won't need any devicetree node specific to any virtual dev=
ice :-)
>
>Cheers,
>Angelo
>
>

Sure, but does it make any sense for HDMI v1?
As the ddc in v1 is a real device which (in theory) can be reused by other =
IPs.

I would see either v1 and v2 ddc exposed as a devicetree node (which
is what I favor).
Or v1 as a devicetree node and v2 probed directly from the hdmi code base.

Thx,
Guillaume.

