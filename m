Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51053C00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 15:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSswJuC75R6XDrPIU1WtI9zMLCP/ryjDK45Y39QAIBs=; b=QYIB4IFJc5vmXojFjidabJYW9E
	bqgBgEqu+49oX04VLalpmA/dUJSwnsxYUhVfhY6De1olSVXt6U1v6nIbRCVyiDv8pGAjSTndGjkai
	Q7Y/XcfGktmu8Jd/ZFGcwXPWpxOAmfqnNUzz2JFfQLQtpYJSNqZn+tPawDpsWTXKTud3UZQ1yDdYc
	QSxAmMLGg/lyn/plFxc4nCijKQSWumYY40AznE2+ixVFIus5+6mBCvf1lsxTOH6HomUcxUo+hjYcf
	Z66KdWhua1Y8egnJLHKZpJLISrzWFQFtgX8GevIXU3/qdPPs4QPoR7XeGYX0uiqMCPNb0KIm0hrBH
	NX0Nd3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOhVQ-006f0E-Bo; Thu, 18 Aug 2022 15:32:24 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOhSS-006dOf-2i; Thu, 18 Aug 2022 15:29:21 +0000
Received: by mail-oo1-f49.google.com with SMTP id r22-20020a4abf16000000b00448a8a2044aso404714oop.12;
        Thu, 18 Aug 2022 08:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=bSswJuC75R6XDrPIU1WtI9zMLCP/ryjDK45Y39QAIBs=;
        b=0fTfAKA+3e0mjDnSEwI6oaLm7Aj4kpRytcaqYCH9eqoWh0Ksdsh4guiNqk5xPhn5ak
         iut/5eVXH75tV6PnurC8gWyJ8N9ecKs4UP/+X1BVS95tDo/6WtcY7iSXFu+C4FRRexAP
         8bevdVqv2EcvBvYq0HZTG8mBlDowOphAj6vAIGIp+opdeHI34QVJ5D+YxUGC8Pqryfp4
         PaPQRBlM3uS//VXzgdCVFtGFqJlddRZDWf05y9GEZeJVka/+Afe3EIJA9hvGd5AnXZAu
         CzYHqltxddc4biRosK8wtKD/ymXC0QeQoLI1ZPnujlo7hmECPm0gkx/rbPuM+GbRt39a
         kjYw==
X-Gm-Message-State: ACgBeo0V9CpJe/ABs836nvLwVqlsWDzRdnYnYeZNHJRg2vEwPZdnusFR
	fJaiHd1XZTowncdkTr1SOA==
X-Google-Smtp-Source: AA6agR7xwZCJnyPO6SbLNaIEgg5t/Izwz4ra7rD9omGf98iEzXjjM8IaFZpVK/cbz/Gbp8B4CH9v3Q==
X-Received: by 2002:a4a:e54e:0:b0:44a:fb57:7022 with SMTP id s14-20020a4ae54e000000b0044afb577022mr617657oot.91.1660836557832;
        Thu, 18 Aug 2022 08:29:17 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:5fe0:b4f5:6e22:4704:df60:73a3])
        by smtp.gmail.com with ESMTPSA id g128-20020a4a5b86000000b004489258c9d2sm371872oob.2.2022.08.18.08.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 08:29:16 -0700 (PDT)
Received: (nullmailer pid 1902294 invoked by uid 1000);
	Thu, 18 Aug 2022 15:29:14 -0000
Date: Thu, 18 Aug 2022 09:29:14 -0600
From: Rob Herring <robh@kernel.org>
To: "Chengci.Xu" <chengci.xu@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, yi.kuo@mediatek.com, anthony.huang@mediatek.com, wendy-st.lin@mediatek.com, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: memory: mediatek: Add mt8188 smi
 binding
Message-ID: <20220818152914.GO1829017-robh@kernel.org>
References: <20220817124608.10062-1-chengci.xu@mediatek.com>
 <20220817124608.10062-2-chengci.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817124608.10062-2-chengci.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_082920_228296_4827DBB0 
X-CRM114-Status: GOOD (  13.89  )
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

On Wed, Aug 17, 2022 at 08:46:05PM +0800, Chengci.Xu wrote:
> Add mt8188 smi supporting in the bindings.
> 
> In mt8188, there are two smi-common HW, one is for vdo(video output),
> the other is for vpp(video processing pipe). They connect with different
> smi-larbs, then some setting(bus_sel) is different. Differentiate them
> with the compatible string.
> 
> Something like this:
> 
>    IOMMU(VDO)          IOMMU(VPP)
>        |                   |
> SMI_COMMON_VDO       SMI_COMMON_VPP
> ----------------     ----------------
>    |     |   ...       |     |    ...
>  larb0 larb2 ...     larb1 larb3  ...
> 
> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../bindings/memory-controllers/mediatek,smi-common.yaml      | 4 +++-
>  .../bindings/memory-controllers/mediatek,smi-larb.yaml        | 3 +++
>  2 files changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>

