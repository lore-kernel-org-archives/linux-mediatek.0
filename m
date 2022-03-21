Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957D1C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 23:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YGQN25hhWQNZrx2GvJoDaGhqjpCTaW2arM/8ka++m6U=; b=CukQecZKe3gVfA
	iNHRRHBRWyZaF7HTbW2N/HaVdRV2dJII1uJ/wdW/YOw1BywVE7ZJFUibLMzOrUc0uZSDeFlh97jNW
	sSgvN4q6/KnWN307F88MupF0ljITwNcIdXODpPcgZwgrgeOiu1xE5+xjJsUCt5GWzufV+Lp8H1ql8
	lXSd9urZmYVH2fXAKB5+cbRruP9U1qjhOlbA1B0WyVqW87GKd46RU94oRC0bo0beH/LfwhhP0OFFU
	/7lGRVGLMdlUbUZ3GE9d2YRDi7NK/D+bMV4UtnPu3kxBJdRYlNQV8IVvqX8CR64q/dv+6Fhmho3OA
	ihvAftOiaT0nVOH6t3pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWRa2-009R09-27; Mon, 21 Mar 2022 23:36:54 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWRZz-009Qzc-9V; Mon, 21 Mar 2022 23:36:53 +0000
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-d6ca46da48so326941fac.12; 
 Mon, 21 Mar 2022 16:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jcbOalPGoZlPVOYBNp+MHPtkQGuUqsNk0ulK/GNGgc8=;
 b=SGnnyEQyL8oi9e8G++pY4oTXYG2ukiBnfUa6O91AJ81d0HN6wSLsckCJe7Du/PRXel
 w1io2DALtLUWBo//4We9N3e7XRIgaJ0m0r/LCcEgEZv8bGxlrcZnanJgY+P4FwyCpyC5
 j503zv81lJLuX70iBHZSnSypbdF+UkWlVafhfg2i29gNJQ2ItSYh4zqhA8/qjZcGs8pd
 P7zSoEHONGCxJ9uOdKyoeQqqK/L9XcdgDLOhrWmk57UneX8o99SopxQBfaMPKyflLODv
 Lcbmrd6M00TqkeSe3HXf/bjd2//6lNWFW26Ee6qimfBHAK+iB7GU0qnEJyJDu54LPI65
 OyEg==
X-Gm-Message-State: AOAM530FZUVgN5FM9oyK9CpcDrhu0jucFCrMOXhzBgpb6iNFJdVcBqpi
 iq0dgAsdej4nGksZRYl0bJIbnxMJAA==
X-Google-Smtp-Source: ABdhPJwus8FT5y2o3/MJA9opEbTL/aWgDuKhBeOv7vLJJLqBbRBk4A9XVfafmZwyivYO4tXGW68qrQ==
X-Received: by 2002:a05:6870:5687:b0:dd:d21b:4e54 with SMTP id
 p7-20020a056870568700b000ddd21b4e54mr604717oao.184.1647905407981; 
 Mon, 21 Mar 2022 16:30:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x25-20020a056830409900b005af164235b4sm7795352ott.2.2022.03.21.16.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 16:30:07 -0700 (PDT)
Received: (nullmailer pid 746077 invoked by uid 1000);
 Mon, 21 Mar 2022 23:30:06 -0000
Date: Mon, 21 Mar 2022 18:30:06 -0500
From: Rob Herring <robh@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Subject: Re: [PATCH V6 2/3] dt-bindings: spi: support hclk
Message-ID: <YjkKfjeJ5cuSyE3d@robh.at.kernel.org>
References: <20220321013922.24067-1-leilk.liu@mediatek.com>
 <20220321013922.24067-3-leilk.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321013922.24067-3-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_163651_343465_81DC2D68 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

On Mon, 21 Mar 2022 09:39:21 +0800, Leilk Liu wrote:
> this patch support hclk for AHB bus.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/spi/mediatek,spi-mt65xx.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
