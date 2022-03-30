Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2C1C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 12:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B20dBRTplKvYhkWy4633ejQR1yuJTzFbLs/nPEplA0Q=; b=aPZZ2D0W7e5oyt
	oDfd/NigBWFcvAZzSp2D6K2dMdJR6uqXxBRtSQ6qFsI/cQZvgm96+fjcD1b63GPDcLvFtqvj/0ucB
	SC9kr6hd8/YXTTLWQcrDWjFQrb14MoyspdJoUpdmIDXq+sRgVU3bQ3AZHydJSBeP4LXaxrUm/fqJY
	9GdD4PZKZlmKWQXOaJNLuwWvgVPJIlG34OU0JpLfp3mEtRxn1D0LyvTQAuGlDbyjmF/4elDyvYnPq
	RuSsl2C/bgbv4CHhWYa6fLAbMc2A/8kIarlDm065DsAj+aBQ5RZHmBcVVxSLHgFTH26XYEchF+P0l
	o0npk8v3ahapAJWfvr2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZX03-00FVXj-Jr; Wed, 30 Mar 2022 12:00:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZWoo-00FPm6-CK; Wed, 30 Mar 2022 11:48:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D9AB46162C;
 Wed, 30 Mar 2022 11:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBF7C36AE3;
 Wed, 30 Mar 2022 11:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640932;
 bh=Yw9KpInkgsNYhh+OCNup/aC8fKxzxvvo6UbYxOjbCnQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ukJPwQxo66ZQ8HYDWDJCCeoPDTtzB4grXjeDGQUYLE2TMQng7jShzU86DrWGMTBQo
 6hqb9iuf5Fth1gacOxOdT4wUuhEz2bng7dzYhpOsyvpmsHdBfJn81dT4AszgFNbqWc
 ilV5myNX8phBu9YmQhdHJ6mYj11QhhZOiEjKvPICmvKRR6XHDwdesHLw/AxRCSHDaK
 OG7Q9Ip4vSIoMVsVFZFcFdWUXq/DQ4nGLo7kRPGb2GFmv/dZGT7X5KYUo8OwAIDlix
 2aPsGRKbO57zJPUVYYFoxYN9h9mvrXib+krXpO5eWgH1vv67kN1wYa4+kDbponjjbm
 psm8u8608l4cA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <jroedel@suse.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sasha Levin <sashal@kernel.org>, joro@8bytes.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.16 12/59] media: iommu/mediatek: Return ENODEV if
 the device is NULL
Date: Wed, 30 Mar 2022 07:47:44 -0400
Message-Id: <20220330114831.1670235-12-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114831.1670235-1-sashal@kernel.org>
References: <20220330114831.1670235-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_044854_513006_76D4BD27 
X-CRM114-Status: GOOD (  15.55  )
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

From: Yong Wu <yong.wu@mediatek.com>

[ Upstream commit 2fb0feed51085db77606de9b9477c96894328809 ]

The platform device is created at:
of_platform_default_populate_init:  arch_initcall_sync
  ->of_platform_populate
        ->of_platform_device_create_pdata

When entering our probe, all the devices should be already created.
if it is null, means NODEV. Currently we don't get the fail case.
It's a minor fix, no need add fixes tags.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Acked-by: Joerg Roedel <jroedel@suse.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/mtk_iommu.c    | 2 +-
 drivers/iommu/mtk_iommu_v1.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 25b834104790..77ae20ff9b35 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -848,7 +848,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		plarbdev = of_find_device_by_node(larbnode);
 		if (!plarbdev) {
 			of_node_put(larbnode);
-			return -EPROBE_DEFER;
+			return -ENODEV;
 		}
 		data->larb_imu[id].dev = &plarbdev->dev;
 
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 1467ba1e4417..68bf02f87cfd 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -604,7 +604,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		plarbdev = of_find_device_by_node(larbnode);
 		if (!plarbdev) {
 			of_node_put(larbnode);
-			return -EPROBE_DEFER;
+			return -ENODEV;
 		}
 		data->larb_imu[i].dev = &plarbdev->dev;
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
