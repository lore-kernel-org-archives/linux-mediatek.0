Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9DDC54798
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Feb 2024 18:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6+MUuGb2zmEv5DAM4fS96IcXlW7pM5/kqGwRmxcUuE=; b=YIu0BQGmnyK8uMDxkD481CFwgt
	tDo11Yt1QfTtONzJMTJz+QwrqpofP0AVcmFKKUVs41zjRd2OUdMyUxfVlykHkCf8Rj8bxBgP3BdRM
	Hn+E3BEUJ2xhjLp7ELOnTv/XNRDfESxSAZ4i3RIn3ZWx6mb8z6cyJuMEBlkEHeP3LWVZ2ua6K6l45
	0rxl/TKnZ1qBzNKME+flgeeqRtgKt7zMsxdiwRH0BTkHXYdmGc49LkgdxyGjI9T92yFzT4zMuHP5w
	SlmH3Grnqio0vDmhBztEvuY7L7gH/WOtIu/0KGCSMQOv4i2R0mT4H19y8W4BEVPXK+vWvCQC7QdUN
	V6u6QfZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf1rT-00000006MB2-19o7;
	Tue, 27 Feb 2024 18:07:27 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf1rQ-00000006M8d-1xoz
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Feb 2024 18:07:26 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7c48fc56752so147122639f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Feb 2024 10:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709057237; x=1709662037; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S6+MUuGb2zmEv5DAM4fS96IcXlW7pM5/kqGwRmxcUuE=;
        b=OY0O+gwIV5KyDsqkktVJjFaU9Y9A83xnwOjSRUWWXh/syCHyPaWNoa6T2qcauSGlj4
         gtiQ2h+HIhyRvaEgsLC9CwD1BmoOSumRocA6O7xow4d3iteboj9fNkerGBo+2IshdSUk
         s7LxsgQxVOOr4mnrcg7jUhnfJ7ATWVe3N8hd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709057237; x=1709662037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6+MUuGb2zmEv5DAM4fS96IcXlW7pM5/kqGwRmxcUuE=;
        b=Y+/8GLVN4gHg86JWoyX02osvMf1syCxCEzI4frKjpB3oArikQHw8CHVPnneYvtSQIn
         JVp9cQVAB3SxWnTbCrrxKJNZI+PWqg1pUBDNNLRq3SlYJjHIol205GfwSFeEkex4beZv
         D5hSiLEAlOZ8ehfHCTHpAaIts8adXVuW2l8xIlN4A6tooc3IDc4Mp/e2JAMJF/JMWlNn
         l4QEvIpP6VJdblOeTrH7NP9+cJSI28c4dZpOoZj7G1EAsnnExZcNO0MJjCE6ukBeXRKA
         LIfIFbQ2VHJt/sGOoj/URIDcpBswPSD29iMBrrPZURcI+0dOctlA945gQ+L7Wj15joko
         r7sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgc8+ZsqHxy+mqmSDpkvcJErhexd7L3B14SGolzi2aDCZfTcpy8oaz7nf2th3kITdUtpEsIMyQUd/D1aOBLXCNRxa5pvfWBdJJWdql+YL5BqqR
X-Gm-Message-State: AOJu0YwB6LyfJaYYyjyczvaMoTqiZXqY0P3px62JygnAnC4qzFLppRGR
	ToHa0+7s+MSwdLAIhXbenhUAcmkdGDGtS7ZOhdU2B5Cso7wuaHaK/OOLttmB7g==
X-Google-Smtp-Source: AGHT+IEQdgN+oxQVY2WhNXlBaGf5tUG6zmnED4R2Bd3ZjsSu6BIoJ+KVjm1A4HgbPn4YL/9IXDzhfA==
X-Received: by 2002:a05:6602:25d5:b0:7c7:c6fe:d216 with SMTP id d21-20020a05660225d500b007c7c6fed216mr6816933iop.15.1709057236921;
        Tue, 27 Feb 2024 10:07:16 -0800 (PST)
Received: from localhost (147.220.222.35.bc.googleusercontent.com. [35.222.220.147])
        by smtp.gmail.com with UTF8SMTPSA id b18-20020a026f52000000b0047477ee4899sm1878140jae.147.2024.02.27.10.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 10:07:16 -0800 (PST)
Date: Tue, 27 Feb 2024 18:07:16 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Yow-shin Liou <yow-shin.liou@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Javier Carrasco <javier.carrasco@wolfvision.net>
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add binding for TI USB8020B hub
 controller
Message-ID: <Zd4k1BlWDz7nmc6o@google.com>
References: <20240227090228.22156-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240227090228.22156-1-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_100724_543800_8925D900 
X-CRM114-Status: GOOD (  19.61  )
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

On Tue, Feb 27, 2024 at 05:02:27PM +0800, Macpaul Lin wrote:
> The TI USB8020B is a USB 3.0 hub controller with 2 ports.
> 
> This initial version of the binding only describes USB related aspects
> of the USB8020B, it does not cover the option of connecting the controller
> as an i2c slave.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../devicetree/bindings/usb/ti,usb8020b.yaml  | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,usb8020b.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml b/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml
> new file mode 100644
> index 000000000000..8ef117793e11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/ti,usb8020b.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI USB8020B USB 3.0 hub controller
> +
> +maintainers:
> +  - Macpaul Lin <macpaul.lin@mediatek.com>
> +
> +allOf:
> +  - $ref: usb-device.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - usb451,8025
> +      - usb451,8027
> +
> +  reg: true
> +
> +  reset-gpios:
> +    items:
> +      - description: GPIO specifier for GRST# pin.
> +
> +  vdd-supply:

There is currently a rework of the onboard_usb_hub driver ongoing to
support the actual names of the supplies, instead of the generic 'vdd-supply':

https://lore.kernel.org/linux-usb/20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net/

I think for new bindings we should wait until this rework is done and the binding
should have the hub specific supply name.

