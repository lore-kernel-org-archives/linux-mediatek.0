Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18694C30653
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 03:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0919Eg9JUothln0+V1EUy9kX5BQowYtQJF09dFwlQ+Q=; b=oYBQ/H/D7q8KXuuTiFZ0WXTyTW
	b4rGDkKXUobXQ5JOIS5AcdYBP4Atkv9psegZf+m0RIK3Ef2Iei4PZsN4rMQxuwvilcZZGa0I7rkXj
	menNL+gkMNbGaop/gjpTOyPcH2cAoLNPWF36f4mnmPpxuUy6lOAQGCYaFfoym6M0RGUo6l7qXjD7D
	dZ0jU5m5sUA3UrAEKvvy9n94eXg+Yni70oTAr6Bv20xVctXnSgqhM19eA+utoNvKgT701fZoYF3qF
	i3WWUoXaCqVJXN7ZVFVSAd1sZpZJmNLBpKLsD6Zl9C+iwJbs7uM9R1olNBsQ81BZzS98PqK707ZQ5
	STjgrxCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOquz-00000008m60-3kDW;
	Wed, 03 Jul 2024 03:44:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOquw-00000008m5W-3oN3;
	Wed, 03 Jul 2024 03:44:28 +0000
X-UUID: 87e89c9438ee11ef9daba96ee3f3cc8c-20240702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0919Eg9JUothln0+V1EUy9kX5BQowYtQJF09dFwlQ+Q=;
	b=eIzh4JOJmNhqQfZg3FffbYTrdBgiSvYozra/EbJ01xc9WcPN/1QGLK7MyYvK/Cpxs61ehbLh9TuhiNyoXE1Kc1nNBhVbUSIq0xO/+k3Wk6cTdWB1dFusFzoDt8BtrwYaYwNTQA/WeQ9yYEmAGi3vM/hm3LoqL0plDvvHN92dQqM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:6ee009b0-445f-47ad-868f-512756e351d8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:ba885a6,CLOUDID:37d2d744-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 87e89c9438ee11ef9daba96ee3f3cc8c-20240702
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 884274825; Tue, 02 Jul 2024 20:44:20 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Jul 2024 11:44:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Jul 2024 11:44:17 +0800
From: Jason Chen <Jason-ch.Chen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Jason Chen <Jason-ch.Chen@mediatek.com>
Subject: [PATCH] remoteproc: mediatek: Increase MT8188/MT8195 SCP core0 DRAM size
Date: Wed, 3 Jul 2024 11:44:09 +0800
Message-ID: <20240703034409.698-1-Jason-ch.Chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_204426_973117_E787757C 
X-CRM114-Status: GOOD (  11.00  )
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

The current DRAM size is insufficient for the HEVC feature, which
requires more memory for proper functionality. This change ensures the
feature has the necessary resources.

Signed-off-by: Jason Chen <Jason-ch.Chen@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index b17757900cd7..e744c07507ee 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1388,7 +1388,7 @@ static const struct mtk_scp_sizes_data default_scp_sizes = {
 };
 
 static const struct mtk_scp_sizes_data mt8188_scp_sizes = {
-	.max_dram_size = 0x500000,
+	.max_dram_size = 0x800000,
 	.ipi_share_buffer_size = 600,
 };
 
@@ -1397,6 +1397,11 @@ static const struct mtk_scp_sizes_data mt8188_scp_c1_sizes = {
 	.ipi_share_buffer_size = 600,
 };
 
+static const struct mtk_scp_sizes_data mt8195_scp_sizes = {
+	.max_dram_size = 0x800000,
+	.ipi_share_buffer_size = 288,
+};
+
 static const struct mtk_scp_of_data mt8183_of_data = {
 	.scp_clk_get = mt8183_scp_clk_get,
 	.scp_before_load = mt8183_scp_before_load,
@@ -1474,7 +1479,7 @@ static const struct mtk_scp_of_data mt8195_of_data = {
 	.scp_da_to_va = mt8192_scp_da_to_va,
 	.host_to_scp_reg = MT8192_GIPC_IN_SET,
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
-	.scp_sizes = &default_scp_sizes,
+	.scp_sizes = &mt8195_scp_sizes,
 };
 
 static const struct mtk_scp_of_data mt8195_of_data_c1 = {
-- 
2.34.1


