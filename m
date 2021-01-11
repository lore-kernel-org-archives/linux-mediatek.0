Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87257C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:35:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E25E224B8
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E25E224B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ld0Icw3dXlUeU0yBdH61Fp/elUprjwpYrhmm54QEfZQ=; b=q2KWpX7N0GDrzGf3NSEtkx5GY
	ZJZ+NE8J13/K1aPJ/Esf+LyJ6444ZzVyO6nZYvacRYtzA4ntPzCiTkIxPChgYf8NFpOF0lw5vacER
	wqxpkljtBAw3H3toODWYtCQG0otNNuzxyBwQuMGTpX3eVUNLcWSIvshAebHc5v6+4WnEijP8Mua7K
	prXFqg1a63znFwOS0awqKGDizQ8ZXI5UX0f6J4EReK5TTLMNYEHcN1tpq06V2YL1R0rF6VCSWLM4y
	vM7isMkY97Cxaw4tvBVqVGE4MMIdterXIJq2A/Ix1lvfiWrYSjhsMPZ4ZeJgqrzgpRK0OnDp9u628
	qJJE4tY6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyvTm-0008FR-Ku; Mon, 11 Jan 2021 11:35:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyvPR-0005FG-Gf; Mon, 11 Jan 2021 11:30:56 +0000
X-UUID: 256c63fe988a44a79102e8b290550e1a-20210111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=9fqRDBfB0emWvVhu3JV4od6CkDH1f7fnKmp5xoQ/sbM=; 
 b=pC/p1NF4T+1TZq+u85zOFPnRBnnmYaKfmqkZO5mlYXJGsTSmeECvcBMGDylfWPhhlSfpWZ8KNn3k3LGLIOluMi/rBsPasXV5oBA/ia4aAAJdie8NS65HVFBjc3xcmxwgOmAWyIVNhPuKU58oVnFRKsnp/bqMsOpaC69qU7Ydb/o=;
X-UUID: 256c63fe988a44a79102e8b290550e1a-20210111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 433383751; Mon, 11 Jan 2021 03:30:34 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 03:22:03 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 19:22:02 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 19:22:01 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v6 16/33] iommu/mediatek: Move hw_init into attach_device
Date: Mon, 11 Jan 2021 19:18:57 +0800
Message-ID: <20210111111914.22211-17-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210111111914.22211-1-yong.wu@mediatek.com>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_063053_763920_42F8ECC7 
X-CRM114-Status: GOOD (  14.67  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, yong.wu@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In attach device, it will update the pagetable base address register.
Move the hw_init function also here. Then it only need call
pm_runtime_get/put one time here if m4u has power domain.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 1c4af574f5f7..87c4626c9072 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -126,6 +126,8 @@ struct mtk_iommu_domain {
 
 static const struct iommu_ops mtk_iommu_ops;
 
+static int mtk_iommu_hw_init(const struct mtk_iommu_data *data);
+
 /*
  * In M4U 4GB mode, the physical address is remapped as below:
  *
@@ -364,12 +366,15 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 {
 	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
 	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
+	int ret;
 
 	if (!data)
 		return -ENODEV;
 
-	/* Update the pgtable base address register of the M4U HW */
-	if (!data->m4u_dom) {
+	if (!data->m4u_dom) { /* Initialize the M4U HW */
+		ret = mtk_iommu_hw_init(data);
+		if (ret)
+			return ret;
 		data->m4u_dom = dom;
 		writel(dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
 		       data->base + REG_MMU_PT_BASE_ADDR);
@@ -724,10 +729,6 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 
-	ret = mtk_iommu_hw_init(data);
-	if (ret)
-		return ret;
-
 	ret = iommu_device_sysfs_add(&data->iommu, dev, NULL,
 				     "mtk-iommu.%pa", &ioaddr);
 	if (ret)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
