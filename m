Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0E1C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 21:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kx30NfCuoE4f7StDUBIgetC5cDSRTgNlQVxRoAeQXM=; b=ugxPczZgJOTYMX
	KCEQV4NxXvs651KQjU5Qxw0vSmeNxNa7/vLwNjSVGSriqyIg5AVPKOPQol9QWnojH5FaeoqBIztXo
	X/bwgmM74VzOzDxAZQOGmuqpV66fB0TcPqK7Zqwc8tdhVnlyNa6xMDo68h7AjshuSSEZSFinDxRF+
	fV6ZQkOj28JhqzcASwvxozfc5HLxLPXXjEq+uU9VeQhoSShsCLqLo11HZ8dw1C9qf3y7MK2LJp0Tl
	4YNubvULpoTaWWWwZuIqGH3/Q2336M5aTUe52egDG0eie0x/kUsO1lCLu8B2ka/meiF6Q1WIIRsEk
	vNC079jvh+3kAmsqqp1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRL82-001ex2-1Y; Mon, 07 Mar 2022 21:42:54 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRL7y-001ewC-Qe
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 21:42:52 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 134053F7E3
 for <linux-mediatek@lists.infradead.org>; Mon,  7 Mar 2022 21:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646689368;
 bh=MhNMfDbHr8DyNFMUPNwO39VGUJ2PygUUS2WxU9QRbWs=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=j7UA/72aChWwwyrSM5SeodvG2O8hOb1j0l/vXCSe85DNuUWXm/0POtwWD7kOqpo40
 wr4N9UJr4k4dmTln3U+BsjW+yWbxRes6LOpSZEhnFFkDwRON7toxmgn7UeTk7EZ+s4
 LDPECfarZzm4WUUlagn1sB6NN3GDP5hLBs9bDHjqId7/HrThMf4BAj8lctx6CBsMBG
 0TORM93RHhYd8olIurjGRwCE061fLLolhwMUasiuuy6AluNjzLzbK68Rsaw0A1aUGp
 jnaVKYPZv3blDKZ4tN0NVxQnXCrI+2NszBiV8BOsYYWAFol++/Y+/CdMktGgWk0sve
 jXAwHuho+z5sA==
Received: by mail-ed1-f71.google.com with SMTP id
 cm27-20020a0564020c9b00b004137effc24bso9408450edb.10
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 13:42:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MhNMfDbHr8DyNFMUPNwO39VGUJ2PygUUS2WxU9QRbWs=;
 b=QKnRNGYywDSxAeFby1wzXzBELFHaZ0jA5y0JGjhzwl9kcL1fAs7pHJyz/PYwdsaL7L
 OPBo5hr3oqEood0ZUQj/RRVdcr6PM45UkeR8Np1gug9h2J/VLbD30XyFFmuzjMumG0lA
 KguCo8aMGxkdzmgDUfnA7zDX+NucJ0YHnGNBLetq+ZefGVqJFh9qNGdVlEok62e7H6Cl
 ID1vYEvI7rBmVAWBvccd/6RQScKR/vs2dwR13Nr3L7UCsrHZTZ8u5ChfxwIClcBBPLIT
 +IEXPofC6Z1wxjuEN6f69//aNvOy5nw7ULyR47rrxOqfbpPZH2ERFW2B1JwdJCAh3RrS
 XqeQ==
X-Gm-Message-State: AOAM532L8DDBw8tg14VSeFbWtNch7F2dUCdVbZTw7yGOeCQv/VjW/BpI
 yyqaeGqXunI5TbZ0Me7Ee2RVSJtXVrGMhfGQOsIKoJG5VVfQLeWGumdvSrMIqXpbr9o74P7QU8f
 RDmmWYfLOIKN4i+ANYisUvsEldw2BcZ11snpBHIHU43RbwqY7qg==
X-Received: by 2002:a17:907:60ca:b0:6da:8f25:7983 with SMTP id
 hv10-20020a17090760ca00b006da8f257983mr10532846ejc.106.1646689367237; 
 Mon, 07 Mar 2022 13:42:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYdGvNdcQTcQgY1xPFW9oHn64MaAA5xJnmohahgMntl3auBJxf8s7T1mVacTWUqEeHAeQ7HA==
X-Received: by 2002:a17:907:60ca:b0:6da:8f25:7983 with SMTP id
 hv10-20020a17090760ca00b006da8f257983mr10532814ejc.106.1646689366933; 
 Mon, 07 Mar 2022 13:42:46 -0800 (PST)
Received: from [192.168.0.143] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 x1-20020a05640226c100b0041668b404basm234923edd.0.2022.03.07.13.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 13:42:45 -0800 (PST)
Message-ID: <bf418e08-2e32-5e61-abd8-abb0d8f5c080@canonical.com>
Date: Mon, 7 Mar 2022 22:42:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] dt-bindings: devfreq: mediatek: add mtk cci devfreq
 dt-bindings
Content-Language: en-US
To: Tim Chang <jia-wei.chang@mediatek.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, fan.chen@mediatek.com, louis.yu@mediatek.com,
 roger.lu@mediatek.com, Allen-yy.Lin@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
References: <20220307122513.11822-1-jia-wei.chang@mediatek.com>
 <20220307122513.11822-2-jia-wei.chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220307122513.11822-2-jia-wei.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_134251_105968_2E87D60A 
X-CRM114-Status: GOOD (  26.10  )
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

On 07/03/2022 13:25, Tim Chang wrote:
> add devicetree binding of mtk cci devfreq on MediaTek SoC.

Start with capital letter.

> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>

This does not match your From. Please fix this in all your submissions.

> ---
>  .../devicetree/bindings/devfreq/mtk-cci.yaml  | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/devfreq/mtk-cci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/devfreq/mtk-cci.yaml b/Documentation/devicetree/bindings/devfreq/mtk-cci.yaml
> new file mode 100644
> index 000000000000..e64ac4c56758
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/devfreq/mtk-cci.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/devfreq/mtk-cci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Cache Coherent Interconnect (CCI) Devfreq driver Device Tree Bindings

Similarly to your other patches - the title describes hardware. Please
fix it in all your submissions of all your series.

Remove "driver Device Tree Bindings". "Devfreq" is Linuxism, so this
maybe "bus frequency scaling"? Although later you call the device node
as cci.

> +
> +maintainers:
> +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
> +
> +description: |
> +  This module is used to create CCI DEVFREQ.
> +  The performance will depend on both CCI frequency and CPU frequency.
> +  For MT8186, CCI co-buck with Little core.
> +  Contain CCI opp table for voltage and frequency scaling.

Half of this description (first and last sentence) does not describe the
actual hardware. Please describe hardware, not driver.

> +
> +properties:
> +  compatible:
> +    const: "mediatek,mt8186-cci"

No need for quotes.

> +
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
> +      - const: "cci"
> +      - const: "intermediate"

No need for quotes.

> +
> +  operating-points-v2:
> +    description:
> +      For details, please refer to
> +      Documentation/devicetree/bindings/opp/opp-v2.yaml
> +
> +  opp-table: true

Same comments as your CPU freq bindings apply.

> +
> +  proc-supply:
> +    description:
> +      Phandle of the regulator for CCI that provides the supply voltage.
> +
> +  sram-supply:
> +    description:
> +      Phandle of the regulator for sram of CCI that provides the supply
> +      voltage. When present, the cci devfreq driver needs to do
> +      "voltage tracking" to step by step scale up/down Vproc and Vsram to fit
> +      SoC specific needs. When absent, the voltage scaling flow is handled by
> +      hardware, hence no software "voltage tracking" is needed.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - operating-points-v2
> +  - proc-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8186-clk.h>
> +    cci: cci {

Node names should be generic and describe type of device. Are you sure
this is a CCI? Maybe "interconnect" suits it better?

> +      compatible = "mediatek,mt8186-cci";
> +      clocks = <&mcusys CLK_MCU_ARMPLL_BUS_SEL>, <&apmixedsys CLK_APMIXED_MAINPLL>;
> +      clock-names = "cci", "intermediate";
> +      operating-points-v2 = <&cci_opp>;
> +      proc-supply = <&mt6358_vproc12_reg>;
> +      sram-supply = <&mt6358_vsram_proc12_reg>;
> +    };


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
