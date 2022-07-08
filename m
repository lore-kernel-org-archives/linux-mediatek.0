Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA33AC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 22:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oN8Bupin0hE35LPgYOevBJqhqJt/5KoteoM0acQHYOI=; b=TuWkqozDGSiE+QBNHsrHjjZ6EV
	yOdW6/85ICk62Cx9j2ERBox1rq980ZaXFuyRIMOr7/9vHsJWeDFXuh3RH9XPcbzbc988HwPIRS3VQ
	sL6tMEqnx+ngBLKfX79tL+TffxafLcp8/UNZyGuU/m5STNulzNpWV6GwA4aGxNn6oYAYrj2IVDMpO
	i4XPjkcDww5hy/C5Qw2ksx4hS6lfz8ieSZLXotVCgNXPq/EEr/i9NV9Eqf2rxCKSyFdWGLE8p2Igb
	YPvCHT2fRBKtZOjZubxCtsUkxiGCv03XzTDQRE0j8F3wqmXAfV/jqlJxYavQxXaUnK9a0OGWfyCtM
	MK1Wwd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9wBQ-0069hU-Bc; Fri, 08 Jul 2022 22:10:44 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9wBF-0069ee-KD; Fri, 08 Jul 2022 22:10:34 +0000
Received: by mail-io1-f49.google.com with SMTP id r76so214408iod.10;
        Fri, 08 Jul 2022 15:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oN8Bupin0hE35LPgYOevBJqhqJt/5KoteoM0acQHYOI=;
        b=tKusEO5Z20nEaAARFYBsH1ff1nV7IwHNHvZbpyssfBBlGEFkygzG5oECn5F+CoWLwp
         +VXpZTDNum0UvhoH2HzOhPxrTtyXm93oefCG+59SF1M9HsKHupa9opVz4L0Cabphg5C8
         89CAiVeASMU7WxXG3QY9RJI4Q0uPuACRlY93RTPq03049cvVpgucHDYtR6Yx87Bmm7A4
         WyA2Ijc3ofxxqlhl2pMZNSHb1/CLADIXHQwXh9QdIBNc3xzyLVxilDGGW2IAJ3lZMErU
         PMTNACo06KiJRZK9FSQIkiBMQx/m9EkjM1uoIZ/a6znFb4j3MINRbOnyYVEYvclbKLQ+
         xdfA==
X-Gm-Message-State: AJIora8B0Fl6Chzhli0CX01Zr7bOtJyQuQltpIdN2hIsloWhacaD16kz
	YlSxyIXqBdagzAdxQlLMRw==
X-Google-Smtp-Source: AGRyM1vgvzoqD/VrjwnV1hgMdhHsLV/WW3CpbxY6wr8BZDe4k4zakYv2tFXWrRfkjJtuZF95e+K6UA==
X-Received: by 2002:a05:6638:3d83:b0:33c:805a:77eb with SMTP id ci3-20020a0566383d8300b0033c805a77ebmr3525050jab.237.1657318231891;
        Fri, 08 Jul 2022 15:10:31 -0700 (PDT)
Received: from robh.at.kernel.org ([98.38.210.73])
        by smtp.gmail.com with ESMTPSA id n28-20020a056602341c00b0067b7841c09asm14656ioz.15.2022.07.08.15.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 15:10:31 -0700 (PDT)
Received: (nullmailer pid 1567732 invoked by uid 1000);
	Fri, 08 Jul 2022 22:10:30 -0000
Date: Fri, 8 Jul 2022 16:10:30 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] dt-bindings: usb: mtk-xhci: add compatible for mt8188
Message-ID: <20220708221030.GA1567681-robh@kernel.org>
References: <20220707015041.12264-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707015041.12264-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_151033_677946_4FABA93B 
X-CRM114-Status: GOOD (  10.74  )
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

On Thu, 07 Jul 2022 09:50:41 +0800, Chunfeng Yun wrote:
> Add compatible for mt8188
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

