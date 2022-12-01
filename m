Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1B3C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 22:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3j3bEeuDoIsUBAWa7/8QM9wLDVakFUwmm4Xl9cQM6M=; b=pj+s9BUuuQgOHHC1/PmkVmJ1KB
	NadfY9dNXwa7r0+S6zZlRolgC/6QNFO096VDwiXRBcK6sPZbx3vHrUy7QI/t9WrvTXpfLfQzQvbYD
	iyeMWfabIH9Gx6AOsJCioZ6W3QNW/tG+dZ0D6EKD1u4t/w3f6f8bewtf8w+WYEw2ZNIZesTtGXzQU
	/slpxQvt6xndkkqPtz421Tc7pKMHwAqtxCr8bgIrltf2Z0bvlwNKdAvF8ps0/bNwTqUSBHonQ2KLJ
	o7Y3xrafH5x2+f6wdaGlKXS3CJlHDxU3hVLYWK3Wvcc5M7myjjbsWjfn+k5BErWxswZf/etVoWrXE
	Cj/YbisA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0s6C-00BOOB-Mk; Thu, 01 Dec 2022 22:32:08 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0rvD-00BMs6-RH; Thu, 01 Dec 2022 22:20:49 +0000
Received: by mail-oi1-f177.google.com with SMTP id e205so3535285oif.11;
        Thu, 01 Dec 2022 14:20:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3j3bEeuDoIsUBAWa7/8QM9wLDVakFUwmm4Xl9cQM6M=;
        b=yuRJ38EGyJFjpp1wGEk3pD3mKCDqHAMMBZUh9FuR9xMAyYrVUYuJSSRMG/gKx00bP/
         qvI0NpL9r0PRZRbqHWOxdLLXQDhEofaAlh5CoW7fh6XA2RpJoILoLuptDYR0aL2UscBE
         TC6hxwtHmHYIgLJTMTVxqn0JLX7XvtZEO8EynCRNFn9bMVUsfXifGuJxV/zFV0hQzMm3
         41VKeC3IDszFjgi8KdXFTqfIZC5A9xVKY0nkpQgY6bxhoYGKbfUa+xCH0iDO+uFsudkH
         eaHZ4K9U7qW7mT1FjODM9jQqrUFrWfigOCA2z5pTA5kvQR2M5mj7rK2RiCcAeKJST6NJ
         U1/w==
X-Gm-Message-State: ANoB5pm/HtcoaYVd954TAE9k7K5Zg/cgMpaMiezb+a33G0J9BXXIwpLo
	dkqotadEGY0rZpUoM2nlaw==
X-Google-Smtp-Source: AA0mqf42MMIFrtz92p86keOLNQSjuFkfAIltsaIbK6cM1FEYGtxgpTNkZpIBNJibSjHO9FIM35KyiA==
X-Received: by 2002:a05:6808:22a0:b0:35b:c6c4:7a33 with SMTP id bo32-20020a05680822a000b0035bc6c47a33mr6829339oib.266.1669933245777;
        Thu, 01 Dec 2022 14:20:45 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e2-20020a056870c0c200b0013b0b19100fsm3293131oad.32.2022.12.01.14.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 14:20:45 -0800 (PST)
Received: (nullmailer pid 1548625 invoked by uid 1000);
	Thu, 01 Dec 2022 22:20:44 -0000
Date: Thu, 1 Dec 2022 16:20:44 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Vincent Knecht <vincent.knecht@mailoo.org>, Nikita Travkin <nikitos.tr@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Andrew Davis <afd@ti.com>, Gene Chen <gene_chen@richtek.com>, Bjorn Andersson <andersson@kernel.org>, ChiYuan Huang <cy_huang@richtek.com>, Luca Weiss <luca@z3ntu.xyz>, Neil Brown <neilb@suse.de>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 0/6] leds: dt-bindings: use
 unevaluatedProperties:false and few fixes
Message-ID: <20221201222044.GB1518960-robh@kernel.org>
References: <20221127204058.57111-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221127204058.57111-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_142047_897927_5478BDF9 
X-CRM114-Status: GOOD (  10.46  )
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

On Sun, Nov 27, 2022 at 09:40:52PM +0100, Krzysztof Kozlowski wrote:
> Hi,
> 
> Changes since v1
> ================
> 1. New patch #3: dt-bindings: leds: lp55xx: switch to preferred 'gpios' suffix
>    (Fixing DTS in separate patches, see [1] [2] which superseded [3])
> 2. New patch #6: dt-bindings: leds: ti,tca6507: correct Neil's name
> 
> [1] https://lore.kernel.org/linux-devicetree/20221127203240.54955-1-krzysztof.kozlowski@linaro.org/T/#md1ccb03ee81f820e0c7b8043111d56b5ed0d1e2f
> [2] https://lore.kernel.org/linux-devicetree/20221127203034.54092-1-krzysztof.kozlowski@linaro.org/T/#m17f1d2f79a35fce43509edc351a84bc9dab980c1
> [3] https://lore.kernel.org/linux-devicetree/20221125173602.cnipos5oo4ncxsac@mercury.elektranox.org/
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (6):
>   dt-bindings: leds: use unevaluatedProperties for common.yaml
>   dt-bindings: leds: lp55xx: allow label
>   dt-bindings: leds: lp55xx: switch to preferred 'gpios' suffix
>   dt-bindings: leds: lp55xx: rework to match multi-led
>   dt-bindings: leds: mt6360: rework to match multi-led
>   dt-bindings: leds: ti,tca6507: correct Neil's name

I've applied patches 1-5. 6 should not be applied.

Rob

