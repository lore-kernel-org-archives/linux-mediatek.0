Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E546C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 22:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXAWpxsRzdjuf0jW9ze1znkCeK7jZuvAzyAN65D/SzY=; b=JULEBF2zTK3y6HGzxk92XZ0Upo
	fMYD9fTMuJkxuc09f1sn3SIrsQ1Q3/qSmrgcghE1mIFTbwtddfTFuhHJR5wAQ5/v9O73H1e8XEsO+
	Q1VjarJiD5rHZHP9O2SKZY7GmHlIlMywj75Wbltq33uLiUYqVi1dIxp/LSLkAggRrIECnY69dCRqJ
	7ss+8Kn9n2O60M4x1NBckLWwlv0a7A6aT04nQFRUsNijhGJeVRaIwrCmLbv7ya0IGQiRUhL7ti/b/
	OWNxmmfdNT1aNadZZTZWC2WINt7STXvIy6v/0oH46uwYg9ranRPIvgjPWT8jcubxldxMsFrJNve5G
	PNj83U9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB2FG-005OAu-6u; Mon, 11 Jul 2022 22:51:14 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB2FD-005O9S-VE; Mon, 11 Jul 2022 22:51:13 +0000
Received: by mail-io1-f49.google.com with SMTP id u6so6148014iop.5;
        Mon, 11 Jul 2022 15:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jXAWpxsRzdjuf0jW9ze1znkCeK7jZuvAzyAN65D/SzY=;
        b=d9EPWmk0toQmWA57qT2kW08uh4tbAZYIAxMv9djBnR3xikXCNKNSr7MJJ0j1dlZDmE
         I+O2N5UY47+0/FDG/MFfaxHvK5y8ueQZgBHnuBm9KBuHyQybH3MtVNj99WLdBfHweyMM
         ZmD29rAxr9ToGCkE68qTIrO4U69diHkru8+2BFWF22hybZyF2/U/zdVKGRgaXSXLDaQ/
         Szoq817iL939efU4TeseXxVfy8pX3954sTABta9qRFvruWYJ7Ol0R9NN+/7tuISyr1LB
         +mh3YpVsVemuN/DSYGLvanH4moF+HhXgJzBozYCQ01+NlQpYhCL4jhk9IQLAw2zzx8+8
         Lf5A==
X-Gm-Message-State: AJIora+xiutsSdhw0VHNWYDpHTryizfyHGwBVplHdeQ8wByPtG4jOzCY
	mrVyDUihaRMR7ht2CP8Dqg==
X-Google-Smtp-Source: AGRyM1t8+HTOGXnkYMIWNIFD5Olq8bhfFtLnjZWpAPq65vQDqoVSjEyZZhyCQPGLFyTFy8OvbwWD9g==
X-Received: by 2002:a05:6638:4105:b0:33c:b13:23ed with SMTP id ay5-20020a056638410500b0033c0b1323edmr11732399jab.82.1657579869885;
        Mon, 11 Jul 2022 15:51:09 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d78-20020a6bb451000000b00669ceb1d521sm4117055iof.10.2022.07.11.15.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 15:51:09 -0700 (PDT)
Received: (nullmailer pid 415975 invoked by uid 1000);
	Mon, 11 Jul 2022 22:51:07 -0000
Date: Mon, 11 Jul 2022 16:51:07 -0600
From: Rob Herring <robh@kernel.org>
To: kewei.xu@mediatek.com
Cc: linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, david-yh.chiu@mediatek.com, liguo.zhang@mediatek.com, caiyu.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, leilk.liu@mediatek.com, devicetree@vger.kernel.org, yuhan.wei@mediatek.com, qii.wang@mediatek.com, liju-clr.chen@mediatek.com, housong.zhang@mediatek.com, wsa@the-dreams.de, robh+dt@kernel.org
Subject: Re: [RESEND v4 1/2] dt-bindings: i2c: update bindings for MT8188 SoC
Message-ID: <20220711225107.GA415923-robh@kernel.org>
References: <20220708034758.22747-1-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708034758.22747-1-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_155112_025000_23C645F7 
X-CRM114-Status: GOOD (  10.49  )
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

On Fri, 08 Jul 2022 11:47:57 +0800, kewei.xu@mediatek.com wrote:
> From: Kewei Xu <kewei.xu@mediatek.com>
> 
> Add a DT binding documentation for the MT8188 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> v4: resend patch
> v3: add reviewed-by owner
> v2: no changes
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

