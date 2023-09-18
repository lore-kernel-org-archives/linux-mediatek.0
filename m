Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACD9CD13D2
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 19:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUYBgtftoQP8FosQUXrBMLkP++zothKvc1aH24DtKBA=; b=CeF8sLJsMSwnCz9z+bxHqf8k8g
	caA2CX2wC0F/7E/wKMM0sBJdtR25PScxGtuVxToz+W9UtGKpvzfMSu1sjhTiDA3bRRg8cywkQZnB4
	ivxnZI6sqKy5Alyf1EVpyI7mwkHVphg9caeKOGc4vDFitx61DEWulInP9d4raKgkvM+9fiq5fxh0Q
	01WQzUeBaAVWVO2qNxkwPYrH4QvS+Fp1xmASf1YvabtyiIoeLXH20W3XVjftJruddQRxnqukbEiXr
	xF5B1rMu/ijMu9cq9NHN5V5Yq1BIbngMy3I1ubaBVQN0GdNq2wpOTAVV2tXsFxw9uUbzEaZsVHlUY
	XnUGx8Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJpW-00GAfR-2s;
	Mon, 18 Sep 2023 19:22:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJp3-00GAG9-2Z;
	Mon, 18 Sep 2023 19:22:19 +0000
X-UUID: a9af3a1e565811ee9b7791016c24628a-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bUYBgtftoQP8FosQUXrBMLkP++zothKvc1aH24DtKBA=;
	b=qri/ha5HR9qIAu1NVDSBkBUaacqWgYIj1yJ1PpYH4d3rWeFK9QuSRCzKpwsaDMDwmPDgb7NpxW4pvvINKX4/cfDxJbm9/Jyt3qKZ+zvH3lq8rq6aDuj0foq2awZ9Zni7DR1uMc6qK1Blc+/MOwc7F3tk5gnKIaUAk65KQI0dQ84=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:d1057c7c-f91b-4580-aabc-e051305dc9d5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:cf0b1514-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a9af3a1e565811ee9b7791016c24628a-20230918
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1114786866; Mon, 18 Sep 2023 12:22:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 03:22:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 03:22:06 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Conor Dooley <conor+dt@kernel.org>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, Elvis
 Wang <Elvis.Wang@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 03/15] soc: mailbox: Add SPR definition for GCE
Date: Tue, 19 Sep 2023 03:21:52 +0800
Message-ID: <20230918192204.32263-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_122217_836419_ED112CC6 
X-CRM114-Status: UNSURE (   9.83  )
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

GCE has specific purpose registers, abbreviated as SPR.
Client can us SPR to store data or programs.

In CMDQ driver, it allows client to STORE or LOAD data into SPR.
The value stored in SPR will be cleared after reset GCE HW thread.

There are 4 SPR (register index 0 - 3) in every GCE HW thread.
SPR is thread-independent and HW secure protected.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 include/linux/soc/mediatek/mtk-cmdq.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 649955d2cf5c..f49ca8bd58e8 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -11,6 +11,11 @@
 #include <linux/mailbox/mtk-cmdq-mailbox.h>
 #include <linux/timer.h>
 
+#define CMDQ_THR_SPR_IDX0		0
+#define CMDQ_THR_SPR_IDX1		1
+#define CMDQ_THR_SPR_IDX2		2
+#define CMDQ_THR_SPR_IDX3		3
+
 #define CMDQ_ADDR_HIGH(addr)	((u32)(((addr) >> 16) & GENMASK(31, 0)))
 #define CMDQ_ADDR_LOW(addr)	((u16)(addr) | BIT(1))
 
-- 
2.18.0


