Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58BEC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 19:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7ImUPj6zMugUdmr150Xy+rw3VtjTeE0qXvYxSkkJ8s=; b=4hVeNqfumJPulm
	n6iJsixizM3koqliZVR0YQGN802slju/qY7jiaA5dmZbblAnI4sbW3pogCXQO6oy+k85W4ao1v9Uc
	pIFCw7TQAAT8XRrICMad6cyW/B5SvXaqgooJZnj2pgB4mbS0YwPiGi0NFPi/znP/nEqnPz2VSIJjp
	PtE1TrTM09y9rF3U6BFskvasQ8DknPiTFBfeC9U3fPfAHWdVlCtWztbGLefe9xSQbH9kCjjse/Ok2
	W1D29kEn71QIynkzDfPRXUBSYGD2P0LTH5CSq/aJ0Nvilc6RLFctXCqku2Nx13jNdDsTezotqN42N
	J+r+gfgGxZwrOBKU5Dog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNK6u-002Bfa-IK; Thu, 24 Feb 2022 19:49:08 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNK6q-002Beh-Tz; Thu, 24 Feb 2022 19:49:06 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 w3-20020a056830060300b005ad10e3becaso2078860oti.3; 
 Thu, 24 Feb 2022 11:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vEMkaLmcYjI09xvx6jYK1M/q56ooly5OYLZnEhsDSRo=;
 b=zWD8mQ+xQi9taGUR6XbL5VH+HudufCekjYVHkRWZJ18Jzh8KqcJi1HcG8/bYq96w8H
 PsTZkP/Zj9rKcwoTyXAaYdGCHUojydDLXvPwgtO5oP8i51wDelHrjYm0Tj+TpPbNtBgm
 soTznpSXg8mXItM0mYDywKGTvhT8wNItrQ2KIkDOUfas+6trOTezUtiJ7F+bFAPk3P15
 Ii8uT9Cbq25zvmYHhhc4syvHZmHZJpq2aw44VjXX0/zsD448p8K0zGdbnr7Fc0CeI8NR
 76zLbF7aRMGpt4LX4kyxLbF90UfsLfn/B40ftw30UUilPmAybgS4fxGMTWLtQMPQdJfj
 a1TQ==
X-Gm-Message-State: AOAM531wVh7lcBT2KK9xQUTv/jvw3If9wx4txjHpKJPrXg9LoXjMO//8
 VUhAXdI0Sc++Z1L4KW056A==
X-Google-Smtp-Source: ABdhPJypgynPujP0cdPUrnNUKBeJNnGl3BBCJkagr3tusQSqPPDDWnHi4y3UQXDbmLAkglzENGbn9A==
X-Received: by 2002:a4a:8507:0:b0:319:4719:27f6 with SMTP id
 k7-20020a4a8507000000b00319471927f6mr1532083ooh.84.1645732143607; 
 Thu, 24 Feb 2022 11:49:03 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 j25-20020a4ad199000000b003171dfeb5bfsm121557oor.15.2022.02.24.11.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 11:49:02 -0800 (PST)
Received: (nullmailer pid 3475137 invoked by uid 1000);
 Thu, 24 Feb 2022 19:49:01 -0000
Date: Thu, 24 Feb 2022 13:49:01 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: long.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, sean.wang@mediatek.com,
 krzysztof.kozlowski@canonical.com, linux-arm-kernel@lists.infradead.org,
 vkoul@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org
Subject: Re: [PATCH v3] dt-bindings: dma: Convert mtk-uart-apdma to DT schema
Message-ID: <YhfhLWdVKLqHHFyv@robh.at.kernel.org>
References: <20220217095242.13761-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220217095242.13761-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_114904_993207_88BBCD90 
X-CRM114-Status: GOOD (  10.25  )
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

On Thu, 17 Feb 2022 10:52:42 +0100, AngeloGioacchino Del Regno wrote:
> Convert the MediaTek UART APDMA Controller binding to DT schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> v3: Removed anyOf condition
> v2: Fixed interrupt maxItems to 16, added interrupts/reg maxItems constraint
>     to 8 when the dma-requests property is not present
> 
>  .../bindings/dma/mediatek,uart-dma.yaml       | 122 ++++++++++++++++++
>  .../bindings/dma/mtk-uart-apdma.txt           |  56 --------
>  2 files changed, 122 insertions(+), 56 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
>  delete mode 100644 Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
