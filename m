Return-Path: <SRS0=2t6o=GD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0325C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 15:44:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44832207C8
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 15:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44832207C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HQyyGEr5U/PiXhUS22Z0qYVhp1sK2iRrTbxp7TOD3kE=; b=DcirgqxYYCmdIVL50r+FiAeAS
	UT2rFN2ThWAGsWVeb5qnZYP7XXHL5bXb1tyZuc70QLB1uEmx7CCCWcyT3UmHwFsSrooC8bUIpTTy0
	LmA8CRrUg5YeGrw6f/HvhrZMujyfxfkqNXMFRu0tZoogbToANSeD7O6si5Z/2mr55T+QHAFrHBUnV
	BkO2YfoZvG/JlgpeSkepG6/aYp5nXbmZQCo9hQnCnGM5jA1/4deyiAWUsNz81e73HT83WLH2bfn0s
	QWF3hqKSEATBTzNutkzzz70Di/SOZD9KQC2XufluJrdZZL7nRZ+XiNUvnDlCwmNN64TrDHXVbAaws
	BLdaFOyZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kv07T-0001UL-9l; Thu, 31 Dec 2020 15:44:07 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kv07P-0001Te-PZ; Thu, 31 Dec 2020 15:44:04 +0000
Received: by mail-oi1-f169.google.com with SMTP id d203so22182200oia.0;
 Thu, 31 Dec 2020 07:44:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cY0/B8d4jVkdNyYDuXSgudpiPHLVy6pOgXUesN4v88o=;
 b=H5b0N9kN8KyczDVHOXxQ/FbAcdubNXKRdCSxF8aNceOo/oLFn8vv+R6X5msx6jZcZF
 47knvC46Ruuc8pkzi+MOzB/sQr57BPc4ujh/UaTpyvB/jjmiGYt4BWbh/Uvk1MrP+jlo
 bsv9RVLjWdv9qa8hQ5cogkn1RrI+kHaW/QBxI5euZ0arYlQwMUluZyewmRjgY3IBi0rP
 kEVrtIfansN0IxFKlVbWXaD3E9xACkG/1haI51sPM4zzCV9nbvCgdCLcTSciyJ4XUYVo
 R5wWkGFKU6t5/oY53GajwyJAVCCglwHB636X5eZvAohJ6oY+kZlEhr5+9h2UXuBG72d4
 gmkg==
X-Gm-Message-State: AOAM531YbXzaUczcstHlwuaIzOG5/WcYQNjGtvnPsVbzpYjn3Rl4hYL9
 LIhbjxRAiE5273KMJUvMUA==
X-Google-Smtp-Source: ABdhPJyfHYCwbjFtiLzrwArTkpQhp8K/FJcjLw0PXOJNAAPOP5x2y/0CZRhGzl6PudDcGsAn/mlESw==
X-Received: by 2002:aca:ab8c:: with SMTP id u134mr8517925oie.15.1609429442997; 
 Thu, 31 Dec 2020 07:44:02 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id g21sm11349439otj.77.2020.12.31.07.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 07:44:02 -0800 (PST)
Received: (nullmailer pid 1843013 invoked by uid 1000);
 Thu, 31 Dec 2020 15:44:00 -0000
Date: Thu, 31 Dec 2020 08:44:00 -0700
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: regulator: document binding for
 MT6315 regulator
Message-ID: <20201231154400.GA1840028@robh.at.kernel.org>
References: <1608725624-30594-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1608725624-30594-2-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608725624-30594-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_104403_844808_A88AB95B 
X-CRM114-Status: GOOD (  18.18  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 srv_heupstream@mediatek.com, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 23, 2020 at 08:13:42PM +0800, Hsin-Hsiung Wang wrote:
> Add device tree binding information for MT6315 regulator driver.
> Example bindings for MT6315 are added.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../bindings/regulator/mt6315-regulator.yaml  | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
> new file mode 100644
> index 000000000000..15ce83a36174
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mtk,mt6315-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6315 Regulator
> +
> +maintainers:
> +  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> +
> +description: |
> +  The MT6315 is a power management IC (PMIC) configurable with SPMI.
> +  that contains 4 BUCKs output which can combine with each other
> +  by different efuse settings.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6315-regulator
> +
> +  reg:
> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +    description: List of regulators and its properties
> +
> +    patternProperties:
> +      "^vbuck[1-4]$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^vbuck[1-4]$"
> +            description:
> +              should be "vbuck1", ..., "vbuck4"

The description just repeats what the schema defines. Drop it.

> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - regulators
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmic@6 {
> +      compatible = "mediatek,mt6315-regulator";
> +      reg = <0x6 0 0xb 1>;
> +
> +      regulators {
> +        vbuck1 {
> +          regulator-compatible = "vbuck1";
> +          regulator-min-microvolt = <300000>;
> +          regulator-max-microvolt = <1193750>;
> +          regulator-enable-ramp-delay = <256>;
> +          regulator-allowed-modes = <0 1 2 4>;
> +        };
> +
> +        vbuck3 {
> +          regulator-compatible = "vbuck3";
> +          regulator-min-microvolt = <300000>;
> +          regulator-max-microvolt = <1193750>;
> +          regulator-enable-ramp-delay = <256>;
> +          regulator-allowed-modes = <0 1 2 4>;
> +        };
> +      };
> +    };
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
