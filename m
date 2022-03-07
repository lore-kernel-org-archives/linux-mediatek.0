Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FBCC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 16:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GJhqP14adDAES9/hl7v3faSQysvJwBiJmuRd3cBpKdE=; b=xXsJBxnJT9zCxwCR097slI4JB3
	0RK0UWi9Sl2fLNnGHDFJaRNHffEp3PTD+DK7RInNBa0xRxsspTridpp0C2TedKhVKtX3ydrRgvijY
	hhyXJL8bcHV3GoUACySISEfJaydcZctwzzANxmIJicJmCU1OKzfvbk7N2ai7ttNQBoAMX/RFYuDS/
	832PCmpubq/vB2g2B8XUox/NVfdmekZ8LSBK49jsaLG65M1cbeTmZet8LGC3BV09aAhsA4TgOzlux
	vO/EvYa+9iQSD4RHMDFKAWUkajdHtkoTolikulpFdiAncoQ5wRspAquMvQ9xC79Yo3SbeXNpH5Jd1
	pWnaL9dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRG6U-000oaB-6p; Mon, 07 Mar 2022 16:20:58 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRG6R-000oYM-GJ
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 16:20:57 +0000
Received: by mail-pl1-x634.google.com with SMTP id n15so4249000plh.2
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 08:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=iNi/NuJgb3I9MZadAA/nBbNUy0J51g3KZrUkLORkuTg=;
 b=ncIyprolCtNzbtGaI8ZEmcOjRrndbUssGRkZqhTqAq1mncPCxyr8gFUJT+9I8xw3xp
 1KU0CXG+rNCoX6ko4mNtq8RrozoX0C5ZaIoyvWhz5WuIWD848QK3TinrNTgYk2H0pjay
 odWdVM4oK06IhmLm2ZcpZ0v15xUfdR5ZvVuPOnMWX7n6TXe5xpnAyVs3mM72TW+xblVn
 mMYYTaKxcR1doMK9EUB3YFnFb9X+xNpabSffaQfIwXi11CR5PVbT8n/PxmD8rD54BIKV
 YfQWUEZpZHA4EuNW66caBCVzlVAUu4DnBwAO3IJNM7eqAMTnXHCAWIcjn4NKJ8hHT1yf
 E2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=iNi/NuJgb3I9MZadAA/nBbNUy0J51g3KZrUkLORkuTg=;
 b=oPYMzMD80K5QBjbz4ugwqmxo7sKqWLxkP2zdZG7cimf+oduXvoTIqkFG/0YZL2kzZU
 NbNHo3oQcV/J/uiJA3YRHG+ZQqmWHT3AmG0vAvHPeWo6YsuDbaTeLIyEM1U07yFHeTUJ
 DkvK7sZjNrJ0NSLYazBjzBYzQIOZAGpElA7+naKTpcRcPqQDPVwZy683LrQzm/7SB1QD
 Qcr35+k0uBiV+2zQ3a3Z7oP6DpyD5oJq8p2xPWuA3JO4UCmbXAS7YUpS7u8mixoi5rXO
 M+AE9NJEaZbWfOyS/rhcauB0JZ2R8vpavuHnmcuqWagX8EX/XkMhacNGWxXx9BwgnCtm
 eGzw==
X-Gm-Message-State: AOAM533RmDL2/FKbC6ZRi12J02FbgrBh25Y7QAWb3hnNmbdvuDc0UHHV
 ZTOVQhzz629YbThg5y/kp/VDwNEjAHxve+1cdzmfoA==
X-Google-Smtp-Source: ABdhPJwdaWZHVqYQDvsGi1XSWtL8PLKoWQ/6BDdpDRBxtNhslHD57lm6/C7wkiv2yOrgMygpsnOjzpRX6cHmYGRXWVI=
X-Received: by 2002:a17:902:f155:b0:151:8377:9a8e with SMTP id
 d21-20020a170902f15500b0015183779a8emr12909462plb.21.1646670054330; Mon, 07
 Mar 2022 08:20:54 -0800 (PST)
MIME-Version: 1.0
References: <20220307154558.2505734-1-robert.foss@linaro.org>
 <20220307154558.2505734-2-robert.foss@linaro.org>
In-Reply-To: <20220307154558.2505734-2-robert.foss@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 7 Mar 2022 17:20:43 +0100
Message-ID: <CAG3jFytBsDVe6z7QsEZCc2KN4HdyBCZKTQxuc01YUO4m-RkMmQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] Revert "dt-bindings:drm/bridge:anx7625:add vendor
 define"
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, 
 matthias.bgg@gmail.com, robert.foss@linaro.org, xji@analogixsemi.com, 
 hsinyi@chromium.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_082055_588347_D0E46825 
X-CRM114-Status: GOOD (  15.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 7 Mar 2022 at 16:46, Robert Foss <robert.foss@linaro.org> wrote:
>
> This reverts commit a43661e7e819b100e1f833a35018560a1d9abb39.
> ---
>  .../display/bridge/analogix,anx7625.yaml      | 65 +------------------
>  1 file changed, 2 insertions(+), 63 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 1d3e88daca041..ab48ab2f4240d 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -43,70 +43,14 @@ properties:
>    vdd33-supply:
>      description: Regulator that provides the supply 3.3V power.
>
> -  analogix,lane0-swing:
> -    $ref: /schemas/types.yaml#/definitions/uint8-array
> -    minItems: 1
> -    maxItems: 20
> -    description:
> -      an array of swing register setting for DP tx lane0 PHY.
> -      Registers 0~9 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
> -      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
> -      Swing1_Pre2, Swing0_Pre3, they are for [Boost control] and
> -      [Swing control] setting.
> -      Registers 0~9, bit 3:0 is [Boost control], these bits control
> -      post cursor manual, increase the [Boost control] to increase
> -      Pre-emphasis value.
> -      Registers 0~9, bit 6:4 is [Swing control], these bits control
> -      swing manual, increase [Swing control] setting to add Vp-p value
> -      for each Swing, Pre.
> -      Registers 10~19 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
> -      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
> -      Swing1_Pre2, Swing0_Pre3, they are for [R select control] and
> -      [R Termination control] setting.
> -      Registers 10~19, bit 4:0 is [R select control], these bits are
> -      compensation manual, increase it can enhance IO driven strength
> -      and Vp-p.
> -      Registers 10~19, bit 5:6 is [R termination control], these bits
> -      adjust 50ohm impedance of DP tx termination. 00:55 ohm,
> -      01:50 ohm(default), 10:45 ohm, 11:40 ohm.
> -
> -  analogix,lane1-swing:
> -    $ref: /schemas/types.yaml#/definitions/uint8-array
> -    minItems: 1
> -    maxItems: 20
> -    description:
> -      an array of swing register setting for DP tx lane1 PHY.
> -      DP TX lane1 swing register setting same with lane0
> -      swing, please refer lane0-swing property description.
> -
> -  analogix,audio-enable:
> -    type: boolean
> -    description: let the driver enable audio HDMI codec function or not.
> -
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> -        unevaluatedProperties: false
> +        $ref: /schemas/graph.yaml#/properties/port
>          description:
> -          MIPI DSI/DPI input.
> -
> -        properties:
> -          endpoint:
> -            $ref: /schemas/media/video-interfaces.yaml#
> -            type: object
> -            additionalProperties: false
> -
> -            properties:
> -              remote-endpoint: true
> -
> -              bus-type:
> -                enum: [1, 5]
> -                default: 1
> -
> -              data-lanes: true
> +          Video port for MIPI DSI input.
>
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
> @@ -143,9 +87,6 @@ examples:
>              vdd10-supply = <&pp1000_mipibrdg>;
>              vdd18-supply = <&pp1800_mipibrdg>;
>              vdd33-supply = <&pp3300_mipibrdg>;
> -            analogix,audio-enable;
> -            analogix,lane0-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
> -            analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
>
>              ports {
>                  #address-cells = <1>;
> @@ -155,8 +96,6 @@ examples:
>                      reg = <0>;
>                      anx7625_in: endpoint {
>                          remote-endpoint = <&mipi_dsi>;
> -                        bus-type = <5>;
> -                        data-lanes = <0 1 2 3>;
>                      };
>                  };
>
> --
> 2.32.0
>

Signed-off-by: Robert Foss <robert.foss@linaro.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
