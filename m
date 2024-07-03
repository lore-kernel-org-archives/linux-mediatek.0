Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A110EC2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 11:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75FkGdUKgt+Z9hXJnJSQngHwHaha+5GUkIFIvukvpH4=; b=WRQvK1GyRDYW/hHXGHdWfcCEJM
	lZwVz6Ejqm8Ja2zqtqq4tLzD04+sSj7xE1UtwTas6YoiQCoDRM/cl/evlvj2865it2TgpkdZcZzWD
	rg7QzfzbPhNtGd3qO6FmKeOMXB9iuvDgKucuZIXh9sUAjNZj/KuAKW9J9cVgl5KuXFUcpbpc8aLZp
	bdcrek9ecpKA1PnfShPj6n18QAd9M+L+UrU86EeoCRSqhM/GeMAuNpZZtxKs8OPxDBPsaeGw72JgW
	nNvAlfArqvBPdF26UGfQUFofAVY6INAse4TB3IoxNZxTn/gGnroXM64nr9dFKgL0q85elFx1IJhJx
	Ch/DpFjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOyYI-0000000A4Rf-0ujU;
	Wed, 03 Jul 2024 11:53:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOyY7-0000000A4PV-291B;
	Wed, 03 Jul 2024 11:53:25 +0000
X-UUID: d6236562393211ef9daba96ee3f3cc8c-20240703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=75FkGdUKgt+Z9hXJnJSQngHwHaha+5GUkIFIvukvpH4=;
	b=NKaGM0vzZOZyrtlEqFXiDOsmDOeKz0DSeoyHprO9wvNf7oiKmYwsWEwgUh4rFiIdjGwBY2nLltQfXuQqFMrAPTm1DcjbgBfT8XpGHI0Xi4IdSSi78jrV2CHCJJvWXBux11Hkb6xJ4g0B3L4bamYW0NaVONsXTbIx9xqpZlSDPwQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:42b08f0c-2029-4214-a280-23b500d16e45,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:dfffdc44-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d6236562393211ef9daba96ee3f3cc8c-20240703
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shun-yi.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 688864684; Wed, 03 Jul 2024 04:53:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Jul 2024 19:53:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Jul 2024 19:53:13 +0800
From: Shun-yi Wang <shun-yi.wang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-ch.chen@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, <olivia.wen@mediatek.com>, shun-yi.wang
	<shun-yi.wang@mediatek.com>
Subject: [PATCH 1/1] remoteproc: mediatek: Support multiple reserved memory regions
Date: Wed, 3 Jul 2024 19:53:08 +0800
Message-ID: <20240703115308.17436-2-shun-yi.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240703115308.17436-1-shun-yi.wang@mediatek.com>
References: <20240703115308.17436-1-shun-yi.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.883000-8.000000
X-TMASE-MatchedRID: Ei0WBMmFdJjleW6zTRN7wAPZZctd3P4B6tEkNTIMeQjEosIs7IJbkCpJ
	3T68EJKPg/N7mdNXD1c8RLY2vU8PD4/opKiQWjqUdXu122+iJtp6zDxGcFEbChL6MU7t349bxsr
	6m7RljBHftLFtxOSbQ4Ay6p60ZV62fJ5/bZ6npdjKayT/BQTiGlIc3O7Mj/yCMO7Fp3VK5MEhmu
	FTYDf84D50unEEcwa99dfwm9WweGYZ3afb2GJc48A9F3ly54VehHNYhwwtQTza6j4tja6OgKCjN
	WMcfCKKdATQdtPksR+3/JiWOe6GXXSWgQ2GpXdZhztLVWA1eE9DDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.883000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E45F84B53C2F9FE0E27731A6831DB9EC31E41B727B72E08D8A7DF8CAA7380CC92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_045323_589847_841132C7 
X-CRM114-Status: GOOD (  13.72  )
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

From: "shun-yi.wang" <shun-yi.wang@mediatek.com>

SCP supports multiple reserved memory regions, intended for
specific hardwards.

Signed-off-by: shun-yi.wang <shun-yi.wang@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 9ecd5ea04b5f3..1902826cea0af 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1006,22 +1006,31 @@ EXPORT_SYMBOL_GPL(scp_mapping_dm_addr);
 
 static int scp_map_memory_region(struct mtk_scp *scp)
 {
-	int ret;
+	int ret, i, err;
 	const struct mtk_scp_sizes_data *scp_sizes;
+	struct device_node *node = scp->dev->of_node;
+	struct of_phandle_iterator it;
+
+	i = 0;
+	of_for_each_phandle(&it, err, node, "memory-region", NULL, 0) {
+		ret = of_reserved_mem_device_init_by_idx(scp->dev, node, i);
+
+		if (ret) {
+			dev_err(scp->dev, "failed to assign memory-region: %s\n",
+				it.node->name);
+			of_node_put(it.node);
+			return -ENOMEM;
+		}
 
-	ret = of_reserved_mem_device_init(scp->dev);
+		i++;
+	}
 
 	/* reserved memory is optional. */
-	if (ret == -ENODEV) {
+	if (!i) {
 		dev_info(scp->dev, "skipping reserved memory initialization.");
 		return 0;
 	}
 
-	if (ret) {
-		dev_err(scp->dev, "failed to assign memory-region: %d\n", ret);
-		return -ENOMEM;
-	}
-
 	/* Reserved SCP code size */
 	scp_sizes = scp->data->scp_sizes;
 	scp->cpu_addr = dma_alloc_coherent(scp->dev, scp_sizes->max_dram_size,
-- 
2.18.0


