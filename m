Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329ABC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 18:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SDq5oYcyiXYq89saBWxds2k7OcfjOA4JcUSqpkakgBY=; b=comY2eJAzfIGOd
	yft3QLVw60XxphFLDX+pn9QAJiAqoh+NSzJwr5VniLmIohdhbJ9x+oJ7Ge1PuvZ0liRbfdLmmUEct
	eEdQu+gR1u5xsxRivubPsxNRJrA2q3DWt3RfyqrIUk+Jn8kDNQGNpoP/9No7faq3H3m7Qc7QbJMov
	PsWOhiqadTt6x9ES86WyKzalRS5RXwR1oXbuRMBc/9LyJqd/pjqaJ0TWOZFW/XmzbtUC8kLeNcIJp
	UQBUrl8J44TTJ/79Is3BLGHOyruV2pvIB4pASZ/k7akwtU295/N2H6lG9/1G5Lty6MOsChciwPwwm
	9mE6fy43P9ZwHovgUxbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNfn1-006hJP-Tt; Fri, 25 Feb 2022 18:58:03 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNfmz-006hHj-Jt; Fri, 25 Feb 2022 18:58:02 +0000
Received: by mail-oi1-f169.google.com with SMTP id q5so8302290oij.6;
 Fri, 25 Feb 2022 10:58:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XSJqpyXOMhS5kw8V/AvAh+G8eD23sLN1cYoPcwgSo8E=;
 b=1jn6QxVMKerurwnW7VHBxQ0u0Rj/OLmBCe3hGnpW659QNq/Or1KhPyNKqpnECBGRNk
 ESOkzRf3NlG1k7yeIRQytdg/8LaqL3UJYrl9gwoyUstMDQOusFKr/5yQNHUOC2BHsfFA
 bq98ukQG7j1rAYsFJJzhRbYLxmrqWY1CZV0cPBUKY/E9EFf819z1TQOSqhfTiR3KXqvG
 CIPVPFexoaRwLtlFzycRAm62gpMQWE+YigI6zwcP5DiPQtyMDYYul+jydYj/wVsOD33L
 a9PO0CVHqkIohiIRwL4zQuaa5vptiTLj7iQG04vYgHOwPSmwbpBhAj2SDlpLqzqxNWIi
 hVwQ==
X-Gm-Message-State: AOAM532mt1cYv9ZFYg8QsSwgmUtUYqnVDXpss4ZEtMmQwaZZls3Ofpmq
 cmdsnVnqbidwrA2+GXPFhrWjGrEGCg==
X-Google-Smtp-Source: ABdhPJzRL9I3juGZd4RbqTGsMJXhz2hWy20wQ1cZOx4PfY+9S5H2lzmLZ7u4WHIoeRBMZsSwD3TCkQ==
X-Received: by 2002:a05:6808:13d6:b0:2d5:1d7e:5f1 with SMTP id
 d22-20020a05680813d600b002d51d7e05f1mr2542906oiw.41.1645815480271; 
 Fri, 25 Feb 2022 10:58:00 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 s30-20020a056870611e00b000d2672a8d13sm1732106oae.12.2022.02.25.10.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 10:57:59 -0800 (PST)
Received: (nullmailer pid 1247848 invoked by uid 1000);
 Fri, 25 Feb 2022 18:57:58 -0000
Date: Fri, 25 Feb 2022 12:57:58 -0600
From: Rob Herring <robh@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 1/6] dt-bindings: spi: Add compatible for Mediatek IPM
 IP with single mode
Message-ID: <YhkmtgZzKiFn8ntK@robh.at.kernel.org>
References: <20220221040717.3729-1-leilk.liu@mediatek.com>
 <20220221040717.3729-2-leilk.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221040717.3729-2-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_105801_674672_0334A59E 
X-CRM114-Status: GOOD (  11.16  )
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

On Mon, 21 Feb 2022 12:07:12 +0800, Leilk Liu wrote:
> This patch adds dt-binding documentation for Mediatek SPI IPM IP with
> single mode.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
