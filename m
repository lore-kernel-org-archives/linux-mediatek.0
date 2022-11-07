Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79C6C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 14:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfXdjQhTZQkr1X94ZZoUwqUu1jkMou77X3rg8dG96a8=; b=P21s5+XcOmdr3avhQeMyWgct+I
	RWAZ83Dp4Spfr099IATxOk6z9uS7OUgA72Mi1kCEWoTUG4noAI5dNUx18PlmcAuOmwrg5qio0Jn7x
	2OpfCFrDFluABiYsTN262EaOgV+wwz4/FAvv3W4/yVP1xOSvUfHQVot3q02jprtRKtOKSvLNgKVxf
	8DXJ4f42VdhhYBiu869kMsEmo+5a/rJPPgO6gfwABfZoJdeIzgTrgEIukMfWX+hv8A4YVA+Nkk8G3
	BFZ/V9FMiocpHnGTCE79/eSmCZe2PqieAUoE1yettoj8VmGZ6BtV9r4Pqjl+jHdm+i46jrtHrP9vr
	B7dMvUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os3YF-00FRDo-F2; Mon, 07 Nov 2022 14:56:39 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os3KZ-00FJVM-SY
	for linux-mediatek@lists.infradead.org; Mon, 07 Nov 2022 14:42:33 +0000
Received: by mail-lf1-x136.google.com with SMTP id f37so17031406lfv.8
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Nov 2022 06:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfXdjQhTZQkr1X94ZZoUwqUu1jkMou77X3rg8dG96a8=;
        b=YY/rIl083jijvHJKrVqGCLgKhx1v5KpSxBKiU1+0a9eewETgjWVakNpnGhGMKPrXgU
         cO1XJQO7ms2EabCorEz5LwdJjlGCPz21MpkLr+SLY5nglIWcT4dTmCAt7R2Wcv76yuWt
         p0Cgd/gsGoHIDF5So+E1NrRbe8cHiv3++mag11g+FaFv1hRcS8klQrwysIw0VTmqGBR6
         9HdC0oO1CFvTxOOtKywSXSkN7S5iDbHc2GMV/2PX7V2ItPNgLhh04mFuO6sjt605vxAd
         yM8BKtaJs2AvTjF3tQC58gaQ2CzGVEVzIZBoIhmPeANGprFmO3fgZwoQKGDEXFdPdXyb
         Yhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfXdjQhTZQkr1X94ZZoUwqUu1jkMou77X3rg8dG96a8=;
        b=aLZrMj4CZxx5IE378AsqiLW4CEVAoFrYyW+EhNk8Rc7awUZHgraGgZiZxklku7WtkD
         /agwpRVi79g1bWhwMk7iusJ9c1CYwdwPkhT1OJpQyiblGrwM7THs6wXocsxR2Iiom72m
         nb+peCYQrXJi4deOCD1y5GbOesnwwmNcJTbnHX+HIzq9iTzyChXgMKf/XH2NyuO9Dae5
         6rlUasAesgreSYEsBKjrGGOSS2WY1n6vRLc22xnNH34Ys2ys5aG3MQN5lFFgE4VSQVZ5
         oQ5PiGurmliHslbzP9kQ6mERJkF+MgFcP/0yRFi/igOA1+t9G6ND7QfKfByFIXzwTYcJ
         Y0EA==
X-Gm-Message-State: ACrzQf02CZ6Avkf1YkNjG6Dbaa8XkA2+Gj6atY5UKv7rPdDiUwRaH3xa
	iT1l2ebotJ0ZLX8JPwFo+ezfoehP/rdqhfAp+1D7mA==
X-Google-Smtp-Source: AMsMyM4obaHSDFPifKElHvH7PBL0HAA5pZ3NjQn/6AtTpDJdt3UiOIE4TO8MH3JiH/CTme2Sfp3yxRp/Y7LOmjXfHcA=
X-Received: by 2002:a19:8c57:0:b0:4ae:2436:818c with SMTP id
 i23-20020a198c57000000b004ae2436818cmr368888lfj.346.1667832145955; Mon, 07
 Nov 2022 06:42:25 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Nov 2022 14:42:25 +0000
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v3-0-a803f2660127@baylibre.com> <20220919-v3-2-a803f2660127@baylibre.com>
 <ab8528cc-fa5d-35da-0c6e-cdebc694f646@linaro.org>
In-Reply-To: <ab8528cc-fa5d-35da-0c6e-cdebc694f646@linaro.org>
MIME-Version: 1.0
Date: Mon, 7 Nov 2022 14:42:25 +0000
Message-ID: <CABnWg9vNWiz+2Ms6oJ2e3fp502m4o3Vx12PWZCk-FoV-Vw55+Q@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] dt-bindings: display: mediatek: add MT8195 hdmi bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, 
	Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, stuart.lee@mediatek.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	mac.shen@mediatek.com, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_064231_977351_5873965F 
X-CRM114-Status: GOOD (  13.77  )
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

On Mon, 07 Nov 2022 11:02, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>On 04/11/2022 15:09, Guillaume Ranquet wrote:
>> Add mt8195 SoC bindings for hdmi and hdmi-ddc
>>
>> On mt8195 the ddc i2c controller is part of the hdmi IP block and thus has no
>> specific register range, power domain or interrupt, making it simpler
>> than its the legacy "mediatek,hdmi-ddc" binding.
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> ---
>>  .../bindings/display/mediatek/mediatek,hdmi.yaml   | 61 ++++++++++++++++++----
>>  .../display/mediatek/mediatek,mt8195-hdmi-ddc.yaml | 51 ++++++++++++++++++
>>  2 files changed, 101 insertions(+), 11 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>> index bdaf0b51e68c..9710b7b6e9bf 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>> @@ -21,6 +21,7 @@ properties:
>>        - mediatek,mt7623-hdmi
>>        - mediatek,mt8167-hdmi
>>        - mediatek,mt8173-hdmi
>> +      - mediatek,mt8195-hdmi
>>
>>    reg:
>>      maxItems: 1
>> @@ -29,18 +30,12 @@ properties:
>>      maxItems: 1
>>
>>    clocks:
>> -    items:
>> -      - description: Pixel Clock
>> -      - description: HDMI PLL
>> -      - description: Bit Clock
>> -      - description: S/PDIF Clock
>> +    minItems: 4
>
>Drop minItems, it's not needed when equal to maxItems.
>
>> +    maxItems: 4
>>
>>    clock-names:
>> -    items:
>> -      - const: pixel
>> -      - const: pll
>> -      - const: bclk
>> -      - const: spdif
>> +    minItems: 4
>
>Drop minItems, it's not needed when equal to maxItems.
>
>
>> +    maxItems: 4
>>
>>    phys:
>>      maxItems: 1
>> @@ -58,6 +53,9 @@ properties:
>>      description: |
>>        phandle link and register offset to the system configuration registers.
>>
>> +  power-domains:
>> +    maxItems: 1
>> +
>>    ports:
>>      $ref: /schemas/graph.yaml#/properties/ports
>>
>> @@ -86,9 +84,50 @@ required:
>>    - clock-names
>>    - phys
>>    - phy-names
>> -  - mediatek,syscon-hdmi
>>    - ports
>>
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: mediatek,mt8195-hdmi
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: APB
>> +            - description: HDCP
>> +            - description: HDCP 24M
>> +            - description: Split HDMI
>> +        clock-names:
>> +          items:
>> +            - const: hdmi_apb_sel
>> +            - const: hdcp_sel
>> +            - const: hdcp24_sel
>> +            - const: split_hdmi
>> +
>> +      required:
>> +        - power-domains
>> +    else:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Pixel Clock
>> +            - description: HDMI PLL
>> +            - description: Bit Clock
>> +            - description: S/PDIF Clock
>> +
>> +        clock-names:
>> +          items:
>> +            - const: pixel
>> +            - const: pll
>> +            - const: bclk
>> +            - const: spdif
>> +
>> +      required:
>> +        - mediatek,syscon-hdmi
>> +
>>  additionalProperties: false
>>
>>  examples:
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>> new file mode 100644
>> index 000000000000..2dc273689584
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Mediatek HDMI DDC for mt8195
>> +
>> +maintainers:
>> +  - CK Hu <ck.hu@mediatek.com>
>> +  - Jitao shi <jitao.shi@mediatek.com>
>> +
>> +description: |
>> +  The HDMI DDC i2c controller is used to interface with the HDMI DDC pins.
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
>
>Unless you expect it to grow, I propose to drop clock-names. It's not
>useful when the name is the same as name of hardware.
>
>Best regards,
>Krzysztof
>

Thx for your suggestions, I'll apply them in v4.

Thx,
Guillaume.

