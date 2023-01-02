Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBED9C4708E
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jan 2023 13:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:MIME-Version:In-Reply-To:
	References:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUeJe0drBbTMgiYkIr+hpKI3FSwnBgCuZWCVk8bkpiQ=; b=5DBl/qoTVq76q6jjXtGJ3k60+/
	kBEg9G8D7D1jsb3S8yUNSgp/2GB7f1NjYoUZCko3Pb/AoZKuFwtreWRr0c92amZxl49eQwqv/+eQ5
	txFWquqZ4rOF2FwUD6usstHJlhclmSjDuZIGE4hreVwv/fHYM+ohLlKLQ9DBV/1UazuSHEf76301h
	ORpbDY4bmQW33yLRhl225QMt8cLTXt0m+Wkz9YJtIiXRU4Y1RPgJIoydu45TdSC43zvUXsuDhkAix
	e7pg/U95R+1C14/Ui9AL//WzAAH7E+tEHCs2DTQ8uMcTxnWoblgCB500XnQ6X3DE3LZjs16Spseja
	gJF92dYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCL1X-00BaOj-2S; Mon, 02 Jan 2023 13:38:43 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCL1R-00BaLB-9U
	for linux-mediatek@lists.infradead.org; Mon, 02 Jan 2023 13:38:40 +0000
Received: by mail-qt1-x831.google.com with SMTP id z12so22454492qtv.5
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Jan 2023 05:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:in-reply-to:references:user-agent:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUeJe0drBbTMgiYkIr+hpKI3FSwnBgCuZWCVk8bkpiQ=;
        b=sJKeU3WCdOQHKogctAuHoH1Lb5awwjpVpHefGzuQH49JgYhK41rW3ae5mHbdmBGjsY
         UnNOamQKAW85+d3DJvYxWEY0sQwr8sxKKtQaJB5/ZBhMt7NlGdpExaGUTvd1Ym8DFBJN
         z/E2hVpZRbW12fzg0X2Kj7ZDsGIcLif6Q2AhzKLokR+qFZiuaAbfbrrFr+unYfzjUdTo
         IBWE8DrMPJ7CwXxGloffvAvF0SeiBqq0lV8Vq6+n+EzQHdffJcGYNIxvZMkpsWb/VBo6
         wuXMNTIGHn3SZ4HlhcRTVEyDdo/VUZ2atZFin0VDm7biJW7nnru9XUW+S1aJ2RCzJq8Z
         kYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:in-reply-to:references:user-agent:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUeJe0drBbTMgiYkIr+hpKI3FSwnBgCuZWCVk8bkpiQ=;
        b=ZdtIdvhSp4B17McMlwTUs1FAZbOqYyuY0cH+/+4qIbFwhQpgYFdOlA937PI/ffEObK
         hHAfBwkZR7irOWAKbBjSCRZ8D6S5hG5nKztUPcBYMq/IpvnnIhFNkAjxLHYLE0XlR7Aq
         1h6D3YJ7MZSZWfdbGfcoqUsE91T1BpViwLGLIt08LTwtQMAee9Ccu+jAZWXaDF5qa0p1
         tL/TJGwKAwKYyc57y9WgKAYOCDzIkSQYCdyuhg+dl65oEZPMD6bhrdZss3imMptboKP+
         6XgKTgLzFCtto+TOpdAquCfQn3ZMhK5ehWG5+yjLvth89GeMqDHVk/pYIPQ6UrMvGkbG
         Dk3w==
X-Gm-Message-State: AFqh2kqc5HjlyfszcftjluyyuUAKn4dI7e8UI8GaJ1ezhl5lRcKa8qkp
	sKpNIqBXbCtPmFZqPnfg1IRK4cyB27bVNEqg5Co0Lg==
X-Google-Smtp-Source: AMrXdXsRzYNVZ3d4bkKeYiAZTwzM9YRTxsFtaA7lSB3wLl6IBFcwrL0JOddsqmMqIzrw5hKkoMpSWmO5PrVO7+oREAw=
X-Received: by 2002:ac8:4d50:0:b0:3a8:a6e:1b4 with SMTP id x16-20020ac84d50000000b003a80a6e01b4mr1646554qtv.313.1672666714390;
 Mon, 02 Jan 2023 05:38:34 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Jan 2023 13:38:33 +0000
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v3-0-a803f2660127@baylibre.com> <20220919-v3-2-a803f2660127@baylibre.com>
 <7da1e73a0cca6867a060d5b69d45e8d4dfc89748.camel@mediatek.com>
In-Reply-To: <7da1e73a0cca6867a060d5b69d45e8d4dfc89748.camel@mediatek.com>
MIME-Version: 1.0
Date: Mon, 2 Jan 2023 13:38:33 +0000
Message-ID: <CABnWg9tf8Sx8S0d8mGowZ80YmZLz6cX2iyxZyKYCGbH_RKMKyA@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] dt-bindings: display: mediatek: add MT8195 hdmi bindings
To: CK Hu <ck.hu@mediatek.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"kishon@ti.com" <kishon@ti.com>, Chunfeng Yun <Chunfeng.Yun@mediatek.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, 
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>, 
	"rzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "koul@kernel.org" <vkoul@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"inux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Mac Shen <Mac.Shen@mediatek.com>, 
	"evicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"rzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>, Stuart Lee <Stuart.Lee@mediatek.com>, 
	"ri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"inux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_053837_667166_A4FC1F5F 
X-CRM114-Status: GOOD (  12.23  )
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

On Mon, 26 Dec 2022 06:18, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck.hu@media=
tek.com> wrote:
>Hi, Guillaume:
>
>On Fri, 2022-11-04 at 15:09 +0100, Guillaume Ranquet wrote:
>> Add mt8195 SoC bindings for hdmi and hdmi-ddc
>>
>> On mt8195 the ddc i2c controller is part of the hdmi IP block and
>> thus has no
>> specific register range, power domain or interrupt, making it simpler
>> than its the legacy "mediatek,hdmi-ddc" binding.
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> ---
>>
>
>[snip]
>
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-
>> hdmi-ddc.yaml
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-
>> hdmi-ddc.yaml
>> new file mode 100644
>> index 000000000000..2dc273689584
>> --- /dev/null
>> +++
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-
>> hdmi-ddc.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id:
>> https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediat=
ek/mediatek,mt8195-hdmi-ddc.yaml*__;Iw!!CTRNKA9wMg0ARbw!wwVQuq5lzW0lvUFUkVX=
PWT8cIu96xdkn4tMams1E55qyxEZmgV1i0WfpOlq57w$
>>
>> +$schema:
>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml=
*__;Iw!!CTRNKA9wMg0ARbw!wwVQuq5lzW0lvUFUkVXPWT8cIu96xdkn4tMams1E55qyxEZmgV1=
i0WdSGOSxzw$
>>
>> +
>> +title: Mediatek HDMI DDC for mt8195
>> +
>> +maintainers:
>> +  - CK Hu <ck.hu@mediatek.com>
>> +  - Jitao shi <jitao.shi@mediatek.com>
>> +
>> +description: |
>> +  The HDMI DDC i2c controller is used to interface with the HDMI DDC
>> pins.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - mediatek,mt8195-hdmi-ddc
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ddc
>> +
>> +  mediatek,hdmi:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      A phandle to the mt8195 hdmi controller
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    hdmiddc0: i2c {
>> +      compatible =3D "mediatek,mt8195-hdmi-ddc";
>> +      mediatek,hdmi =3D <&hdmi0>;
>> +      clocks =3D <&clk26m>;
>> +      clock-names =3D "ddc";
>> +    };
>
>I think we should not have a virtual device. This ddc is part of
>mt8195-hdmi device, so just keep mt8195-hdmi, and let mt8195-hdmi
>driver to probe the sub driver of ddc driver.
>
>Regards,
>CK

Hi CK,

Thx for your input.
Though I would strongly prefer to keep the ddc as a separate "virtual devic=
e".

It aligns better with the goal of reusing as much code as possible
from the HDMI V1 IP,
which is something you have been advocating since V1 of this patch
quite some time ago
and has shaped this patch.

To me we are in a state that is clean and avoids branching in the hdmi
common code.
Would you reconsider and allow the use of that virtual device?

Thx,
Guillaume.

>
>> +
>> +...
>>

