Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A52C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 15:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amS3FGfsgbMb0nzVH1PDVjchLpb+QsDz/31V+WB1mKE=; b=T4BvC+skTD9Us6
	DicPDJUtzSk0snEqVlokdvaHxKpDT5JXK+lRHN3qdFsQ2bbtEw3VfirsRZM7pIzsr95HJZn4/pZQc
	lQAhfHrLXvRB6qVbKCrJgoiuRWNAa4zoFTc6OwpMFY2jsVFzAA6Mzw3aCkGhVrwn3Bjoddp5Wg4It
	wWEAosQ39YHjcZpe0E0qV9NRkpYzteMN0cpEQEG32xGFzH5Jp59HgEkY4g/8cm9coRSs9lCviuTH+
	DlD1JDQxjlVMPWU2LrfxQXbcyZCp+sY10fdOzJcCzeGNxb0xs0BbEwt6Ex0lDuxH2y5yztdL0p8ya
	QYmXFrZbEP2AbFXSitGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk63n-007f7p-Ej; Thu, 28 Apr 2022 15:28:03 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk63O-007exx-MU; Thu, 28 Apr 2022 15:27:42 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id CBFB6374; Thu, 28 Apr 2022 17:27:32 +0200 (CEST)
Date: Thu, 28 Apr 2022 17:27:31 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com,
 libo.kang@mediatek.com, chengci.xu@mediatek.com
Subject: Re: [PATCH v3 0/2] MT8186 IOMMU SUPPORT
Message-ID: <YmqyY7V5p2i2h6ZN@8bytes.org>
References: <20220407083230.18041-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220407083230.18041-1-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_082738_933894_607A2F26 
X-CRM114-Status: GOOD (  10.54  )
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

On Thu, Apr 07, 2022 at 04:32:28PM +0800, Yong Wu wrote:
> Yong Wu (2):
>   dt-bindings: mediatek: mt8186: Add binding for MM iommu
>   iommu/mediatek: Add mt8186 iommu support
> 
>  .../bindings/iommu/mediatek,iommu.yaml        |   4 +
>  drivers/iommu/mtk_iommu.c                     |  17 ++
>  .../dt-bindings/memory/mt8186-memory-port.h   | 217 ++++++++++++++++++
>  3 files changed, 238 insertions(+)
>  create mode 100644 include/dt-bindings/memory/mt8186-memory-port.h

This patch-set seems to apply cleanly only on 'MT8195 IOMMU SUPPORT',
please re-submit it together with the former when you made the changes
Matthias requested.

Thanks,

	Joerg

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
