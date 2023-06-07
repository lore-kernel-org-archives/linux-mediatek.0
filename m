Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28161C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 06:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tk3XutL9e2YWZ1gDFC/8kPKTgAad11wdBVRkC6GJm48=; b=lK7K/+kGSikioY4Jdp05wjeKlg
	3Ofazlrqx8oyeJYu5e8XWLvTNhWZZVpat6gwcYyoTcOAt+4bxGY9i1VF25q5m+sThQBz9YfW6WftS
	JCbDl0LoQUv8O5j3OmUmVv9ddRzrRQk+bl1vkWcB4PNb5uwDuOsWL588AMPKtl/Rp+++ujIQsQ9AT
	YQqK4YJ8iL9YO3NCnyJh2ua6RqL2PU6Ja+dieO9UDIAS9ePDJhnw0Ns9Su6sxTXnGklGg+1rKs645
	R07At7IMdbrzwF4N+PWMv0eE3sFU75JMY9fM/n1oXA5KAJOsV47smlLzMYHM0gviyBU1ePCnUVCh7
	MeK0UmHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6mOW-004W8H-01;
	Wed, 07 Jun 2023 06:11:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6mOT-004W7E-1I;
	Wed, 07 Jun 2023 06:11:42 +0000
X-UUID: 26f4503c04fa11ee83ed1395ce914268-20230606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tk3XutL9e2YWZ1gDFC/8kPKTgAad11wdBVRkC6GJm48=;
	b=VYpLY0UxH/aEutD/PQXb2rRCLeb6WIxbC/OJlmBnuSCj6lFzZMhp7f/QV3KbsZa6d7sQd299OXi/OJ4WG/K6VOyZLNLDrliZxfzjF4quw7lXzRTxhTUUzGt5+ZOu8fpM7gw/I2u+ozausHhmg2GWhpKG6y1d/ODhP8F0lEm3MZM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:32c58473-3928-4de8-a4a4-ef3b9408e8ed,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:80d4d33d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 26f4503c04fa11ee83ed1395ce914268-20230606
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1595345398; Tue, 06 Jun 2023 23:11:33 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Jun 2023 14:11:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Jun 2023 14:11:30 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Singo Chang <singo.chang@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Hsiao
 Chein Sung <shawn.sung@mediatek.com>, Fei Shao <fshao@google.com>
Subject: [PATCH v1 2/6] dt-bindings: reset: mt8188: Add reset control bits for VDOSYS1
Date: Wed, 7 Jun 2023 14:11:17 +0800
Message-ID: <20230607061121.6732-3-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230607061121.6732-1-shawn.sung@mediatek.com>
References: <20230607061121.6732-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_231141_454378_3185528E 
X-CRM114-Status: GOOD (  10.28  )
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

Add reset control bits for  MT8188 VDOSYS1.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 include/dt-bindings/reset/mt8188-resets.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/dt-bindings/reset/mt8188-resets.h b/include/dt-bindings/reset/mt8188-resets.h
index 377cdfda82a9..439a9a25ca19 100644
--- a/include/dt-bindings/reset/mt8188-resets.h
+++ b/include/dt-bindings/reset/mt8188-resets.h
@@ -33,4 +33,16 @@

 #define MT8188_TOPRGU_SW_RST_NUM               24

+/* VDOSYS1 */
+#define MT8188_VDO1_RST_MERGE0_DL_ASYNC         9
+#define MT8188_VDO1_RST_MERGE1_DL_ASYNC         10
+#define MT8188_VDO1_RST_MERGE2_DL_ASYNC         11
+#define MT8188_VDO1_RST_MERGE3_DL_ASYNC         32
+#define MT8188_VDO1_RST_MERGE4_DL_ASYNC         33
+#define MT8188_VDO1_RST_HDR_VDO_FE0_DL_ASYNC    64
+#define MT8188_VDO1_RST_HDR_GFX_FE0_DL_ASYNC    65
+#define MT8188_VDO1_RST_HDR_VDO_BE_DL_ASYNC     66
+#define MT8188_VDO1_RST_HDR_VDO_FE1_DL_ASYNC    80
+#define MT8188_VDO1_RST_HDR_GFX_FE1_DL_ASYNC    81
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8188 */
--
2.18.0


