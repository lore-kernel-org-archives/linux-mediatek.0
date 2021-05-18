Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627ACC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 14:43:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7E4161059
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 14:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7E4161059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sK56a7YK29kT6vyCNA1sczfl9TPT8UyKg0Y8HdoP0AI=; b=QH/foy52Zpaja6HFM53+FaRqF
	/PFndDgvF7rBIcEHePAC412bIebpfT7jp9+ZHTWfppP5WrCTW56/U0xAF0tAjJconGHR3+u4i1AoO
	/zQYFjD/UZGzBK5EduT+1bH+hst9vuve/yyZHxsfFz9uUpKzrwzTuxEg7k9v7qD/yf+AbSknE0aTm
	gh7yxTwq2qW0Y8phsfWPBP2KEE8c4SghNhpwk/vLxVAhCrjPzA9ND/oxKEpPQ7drMOQ+JkYuSKV3i
	tJy894VYd66tB+TP7XL/W/p1vZcT0+kPAGOciaA9ijNuVd9cd00CylNVRrwO9l4SwIECDEox5zbBE
	WLNIzO//w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj0wS-0015HJ-Ub; Tue, 18 May 2021 14:43:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj0vw-0015BQ-5K
 for linux-mediatek@desiato.infradead.org; Tue, 18 May 2021 14:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=b3DMt2F3yR1S8LhJiSdAhlPcYPUp2f9kxGSREUS+xFY=; b=p650H3ea7k6eMIA8AgUBUcXyb+
 NcpW+xC57LsLkz3jsptma0o1If1ljdcmZH3lEq4cAS2NYYED5uismE0r8jPsd2FLvqIeaZ493Gjzf
 ldSaJbJBhxTP79xxRiyKBp3PWhpxoPDwNnYPULN32WSWF1Z9Pfb341cQ7Ug1EaM+mWWyRQJ4nhm8t
 nU96XaQZiVH8znL2Yfjf1SYdaTyC1+OnBTDVsEC6ooWe3IZM/tLaYXaWovyUCucxqEYBWzpbLisE5
 aY6mP7zC5FP9Gay31UqkEXVOuGKbGn9VGlyRf/6jvOOKfIdw6cfaGMhZ4+NhILDjCN7BvNCevT5eP
 VJzuVcvw==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj0vt-00EjtQ-2K
 for linux-mediatek@lists.infradead.org; Tue, 18 May 2021 14:42:54 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 pf4-20020a17090b1d84b029015ccffe0f2eso1692015pjb.0
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 07:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b3DMt2F3yR1S8LhJiSdAhlPcYPUp2f9kxGSREUS+xFY=;
 b=hrKuPisLxc8CgXd9G6ghQ6FBg4IJtnIX7kOnnpJojVxnuLnLTdp7lfi3kHnxK9dz0+
 v+gfHV/vAujTUbSAZUMzTXMkFkS06vjZKGpIpbupOJ0CQzyDiB9qEwDG9gBbYwNjwB4d
 4/Sf3gbt9uYnMkgDd4vJ4RAplDIoz0rt8sNrsoWPDkLadtBj8lQDAplYoqANqXtRTxxB
 9Uu38T6Ax0+/znT5ex5MKtIhfm+jjo6r6sCDk+5rEXrNF0dGBmJcQq2cfYm3W6e2PAML
 +bdCUUIS3x+IPNlwCBnwGWge0nKbJeB1ZSjS4dDyFnma0emXEP+2ooA+vRqNc1qdezZ/
 xQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b3DMt2F3yR1S8LhJiSdAhlPcYPUp2f9kxGSREUS+xFY=;
 b=l4mAfufTmDL7VXcR7il+PNMSCy/5h88EcGf+LNq0ClBpxCRvnjNkyUNCKGWxxAotL7
 j0ZQTx4/qY4fH0s93etKX9oRMvM/5HqZdyMlmQjg3a/q+9sF7bHiE2zwKnL7Qb+Ju0y/
 T87wROxD9314FPv1F+O3E046FV8OBjhKZspfGvthkX1+b3pDLPyIlRIyPkiTPKcU1fXN
 +FJjpaxHErq2MfIYdcRWy+C/SWqfuFVNlZmw/lifjrKX1ES0d9gdOrstoqReG/+foLg+
 OKCg38/OSVEVtd6CnjtgRc07Q82EC/OT3YicX3AyYxaQoYDpH+MADU3PPy38s/QRcB5H
 yCeA==
X-Gm-Message-State: AOAM5331btpyc8yqhrtFxsHWT2KbG7d3cZ0aiaaBUgVL63k/sRXxIozB
 8AVyi1HViHMDM0y1FhtdtXU9tIhfbXoIbUPaIH45+Q==
X-Google-Smtp-Source: ABdhPJz6HxDCbuqQzC6kuOWJ/Z4wKk+gxz+hYXy740zOMxhRX6CV1XDh880v/3VEjfhmUyaukGJCeYabreKqbOSypV0=
X-Received: by 2002:a17:90a:e391:: with SMTP id
 b17mr1086553pjz.75.1621348970117; 
 Tue, 18 May 2021 07:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210518141927.24795-1-dafna.hirschfeld@collabora.com>
 <20210518141927.24795-2-dafna.hirschfeld@collabora.com>
In-Reply-To: <20210518141927.24795-2-dafna.hirschfeld@collabora.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 18 May 2021 16:42:38 +0200
Message-ID: <CAG3jFyuu7Vvd3QtKpfVg+uSFB9JJmKOAovxpX_gs=BoBUYuamw@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 1/2] dt-bindings: display: add google,
 cros-ec-anx7688.yaml
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-mediatek@lists.infradead.org, 
 linux-kernel <linux-kernel@vger.kernel.org>, megous@megous.com,
 linux-usb@vger.kernel.org, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, enric.balletbo@collabora.com, 
 Nicolas Boichat <drinkcat@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 kernel@collabora.com, dafna3@gmail.com, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_074253_134732_DE8FAB5A 
X-CRM114-Status: GOOD (  17.17  )
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

Series applied to drm-misc-next.

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=b67f7599c90ae36a5174826132f7690fa13d462c

On Tue, 18 May 2021 at 16:19, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> ChromeOS EC ANX7688 is a display bridge that converts HDMI 2.0 to
> DisplayPort 1.3 Ultra-HDi (4096x2160p60). It is an Analogix ANX7688 chip
> which is connected to and operated by the ChromeOS Embedded Controller
> (See google,cros-ec.yaml). It is accessed using I2C tunneling through
> the EC and therefore its node should be a child of an EC I2C tunnel node
> (See google,cros-ec-i2c-tunnel.yaml).
>
> ChromOS EC ANX7688 is found on Acer Chromebook R13 (elm)
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bridge/google,cros-ec-anx7688.yaml        | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> new file mode 100644
> index 000000000000..9f7cc6b757cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/google,cros-ec-anx7688.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ChromeOS EC ANX7688 HDMI to DP Converter through Type-C Port
> +
> +maintainers:
> +  - Nicolas Boichat <drinkcat@chromium.org>
> +  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> +
> +description: |
> +  ChromeOS EC ANX7688 is a display bridge that converts HDMI 2.0 to
> +  DisplayPort 1.3 Ultra-HDi (4096x2160p60). It is an Analogix ANX7688 chip
> +  which is connected to and operated by the ChromeOS Embedded Controller
> +  (See google,cros-ec.yaml). It is accessed using I2C tunneling through
> +  the EC and therefore its node should be a child of an EC I2C tunnel node
> +  (See google,cros-ec-i2c-tunnel.yaml).
> +
> +properties:
> +  compatible:
> +    const: google,cros-ec-anx7688
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C address of the device.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for HDMI input.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: USB Type-c connector.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c_tunnel_b: i2c-tunnel1 {
> +        compatible = "google,cros-ec-i2c-tunnel";
> +        google,remote-bus = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        anx7688: anx7688@2c {
> +            compatible = "google,cros-ec-anx7688";
> +            reg = <0x2c>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    anx7688_in: endpoint {
> +                        remote-endpoint = <&hdmi0_out>;
> +                    };
> +                };
> +                port@1 {
> +                    reg = <1>;
> +                    anx7688_out: endpoint {
> +                        remote-endpoint = <&typec_connector>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> --
> 2.17.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
