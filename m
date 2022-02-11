Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CE1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 16:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5dj3AEJOMvbQaCd4Lf+njJJ2EpG0VARZ+pkisKUhHt0=; b=A49gf9cvkfZ6Te
	JAygaBvlqlgXbmaVJOw1rg1cAVdicX3uONh3Qk5eVJbVshMbRyNMV2Pff5aLNmj1a4e9ntbalODN4
	D5mrS6yUcnduVgLbDjYpyQfUJ7NUyoXRW564nLEA1p3wGE8UjK6iMKJdWXsn9uDH1OTvGpxKVndJc
	Y6SGJLNwlLh/As0gl6lqhnuGl/B1z8smuVoLx/nmUuHXhEeVhQzIp7+/y3aH7wi8UyAUPxPv+YyG/
	hpucwBWQWduebNu5JIum4+1nhcy8ifR7UhhT1eQjYySWJvcnnz9RGsvR9ElHGTYbb3ZWhis0ptr7G
	YXiH++ILBOzVNu3k3mpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIZDD-0088J9-Rw; Fri, 11 Feb 2022 16:55:59 +0000
Received: from mail-qk1-f173.google.com ([209.85.222.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIZCx-0088ED-23; Fri, 11 Feb 2022 16:55:48 +0000
Received: by mail-qk1-f173.google.com with SMTP id b22so8745799qkk.12;
 Fri, 11 Feb 2022 08:55:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1UwYLCupktfjJ9mUj4/QYlTAZwDMfe5S5C3K0edWIBg=;
 b=T9HhJBJn2TOT7/DTa1FM/QTC0jD7z062PdqYIok4b0iNuWIzbzFmrVtaXnn1hMMG+P
 JvKE56r7YHNc6D+/ZDROIGTNhqjkgFl2w5x6dmpuj0gbWcp3mKLNT9Q1/rzEEd6vroPQ
 cOd9LP1VwoeW6AvOx31rPgRcxB1DufLK9mCPBjaOx7cFTQBSchhimsIh6+SVc0OGG9J0
 NTyrQ1mFrTJmTObErqFBUtSch6AaxwPqryFD6fScVpH2nlY6OL8VsAJi1G3/aAPoP3LN
 bW1VlDcGdG3MojqfEui57zHNr0lD0n+kk/8lsQSdMZKVQwcFX3eOeaLtKxFWxS1okRse
 gk0w==
X-Gm-Message-State: AOAM531pBi8WF1hi0bxfbvYURZDweceruklQlja3hQek/xi1pEfzd50B
 CF+oCfozp+EqBYkLKCv/jQ==
X-Google-Smtp-Source: ABdhPJzWhtYP/lUed83bNEhXzwT/Rs7Lt75nHeV6b3tF2GWmTTD5Cck+mTKwvTJDx3LpaD35b0Op9A==
X-Received: by 2002:a05:620a:d45:: with SMTP id
 o5mr1221552qkl.731.1644598541587; 
 Fri, 11 Feb 2022 08:55:41 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:5fee:dfce:b6df:c3e1:b1e5:d6d8])
 by smtp.gmail.com with ESMTPSA id
 bk19sm11503188qkb.125.2022.02.11.08.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 08:55:40 -0800 (PST)
Received: (nullmailer pid 512729 invoked by uid 1000);
 Fri, 11 Feb 2022 16:55:38 -0000
Date: Fri, 11 Feb 2022 10:55:38 -0600
From: Rob Herring <robh@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/6] dt-bindings: spi: Add compatible for Mediatek IPM IP
 with single mode
Message-ID: <YgaVCmizWJfFMK5I@robh.at.kernel.org>
References: <20220209111938.16137-1-leilk.liu@mediatek.com>
 <20220209111938.16137-2-leilk.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220209111938.16137-2-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_085543_119181_59FFEFF0 
X-CRM114-Status: GOOD (  15.04  )
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

On Wed, Feb 09, 2022 at 07:19:33PM +0800, Leilk Liu wrote:
> This commit adds dt-binding documentation for
> Mediatek SPI IPM IP with single mode.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> index bfa44acb1bdd..0a2fc0404cb3 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> @@ -41,6 +41,7 @@ properties:
>                - mediatek,mt8135-spi
>                - mediatek,mt8173-spi
>                - mediatek,mt8183-spi
> +              - mediatek,ipm-spi-single

Is IPM an SoC? Compatible strings should be SoC specific or whatever 
granularity could have a unique errata.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
