Return-Path: <SRS0=jjMD=22=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4CBC3F68F
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 10:47:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADE0B24670
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 10:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nivLz7O9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rP5Pg479"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADE0B24670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8uPF05PfFd7MIbgwOEc7dJUT2CmAUZfft0ULIZYjCsc=; b=nivLz7O9Pdhf04
	vjHeUqpreqdd8nqMcB3Av5STYBSJG1elRoQB2of91hUwIKe6SuSqyvT57CUdegT/0v204ruH4h9Rr
	bSTzWKafwoojAcZ0XHaF9UtzHnWCg9J8anBUADPLWrZggxTWqvv/BYr8z6eaUKxwah7PS6tQjr3Q/
	GTzZyQIjEGE2dNcH0tZTNzoTMIaZriNcWKpphnJ1KqJSfsmerHttQmo1bnbTq6FUFaNIU0Vyg4r5w
	Zf1EmOoMjL+du2Wvz9mP3GUFtiJDbTONvEwMokGwTGofTGlYZj8uSzDAaJK3DeonufcYsQTUIi3sX
	/E4gdTAV4w1JLED+1T4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1io3Qj-00007Q-0B; Sun, 05 Jan 2020 10:46:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1io3Qc-0008SQ-5y; Sun, 05 Jan 2020 10:46:39 +0000
X-UUID: 43af6662a3194410a4fe388015fedba2-20200105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5wwx9zI1tNRihK2T3I1D2qJUFCK1MtGL2mDXTtoZpp8=; 
 b=rP5Pg479WVa6HfdO2xguGrf1jHnZd3fguxfZTI/c7QL2qjNF6NGJkMuFuKi6OxYalseILGQgdfkcTPB69ZIl3JdtWrZgRDf7f04h6wVhtMprpuQFlj5ShDB9/ILu/FoxGwHpm+vyy4rbT+dlmw5HbHCeCNXJm6qhasyJ2q+k4g8=;
X-UUID: 43af6662a3194410a4fe388015fedba2-20200105
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1440134628; Sun, 05 Jan 2020 02:46:35 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 02:46:34 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 18:46:06 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 5 Jan 2020 18:45:03 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v2 03/19] iommu/mediatek: Extend larb_remap to larb_remap[2]
Date: Sun, 5 Jan 2020 18:45:07 +0800
Message-ID: <20200105104523.31006-4-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200105104523.31006-1-chao.hao@mediatek.com>
References: <20200105104523.31006-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_024638_223729_81B98685 
X-CRM114-Status: GOOD (  10.56  )
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
Cc: Anan Sun <anan.sun@mediatek.com>, devicetree@vger.kernel.org,
 Jun Yan <jun.yan@mediatek.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Cui Zhang <zhang.cui@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For more than one IOMMUs, they are corresponding to different
smi_larb id, so we need to extend larb_remap to larb_remap[2]
to distinguish it by index.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 8 ++++----
 drivers/iommu/mtk_iommu.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 09192edef1f7..f2d953fc09df 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -245,7 +245,7 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	fault_larb = F_MMU_INT_ID_LARB_ID(regval);
 	fault_port = F_MMU_INT_ID_PORT_ID(regval);
 
-	fault_larb = data->plat_data->larbid_remap[fault_larb];
+	fault_larb = data->plat_data->larbid_remap[data->m4u_id][fault_larb];
 
 	if (report_iommu_fault(&dom->domain, data->dev, fault_iova,
 			       write ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ)) {
@@ -782,7 +782,7 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 	.has_4gb_mode = true,
 	.has_bclk     = true,
 	.has_vld_pa_rng   = true,
-	.larbid_remap = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
+	.larbid_remap[0] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
 };
 
 static const struct mtk_iommu_plat_data mt8173_data = {
@@ -790,13 +790,13 @@ static const struct mtk_iommu_plat_data mt8173_data = {
 	.has_4gb_mode = true,
 	.has_bclk     = true,
 	.reset_axi    = true,
-	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
+	.larbid_remap[0] = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
 };
 
 static const struct mtk_iommu_plat_data mt8183_data = {
 	.m4u_plat     = M4U_MT8183,
 	.reset_axi    = true,
-	.larbid_remap = {0, 4, 5, 6, 7, 2, 3, 1},
+	.larbid_remap[0] = {0, 4, 5, 6, 7, 2, 3, 1},
 };
 
 static const struct of_device_id mtk_iommu_of_ids[] = {
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index b4bd76548615..c585811a957c 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -43,7 +43,7 @@ struct mtk_iommu_plat_data {
 	bool                has_vld_pa_rng;
 	bool                reset_axi;
 	u32                 m4u1_mask;
-	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
+	unsigned char       larbid_remap[2][MTK_LARB_NR_MAX];
 };
 
 struct mtk_iommu_domain;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
