Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55694C77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 13:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fR5zPRr6mGaPjBEV+8bAJ+j1tXb4IEd8qsOXLOLPyjY=; b=3aFsgv1FLuZRr/YDKtn6SN3UCx
	vGbxuf2wnaTxi5tezZsc4lfOEI6jbbkDAMQ6PBkQ5NHGIJ2uFc+KUvcA44c65UHdMmRBibsw6x2/s
	8DEzlQ5F0N1ZS8VcgQG265/BncCGV99P2KbSbGtNHHHRdHsheUd95d7L/WYX3izrF9YvKaAANnecb
	edyWtCD/8H1pe2hp23n7ZO04IXr8lbYKMV/zJrTckqP4OhJkVtP+RlHJyMWKB1NeQZg41QaEJHcCu
	5Yu16lc/E7BgEjjFSmHA7W1OrY0asJfEZd7K907x6ANtQ8VtEha0ZshHjMC7G5+c/cT/CSh+YjAxL
	Pfku05sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ox8-00Dcqu-0v;
	Wed, 24 May 2023 13:54:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ox6-00DcpW-0X;
	Wed, 24 May 2023 13:54:57 +0000
X-UUID: 8cb4d0a6fa3a11ed83ed1395ce914268-20230524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fR5zPRr6mGaPjBEV+8bAJ+j1tXb4IEd8qsOXLOLPyjY=;
	b=t14xnmyJBfXUcJ2Bn8YDV08Xtm/wnbQIZT2/tq3OTW3tf09QYb8IfKAImyc0U2XZVJ2DIXV8wnHt6tKkOM23YMSoSlHku6vz2228I9oV0PE2X7zqiye20MQCxVsisRaamZ2QjJBjyytXWQE0Dm91see3P5RBdrHluDj2uZp9b9U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:0a92a80b-4c9c-4a7d-9c52-a0bee263f172,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:d8053b3c-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 8cb4d0a6fa3a11ed83ed1395ce914268-20230524
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <runyang.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 990639505; Wed, 24 May 2023 06:54:49 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 24 May 2023 21:34:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 24 May 2023 21:34:45 +0800
From: Runyang Chen <runyang.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Runyang Chen <runyang.chen@mediatek.com>
Subject: [PATCH v3 1/2] dt-bindings: reset: mt8188: add thermal reset control bit
Date: Wed, 24 May 2023 21:34:38 +0800
Message-ID: <20230524133439.20659-2-runyang.chen@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20230524133439.20659-1-runyang.chen@mediatek.com>
References: <20230524133439.20659-1-runyang.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_065456_214073_99311940 
X-CRM114-Status: GOOD (  10.77  )
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

To support reset of infra_ao, add the index of infra_ao reset of thermal
for MT8188.

Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
---
 include/dt-bindings/reset/mt8188-resets.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/reset/mt8188-resets.h b/include/dt-bindings/reset/mt8188-resets.h
index 377cdfda82a9..ba9a5e9b8899 100644
--- a/include/dt-bindings/reset/mt8188-resets.h
+++ b/include/dt-bindings/reset/mt8188-resets.h
@@ -33,4 +33,9 @@
 
 #define MT8188_TOPRGU_SW_RST_NUM               24
 
+/* INFRA resets */
+#define MT8188_INFRA_RST1_THERMAL_MCU_RST          0
+#define MT8188_INFRA_RST1_THERMAL_CTRL_RST         1
+#define MT8188_INFRA_RST3_PTP_CTRL_RST             2
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8188 */
-- 
2.18.0


