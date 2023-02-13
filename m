Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA353C636CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 09:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xp1f1ClZNE5cUv+RX5qXmus2twTBsJN6syezVKx0s8=; b=jjVJe+oYv5r/9mOLVqI4+fyYx4
	oLgqWx2GjSyOl56G9laY4W7IMtwn+wyG8rT8q14xgLIRbN2XP2LQheWPeIhfAG05101PKFgHJ5PrW
	37F7XIFYJu2YhpLR2iSinweCsouci1xIU+7nxpE3Q3bWV7uJ8uzO7zji6k0i+8ZhiUaGsvyW6h6iQ
	wPU5T2hv5FPS6/WlTqcbhdntnX6dRH5rcFdEXnhqAJKS0dlAy/gHJqbNnXbnSDZkxL+V/5eyYjO8P
	V4os1oN4HZINIAXL2fob8LJm3QPrjA8ZKZpmQN9mRN5uM2KHbObQFB2KeBzZv0XqfS6uME3UhEFzY
	9Ufy03uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRUwl-00DmJP-2m; Mon, 13 Feb 2023 09:16:27 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRUwT-00DmCb-DX
	for linux-mediatek@lists.infradead.org; Mon, 13 Feb 2023 09:16:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id z13so8212877wmp.2
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Feb 2023 01:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9xp1f1ClZNE5cUv+RX5qXmus2twTBsJN6syezVKx0s8=;
        b=gcbQXNr/KgUkr+MrCgtpoSl9reVna7vb/KY4TcMjsqFt/uWfsOL+8VIv2kZFKAXN3/
         ZlZlTHynJeVoKi68H0wu5ITc4AO/Svn+DI0Es9LPe2rscNPaP/gisgAKc8I+Y+u8yXjp
         Bspc3cmrubzquX7CXdLtwyJ36ToCCRha9jnQN/HgwLMD2rdvGoo76c4x/5fdIgdxzMVZ
         agjQizRF6fEz5wXSvW7YyH52Af9NHdREcYdF1yY9oetUI9EYS1DwuBeoHq6u096lZIuG
         uuk9dzCc/ScvyP0EZ3P42OtXomXJ+H9aqR9LQph/KmjT0mV12bWmrR5YaGgn2GT6PE4i
         QQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9xp1f1ClZNE5cUv+RX5qXmus2twTBsJN6syezVKx0s8=;
        b=oLafaGXma3LCVFGsdxSgzX5fwhcXl0IOxB9U8auatgRk63FQ7AjbeQzcm6H1CqQrqJ
         rZUqXCivjVplH5gFsnenFd5mBnt3MJncG7RISKe4rwUbkr9Vs5kfDJd6iwJIV0V1jM8Q
         MKnXQ9oJ949u4HqsHZsV20kIKLW7f6rECjCqPizO3c0E5lk7ypLNDqpB8KHYF02kWXrp
         +F3wGkHcPYt0DmcfyFhkM4ZQNahztJoMThM0SprdsATqLpBjNyfkATvKRTXQrhh3sGEj
         uYoDYhuKscnsqN/BODWg4JfNZtbbMznA+KFUPw9H2GaCfztuxakoPOlnKReITNoN4yfS
         WcUA==
X-Gm-Message-State: AO0yUKU3HVXXrpuFb6CQ7ZXW5JTk7FLu3YuWVBqmgbTjQWM9cl+IDb1u
	OJmD5x5ACXPQoyrbrFvf3x5sPw==
X-Google-Smtp-Source: AK7set+GGl89xH8tiPOhMxaLDcaC7fVDbIk2ilrwvdd78yp4famGjU6z+o38lQ5t4v7j0eO3JvzD1w==
X-Received: by 2002:a05:600c:340a:b0:3dc:45a7:2b8a with SMTP id y10-20020a05600c340a00b003dc45a72b8amr18539198wmp.10.1676279767343;
        Mon, 13 Feb 2023 01:16:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k7-20020a05600c080700b003daf672a616sm12678568wmp.22.2023.02.13.01.16.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:16:06 -0800 (PST)
Message-ID: <25572962-32ad-3175-e4b2-1d13eba45126@linaro.org>
Date: Mon, 13 Feb 2023 10:16:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 03/12] dt-bindings: arm: mediatek: sgmiisys: Convert to
 DT schema
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, John Crispin <john@phrozen.org>,
 Felix Fietkau <nbd@nbd.name>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang <dqfext@gmail.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Jianhui Zhao <zhaojh329@gmail.com>, =?UTF-8?Q?Bj=c3=b8rn_Mork?=
 <bjorn@mork.no>
References: <cover.1676128246.git.daniel@makrotopia.org>
 <6ea4483df9720a209462bd163d7f7e406d14053c.1676128246.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6ea4483df9720a209462bd163d7f7e406d14053c.1676128246.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_011610_037358_CEEA9525 
X-CRM114-Status: GOOD (  17.57  )
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

On 11/02/2023 17:02, Daniel Golle wrote:
> Convert mediatek,sgmiiisys bindings to DT schema format.
> Add maintainer Matthias Brugger, no maintainers were listed in the
> original documentation.
> As this node is also referenced by the Ethernet controller and used
> as SGMII PCS add this fact to the description.
> 
Thank you for your patch. There is something to discuss/improve.

> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.yaml
> new file mode 100644
> index 000000000000..99ceb08ad7c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,sgmiisys.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes from both.

> +
> +title: MediaTek SGMIISYS Controller
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description:
> +  The MediaTek SGMIISYS controller provides SGMII related clocks to the system
> +  and is used by the Ethernet controller as SGMII PCS.
> +
> +properties:
> +  $nodename:
> +    pattern: "^syscon@[0-9a-f]+$"

Drop nodename, we do not require it per binding.

> +
> +  compatible:
> +    oneOf:

Drop oneOf, unless you plan to use it soon?

> +      - items:
> +          - enum:
> +              - mediatek,mt7622-sgmiisys
> +              - mediatek,mt7629-sgmiisys
> +              - mediatek,mt7986-sgmiisys_0
> +              - mediatek,mt7986-sgmiisys_1
> +          - const: syscon
> +


Best regards,
Krzysztof


