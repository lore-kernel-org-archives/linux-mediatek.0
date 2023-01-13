Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F96C61DB3
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 06:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1Ghxl1XJabXKhcVsoUFPdobaBEZ4/RbrX/ASwjk8BA=; b=FXzewCcK+LP6tKa5WbnFMUPZ5s
	73bY4qw4Cyx7H5mRRjGuu7Odex5l5NAafCQXohlNBF5PmZLz1uPTwN5YnBltYhoClW7b1pZ1+QfUz
	64e6OakTeKgBxKrx1iPOJ+MaHPwpYmwiYtaJiCL40bnJkXca3hImzK4uYlpMWNbp21qRT9lJzcA6s
	RrE7/RqojPGpPgwrhMpOWOnBlMVjTpC1pTkb34VdqgyFdIsS6TDc5s8tj1uLYbL/DD29QJLpDVgT/
	9Pe66GobUk4YNKA/cMpmtvChxB0l3AxWTSU+4TD/o6CAe4U91iNX/ggCkDQp8Oby76xlkNqrm+go7
	TV80CKlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGD9s-000ebM-2I; Fri, 13 Jan 2023 06:03:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGD9T-000eO8-9L; Fri, 13 Jan 2023 06:02:56 +0000
X-UUID: eb069044930711edbbe3f76fe852e059-20230112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=T1Ghxl1XJabXKhcVsoUFPdobaBEZ4/RbrX/ASwjk8BA=;
	b=db5v4aFSq0Qx+gLcwvU9aJwZlXJIcz0Vw1VLZW7BCJs0Ez5JeXEmdb7t++F4kdcGiIcE7s1OVuVCekRe3z95m3uPbv+x5vIt1Hyx5I4+ud4PEZARzHs2oVpRMIGyR7agfeNiaZZykc6iOJDnKC9V9Tt0QwfJZTl1W6cx1CHod2w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:fb6bb975-0113-4e8f-b0a6-2d85a2eb4914,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.17,REQID:fb6bb975-0113-4e8f-b0a6-2d85a2eb4914,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:543e81c,CLOUDID:77f48a54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:230113140254CPULIMR6,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:0,Malicious:0
X-CID-BVR: 0
X-UUID: eb069044930711edbbe3f76fe852e059-20230112
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 990638380; Thu, 12 Jan 2023 23:02:53 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 14:02:29 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 14:02:28 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, <nfraprado@collabora.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
	<mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>, <libo.kang@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>, Yong Wu
	<yong.wu@mediatek.com>
Subject: [PATCH 03/10] iommu/mediatek: Get regionid from larb/port id
Date: Fri, 13 Jan 2023 14:01:26 +0800
Message-ID: <20230113060133.9394-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230113060133.9394-1-yong.wu@mediatek.com>
References: <20230113060133.9394-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_220255_339790_4E853643 
X-CRM114-Status: GOOD (  20.77  )
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

After commit f1ad5338a4d5 ("of: Fix "dma-ranges" handling for bus
controllers"), the dma-ranges is not allowed for dts leaf node.
but we still would like to separate to different masters
into different iova regions.

Thus we have to separate it by the HW larbid and portid. For example,
larb1/2 are in region2 and larb3 is in region3. The problem is that
some ports inside a larb are in region4 while some ports inside this
larb are in region5. Therefore I define a "larb_region_msk" to help
record the information for each a port. Take a example for a larb:
 [1] = ~0: means all ports in this larb are in region1;
 [2] = BIT(3) | BIT(4): means port3/4 in this larb are region2;
 [3] = ~(BIT(3) | BIT(4)): means all the other ports except port3/4
                           in this larb are region3.

This method also avoid the users forget/abuse the iova regions.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 43 +++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 2badd6acfb23..d30020d0a190 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -8,7 +8,6 @@
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/device.h>
-#include <linux/dma-direct.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -194,6 +193,7 @@ struct mtk_iommu_plat_data {
 	enum mtk_iommu_plat	m4u_plat;
 	u32			flags;
 	u32			inv_sel_reg;
+	const u32		(*larb_region_msk)[32];
 
 	char			*pericfg_comp_str;
 	struct list_head	*hw_list;
@@ -508,30 +508,33 @@ static unsigned int mtk_iommu_get_bank_id(struct device *dev,
 static int mtk_iommu_get_iova_region_id(struct device *dev,
 					const struct mtk_iommu_plat_data *plat_data)
 {
-	const struct mtk_iommu_iova_region *rgn = plat_data->iova_region;
-	const struct bus_dma_region *dma_rgn = dev->dma_range_map;
-	int i, candidate = -1;
-	dma_addr_t dma_end;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	unsigned int portidmsk = 0, larbid;
+	const u32 *rgn_larb_msk;
+	int i, region_id = -1;
 
-	if (!dma_rgn || plat_data->iova_region_nr == 1)
+	if (plat_data->iova_region_nr == 1)
 		return 0;
 
-	dma_end = dma_rgn->dma_start + dma_rgn->size - 1;
-	for (i = 0; i < plat_data->iova_region_nr; i++, rgn++) {
-		/* Best fit. */
-		if (dma_rgn->dma_start == rgn->iova_base &&
-		    dma_end == rgn->iova_base + rgn->size - 1)
-			return i;
-		/* ok if it is inside this region. */
-		if (dma_rgn->dma_start >= rgn->iova_base &&
-		    dma_end < rgn->iova_base + rgn->size)
-			candidate = i;
+	larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
+	for (i = 0; i < fwspec->num_ids; i++)
+		portidmsk |= BIT(MTK_M4U_TO_PORT(fwspec->ids[i]));
+
+	for (i = 0; i < plat_data->iova_region_nr; i++) {
+		rgn_larb_msk = plat_data->larb_region_msk[i];
+		if (!rgn_larb_msk)
+			continue;
+
+		if  ((rgn_larb_msk[larbid] & portidmsk) == portidmsk) {
+			region_id = i;
+			break;
+		}
 	}
 
-	if (candidate >= 0)
-		return candidate;
-	dev_err(dev, "Can NOT find the iommu domain id(%pad 0x%llx).\n",
-		&dma_rgn->dma_start, dma_rgn->size);
+	if (region_id >= 0)
+		return region_id;
+	dev_err(dev, "Can NOT find the region for larb(%d-%x).\n",
+		larbid, portidmsk);
 	return -EINVAL;
 }
 
-- 
2.18.0


