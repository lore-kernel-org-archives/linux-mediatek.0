Return-Path: <SRS0=mrrP=63=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57995C2D0F6
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 02:39:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22BFE206F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 02:39:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ln6f64qQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22BFE206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijtZ7io2uTg9uV0/fTtg8xJP9Pi32Jah7TrvRI+ETbA=; b=Ln6f64qQj8kZlr
	kUMSkhHVF7CT91xWp+FzeQZtIiFtTIYgcjUxCU88L2g7dFrvqR90UI9EeEI0KEqiwqJALkDiNXcxq
	nbLuFBQCOKjsiA4CiomNIJpaq3JV+mPdX5F1IYQg0/DMb7DlCj1mwkjQhi13b/4EzAYMdbyn7eI0q
	JyUCh0ZIpddbU0NY9j6w4g3MHJqapeGnI5HTfbIOd0esmJ7M26aSa5n4qHD4OcTHbQiqni+trzQov
	I3fYJ0zjvCwvCkmEI+C+TFHNKYkCbJUiGJ5LQYDq1N4TrJbs71lszYUVdvWkfNQY6SuxpWtgO4+DO
	2OK3ifACF90i7FoTLRsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYhIb-0003Ge-M2; Wed, 13 May 2020 02:39:09 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYhIQ-00038G-UM; Wed, 13 May 2020 02:39:00 +0000
Received: by mail-oi1-f194.google.com with SMTP id o7so20181178oif.2;
 Tue, 12 May 2020 19:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mB48QmwP9BiyH2LbdU0ZoxXeDi5pgn5seQ5bqpzznwg=;
 b=LdOrlbDgi90yMVXaDPEZJiJQew5lBb4yRD4NxY1hIk3qEbfRMSd9ksDBQeG5O11fLP
 KkahbCFKvNc9Qg7R7M/k6H+IFnfyVYRAnRDg6jfDLhIJg5F1QBFaM8xwjzP7YBaYWkE0
 eAErnd//eQ5BTraVwibP3dO94a3xImT+nFEO+ShrfQN8RMlUwVauNmIfJcRnJCQkY15b
 jyuFZa5ITknlgDP5e95rUlHwRM+qFqvMnpYuPMe8/Vah4KPPJyEnaEyKB6Gyrop3Ag7j
 RsDe/h1919Gf4hfQPBUeKvubn6SIn8O/bChf4pE03rkpmk/V1J9GvUksy70DbQffx8RE
 rSqQ==
X-Gm-Message-State: AGi0PuYAYNoluY+TJXM0x7xN1RNJoyiFmE4dEHWU/tOegEyaSu0n8JXD
 +xRuBvVutCKWEzZ55NV9qg==
X-Google-Smtp-Source: APiQypI/fAJkeunIrrooBsca9jm5OufxdvNcX6Hy9olT8g0z8O/+ezwT5ubQzkvo5BteCx+UsEg1kA==
X-Received: by 2002:a05:6808:a93:: with SMTP id
 q19mr26255041oij.6.1589337537668; 
 Tue, 12 May 2020 19:38:57 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y22sm5733356oih.57.2020.05.12.19.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 19:38:56 -0700 (PDT)
Received: (nullmailer pid 29317 invoked by uid 1000);
 Wed, 13 May 2020 02:38:55 -0000
Date: Tue, 12 May 2020 21:38:55 -0500
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 01/11] dt-bindings: add a binding document for MediaTek
 PERICFG controller
Message-ID: <20200513023855.GA23714@bogus>
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505140231.16600-2-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_193858_977302_FEF75A65 
X-CRM114-Status: GOOD (  15.59  )
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
Cc: devicetree@vger.kernel.org, Felix Fietkau <nbd@openwrt.org>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, May 05, 2020 at 04:02:21PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This adds a binding document for the PERICFG controller present on
> MediaTek SoCs. For now the only variant supported is 'mt8516-pericfg'.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  .../arm/mediatek/mediatek,pericfg.yaml        | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
> new file mode 100644
> index 000000000000..74b2a6173ffb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,pericfg.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek Peripheral Configuration Controller
> +
> +maintainers:
> +  - Bartosz Golaszewski <bgolaszewski@baylibre.com>
> +
> +properties:
> +  compatible:
> +    oneOf:

Don't need oneOf.

> +      - items:
> +        - enum:
> +          - mediatek,pericfg

PERICFG is exactly the same register set and functions on all Mediatek 
SoCs? Needs to be more specific.

> +        - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pericfg: pericfg@10003050 {
> +        compatible = "mediatek,mt8516-pericfg", "syscon";
> +        reg = <0 0x10003050 0 0x1000>;

Default for examples is 1 cell for addr and size.

> +    };
> -- 
> 2.25.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
