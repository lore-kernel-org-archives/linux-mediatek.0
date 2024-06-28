Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E485C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 11:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+danxBg72kkVWhHZ7NufVUsP5WdRg7pgzK5U7q+oXYY=; b=tBUpYxUMKY6Q0H2k1oioJgzBPX
	icVzBK7GyoqM+ZZd/tVAn6CoLffE9+jVzmtbt8ln7nffGfb0DJbNHarTTH6v/FSBXmPppSKuEhSab
	vDqdCKomC1uiNal20PQ/BJM51r/5PuRVGqGBpYNMMfM7iRlHhvGKsdcw24aeYaGyYNgxvnanN0Rcn
	rx/+3b3wX23DIGoQNs6nLv4eG+NNP5xwDeAteJzRGlSY4yDfjPVTJX1JhKslZ63QR+Cena6N8KokN
	I4HUildy9Xn8eQNSakvpZB53WUAsg05yliMoMCZLIQq+YJ0aYHhVNEbWWtB3Ryzt5KdJ6r3YxEySo
	9Kc4ad4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN9o9-0000000DXGr-1VsX;
	Fri, 28 Jun 2024 11:30:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN9o6-0000000DXGQ-1lLa;
	Fri, 28 Jun 2024 11:30:23 +0000
X-UUID: cb4aa7d0354111efb2966dae1f787272-20240628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+danxBg72kkVWhHZ7NufVUsP5WdRg7pgzK5U7q+oXYY=;
	b=Vw3h66IcM7Ih/RuLuPAitnpVkOahLYiB1KN0xW0o3rMhMSliiACVhdHUAuNOxVrC/YwAY6B6TEm0/hRokSClEqcj2xLXvwyb/mFIWjvOQAawRaXBqW6CisTgdn+RDpKKIHu4R+L5eS/GgGXJVpMg0mg7u9XA44WxDZgaJHvUPBQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:6cc62855-6391-40f5-b3a4-9b413916ac4a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:b647ad44-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cb4aa7d0354111efb2966dae1f787272-20240628
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 332438798; Fri, 28 Jun 2024 04:30:17 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 28 Jun 2024 19:30:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 28 Jun 2024 19:30:13 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <yj.chiang@mediatek.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] iommu: Remove iommu_sva_unbind_gpasid
Date: Fri, 28 Jun 2024 19:30:04 +0800
Message-ID: <20240628113011.3535-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.239400-8.000000
X-TMASE-MatchedRID: S6zgMyN4g9KGsPek1xLHVnH7HV/mO4UTT9kSL7SwB1hq1Zuz1uJuCNn7
	b/+Y15IvMm6uZ1zccZcQCEi5k+nQxB8TzIzimOwP0C1sQRfQzEHEQdG7H66TyHEqm8QYBtMOvwY
	XYCR6VwgLQgZ3u/DVwAgsD3ZCYFN1JDDLO9wvb7dnPqKjSU9SXe7o5tZbWcdZRvCkNdMmYoFxsN
	4zhBrsExsXRXHy1IH0eZUpm6wun3ba/06NhYDa4wyzCDjlUx89djekYOaiKTo=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.239400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9C659BD85D1E1F99FDEC3C8CB47448B2FD5AFBB33DCB9AD1BC9FAA614F21077D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_043022_489559_9F34C7CB 
X-CRM114-Status: UNSURE (   8.28  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is a left over of commit 0c9f17877891
("iommu: Remove guest pasid related interfaces and definitions")

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 include/linux/iommu.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 17b3f36ad843..225403cfe614 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -785,8 +785,6 @@ extern int iommu_attach_device(struct iommu_domain *domain,
 			       struct device *dev);
 extern void iommu_detach_device(struct iommu_domain *domain,
 				struct device *dev);
-extern int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
-				   struct device *dev, ioasid_t pasid);
 extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
 extern struct iommu_domain *iommu_get_dma_domain(struct device *dev);
 extern int iommu_map(struct iommu_domain *domain, unsigned long iova,
-- 
2.18.0


