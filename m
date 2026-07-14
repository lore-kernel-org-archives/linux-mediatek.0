Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD83C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2026 02:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RMQXnFeO5BMpwcl0jMYZT6qAkgOxYonmNUcoDCtOyA8=; b=km/tq5riuq2f0gdqtoB1aPmOS+
	Zk3ShXjHO7Mvs5toSB95gXlNz+8kU2AcczqkMty1NGP4yni9u7EK/IMu6sGnot2RVkX/M8F7Nb0mW
	yN+mJtnZO+p1L112ZJvbPUHChuIrsVI6w6vTtrb0hHJNfG4701Vfy9Gwgtj8XLBs0ZV9weXhY2AqR
	fETiiHhHvlfp9mBHfDmrLtLKP0est95CB3lAlRh2gMM52zrgu4hkspiV6MeKl5J4egpG8zuj2GBLn
	tub9pT+toePsxjLRnLunyeQJPM/NGblwN9OiKS+TaA3sVwINgPKG6AhSuCgA6Y+UUkIOqW8AWCGGN
	RVEem59g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjT9T-0000000Am9X-05O4;
	Tue, 14 Jul 2026 02:45:43 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjT9Q-0000000Am8B-2Zkx
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jul 2026 02:45:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=RM
	QXnFeO5BMpwcl0jMYZT6qAkgOxYonmNUcoDCtOyA8=; b=kPycrThSJcoDXjRPEa
	LedGeX52oznxE6nB5ExRoHdLkLkA/0b0FlgovVaxwMIfGtIVjDme3SLoqqILkZFs
	EnLZ/iF8/p+hFF2JSw+KOrx9n28AASJamEPGgQKPhrp0DrBbqM7wodi12DynmYLX
	XhJKtRe5mE5N5ZPB6qVxWOqNU=
Received: from xwm-TianYi510Pro-14IMB.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCnI12_olVqESc_IQ--.47824S2;
	Tue, 14 Jul 2026 10:45:22 +0800 (CST)
From: weimin xiong <15927021679@163.com>
To: iommu@lists.linux.dev
Cc: yong.wu@mediatek.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	linux-mediatek@lists.infradead.org,
	xiongweimin <xiongweimin@kylinos.cn>
Subject: [PATCH] iommu/mtk: fix spelling of correspondence in comment
Date: Tue, 14 Jul 2026 10:45:19 +0800
Message-ID: <20260714024519.188603-1-15927021679@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnI12_olVqESc_IQ--.47824S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWkJF4xGr1fJw1DJr4fKrg_yoWfGFc_Gw
	18X34kJr1jyF4akFn7KF1S9rWYkw1q9Fs3Cr95Kr45XwsrXr1UWFWvvrWUAa1DuF47AF98
	tr1Fk3W3ArW3KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8NAw3UUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: jprvmjixqsilmxzbiqqrwthudrp/xtbC8wLIUWpVosLCVAAA3h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_194540_984479_5CE61507 
X-CRM114-Status: UNSURE (   9.63  )
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

From: xiongweimin <xiongweimin@kylinos.cn>

Correct "correspondance" to "correspondence".

Signed-off-by: xiongweimin <xiongweimin@kylinos.cn>
---
 drivers/iommu/mtk_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 2be990c10..b52e16b06 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -220,7 +220,7 @@ struct mtk_iommu_plat_data {
 		unsigned int	iova_region_nr;
 		const struct mtk_iommu_iova_region	*iova_region;
 		/*
-		 * Indicate the correspondance between larbs, ports and regions.
+		 * Indicate the correspondence between larbs, ports and regions.
 		 *
 		 * The index is the same as iova_region and larb port numbers are
 		 * described as bit positions.
-- 
2.43.0


No virus found
		Checked by Hillstone Network AntiVirus


