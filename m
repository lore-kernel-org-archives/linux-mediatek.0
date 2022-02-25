Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CE4C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 19:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LuTD4uI+y1Hjpra2A0C/MkS2cloCX8q+l11+gVPdSM8=; b=WpbkcjVfzag72s
	Q+kx7XdzYtqASfjtcUpaqX+JH919AnoMtO1CrS9VoDJ2qBCXdgcobbLtNXBHURDag1DIojh462J8i
	07r1WOak+OKjY9RpVze3WMnAErQiB8+Z0P5iNnoq1Nr93/Z4wOxXXWC22KQMA5xnFQsc8qry2iFFq
	LkclGQyqDmXzGMCptz09ekfYhj4FpCkq3QAiJlZOEOY28QcvflagVwYklVJD9l2K0zmoBI9Uil8Ab
	cX5GIvkgPfxkvy+/vdZRsYZdFekEoPak/xLE4G6VDkQoUBk35g0KrMS0c6nG5TLS2XJ6dQflLfpPV
	7voyHU/roMpQkyODEWNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNfqu-006iWX-4P; Fri, 25 Feb 2022 19:02:04 +0000
Received: from mail-oo1-f54.google.com ([209.85.161.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNfqe-006iRN-8R; Fri, 25 Feb 2022 19:01:49 +0000
Received: by mail-oo1-f54.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so7535248oos.9; 
 Fri, 25 Feb 2022 11:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FP9O1YxyGDdGfMc3m2rDm0MeKLExSjr2QWzSOURj93U=;
 b=6//fgl6v0D6uI/Mi5psP2y4xxYNYaUC2SwHYuanv7yjFwhWuv2PI4U6y+e1C+uG4kh
 1J0M/02mNc2e9qPafalexZilcxWpB+IdttBC2QCNY3cz1Ij/TDLEwwXsk8dQbet4CnTC
 XQPuPQ5IZqx7xn8JjlQV5HtyTNvhE/e9FInLR5BA3XKVElJ7l84WHe64zQjhm0mq74Bs
 oEF+v0sgk3tKX3qdpI9UslG1Be3tsBkTY5haAT/lrUgXl7KHpCpmpcpZ9aSFE7hGZJ/+
 iJ7Pold8/iLsh+buJB4KJD29bfuyBO1MkN8n240+Cvfu20uQrQJpBmaYGt/NHGy5AZGM
 LmRA==
X-Gm-Message-State: AOAM531pst5rEJ1xIN6HuLCIJFSSWfxLWF8q0jiggYNqqGxw94cytIns
 GNBt/+CtnT/FUckQ2mF98A==
X-Google-Smtp-Source: ABdhPJyCXqGMfApki5/NqUGzddyHbNbNMth+hf6LAv/ruJrKBsXjxKZlMizx3HI8tHzJxPCtxmJUMw==
X-Received: by 2002:a05:6870:c0cb:b0:ce:c0c9:615 with SMTP id
 e11-20020a056870c0cb00b000cec0c90615mr2025979oad.103.1645815705506; 
 Fri, 25 Feb 2022 11:01:45 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 i28-20020a056808055c00b002d51e377248sm1695070oig.33.2022.02.25.11.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 11:01:44 -0800 (PST)
Received: (nullmailer pid 1252805 invoked by uid 1000);
 Fri, 25 Feb 2022 19:01:44 -0000
Date: Fri, 25 Feb 2022 13:01:44 -0600
From: Rob Herring <robh@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH V2 3/6] dt-bindings: spi: Add compatible for Mediatek IPM
 IP with quad mode
Message-ID: <YhknmEtjpN7Lmoru@robh.at.kernel.org>
References: <20220221040717.3729-1-leilk.liu@mediatek.com>
 <20220221040717.3729-4-leilk.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221040717.3729-4-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_110148_326764_2779D144 
X-CRM114-Status: GOOD (  15.55  )
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

On Mon, Feb 21, 2022 at 12:07:14PM +0800, Leilk Liu wrote:
> This patch adds dt-binding documentation for Mediatek SPI IPM IP with
> quad mode.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> index 0a2fc0404cb3..241c0f5880d3 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> @@ -42,6 +42,7 @@ properties:
>                - mediatek,mt8173-spi
>                - mediatek,mt8183-spi
>                - mediatek,ipm-spi-single
> +              - mediatek,ipm-spi-quad

Can't you use the existing width properties to distinguish? Or is the 
programming not a superset?

Is 'ipm' an SoC? If not, these need to be SoC specific.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
