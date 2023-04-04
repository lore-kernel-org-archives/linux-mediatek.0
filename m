Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EE6C761A6
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 14:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApT4/BK1w7ic9F4sBvqn2kPYM1w0Sn+odMgc/sq2JvM=; b=yNebRnY8P5KJAHU+f+14bQeQKv
	lkXBmaU6wDg2lU5IoCg6bFkc8xrVsnlF5JEiC5JwkNRSKB+oyxAbSZK8XK41XuaJnrX1g92LFg+Ir
	jmv0Zt10KNQi55rbyi7xnrMhn194MarVe8wHE1awqnzWkelk3XnQqJ9E1WDA/xFAXSnE+nZ/PVkGR
	e9iJscOrOs3DLhiNy5h+IGgkRDDiB3BVGnOwkYWCXdKHEw+tW+yNxSBcGGC3sDEQilgBClFCDv8lg
	4J1A1VWTrTEHE+vOxSOktqR7Fye/c955xSxDZubhmMwHd/2tAc/kvQYLZ26LzjqKSB4kAFZNfgObi
	mVOfm6EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjhbM-001n4P-2l;
	Tue, 04 Apr 2023 14:25:36 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjhbK-001n3F-0z;
	Tue, 04 Apr 2023 14:25:35 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-17aceccdcf6so34708808fac.9;
        Tue, 04 Apr 2023 07:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680618332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApT4/BK1w7ic9F4sBvqn2kPYM1w0Sn+odMgc/sq2JvM=;
        b=7lg5zHD+LnDWHMmLG6F1V4Eb0RZbslP/4PFKVDCFVtmjcTPb6jhb8HgjCsR8lkAVcP
         WpQnWGao4NcUUMy3MmxW2J7MV/tLc6YdbIgUqiE+8AHYQfo6oZJPuk3BfBDEhzL+mj0C
         B1i86VJIrnt848BxNQdjvH47rpuMjxv62BM0Bd2xJ2vew/i0xvrafiOAOfhlhl5jX603
         R/DVH1yg6Z1qBNP8H344PPcPeEuEqcq/4fH4kDgRvZY7iSgST4D1aYeqBcsSXutnDZgU
         QiC/F0XcM/ufSy8cWOg9SZUXgjeeuHW8cZ1MFUcSaqjK756rK14VbWSTEu5isYPaeLXz
         x/2Q==
X-Gm-Message-State: AAQBX9fUE3/X6FATcjtIA1E1fYR5cyHJeJWwLWaAal9uFE2EN/qHPnSY
	xmmkyAfIpw5VJoEbP2UdjQ==
X-Google-Smtp-Source: AKy350ZUp9g4CNJcEzGG1ZdTCE/lLLo6LkrUbne54r031+kRziV/pc060KzUIpJQZHr0c7d2vdYY3A==
X-Received: by 2002:a05:6870:c684:b0:17a:acbb:d1e4 with SMTP id cv4-20020a056870c68400b0017aacbbd1e4mr1663599oab.53.1680618332200;
        Tue, 04 Apr 2023 07:25:32 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id tw16-20020a056871491000b0017ae909afe8sm4814352oab.34.2023.04.04.07.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:25:31 -0700 (PDT)
Received: (nullmailer pid 3833637 invoked by uid 1000);
	Tue, 04 Apr 2023 14:25:31 -0000
Date: Tue, 4 Apr 2023 09:25:31 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Roger Quadros <rogerq@kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: mediatek,mtk-xhci: drop
 assigned-clocks
Message-ID: <168061833065.3833579.13089366523003216178.robh@kernel.org>
References: <20230403191850.374839-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403191850.374839-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_072534_344728_2E2C9341 
X-CRM114-Status: GOOD (  11.04  )
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


On Mon, 03 Apr 2023 21:18:48 +0200, Krzysztof Kozlowski wrote:
> The meta schema from DT schema already defines assigned-clocks, so there
> is no need for device schema to mention it at all.  There are also no
> benefits of having it here.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml        | 8 --------
>  1 file changed, 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


