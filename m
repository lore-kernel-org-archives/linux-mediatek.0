Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B5CC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 08:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlZ0yPfCWfY4IbaYSapJItZdweXdHbguc8/fHrMzHwk=; b=tVVDgraxBs8Fe1MqQCIM1Waq7B
	Z4htwGQ4OfC19lye+P+hpXkXkLV2gtoSsK7mMDZJ4fpBYMNKiJlsUsVJsoY9BtfXT7oESC/pfrfNu
	GY3GDJogUmrlH0mRCbA7rYfxzttcNO10qHrAwZELJfBQMxJin8AGeK3GAceMQiP1+DJpHGkcS8pBc
	a7dk7PyG0gX/u+rVqHw+7UZk9vozGpEdkxHPve37mmty5t6sJfugzDrm8A+YtQu0Rq5bsqyXaRu0k
	nSo9H8jlG6EpwYyMTKL+zw23HdSnSRdCrusYandJS6cRxYs2sIxXK8HvwOiHZTReytgsdzbPZirJP
	EIazFxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3uc-002Wu3-1c;
	Fri, 15 Dec 2023 08:51:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3uY-002Wt3-31;
	Fri, 15 Dec 2023 08:51:12 +0000
X-UUID: 16018e989b2711ee958cff29c719f35b-20231215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=AlZ0yPfCWfY4IbaYSapJItZdweXdHbguc8/fHrMzHwk=;
	b=fLSbannml/4NB7YBfdgD4rc81DMwMngfcqwFZTn2xltRjqNnswKSkwinm7K6eqRloVDKvISFAaxFsT64cjduSM6ybz6Mlcla6kcfjFxSppu5JJEtxnaM8xA31pHG45XM0dsDyDtPmpmLlDWedkQKsOILpls1bHUSrgrVQgLYQzA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:7fb1198b-e6f4-43cc-a8c5-3b640ca1212a,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:5d391d7,CLOUDID:8a6bb5fd-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,D
	KR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 16018e989b2711ee958cff29c719f35b-20231215
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1064657152; Fri, 15 Dec 2023 01:51:07 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Dec 2023 16:51:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Dec 2023 16:51:03 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
	<jkardatzke@google.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson
 Wang <johnson.wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>
Subject: [PATCH v2 3/3] mailbox: mtk-cmdq: Add CMDQ driver support for mt8188
Date: Fri, 15 Dec 2023 15:00:26 +0800
Message-ID: <20231215070026.2507-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231215070026.2507-1-jason-jh.lin@mediatek.com>
References: <20231215070026.2507-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_005110_981532_C3ECCF5E 
X-CRM114-Status: GOOD (  10.12  )
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

Add CMDQ driver support for mt8188 by adding its compatible and
driver data in CMDQ driver.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 39bf066d376e..27ff3a3ccf2f 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -735,6 +735,13 @@ static const struct gce_plat gce_plat_mt8186 = {
 	.gce_num = 1
 };
 
+static const struct gce_plat gce_plat_mt8188 = {
+	.thread_nr = 32,
+	.shift = 3,
+	.control_by_sw = true,
+	.gce_num = 2
+};
+
 static const struct gce_plat gce_plat_mt8192 = {
 	.thread_nr = 24,
 	.shift = 3,
@@ -754,6 +761,7 @@ static const struct of_device_id cmdq_of_ids[] = {
 	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_mt8173},
 	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_mt8183},
 	{.compatible = "mediatek,mt8186-gce", .data = (void *)&gce_plat_mt8186},
+	{.compatible = "mediatek,mt8188-gce", .data = (void *)&gce_plat_mt8188},
 	{.compatible = "mediatek,mt8192-gce", .data = (void *)&gce_plat_mt8192},
 	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_mt8195},
 	{}
-- 
2.18.0


