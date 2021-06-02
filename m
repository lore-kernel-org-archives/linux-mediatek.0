Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FFDC4708F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 17:14:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95D8961C4F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 17:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95D8961C4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4uSYNCrObsM9xtYmuKn+hxcOdWJzsk1wkmjprELsBs=; b=2nVnYk8Js7U2wG
	UH6hbNyKb/17wDVUUoBeH6Doc5H4wPLsb/XCLpbOEiLE32UWBWSuQr32+g1yMLvS6ntuYUmWFJYwc
	ct95Qo2hK4aHfHXKzDqtznnLCRq9DN+7u9mIx57pHwlnq2NJR+vJ8rnRi4VAlGgg5p5Et3LmB5LtI
	1py81ir4ujTB5p2xFyMQ87y72xm/0p3MhaNfs+yHFMFC1RNFjPM6sSXTm7XdET6bYH4T4Fa3Eae5k
	S/YmiDolYtpu2pXQ6mMgCyL7Gk+KFr/wSENic7SePDvQ+WeTQdzQWbRlphFR1bD5icUl/ZkStvpmE
	TT/a/YRfjJcl3Qrp5+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loURy-005Rhc-F0; Wed, 02 Jun 2021 17:14:38 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loUPV-005PX1-Uh; Wed, 02 Jun 2021 17:12:07 +0000
Received: by mail-oi1-f172.google.com with SMTP id z3so3355035oib.5;
 Wed, 02 Jun 2021 10:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=COKp8u2ZXVU0CymIjovVJV/hDUHC7QysfTLqbeCPlLA=;
 b=ei4yaA55vDaSEEMikJfPkx/eGzJlIw4+sJZ9Arj3xADvNOmMNfj3FzFK6Qp5/AAmXr
 1+Qta/zpA6FZWkWTkWNEMBAVaZXTqdhIBenkBpAvlx46AdetZQ8wj2eIdQfflHnCUQ+S
 rjtzGeCSjmWOg//eMf6mGcipppAUg3wvP/zEVgN0ZZ9xu/9cklwC9ld2y9TmTgO7MaSf
 X5X+pwgtqgEyRLLUIq8+XozTbnx0oAGll7dHHDXcdEjj1/kE7N+u8C6BOFMTh4iVv+pJ
 YatDP8Ztp0wtXMV2nKLgtmPolPl4LFCA1zvvMeDJF7PFvNBhrfXRMU3MjVjXGw8Q4+kb
 hcZQ==
X-Gm-Message-State: AOAM533GluUykR4IsAarYo2VzA/pYf6OfZdTXoTeGvPMisQAsiiXE/HL
 AaYee0FOTV+EYTViKo+6Hw==
X-Google-Smtp-Source: ABdhPJyP/3UlWlRYRDmsD0pTWPUKVDZroExh5v+MUz02ZfHdTYEFo7ZHdLt3LYHa0h3JIS3nfHzYVA==
X-Received: by 2002:a54:4609:: with SMTP id p9mr21746605oip.107.1622653923200; 
 Wed, 02 Jun 2021 10:12:03 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a6sm89629oon.20.2021.06.02.10.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 10:12:02 -0700 (PDT)
Received: (nullmailer pid 3589893 invoked by uid 1000);
 Wed, 02 Jun 2021 17:12:01 -0000
Date: Wed, 2 Jun 2021 12:12:01 -0500
From: Rob Herring <robh@kernel.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v9 01/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of imp i2c wrapper controller
Message-ID: <20210602171201.GA3566462@robh.at.kernel.org>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
 <20210524122053.17155-2-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210524122053.17155-2-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_101206_060227_B691A523 
X-CRM114-Status: GOOD (  18.34  )
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

On Mon, May 24, 2021 at 08:20:32PM +0800, Chun-Jie Chen wrote:
> This patch adds the new binding documentation of imp i2c wrapper controller
> for Mediatek MT8192.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,imp_iic_wrap.yaml   | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
> new file mode 100644
> index 000000000000..fb6cb9e60ee2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,imp_iic_wrap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek IMP I2C Wrapper Controller
> +
> +maintainers:
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:
> +  The Mediatek imp i2c wrapper controller provides functional configurations and clocks to the system.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8192-imp_iic_wrap_c
> +          - mediatek,mt8192-imp_iic_wrap_e
> +          - mediatek,mt8192-imp_iic_wrap_s
> +          - mediatek,mt8192-imp_iic_wrap_ws
> +          - mediatek,mt8192-imp_iic_wrap_w
> +          - mediatek,mt8192-imp_iic_wrap_n

Looks to me like these are all the same h/w, but just have differing 
sets of clocks. That's not really a reason to have different 
compatibles. 

If you need to know what clocks are present, you can walk the DT for 
all 'clocks' properties matching this clock controller instance. Or use 
'clock-indices' to define which ones are present.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
