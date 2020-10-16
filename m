Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93ACC43457
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 15:38:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D59020848
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 15:38:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="15Pwz4NX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D59020848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WFFQXPs8CO3s7psO7++DyDlLNTTX0NmrzRs2vk4dCPY=; b=15Pwz4NXM4HUbUv7uqQM554YT
	kzmMIWltQTnSg1VRTaK3vR2jYKCfVSi8kfwI9nAinzLhm3XOvYuFWFrZUgPpgzHDHYXpgbGAJo0Jk
	/MIA5LoL3VOi5wU6om7wKJwpFTmIQh1JOOeB8IfmwW2IMNNxPlCPeL1eAibk59Ua0vQ1OL87dGbiS
	2pJUbhXOuwjE5lbZ5kTffvhwYe/fmJWQBkZUOxiprePQ/huCMnrTWxsEyTSkU1H39V4ncTejhebRH
	Vp0ZCR6j0Hv7HBaON89mWjOBP3rAOvSJEoQE/r3nRBUNKBYS8mZi36xdyhy/qNjsTi6SRclb3ffMn
	pBvxzQK4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTRoS-0000aI-R7; Fri, 16 Oct 2020 15:38:36 +0000
Received: from mail-ed1-f68.google.com ([209.85.208.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTRoM-0000YS-4l; Fri, 16 Oct 2020 15:38:31 +0000
Received: by mail-ed1-f68.google.com with SMTP id dg9so2862899edb.12;
 Fri, 16 Oct 2020 08:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l7ooLLyjU79cfl+bt7sttr4E3DYykAdem+WSTdZT84Q=;
 b=spKWVYAEDetOW2dtk4ED46QY5bUW9yMOXal5opHzVRjjTooURjtxoahJNjWsvKH+xj
 S1/sVFhlNSStc5mLAfc3HZ+rg9RyHUizIwk7lVBVt3YjcpG9OOpzK4jygZRI9L/EdSXl
 5JhxGl+8KgVEop4sRlLCfYlFuRm/K4KSYJ4vTSCRd0MJgE4mVXawqlUwKRRoDTPdlfRV
 4gtgtz6vhgjpjlCUBS8WJ8DVhZ1dpUsj5gGvi0Pur6mWr33/erawFdUukPrF+EomWR12
 xkhHVWHT5AHdxPgtYEawFWFPPNsqRACR5YB95fvllA8pqoFQ2hzJ6ApulrDd5pvRr69s
 14QQ==
X-Gm-Message-State: AOAM5319IVLPIk5E4ZUH2uG+l8oZL1cX0Bqp1cvreQga81P6a7CF5uGy
 VDwCgs77xm/b1edcKMymTFU=
X-Google-Smtp-Source: ABdhPJx2vXirUY8EO6Lr8GnfzXGhnxo0d9l8dBuveqgE4nywFvaNT1O0eVe8BcAWvhYByAs4SHpmPw==
X-Received: by 2002:aa7:d7c1:: with SMTP id e1mr4740554eds.4.1602862706986;
 Fri, 16 Oct 2020 08:38:26 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
 by smtp.googlemail.com with ESMTPSA id s25sm1894221ejc.29.2020.10.16.08.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 08:38:25 -0700 (PDT)
Date: Fri, 16 Oct 2020 17:38:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: power: Add bindings document for
 Charger support on MT6360 PMIC
Message-ID: <20201016153823.GA9890@kozik-lap>
References: <1600859910-15855-1-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600859910-15855-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_113830_213988_5080C8E2 
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
Cc: Gene Chen <gene_chen@richtek.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, sre@kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 23, 2020 at 07:18:29PM +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for Charger support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../bindings/power/supply/mt6360_charger.yaml      | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml b/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml
> new file mode 100644
> index 0000000..711fc19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/supply/mt6360_charger.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Battery charger driver for MT6360 PMIC from MediaTek Integrated.
> +
> +maintainers:
> +  - Gene Chen <gene_chen@richtek.com>
> +
> +description: |
> +  This module is part of the MT6360 MFD device.
> +  Provides Battery Charger, Boost for OTG devices and BC1.2 detection.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6360-chg
> +
> +  vinovp:
> +    description:
> +      Maximum CHGIN regulation voltage.

1. You need to describe the type.
2. Use proper unit suffix (see property-units.txt).
3. Is this a custom property? If yes, it misses vendor prefix. If not,
   most likely there is already such property. Reuse.

> +
> +  usb-otg-vbus:
> +      $ref: /schemas/regulator/regulator.yaml#

1. Wrong indentation.
2. Name should be more or less generic, so maybe
   "usb-otg-vbus-regulator".

> +
> +required:
> +  - compatible

No address/reg? How does it bind?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mt6360_chg: chg {

s/chg/charger/

> +      compatible = "mediatek,mt6360-chg";
> +      vinovp = <14500000>;

Empty line break

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
