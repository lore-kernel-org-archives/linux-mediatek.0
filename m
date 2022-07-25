Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E53C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 22:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lnMpoZb+qHkuYn7ZnPpjURPzGmFuQzUhlPQ6dAnI2E=; b=Hm8aUjP5EjYVTOv5j8u/1sCm72
	LzT1zZA9qfLQtbfN0cbo6/xNncirgCFtDqNw9Yil7193Jim2OnvoLoiK40ZWjOmZZOxoiQcsZkxyJ
	eq2U0LhwuVkExrU0IapxqhaKMDu/nwJqjci26hcPitIl+Aeelf1uvvNKgF9n+XjrdLZQkhkoWrSIQ
	VI5ctRXDJ6tPqEzoMpfnCDhFh5j9sJSEgS/hg6gghTuCwvZwxjB1NF54mn5yF1dlVIo8zy5bzEoxt
	BROr8S2ckw0cpikVt17bTs6+kMDszc8BCW5xagLwAxr/EkLe3RFTwZ3vAWQnRiKDfY8+2Zw4Hnpwz
	2Abbv+EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG6Vh-003ATY-O4; Mon, 25 Jul 2022 22:25:09 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG6VT-003AKl-Pk; Mon, 25 Jul 2022 22:24:57 +0000
Received: by mail-oi1-f176.google.com with SMTP id w188so10964108oiw.8;
        Mon, 25 Jul 2022 15:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4lnMpoZb+qHkuYn7ZnPpjURPzGmFuQzUhlPQ6dAnI2E=;
        b=d1RVXVx5JGs4x9JBi9/VVnAOfKQksMc30noFyaDVDNhzrTPe+wx9UF8H4XhE+7Iqnr
         +33GGA2yPff6nkfbjf1weDAuXpLjeo1rm2vQ+aZx5voG9BXKVE2KZQXsHVFuGZcH4StZ
         WcG/bFHCBEgKBmfdUTPoHuAPmzUZx/bmmGW/iR/HMxynB/DWvzHzlL9rBzyPCDhiQzEL
         Uw2PhQz0JWjUT/tcOUnTePPW23Lb07X+Sk42cbmrp3eTNGyaG0dpdujG46GQ+LScrPQM
         HlRCm34G8/ZyIiFhSCO8FYUdq7Eeu5Me3qbNptTvV0Rca/t/8aHjmyQ6jEQwXT+OTfMv
         GwMQ==
X-Gm-Message-State: AJIora+NoZlN0rzzUZbGTd22IeWGEb8PAH1ZfatjE1w6PDOZxOf8ZU77
	Wug1SX7mNIsDz2qtYRjDBg==
X-Google-Smtp-Source: AGRyM1vAofLtAEFQzPOgCv9X/fCj3FwcSwZCkPVppTY/bmRdoY/U3iOTun0xg2e24/o3pIP7hHNcIg==
X-Received: by 2002:a54:458b:0:b0:33a:74a7:4271 with SMTP id z11-20020a54458b000000b0033a74a74271mr6389250oib.287.1658787893762;
        Mon, 25 Jul 2022 15:24:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id l6-20020a05687040c600b0010c5005d427sm6639754oal.33.2022.07.25.15.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 15:24:53 -0700 (PDT)
Received: (nullmailer pid 2853362 invoked by uid 1000);
	Mon, 25 Jul 2022 22:24:51 -0000
Date: Mon, 25 Jul 2022 16:24:51 -0600
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Lee Jones <lee.jones@linaro.org>, MandyJH Liu <mandyjh.liu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-mediatek@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH v3 05/21] dt-bindings: power: mediatek: Update maintainer
 list
Message-ID: <20220725222451.GA2853305-robh@kernel.org>
References: <20220720123023.13500-1-tinghan.shen@mediatek.com>
 <20220720123023.13500-6-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720123023.13500-6-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_152455_856098_6FFD5E28 
X-CRM114-Status: GOOD (  11.40  )
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

On Wed, 20 Jul 2022 20:30:07 +0800, Tinghan Shen wrote:
> Update the maintainer list of power controller binding.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../devicetree/bindings/power/mediatek,power-controller.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

