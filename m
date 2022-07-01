Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F773C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 12:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LObHv4Pa8BqhOTukZpemdRYcMOXT3EfkWl6TVaZyaQ=; b=B0ajKccKeraZ08LSjkcpcaZo4e
	14doZdryQIO+q7i0nolkFRXUaeCb0No980JB+t8mFEUCBbKPjSKzbQC+sC+F309Z08z0wKSfwIsLJ
	OBsPr8gvWBSKrAtRLiRK9Tj0J9832EikE2mldrOy5HSTb+4/IWeDmOQSbiEW1W/veIqC6CMsT6h1k
	/6tG1UARmLfsFdHnIsqM0T6hYuyWNUKp7vwRV6/2lNHl1hkVE3FzFgtExUFH86R+wGobAWWM+YlZI
	RZxz2dL4rlrWZPla92t4uD2BO7SFnscdd4wDtUaWuinfJre4wJ5D/vlrsSzS+/uDipLJGFUD5XOnG
	1NjUhQ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7FX2-004j75-Qp; Fri, 01 Jul 2022 12:13:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7FWL-004iop-GF; Fri, 01 Jul 2022 12:13:17 +0000
X-UUID: 5a5f1a6d983147aabb460261a4cfee12-20220701
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:8d86e866-eeff-4d13-a01c-8300785d2ff3,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:cd344f86-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 5a5f1a6d983147aabb460261a4cfee12-20220701
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 142786705; Fri, 01 Jul 2022 05:13:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 1 Jul 2022 20:12:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 1 Jul 2022 20:12:31 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-remoteproc@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 1/1] remoteproc: mediatek: enable cache for mt8186 SCP
Date: Fri, 1 Jul 2022 20:12:29 +0800
Message-ID: <20220701121229.22756-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220701121229.22756-1-allen-kh.cheng@mediatek.com>
References: <20220701121229.22756-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_051313_606244_2146D103 
X-CRM114-Status: GOOD (  14.96  )
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

This patch is for enableing cache in SCP. There is not enough space
on the SRAM of SCP. We need to run programs in DRAM. The DRAM power
and latency is much larger than SRAM, so cache is used to mitigate
the negative effects for performance. we set SCP registers for cache
size before loading SCP FW. (8KB+8KB) and also adjust ipi_buf_offset
in SRAM from 0x7bdb0 to 0x3BDB0 for enableing cache.

This patch was tested on MediaTek mt8186.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 47b2a40e1b4a..5b2ad789e720 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -401,6 +401,14 @@ static int mt8186_scp_before_load(struct mtk_scp *scp)
 	writel(0x0, scp->reg_base + MT8186_SCP_L1_SRAM_PD_P1);
 	writel(0x0, scp->reg_base + MT8186_SCP_L1_SRAM_PD_p2);
 
+	/*
+	 * Set I-cache and D-cache size before loading SCP FW.
+	 * SCP SRAM logical address may change when cache size setting differs.
+	 */
+	writel(MT8183_SCP_CACHE_CON_WAYEN | MT8183_SCP_CACHESIZE_8KB,
+	       scp->reg_base + MT8183_SCP_CACHE_CON);
+	writel(MT8183_SCP_CACHESIZE_8KB, scp->reg_base + MT8183_SCP_DCACHE_CON);
+
 	return 0;
 }
 
@@ -943,7 +951,7 @@ static const struct mtk_scp_of_data mt8186_of_data = {
 	.scp_da_to_va = mt8183_scp_da_to_va,
 	.host_to_scp_reg = MT8183_HOST_TO_SCP,
 	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
-	.ipi_buf_offset = 0x7bdb0,
+	.ipi_buf_offset = 0x3bdb0,
 };
 
 static const struct mtk_scp_of_data mt8192_of_data = {
-- 
2.18.0


