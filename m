Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779EBC54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 15:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0oD3zj5DX+kUZohynN5E92j/zA/TVnioSDMFHlpq9Y=; b=h8MpoKdkAAxuhA0O1gj4cqFLuf
	SVXR3I1N5H2IFWD9g8obOA4+3ctK1cnXHJfDIoDq5KK8L+l2BRlkShcKXunJmKw2hnWPDojCqHuaZ
	g6edTdmdPHcRys8GnQtVNDPSKqxnpxA9fDdr+c+EZ77xL7TtbUIUfqWF60Qut8t7vxB8G1kx1FPex
	BuQt0Tnaifj1QORtVR4ygZDr5jY+w0CDex2SBCIzru9yHlJlzw8Ha9wX9qd5GXdSRk8LaCyVfL5/7
	kV7VprwL5AaI7U3Svsi3wUXENt1AMbjPoRiTS52RizU1GjVSjnXmk8rabDaV/bi2bCgSQZv31Pfrj
	kWEwJSmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGM25-003DKZ-Tf; Fri, 13 Jan 2023 15:31:53 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGM1t-003DEy-Pa; Fri, 13 Jan 2023 15:31:43 +0000
Received: from 8bytes.org (p549ad69d.dip0.t-ipconnect.de [84.154.214.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4E268261BE3;
	Fri, 13 Jan 2023 16:31:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1673623899;
	bh=W0eZQ+91SuOKkGncj7gzewhbmwWHOsQ0mNd5zAk/Afg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kd3MvqU4M0jhYsQnXTuWTVSnh8u/ySUWg+9yJInC5Nf3HOGNvLRTmxR/rphYWg4Sf
	 PYoiGuU583mXBOij5+1S2oKSMygZ/8aUhdw84fm70YckG2AD8H2FDMNIZ49oxXjD9D
	 w4tILH5cAYM+tRhz4OZOHveIUSmEKYzGPPx/mA+YGZxmqn+Q3/vekAHvP02rIASyhW
	 QvklPlTBURl0l8H95wV/d3XxGm/4Ocyp9bnQ2a/7SEwQKabkeMEyEbocQabC+eW3dH
	 yy3qLdHjJzKsUgk2R044hZ54dsY0RJRqNqB6RnCH1xm/3ACcxEcHX9VGBeq5qzTIx4
	 i5ISakzVcqpvw==
Date: Fri, 13 Jan 2023 16:31:37 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: "Chengci.Xu" <chengci.xu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 0/4] MT8188 IOMMU SUPPORT
Message-ID: <Y8F5WUCr5bzv9SgS@8bytes.org>
References: <20221223101439.494-1-chengci.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221223101439.494-1-chengci.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_073142_085884_DA8B824B 
X-CRM114-Status: GOOD (  10.61  )
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

Matthias,

On Fri, Dec 23, 2022 at 06:14:35PM +0800, Chengci.Xu wrote:
> Chengci.Xu (4):
>   dt-bindings: mediatek: mt8188: Add binding for MM & INFRA IOMMU
>   iommu/mediatek: Adjust mtk_iommu_config flow
>   iommu/mediatek: Add enable IOMMU SMC command for INFRA master
>   iommu/mediatek: Add MT8188 IOMMU Support
> 
>  .../bindings/iommu/mediatek,iommu.yaml        |  12 +-
>  drivers/iommu/mtk_iommu.c                     | 113 +++-
>  .../memory/mediatek,mt8188-memory-port.h      | 482 ++++++++++++++++++
>  include/soc/mediatek/smi.h                    |   1 +
>  4 files changed, 584 insertions(+), 24 deletions(-)
>  create mode 100644 include/dt-bindings/memory/mediatek,mt8188-memory-port.h

Please let me know when this can be merged.

