Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8416AC001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 04:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9S7aSlPvxduAfDraJH3WXRUxAvAvEAfT4mg2Cv/CW+Q=; b=rqV2//4/E1NA4AHOIT4nK5GFu+
	l7950PzULOktPeKS72aBoBo1kbFxhmCBshoYK6jxZ48oSX18H7LWICqssEcexjfeNcbxphVX0grxB
	fi2HttdEykSd3d+ngPzmaV1c1gM9Rf7DKjXGhrpQtVjZnxFRbieH2Fx6+S/wpWbh/sisZxBw6dBXN
	yh24fEY0h2iYErmHp5P+KOGU7BvAJvipJYET8dU6sIBihWEP6OQ/1FnuJ93VQe580+qTxh3M3gKIc
	kbhxWosm27SJ4Y2T8fa2hvDP4Lau84lbpB9X1NXuWj1a5A5x3eCx5RK4SC0q6XQ3G1rZr7z30kYO+
	sa8TofKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qun0z-006R9I-1d;
	Mon, 23 Oct 2023 04:58:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qun0v-006R8k-38;
	Mon, 23 Oct 2023 04:58:07 +0000
X-UUID: bcf27f64716011ee9b7791016c24628a-20231022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9S7aSlPvxduAfDraJH3WXRUxAvAvEAfT4mg2Cv/CW+Q=;
	b=MvIJ4fLGmt034INjxvQ+wbVg3OGi6D3ickR1MGXUUwAHvg4s1JBAehjxfl9KLC96Vjos4WZqzJE/Ep1IO9ZMTakTVs0OXlUzPpbW9F/5Hatoimq3FoxcYTNB67KkFoMMSAaD88oPRvbv7ENRK3q5h6J55LSaTx49NGxUMv22zNQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:bdecaacc-dbb2-4eaf-b53d-684bdc5afb51,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:2288a5fb-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bcf27f64716011ee9b7791016c24628a-20231022
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1436815334; Sun, 22 Oct 2023 21:57:59 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 12:37:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 12:37:54 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
	<jkardatzke@google.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>, "Johnson
 Wang" <johnson.wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>
Subject: [PATCH v2 6/9] mailbox: mediatek: Add CMDQ driver support for mt8188
Date: Mon, 23 Oct 2023 12:37:48 +0800
Message-ID: <20231023043751.17114-7-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231023043751.17114-1-jason-jh.lin@mediatek.com>
References: <20231023043751.17114-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.774700-8.000000
X-TMASE-MatchedRID: cAwOsowI+VI9S3IiQd+eNaMVgdN9w+TCTJDl9FKHbrkKogmGusPLb2Tv
	8eaKHrag93LsYxp0JcCAMuqetGVetnyef22ep6XYOwBXM346/+wXxfm3DGa52ziDgySw1N/WFKA
	zntrocjJUmbEGssD1oyi8qpjQ9hxh
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.774700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F5A44B3488AD73E6EF408530E3DB8994676D03692E77F9D01A964B8CDBD02E392000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_215806_019153_AB20AFAF 
X-CRM114-Status: UNSURE (   9.41  )
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

Add CMDQ driver support for mt8188 by adding its compatible and
driver data in CMDQ driver.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 56fe01cd9731..3bdfb9a60614 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -704,12 +704,20 @@ static const struct gce_plat gce_plat_v7 = {
 	.gce_num = 1
 };
 
+static const struct gce_plat gce_plat_v8 = {
+	.thread_nr = 32,
+	.shift = 3,
+	.control_by_sw = true,
+	.gce_num = 2
+};
+
 static const struct of_device_id cmdq_of_ids[] = {
 	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_v2},
 	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_v3},
 	{.compatible = "mediatek,mt8186-gce", .data = (void *)&gce_plat_v7},
 	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_v4},
 	{.compatible = "mediatek,mt8192-gce", .data = (void *)&gce_plat_v5},
+	{.compatible = "mediatek,mt8188-gce", .data = (void *)&gce_plat_v8},
 	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_v6},
 	{}
 };
-- 
2.18.0


