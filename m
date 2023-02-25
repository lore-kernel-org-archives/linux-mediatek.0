Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D27C64EC7
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Feb 2023 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmn+cqYTvDT85OGvCMKkjTNE8FVd8ZGTaREnVmw8Y5k=; b=oTKjIIe3uCgYeRifYvdvnrTxzW
	8QlgKLIggVgfsw0B3972AZQxn86bxVoHjT7GXJyDteNb9sNLTbvJVvNlDOxCZUuQAtsBPigyoCfko
	YryjgYxyEA5Y9c6DBsH22Ae8KV7nWosI4EesoUlNVzITvYDypuMJL3WAtS4c9zBJVUOPhVCgrXbGA
	QcMajdLdj7WUrGDeaGtE4IhqxbGMBkhLNDP3q9VCQ6tTkGfH3w0G5J8QO3kmgu/I9XDkqOrqEHJ1K
	O/S5pWt3y6yey8cGcVQRyshK8ZtULkLY1rPDt1TGh87MYjTSJQVygIPWYm0CZEnhMIyhgR7oa3wts
	Hjfl3guw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVxcT-0061ZQ-DE; Sat, 25 Feb 2023 16:41:57 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVxcG-0061PT-Cs; Sat, 25 Feb 2023 16:41:46 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1723ab0375eso3108615fac.1;
        Sat, 25 Feb 2023 08:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmn+cqYTvDT85OGvCMKkjTNE8FVd8ZGTaREnVmw8Y5k=;
        b=JeAIBpYUvNiXAA121YTlLRE7xs6FpBBdLcnKmViFAKnx0CAyuikX7hInf+ybRgcPU2
         +qxGszBkgPNH4cJ4wAI4569+t1Xqf6fh5xaaQD98MO1fYRYlLG3zyXte2pP0cX/Oe5DZ
         iSk5+0t1cywz6YkzojDiSA0c2orMUnZLEtqT/+iPn16CmlC3iLxUIKNnWvmULxuDanUC
         jFwxulUiH4rLfylMJcybmUuXmvj6jcewXl5auogL9CVK1z8HLdut85UvNOLa2AdE3QPn
         RjZzs+2BDhqeqYVEVmdYunlYeDNE0J71QG7PZ4iKjxXy3svG2dNR7jHcKrEGsF4WxZQ1
         Qbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rmn+cqYTvDT85OGvCMKkjTNE8FVd8ZGTaREnVmw8Y5k=;
        b=xeab8X3VV71w5QTAKOCAusxl1X0fE99AUAPDZMPGnfNUWSZ4ap2PCvaKlA+hN3YOVX
         YyoIZa3r+pWtozHGiXcJiU5Vx97g5C5nuPeVvuHLZLBpvfWYoINTm/atyi89U2YR034Q
         1Tjml4od7vD69jVg4It18lFekeQXZ4nMw0cd+Zy33HrpoV6IshQJbxRfTFKnWuvXWe96
         vAJQ0DAQdVvXZ9JuhNCOhrFiFej/psTubzhTw5kyGztzBjpM7RjkUxe4ueLNi6yoA61f
         OoXIilR5hQp+RY6OkNHpPtESGNlpFm0jz80JPI6JAwBRqdPKJ6lw1bWCibVJQGzTOzK3
         orrw==
X-Gm-Message-State: AO0yUKUg3ZYtd1Xr1UNlAtcxG0Kz8rbUvSibVFk1M2Ksk1R2ttbYnMPD
	hFCo08RcBN4B3FjRv3KdqR8=
X-Google-Smtp-Source: AK7set9nFJwgKU2JNnNF/RkpGiT2OOeIvv/dN+67jI23lAI/UoG09P6nrZwOJLRbeHtMWkberKCg4w==
X-Received: by 2002:a05:6870:910c:b0:16d:c18d:4074 with SMTP id o12-20020a056870910c00b0016dc18d4074mr15754800oae.12.1677343294607;
        Sat, 25 Feb 2023 08:41:34 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t2-20020a05687044c200b001726cfeea97sm718811oai.29.2023.02.25.08.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 08:41:33 -0800 (PST)
Date: Sat, 25 Feb 2023 08:41:32 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Fabien Parent <fparent@baylibre.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
	qii.wang@mediatek.com, matthias.bgg@gmail.com, jic23@kernel.org,
	chaotian.jing@mediatek.com, ulf.hansson@linaro.org,
	srinivas.kandagatla@linaro.org, chunfeng.yun@mediatek.com,
	broonie@kernel.org, wim@linux-watchdog.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 08/17] dt-bindings: watchdog: mtk-wdt: Add MT8365 SoC
 bindings
Message-ID: <20230225164132.GA2905933@roeck-us.net>
References: <20220531135026.238475-1-fparent@baylibre.com>
 <20220531135026.238475-9-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531135026.238475-9-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230225_084144_459784_C7F43F01 
X-CRM114-Status: GOOD (  13.25  )
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

On Tue, May 31, 2022 at 03:50:17PM +0200, Fabien Parent wrote:
> Add binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Going through my old e-mails:

This patch never made it upstream and would have to be rewritten to apply
to Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml.

Guenter

> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index a97418c74f6b..0e63c4ba3785 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -19,6 +19,7 @@ Required properties:
>  	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>  	"mediatek,mt8192-wdt": for MT8192
>  	"mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195
> +	"mediatek,mt8365-wdt", "mediatek,mt6589-wdt": for MT8365
>  
>  - reg : Specifies base physical address and size of the registers.
>  

