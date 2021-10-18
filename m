Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A5BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 19:59:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95A796108E
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 19:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95A796108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5H+4nNtFCaO7vBv9vfZ9u56s0FkIrbXEa5yIwirQCq0=; b=ykzsyl+RPbZ3e2
	Sa0/CpuqZrmEZAIDcqi3R9DnlXT9CGp9NdH7Xi69b/fAEWgGmJY4rKFDZYTZu21wnzTJrA2S9OCBX
	8ntCbkZ6oNcuqSFRnFExW1OKLdW6cxP5648frh9z/n4FSwC6kgEHILYrv0XoFv11ZGzSaODLecmmx
	51AEDZjesM6NhbRORKSbZofHQIiAMmnj2KIjFqJ1/sbJdfhax7oRrnoq9LBS5ZhVEYUN66XVmD1kg
	2OWwB0RwsJgQ9fFPKnnYy46SZALFaCq7SS20MuZGDOYMzl2YoaXvCwpQTXI+jL25MFeWBLLBKv8zv
	C5ZNEvaH+1Ao7sf5ENzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcYnM-00HAlr-SG; Mon, 18 Oct 2021 19:59:40 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcYn9-00HAjX-FR; Mon, 18 Oct 2021 19:59:29 +0000
Received: by mail-oi1-f171.google.com with SMTP id o204so1316221oih.13;
 Mon, 18 Oct 2021 12:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/KO8MvppjA9yDmahjXb0FodhN5V5+dS+Knni3+3rua8=;
 b=wB17FTp6VifJBux+TRHJfa7Rd3Gm5EqUPuwy+l0HTDoI284pMon1epCCvQaPpWzADl
 yjZiNYH4IwnFJTafflmR9GO4jw9zvvAarz3nu9m7wUb7LwCMGZ9SjLt5LT8j/mOKH/gK
 zAwhEiOD/O7goL13lqqY0MJxIiwh4QVr6yZdAqn45PyOnnIctR1TXuchID/rVnuvn9rY
 MjU2PE1JRD7nf+XMnA812tmqShmw5O4mMnFGCbH4dyJmE+ujcjeo6gk41mQNqU0MgLAX
 lWJfCC77zDMhc42VxfYAO9ni6Q3ya8bShj6oos+z41r1RfalLpbJk2xNbxph4AqWrvKk
 fRlQ==
X-Gm-Message-State: AOAM5338A9k6531k/DwW+AJp3SsXbE5oow3/JRGa8G6qxaAHQe7t7roA
 F9GRSIFDIVHQPAHVFrpjC8sjboJRGA==
X-Google-Smtp-Source: ABdhPJxJBK2iXYAuAaPiu+Bn51zOnUYWqFsKlnTyUsyakCVVxNcpPMq+Uxw4DmwcsHfAnJAn+lhUEQ==
X-Received: by 2002:a05:6808:300a:: with SMTP id
 ay10mr820353oib.36.1634587166105; 
 Mon, 18 Oct 2021 12:59:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l1sm1691404oic.30.2021.10.18.12.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:59:25 -0700 (PDT)
Received: (nullmailer pid 2853247 invoked by uid 1000);
 Mon, 18 Oct 2021 19:59:24 -0000
Date: Mon, 18 Oct 2021 14:59:24 -0500
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2] dt-bindings: mediatek: add adsp-mbox document
Message-ID: <YW3SHDBj2Q1dS8Wp@robh.at.kernel.org>
References: <20211008084030.2439-1-Allen-KH.Cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211008084030.2439-1-Allen-KH.Cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_125927_542832_27E73B9A 
X-CRM114-Status: GOOD (  19.57  )
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

On Fri, Oct 08, 2021 at 04:40:30PM +0800, Allen-KH Cheng wrote:
> This patch adds document for mediatek adsp mbox
> 
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> ---
>  .../bindings/mailbox/mtk,adsp-mbox.yaml       | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
> new file mode 100644
> index 000000000000..9028e403ceda
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek ADSP mailbox
> +
> +maintainers:
> +  - Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> +
> +description: |
> +  The MTK ADSP mailbox Inter-Processor Communication (IPC) enables the SoC
> +  to ommunicate with ADSP by passing messages through two mailbox channels.
> +  The MTK ADSP mailbox IPC also provides the ability for one processor to
> +  signal the other processor using interrupts.
> +
> +  mbox0 is handling ipc reply
> +  mbox1 is handling ipc request
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt8195-adsp-mbox
> +
> +  "#mbox-cells":
> +    const: 1
> +
> +  reg:
> +    description: 
> +      Physical address base for dsp mbox base registers.
> +    maxItems: 2
> +    minItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: reg_mbox0 
> +      - const: reg_mbox1

'reg_' is redundant.

> +
> +  interrupts:
> +    description: 
> +      adsp mbox interrupt
> +    maxItems: 2
> +    minItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: irq_mbox0 
> +      - const: irq_mbox1

'irq_' is redundant.


Is this really 1 h/w block? Kind of looks like 2 instances of a block.

> +
> +required:
> +  - compatible
> +  - "#mbox-cells"
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    adsp_mailbox:adsp_mailbox@10816000 {
> +        compatible = "mediatek,mt8195-adsp-mbox";
> +        #mbox-cells = <1>;
> +        reg = <0x10816000 0x1000>,
> +              <0x10817000 0x1000>;
> +        reg-names = "reg_mbox0", "reg_mbox1";
> +        interrupts = <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH 0>,
> +                     <GIC_SPI 703 IRQ_TYPE_LEVEL_HIGH 0>;
> +        interrupt-names = "irq_mbox0", "irq_mbox1";
> +    };
> +
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
