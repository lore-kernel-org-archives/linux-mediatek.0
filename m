Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38519C47074
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Jan 2024 18:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKyStk0haCbQVEo8Al8QRs15264C+ZMsxxJKHUPR7Pc=; b=qhuAoZl9Oem0rc5nKDmT88jLyh
	zGK3t7O4owHSpeyxYyJW2wKSPUYeqm4Gu9ECAPfeHBJwN2rXe0S0J/eYLajbPsAdb9KcGeUBq5OJL
	f47rCLW+54UBFyZ6ZolKZupo/8f+v8eDd/0gRsum5z2VVRjIOz2/eVHdplm48SeZ2Q7dN8hfwFp8C
	IGxDc6rfFbScP4qiQx6N73Np+pO1I1wnZ2vSqHf6GuTLvZoKB5QPLLsh5ZGhQzxn0OLK3zmFJs4rx
	pdXlh1RRQgguoIMMf4LzHPPM88uGToO9tLEuBNOFnM2aavgn0/r30bO0+Hds2n6MruvqVLp2nMI3E
	i5JCJhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMXS1-003L4I-1k;
	Sun, 07 Jan 2024 18:00:45 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMXRx-003L2d-0i;
	Sun, 07 Jan 2024 18:00:43 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40d5a41143fso13894085e9.3;
        Sun, 07 Jan 2024 10:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704650438; x=1705255238; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PKyStk0haCbQVEo8Al8QRs15264C+ZMsxxJKHUPR7Pc=;
        b=i8V2BXJQqP6btl+rvEL0ZA07rfnkIAv8EhAs6YLuxCrKBf+JybEuHGvKNCGfq4ZeeF
         VRkljPDOTb8Md3SeY6iIVnXpdxnM4Vo2lnzyNBOhQF06gFDp0eh9uRTpysOPH9QNuPh4
         BcH8quzZx/346m+rcVq090DDkFtj3+MZgbaRtw1OATUzxF65OxlJ038S808+5fjehpQ4
         C3C8YPR2g+a93sV8ANfJof3hO+q2owlWdQyj+ubOYG5Z0GXMjYT2B58dEqcRMRszMZEu
         Zj0XMsctKiy9YyFgqiEsaljL3IpoYj4i+UlxHNXJP+Z0kOIiqs7L5ghLmzAVB4lCw0/Z
         quPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704650438; x=1705255238;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PKyStk0haCbQVEo8Al8QRs15264C+ZMsxxJKHUPR7Pc=;
        b=nkmBMaOBpmtS9kCoYIwyrwB39XsjOtEOmmc8fvGmbsMHOMR9l51gBSKjasBL0PhPOA
         dMV+ouFw/LHhSwCCsBy6WpiCSbJwpQou4akvX28xxYPYPCB8NxB8Wlo6XL7bqBaRJunu
         JvrxLxyQuesypXaCGVsoi04seqESYUQLYf8RzklW5GD65iAtm1B/VxWQnS3xLWRbt0eX
         b7Z3gtnh6feI7RkOOnebvAA8TTBtQOdGNAgY3Yfka/YJsZqKJH3kw77000V0CzxMCnGT
         E7b1+mehbuv5zL57gC3wwxNSk4arJuuZVzyLJ5ljj1moAa1UeTxhHUuFFGe3FSCiazW+
         WJJA==
X-Gm-Message-State: AOJu0YyUzx/40/dPplOKgGBZguQ8xxxkm5L5xRUfHOtPbNGJDMzE0VsJ
	kn4oWeoIhmW8mI/ghYgBhwY=
X-Google-Smtp-Source: AGHT+IGhqqCvDdoBIyU84SWyNgbazpRv9+3/tHjLax2Xn+swSXh47IxcWIaFtdx7zrKMSJxkodAKfQ==
X-Received: by 2002:a05:600c:a05:b0:40d:9237:dada with SMTP id z5-20020a05600c0a0500b0040d9237dadamr1376192wmp.103.1704650437606;
        Sun, 07 Jan 2024 10:00:37 -0800 (PST)
Received: from [192.168.0.3] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id u12-20020a5d434c000000b0033761b2de64sm3547257wrr.76.2024.01.07.10.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jan 2024 10:00:37 -0800 (PST)
Message-ID: <0926ea46-1ce4-4118-a04c-b6badc0b9e15@gmail.com>
Date: Sun, 7 Jan 2024 20:00:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH RFC v3 1/8] dt-bindings: net: document ethernet
 PHY package nodes
Content-Language: en-US
To: Christian Marangi <ansuelsmth@gmail.com>,
 Robert Marko <robert.marko@sartura.hr>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-2-ansuelsmth@gmail.com>
Cc: Luo Jie <quic_luoj@quicinc.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <20231126015346.25208-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_100041_276468_079D7246 
X-CRM114-Status: GOOD (  27.20  )
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

Hi Christian and Robert,

thank you for this great work!

Let me ask a couple of questions regarding the phy package conception. 
Please find them below.

On 26.11.2023 03:53, Christian Marangi wrote:
> Document ethernet PHY package nodes used to describe PHY shipped in
> bundle of 4-5 PHY. The special node describe a container of PHY that
> share common properties. This is a generic schema and PHY package
> should create specialized version with the required additional shared
> properties.
> 
> Example are PHY package that have some regs only in one PHY of the
> package and will affect every other PHY in the package, for example
> related to PHY interface mode calibration or global PHY mode selection.
> 
> The PHY package node MUST declare the base address used by the PHY driver
> for global configuration by calculating the offsets of the global PHY
> based on the base address of the PHY package and declare the
> "ethrnet-phy-package" compatible.
> 
> Each reg of the PHY defined in the PHY package node is absolute and will
> reference the real address of the PHY on the bus.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>   .../bindings/net/ethernet-phy-package.yaml    | 75 +++++++++++++++++++
>   1 file changed, 75 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> new file mode 100644
> index 000000000000..244d4bc29164
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ethernet-phy-package.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ethernet PHY Package Common Properties
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description:
> +  This schema describe PHY package as simple container for
> +  a bundle of PHYs that share the same properties and
> +  contains the PHYs of the package themself.
> +
> +  Each reg of the PHYs defined in the PHY package node is
> +  absolute and describe the real address of the PHY on the bus.
> +
> +properties:
> +  $nodename:
> +    pattern: "^ethernet-phy-package(@[a-f0-9]+)?$"
> +
> +  compatible:
> +    const: ethernet-phy-package
> +
> +  reg:
> +    minimum: 0
> +    maximum: 31
> +    description:
> +      The base ID number for the PHY package.
> +      Commonly the ID of the first PHY in the PHY package.
> +
> +      Some PHY in the PHY package might be not defined but
> +      still exist on the device (just not attached to anything).
> +      The reg defined in the PHY package node might differ and
> +      the related PHY might be not defined.
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  ^ethernet-phy(@[a-f0-9]+)?$:
> +    $ref: ethernet-phy.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    mdio {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ethernet-phy-package@16 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            compatible = "ethernet-phy-package";
> +            reg = <0x16>;
> +
> +            ethernet-phy@16 {
> +              reg = <0x16>;
> +            };
> +
> +            phy4: ethernet-phy@1a {
> +              reg = <0x1a>;
> +            };
> +        };
> +    };

So, we ended up on a design where we use the predefined compatible 
string 'ethernet-phy-package' to recognize a phy package inside the 
of_mdiobus_register() function. During the V1 discussion, Vladimir came 
up with the idea of 'ranges' property usage [1]. Can we use 'ranges' to 
recognize a phy package in of_mdiobus_register()? IMHO this will give us 
a clear DT solution. I mean 'ranges' clearly indicates that child nodes 
are in the same address range as the parent node. Also we can list all 
child addresses in 'reg' to mark them occupied.

   mdio {
     ...

     ethernet-phy-package@16 {
       compatible = "qcom,qca8075";
       reg = <0x16>, <0x17>, <0x18>, <0x19>, <0x1a>;
       ranges;
       ...

       ethernet-phy@16 {
         reg = <0x16>;
       };

       ethernet-phy@1a {
         reg = <0x1a>;
       };
     };
   };

Did you find some issues with the 'ranges' conception?


And I would like to ask you about another issue raised by Vladimir [1]. 
These phy chips become SoC with all these built-in PHYs, PCSs, clocks, 
interrupt controllers, etc. Should we address this now? Or should we go 
with the proposed solution for now and postpone modeling of other 
peripherals until we get a real hardware, as Andrew suggested?

I'm asking because it looks like we have got a real hardware. Luo 
currently trying to push QCA8084 (multi-phy/switch chip) support, and 
this chip exactly contains a huge clock/reset controller [2,3].


1. https://lore.kernel.org/lkml/20231124165923.p2iozsrnwlogjzua@skbuf // 
Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet PHY 
package nodes
2. 
https://lore.kernel.org/lkml/20231215074005.26976-1-quic_luoj@quicinc.com 
  // [PATCH v8 00/14] add qca8084 ethernet phy driver
3. 
https://lore.kernel.org/lkml/20231104034858.9159-1-quic_luoj@quicinc.com 
  // [PATCH v12 0/4] add clock controller of qca8386/qca8084

--
Sergey

