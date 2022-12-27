Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D2EC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 20:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBA1csH2zpTCPXc/mOCJje46UG2/G02CQjnuR61mbD4=; b=GXWMt4ujgx3t4/ppQhxLbBB+I2
	gmqZNSru0HGFoKzglWbHsTDHdb0F1qv3furpouRU65lK7G03pd+UkE2D+hfFLcByo8mecREX3yg2p
	kNwMsd4HGhPrji6NIjN2/nG1IrDP3qqoUahz1Zh7Gv2dbtgobs20Oz7YotBCQCN9lVoFW5Sbe/0oi
	tT8VuggEln9o1zSQZ0WCRJw9WMyqy2Z7oJichdhdwi/gZVHu7MX+0TkXBI6pVCzJloilrzH+uJCeW
	05ASIyofILWxO/Ulel9xJ8AZ6EH1oIKAJJ9PU1Y2ofOyP5OiSedF/24ihQK+WNhxooxWtpDIZYkVU
	K4Hu1UqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAGdx-00G5el-Ga; Tue, 27 Dec 2022 20:33:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAGdV-00G5V3-MH; Tue, 27 Dec 2022 20:33:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3BF6D6122C;
	Tue, 27 Dec 2022 20:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B521C43398;
	Tue, 27 Dec 2022 20:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672173200;
	bh=I8m2fSy540HdqyYEIxo83HseOdiuUlSL2etr2oXtefo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RQJcuKAkaxcmqI1LLcaVXy6ZX1bV5z6Q3S9QNZfpHlFTUe7pplheo3J8XPUlXsHkJ
	 8RcPs1iEeH+wFWH7dkXBCxThhZ/yumdQ4r/es3F6y37WzSf5+3Y1waB/1Dkbn8D3FX
	 qFEB6exyvYoSbbcKjOjqlukDUZ63br6Nje8kgieWtr2U0AhdmUmjIyusZ5HRCIdWox
	 MYTyspCstLE7ihZhRLrgsnHQOf/ikvjni0TeF+TvmiQW5HKWgzFvp3ep2whF2alNGv
	 Htzv9qqhS1hxxqcSaLir7RsepgZZ42t/XxXOs0Xj0auKDpwr+0Ovq8tPOHrSUFE2Zl
	 vVaKB1t8Wmadw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <jroedel@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	yong.wu@mediatek.com,
	joro@8bytes.org,
	will@kernel.org,
	matthias.bgg@gmail.com,
	iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 20/28] iommu/mediatek: Fix crash on isr after kexec()
Date: Tue, 27 Dec 2022 15:32:41 -0500
Message-Id: <20221227203249.1213526-20-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227203249.1213526-1-sashal@kernel.org>
References: <20221227203249.1213526-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_123324_885697_AFF8C355 
X-CRM114-Status: GOOD (  12.93  )
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

From: Ricardo Ribalda <ribalda@chromium.org>

[ Upstream commit 00ef8885a945c37551547d8ac8361cacd20c4e42 ]

If the system is rebooted via isr(), the IRQ handler might
be triggered before the domain is initialized. Resulting on
an invalid memory access error.

Fix:
[    0.500930] Unable to handle kernel read from unreadable memory at virtual address 0000000000000070
[    0.501166] Call trace:
[    0.501174]  report_iommu_fault+0x28/0xfc
[    0.501180]  mtk_iommu_isr+0x10c/0x1c0

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Link: https://lore.kernel.org/r/20221125-mtk-iommu-v2-0-e168dff7d43e@chromium.org
[ joro: Fixed spelling in commit message ]
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/mtk_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 2ab2ecfe01f8..3d913ab5029c 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -454,7 +454,7 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 		fault_larb = data->plat_data->larbid_remap[fault_larb][sub_comm];
 	}
 
-	if (report_iommu_fault(&dom->domain, bank->parent_dev, fault_iova,
+	if (!dom || report_iommu_fault(&dom->domain, bank->parent_dev, fault_iova,
 			       write ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ)) {
 		dev_err_ratelimited(
 			bank->parent_dev,
-- 
2.35.1


