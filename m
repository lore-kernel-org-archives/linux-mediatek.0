Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23693C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 18:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OA1U7eRtm/NuVJSSdLNeSvW/iGxVfFNKNQ+SAkY8pNo=; b=4EkOFZY8nAgeRl
	J/UgoSxTRkY1jOkFFIGT9JgR7xaBH6l/g2RUkLObr6U1FOD1zUpoaxxgv6ImgOyIxCmaUglai84XB
	00d9L6/b9CrLWPm2T8MFdp/7jElwc8DzC+UkE1gfpDHZkuKNZjXJ6y7OfUQwqhf80p2yEnKBNo169
	IF7UJJVbAI4mYJISwpjawA3S/zNxYSL0CHewjd5qyKN/gUwnA5OP1YZ+3lG4xfvhK181uhFlRPefZ
	+w+4t/14F61cjtyLFFmLO0qf6EtrVSLrdXHX4pahpgq+0u5BoeV3vRsL52AW8JJKV7wzGG9rLRIFz
	4Sb7nFTHSrUUwxrOO50Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRIYD-001GPy-Jr; Mon, 07 Mar 2022 18:57:45 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRIY8-001GNh-Hx
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 18:57:42 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E63963F5FC
 for <linux-mediatek@lists.infradead.org>; Mon,  7 Mar 2022 18:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646679458;
 bh=Xy6MdIJ1JZ9Av676oic2sRFwBOpZq/tlPRFQIZOvVVo=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=OtsZTwD9V7qZQhhpi8qZHK4TZRSt3ziz5bUtLWbLg8IB93fsqwP//7dZMmqcp3M1h
 cAZI6+xm/1jmH5THleTrYsksaSDiMX7dYZDMHnROaWGSf87KQfWg+qWZSwiWFzn4qS
 I79nK3Q28V4u+4x3aiD/PdEuIYXTnlTJ122ZGDPwUixnP0E85Iy0zMLQyrObAsBDIr
 7PgMlK/jOQAIKPJ2dxHInA0Dxat6hjrjdQOhZjUNh/6oivdgf89zzAXsYnUJb/YlKB
 SK7F+1vt/Onm7TAUFFqEcud6crXZBifpNHYjvDe1EAs8Ld+udCDLOsxGbOaI6D1dxq
 MTRlfzf+ohDLw==
Received: by mail-ed1-f70.google.com with SMTP id
 r9-20020a05640251c900b00412d54ea618so9109068edd.3
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 10:57:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Xy6MdIJ1JZ9Av676oic2sRFwBOpZq/tlPRFQIZOvVVo=;
 b=Yuwj0G23XXtCfSEdCQasu/Hdnue2eKXMvMqxlOa255JycDHJgLqAy5ws/9pmNf7L3x
 m+QvQAlZmktOPWQiwYiBjIxrVpv4S7yt2xQ+ldDkX67Z+pp9QwqbuFoyEASM4Qj0OpGx
 S4aD2JNt7NR1+oj9IIZI8wfvv4vhwW3TDFOv25yPgvVSYpdKEvLpsOXlreX7ZkAkQGvi
 3faNOJFaeV0aQ9Zy77Xz2QwqbvTMzBoHGSKTb91iUJ9XZbw+6SOtJAkJUrYHmn9yT28N
 JORgDn2gKoP5gP4jw5APbI4jZJTg5aXIHLPRl1c9no9+PnEgnrB444JrCQZhYb+yJRax
 LwlQ==
X-Gm-Message-State: AOAM532/UbI8BL4EPESpK/xdkxaJRXjeVhrS1f/gSRJAeGI58tBRLHEI
 pMzcLyswVVQUL6odm2Okwm8T/RnggfI6HAvyaYHJ8Fd00w9/d/dfIjNdcNQ4ta65vvESr5IsWzA
 pp7uPkiptjbk068/WWAWcAqMXk84JmfD00AGwKmgab7F39T912g==
X-Received: by 2002:a17:907:9622:b0:6db:a30:8bb8 with SMTP id
 gb34-20020a170907962200b006db0a308bb8mr8103677ejc.475.1646679458576; 
 Mon, 07 Mar 2022 10:57:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbw5jzHRiBUPGzW87WJtQ5FkmPc5d1NjPaESWeFD6YzdTpSqPNUVHDARbSb6sfuT75Z3pO8g==
X-Received: by 2002:a17:907:9622:b0:6db:a30:8bb8 with SMTP id
 gb34-20020a170907962200b006db0a308bb8mr8103654ejc.475.1646679458293; 
 Mon, 07 Mar 2022 10:57:38 -0800 (PST)
Received: from [192.168.0.143] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 fx13-20020a170906b74d00b006da9e406786sm4598892ejb.189.2022.03.07.10.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 10:57:37 -0800 (PST)
Message-ID: <ee98d248-b2cd-e975-84df-448917a79287@canonical.com>
Date: Mon, 7 Mar 2022 19:57:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] dt-bindings: cpufreq: mediatek: transform
 cpufreq-mediatek into yaml
Content-Language: en-US
To: Tim Chang <jia-wei.chang@mediatek.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, fan.chen@mediatek.com,
 louis.yu@mediatek.com, roger.lu@mediatek.com, Allen-yy.Lin@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
References: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
 <20220307122151.11666-2-jia-wei.chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220307122151.11666-2-jia-wei.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_105740_865160_22CCB3BC 
X-CRM114-Status: GOOD (  24.76  )
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

On 07/03/2022 13:21, Tim Chang wrote:
> convert Mediatek cpufreq devicetree binding to YAML.

Start with capital letter please.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
> ---
>  .../bindings/cpufreq/cpufreq-mediatek.yaml    | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml

You wrote "convert" but where is the removal of TXT?

> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml
> new file mode 100644
> index 000000000000..584946eb3790
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek CPUFREQ driver Device Tree Bindings

Please remove "driver Device Tree Bindings" because the title should
describe the hardware. Therefore it could be something like "Mediatek
SoC CPU frequency and voltage scaling".

How is it related to cpufreq-mediatek-hw.yaml? The names/title look
unfortunately too similar.

In general this does not look like proper bindings (see also below lack
of compatible). Bindings describe the hardware, so what is exactly the
hardware here?

> +
> +maintainers:
> +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
> +
> +description: |
> +  CPUFREQ is used for scaling clock frequency of CPUs.
> +  The module cooperates with CCI DEVFREQ to manage frequency for some Mediatek
> +  SoCs.
> +
> +properties:

How is this schema going to be applied? I don't see here select neither
compatible.

> +  clocks:
> +    items:
> +      - description:
> +          The first one is the multiplexer for clock input of CPU cluster.
> +      - description:
> +          The other is used as an intermediate clock source when the original
> +          CPU is under transition and not stable yet.
> +
> +  clock-names:
> +    items:
> +      - const: "cpu"
> +      - const: "intermediate"
> +
> +  operating-points-v2:
> +    description:
> +      For details, please refer to
> +      Documentation/devicetree/bindings/opp/opp-v2.yaml
> +
> +  opp-table: true

You have operating-points-v2. What is this for? Did it exist in original
bindings?

> +
> +  proc-supply:
> +    description:
> +      Phandle of the regulator for CPU cluster that provides the supply
> +      voltage.
> +
> +  sram-supply:
> +    description:
> +      Phandle of the regulator for sram of CPU cluster that provides the supply
> +      voltage. When present, the cpufreq driver needs to do "voltage tracking"
> +      to step by step scale up/down Vproc and Vsram to fit SoC specific needs.
> +      When absent, the voltage scaling flow is handled by hardware, hence no
> +      software "voltage tracking" is needed.
> +
> +  "#cooling-cells":
> +    description:
> +      For details, please refer to
> +      Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml

Skip description, it's obvious. Instead add here const with value.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
