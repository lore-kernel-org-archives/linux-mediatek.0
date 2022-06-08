Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3A3C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 15:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/HUmGhtUqLzHMZoFwuwoB9+sX1LsefMq7dYk7SnigKw=; b=0W5grCobE3gbEV
	njSwMIosxK7Q2gawMeJ4XdOjrrC4E4xXuzvlf2RZCO8EVp82oFBpWhNME3JfAtI0hC/AAP/26J9RY
	FhfygVS7wZOPjjC5nmFn6fNSOIMXLb7Ke+4qAN38U4KT2gtCQHzQcePBTn57bVRpfHV5pkXdKc6TI
	8e4q7PxQg3rwJeG/HxdmFMqCxU8TeZjSX49jTOQgoqXn22qYHOHqXesgvAtM19sIh7ioi0XAZUDPM
	1pILjQ5Vxn5bZsQ7PNllbxKOMNWi5HlQ285v5ABY2fawDmILTlkpwFEuAXipH0N0P4kuxsI85E4ih
	4pq62gN/ipeYh3SgT54A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxAf-00DrFM-0V; Wed, 08 Jun 2022 15:00:33 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxAc-00DrDa-Bx; Wed, 08 Jun 2022 15:00:31 +0000
Received: by mail-io1-f49.google.com with SMTP id z197so14946445iof.1;
        Wed, 08 Jun 2022 08:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5xIHFMIqlOUk9Aus35ryVRsDFE47iiJwnIacUdLPVwY=;
        b=ds/bXWlKnZpxp1pZG4X7QH6LUYyiK17sBsvFhpwEq3yIBXE+OOPgYShfAa99+okQsb
         64hnMr3By/aZJDv0tS9QxG21shFCsKnxeTPZs9HZPsZ5jCFX1simItq8vUSRALps6JQt
         196AD43jxcMtLHgJYt9HQtxEhjn66MWBTjIrXFmUH9k5jaFPLnZmRRuwO+Uy+hpXMSjr
         upehU9/hgackHdUGz+rBhuO9dHyYyDlITTYcUeNmJ0cxloYUeVqfl5RCTouyXZeTWnZ6
         ycUoe5kdGwXeAImfF3gOGa+reseeFjKeriX3mBv6oVRfEMEljLXbegAt2A2DgZiNXeU8
         WcKw==
X-Gm-Message-State: AOAM531+fTVI2SiztahgTc1CMyJ+fv2l2t+3T7noJ3rlgFZ9uMHEnmrH
	JXU2cyzXTP4zRfM1H2S0yQ==
X-Google-Smtp-Source: ABdhPJyzlGi+QzeZyTQq4zOi31iAXIn0f8Dgk2LUVJzEf1hLrggGw+NONFfZiJftfEUfxEIgASsyKg==
X-Received: by 2002:a05:6638:2503:b0:331:950a:9478 with SMTP id v3-20020a056638250300b00331950a9478mr10671602jat.211.1654700426927;
        Wed, 08 Jun 2022 08:00:26 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id w123-20020a022a81000000b003315f06075csm7737187jaw.22.2022.06.08.08.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 08:00:26 -0700 (PDT)
Received: (nullmailer pid 1398631 invoked by uid 1000);
	Wed, 08 Jun 2022 15:00:24 -0000
Date: Wed, 8 Jun 2022 09:00:24 -0600
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: kyrie wu <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa <tfiga@chromium.org>, xia.jiang@mediatek.com, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, maoguang.meng@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [V2,1/2] media: media: jpegenc: add mediatek,mt8186-jpgenc
 compatible
Message-ID: <20220608150024.GA1398383-robh@kernel.org>
References: <20220608060755.2213-1-irui.wang@mediatek.com>
 <20220608060755.2213-2-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220608060755.2213-2-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_080030_454534_5B159DF3 
X-CRM114-Status: GOOD (  14.45  )
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

On Wed, 08 Jun 2022 14:07:54 +0800, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> Add mediatek,mt8186-jpgenc compatible to binding document.
> 
> MT8186 iommu support 0~16GB iova. We separate it to four banks:
> 0~4G; 4G~8G; 8G~12G; 12G~16G.
> 
> The "dma-ranges" could be used to adjust the bank we locate.
> If we don't set this property. The default range always is 0~4G.
> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> ---
>  .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml    | 6 ++++++
>  1 file changed, 6 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
