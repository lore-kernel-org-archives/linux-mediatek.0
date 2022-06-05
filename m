Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F66C43334
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jun 2022 21:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbqhUWlt7D/9Qg2WRj3iA+TrEb2EC32WvX3BQ6tL4ZY=; b=y8fSd13ssBZ8ce
	3w2TYXvWYH34JSa/eqS53AmPLABJ8djirGBUbh/Z+rcDxM1hlxXaIfTp+2b4xzIPwbaunjtHwV2bL
	jJrrIemPsuCi6vhCcI7a0I9TUc9I285h01tugc7mAOthW2I2zIxS7DzssVTvMV3vB9PmEELYIafiF
	xpjt0D4CTiVYEK7hMESEIsCte/RF9sf69qGBRWuJCzOXbTeAylcjj7Aipv5PpxWtGwN3ZLhFWtyo4
	QThRPr0ATvKbvGYNBj6DmZ+dhyGzIrroIS7BI4DW9bWyjr8c5KtsOVKcyeuBUw1RaiJWALLlaWPOs
	O1ywfnAT8tYjzFtDCBYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxxhQ-00FOeX-SU; Sun, 05 Jun 2022 21:22:16 +0000
Received: from mail-qt1-f174.google.com ([209.85.160.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxxhE-00FOZd-Q1; Sun, 05 Jun 2022 21:22:06 +0000
Received: by mail-qt1-f174.google.com with SMTP id j8so6497414qtn.13;
        Sun, 05 Jun 2022 14:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Nef1Ozun/+sIAQcPo6GXHDjM+cslc5L3dWpOX/Hb0jk=;
        b=WIJxZicrxSIVl7eGd7b4rxInDkQyJzcQxxia9H5c4/OtlZhSxVHotmN8jy4xOt8Vpe
         zT4BJutNk4kJ4fjfJUjx8roykT6oru25kThzOc4Cq+U/ocHcpmHr/N+Zd2Qp/OV19Epk
         T0ZtijZqzdGRSst/rzuOPdzfH4qVbpPgH8+r0HE/O6B3argW8vw5Dz7qMtxhtgAMYcw2
         Ncbbvjxv9r2Sfs4yzODUD/5SygwfWaZtsvK5yeNplrrAQyy5tvnuf1+Q3ft/7LNHkIK7
         +LV/T24AiFtq1tOZr3a/UykQ14Y/Pv2b3G2+fbtC+9fguWh6jrkSgSeq3/ipzs42+Sut
         qDHg==
X-Gm-Message-State: AOAM532US1RvOdvbNUQpSe75YbKIo39t1gNyt78Paw9sK9peaBFkjMv4
	JVdXjhBV2ckArGasMnUQng==
X-Google-Smtp-Source: ABdhPJyyhAPumG/SLys5NhI3H6wf7GTwYLJHiQCyC3p9H5iHOwhSEbNiPoiqL01xXencWPz3nSHjrw==
X-Received: by 2002:a05:622a:40b:b0:304:e4be:65a with SMTP id n11-20020a05622a040b00b00304e4be065amr7023694qtx.309.1654464123277;
        Sun, 05 Jun 2022 14:22:03 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:ac97:ac63:b5fd:aa9:8d74:9989])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006a693e46d5csm7278738qkl.11.2022.06.05.14.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 14:22:02 -0700 (PDT)
Received: (nullmailer pid 3539659 invoked by uid 1000);
	Sun, 05 Jun 2022 21:22:00 -0000
Date: Sun, 5 Jun 2022 16:22:00 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Weiyi Lu <weiyi.lu@mediatek.com>, Matthias Brugger <mbrugger@suse.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: power: Add MT8365 power domains
Message-ID: <20220605212200.GA3539140-robh@kernel.org>
References: <20220530204214.913251-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220530204214.913251-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_142204_861769_F763F93D 
X-CRM114-Status: GOOD (  14.78  )
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

On Mon, May 30, 2022 at 10:42:11PM +0200, Fabien Parent wrote:
> Add power domains dt-bindings for MT8365.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../power/mediatek,power-controller.yaml      |  2 ++
>  include/dt-bindings/power/mt8365-power.h      | 19 +++++++++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 include/dt-bindings/power/mt8365-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 135c6f722091..2c6d3e4246b2 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -29,6 +29,7 @@ properties:
>        - mediatek,mt8186-power-controller
>        - mediatek,mt8192-power-controller
>        - mediatek,mt8195-power-controller
> +      - mediatek,mt8365-power-controller
>  
>    '#power-domain-cells':
>      const: 1
> @@ -67,6 +68,7 @@ patternProperties:
>                "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
>                "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
>                "include/dt-bindings/power/mt8195-power.h" - for MT8195 type power domain.
> +              "include/dt-bindings/power/mt8365-power.h" - for MT8365 type power domain.
>          maxItems: 1
>  
>        clocks:
> diff --git a/include/dt-bindings/power/mt8365-power.h b/include/dt-bindings/power/mt8365-power.h
> new file mode 100644
> index 000000000000..4f50997a13b4
> --- /dev/null
> +++ b/include/dt-bindings/power/mt8365-power.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Dual license please.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
