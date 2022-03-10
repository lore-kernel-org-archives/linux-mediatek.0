Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7469CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 22:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4EsC96bvPB2v1emqTZ1N7j/CfKHPqGbnOoe80MCJ7bg=; b=ceq+0uQxeA3Lzh
	LZwIYHfnXyONErYpgx949gcnkV03F7NYsq0OtrvQVtlegy+9P5ZCHlxSKalkby6i+F9tJ4/9YTyCy
	of2AAqD651L6QChXUldoGJe95G076cNCTav9BqAoLTb7X6L0DWaoDzDCPQVf/qyux/WMpsA7BNZjx
	B6yalCyo7M3oYB5Yk0hr69nc6jSgTYIEvTxSFBkxJIlmTyBp0DK/eusKqvEpF5yyIU81ZK9JgybkE
	FShkL6AvRwmM34AChytp/1NpgWjCGBC/bjPioYcjbRnvaU4rFQbBSq+IB4Eq1g52s3Hm3/Fi5fC+Z
	bzgHmVbI1PAocEYffLpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSR7J-00EByY-A2; Thu, 10 Mar 2022 22:18:41 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSR7G-00EBxs-TW; Thu, 10 Mar 2022 22:18:40 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 17-20020a9d0611000000b005b251571643so5048941otn.2; 
 Thu, 10 Mar 2022 14:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uVBl4IjExhMMGQyqVZdtBYxJhbtlhf7V3EID45rNLsk=;
 b=NB7NUFf6lMrzq6RI28HwTCouxV6ZRDUeq0+QmQ4rZyfNbkXeixej25rYC2JscWibBU
 Z9BVLDINXAVI3icviR47cHXoLVBQVPfDztE8xk6Je2Rq3wPalgTaZtz98tb3wiKgO3Nf
 DU7b9n5PvpPUkumWmGmnfNbbriz7qgGoAscoCrLlLHU6bI76GK4dRRcyaT2d/FdhhqDz
 1OYmrg/K42qOH0LMKxDi3z6dS/dbWIH0MWg9mOwxp0/9BdDuEsSgRaT+VXmXtt+ZlyFU
 oEh91KQmHHPWQfpA/bWXEjZ5iJQ4fByLTEqjYm4UeXnYR0nQselxk+BQiCNh8r5RQ7mU
 Dlkg==
X-Gm-Message-State: AOAM5330Sw7DkMtxFqhm0U18gWu0NfJTBfUnuQgJyeLezm7UPRa642hI
 w5TnkpeIDvA6fY6grZNWCg==
X-Google-Smtp-Source: ABdhPJymVHkEV5XxQpBNmw5S/gpv0K8uSPo3RhUKisPITsq2PFiS19pD2qkEoukGiphCl2E24hUkYQ==
X-Received: by 2002:a9d:77d7:0:b0:5b2:29b0:70cb with SMTP id
 w23-20020a9d77d7000000b005b229b070cbmr3556144otl.276.1646950718003; 
 Thu, 10 Mar 2022 14:18:38 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i126-20020acab884000000b002d9f958bceesm2925916oif.41.2022.03.10.14.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 14:18:36 -0800 (PST)
Received: (nullmailer pid 2185267 invoked by uid 1000);
 Thu, 10 Mar 2022 22:18:35 -0000
Date: Thu, 10 Mar 2022 16:18:35 -0600
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aaronyu@google.com, yc.hung@mediatek.com
Subject: Re: [PATCH 5/5] dt-bindings: mediatek: mt8195: add
 mt8195-mt6359-max98390-rt5682 document
Message-ID: <Yip5O3t0Ymyc2h+p@robh.at.kernel.org>
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
 <20220308072435.22460-6-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220308072435.22460-6-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_141838_984132_5400C3C9 
X-CRM114-Status: GOOD (  16.73  )
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

On Tue, Mar 08, 2022 at 03:24:35PM +0800, Trevor Wu wrote:
> This patch adds document for mt8195 board with mt6359, max98390 and
> rt5682.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../sound/mt8195-mt6359-max98390-rt5682.yaml  | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-max98390-rt5682.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-max98390-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359-max98390-rt5682.yaml
> new file mode 100644
> index 000000000000..7ec14d61b109
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-max98390-rt5682.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8195-mt6359-max98390-rt5682.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8195 with MT6359, MAX98390 and RT5682 ASoC sound card driver
> +
> +maintainers:
> +  - Trevor Wu <trevor.wu@mediatek.com>
> +
> +description:
> +  This binding describes the MT8195 sound card.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8195_mt6359_max98390_rt5682

You have nodes for each of these components, why do we need new 
compatible string for each combination. You can figure out the 
combination by looking at each of those nodes.

Second, why does each combination need a new schema doc?

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
