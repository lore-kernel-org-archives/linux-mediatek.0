Return-Path: <SRS0=UIhI=6X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68333C28CBC
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2020 08:51:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AE7B24953
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2020 08:51:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XvETBFPs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TBBX/ERt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AE7B24953
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E8bFBnpGk/1uKGwqOgKNEvI3VvqQ5roT45k0GcvmRNg=; b=XvETBFPs6VkRMK
	vTqSqJ5m5wZ07gaLHB473AaYZ5G/jYgjnrdOpcwcK6YZBfYK6M3QaL5VwoEHYyJNiRnlfVVMLbWTU
	z+NV8LGAPjXIXe+yiQKUuPJWAdVS2iJCWMSqP8TToBSsyJM8SZtLvKJWHQwE7GsMsF+T8xH7bYhWr
	FVoHSXUQykV3Y2DJzJ9vqYQq6PwpEw6hdITMpwhY/j8JeOdME4ZybWPb3xa1BvMu7tlnIA3HfpUMY
	qvxplBw7+YZ+MA1HrShaw7thTDi/qb52wrNbOysISqiDlmYC9nsRFWypdQE9/DDlQxzFBK9o40vUn
	JLBQFcP4VL2DSlaBA4UA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXLCB-0002sA-Ej; Sat, 09 May 2020 08:50:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXLBe-0002Jw-HL; Sat, 09 May 2020 08:50:24 +0000
X-UUID: 7dd660f170ef4a4e82a50e526534d824-20200509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rPAnzwaR6O/GGAIhKQLkHATI14Jacs04rANBVEp2mY0=; 
 b=TBBX/ERtGVeCAwRlO72RIezNCUppkeGxqgBEJYcFuVBDw42RduGAyVJjfAYq8wJCuWCOlKtgrZuFVZ3UHh0BXdrPl1nxDzIw506aDEEf9z9Ie/t1s+xd+McPTSltDJ/JhqD8NIvyffMIp/pqK4RALqQKRI6QWsKFllmiaFB/UI0=;
X-UUID: 7dd660f170ef4a4e82a50e526534d824-20200509
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 339213655; Sat, 09 May 2020 00:50:14 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 May 2020 01:40:17 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 May 2020 16:40:14 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 9 May 2020 16:40:13 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v3 5/7] iommu/mediatek: Add sub_comm id in translation fault
Date: Sat, 9 May 2020 16:36:52 +0800
Message-ID: <20200509083654.5178-6-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200509083654.5178-1-chao.hao@mediatek.com>
References: <20200509083654.5178-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A3C151D800C9A29925EFA4791AFBA4D946A49C30C4A8135BEDDDE73D30FB8C6F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_015022_576084_2DA08ADF 
X-CRM114-Status: GOOD (  15.12  )
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
Cc: devicetree@vger.kernel.org, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>,
 Jun Yan <jun.yan@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The max larb number that a iommu HW support is 8(larb0~larb7 in the below
diagram).
If the larb's number is over 8, we use a sub_common for merging
several larbs into one larb. At this case, we will extend larb_id:
bit[11:9] means common-id;
bit[8:7] means subcommon-id;
From these two variable, we could get the real larb number when
translation fault happen.
The diagram is as below:
		 EMI
		  |
		IOMMU
		  |
           -----------------
	   |               |
	common1   	common0
	   |		   |
	   -----------------
		  |
             smi common
		  |
  ------------------------------------
  |       |       |       |     |    |
 3'd0    3'd1    3'd2    3'd3  ...  3'd7   <-common_id(max is 8)
  |       |       |       |     |    |
Larb0   Larb1     |     Larb3  ... Larb7
		  |
	    smi sub common
		  |
     --------------------------
     |        |       |       |
    2'd0     2'd1    2'd2    2'd3   <-sub_common_id(max is 4)
     |        |       |       |
   Larb8    Larb9   Larb10  Larb11

In this patch we extern larb_remap[] to larb_remap[8][4] for this.
larb_remap[x][y]: x mean common-id above, y means subcommon_id above.

We can also distinguish if the M4U HW has sub_common by has_sub_comm
property.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 20 +++++++++++++-------
 drivers/iommu/mtk_iommu.h |  3 ++-
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index d73de987f8be..3914c418d1b0 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -90,6 +90,8 @@
 #define REG_MMU1_INVLD_PA			0x148
 #define REG_MMU0_INT_ID				0x150
 #define REG_MMU1_INT_ID				0x154
+#define F_MMU_INT_ID_COMM_ID(a)			(((a) >> 9) & 0x7)
+#define F_MMU_INT_ID_SUB_COMM_ID(a)		(((a) >> 7) & 0x3)
 #define F_MMU_INT_ID_LARB_ID(a)			(((a) >> 7) & 0x7)
 #define F_MMU_INT_ID_PORT_ID(a)			(((a) >> 2) & 0x1f)
 
@@ -228,7 +230,7 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	struct mtk_iommu_data *data = dev_id;
 	struct mtk_iommu_domain *dom = data->m4u_dom;
 	u32 int_state, regval, fault_iova, fault_pa;
-	unsigned int fault_larb, fault_port;
+	unsigned int fault_larb, fault_port, sub_comm = 0;
 	bool layer, write;
 
 	/* Read error info from registers */
@@ -244,10 +246,14 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	}
 	layer = fault_iova & F_MMU_FAULT_VA_LAYER_BIT;
 	write = fault_iova & F_MMU_FAULT_VA_WRITE_BIT;
-	fault_larb = F_MMU_INT_ID_LARB_ID(regval);
 	fault_port = F_MMU_INT_ID_PORT_ID(regval);
-
-	fault_larb = data->plat_data->larbid_remap[fault_larb];
+	if (data->plat_data->has_sub_comm) {
+		fault_larb = F_MMU_INT_ID_COMM_ID(regval);
+		sub_comm = F_MMU_INT_ID_SUB_COMM_ID(regval);
+	} else {
+		fault_larb = F_MMU_INT_ID_LARB_ID(regval);
+	}
+	fault_larb = data->plat_data->larbid_remap[fault_larb][sub_comm];
 
 	if (report_iommu_fault(&dom->domain, data->dev, fault_iova,
 			       write ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ)) {
@@ -785,7 +791,7 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 	.has_bclk     = true,
 	.has_vld_pa_rng   = true,
 	.inv_sel_reg = REG_MMU_INV_SEL_GEN1,
-	.larbid_remap = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
+	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}},
 };
 
 static const struct mtk_iommu_plat_data mt8173_data = {
@@ -794,14 +800,14 @@ static const struct mtk_iommu_plat_data mt8173_data = {
 	.has_bclk     = true,
 	.reset_axi    = true,
 	.inv_sel_reg = REG_MMU_INV_SEL_GEN1,
-	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
+	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}}, /* Linear mapping. */
 };
 
 static const struct mtk_iommu_plat_data mt8183_data = {
 	.m4u_plat     = M4U_MT8183,
 	.reset_axi    = true,
 	.inv_sel_reg = REG_MMU_INV_SEL_GEN1,
-	.larbid_remap = {0, 4, 5, 6, 7, 2, 3, 1},
+	.larbid_remap = {{0}, {4}, {5}, {6}, {7}, {2}, {3}, {1}},
 };
 
 static const struct of_device_id mtk_iommu_of_ids[] = {
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index afd7a2de5c1e..d51ff99c2c71 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -41,10 +41,11 @@ struct mtk_iommu_plat_data {
 	/* HW will use the EMI clock if there isn't the "bclk". */
 	bool                has_bclk;
 	bool		    has_misc_ctrl;
+	bool		    has_sub_comm;
 	bool                has_vld_pa_rng;
 	bool                reset_axi;
 	u32                 inv_sel_reg;
-	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
+	unsigned char       larbid_remap[8][4];
 };
 
 struct mtk_iommu_domain;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
