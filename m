Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58552C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 03:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+KICrFm5Rpk4oHnDGsQLqNz2xIUwKVTc6cAgnDErWNs=; b=jX3Og0AisPsSew
	O1nYTs/6z/kY8wNVfNcCYoUgr0yaHdFWbvfZ/dc3bczjrPPYTNQoPmsI8kN8o1Y0MRQ75DsfPTPS3
	eGnGxstslq5i2J0N3B2yKN8k/I06OwMkPppm1iQuetRTCVxi+fJki69PiuqYiHxtXNLHKZ22eVUHB
	ADjS8G4XF+T7TCWUanIu91sVbLM2ZU8HxcESuNXddfo4yBP8Rg/3a1oTJlWayyF2rAzfYiNFekuqR
	y2/m6LONJB0pqri687ONtXNSe2uEqN3BOIKB7GaHcOntuPdpD5Br4KzvCjHJCBnIUMiFuh1TXwN2+
	AN9jjCQfoycNAZb7enUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nipfW-0081gJ-5M; Mon, 25 Apr 2022 03:45:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nipfT-0081f1-T4; Mon, 25 Apr 2022 03:45:45 +0000
X-UUID: 47e81b280d25471fb74176fdcb8af837-20220424
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:1cea514e-12f9-4bfd-83d3-a787306a5b3e, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:69bccdf0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 47e81b280d25471fb74176fdcb8af837-20220424
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1734374537; Sun, 24 Apr 2022 20:45:42 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Apr 2022 20:45:40 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Apr 2022 11:45:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 25 Apr 2022 11:45:38 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, CK Hu
 <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, "Jason-JH .
 Lin" <jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, "Singo
 Chang" <singo.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] soc: mediatek: mutex: remove mt8195 MOD0 and SOF0 definition
Date: Mon, 25 Apr 2022 11:45:37 +0800
Message-ID: <20220425034537.28989-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_204543_984153_D020C964 
X-CRM114-Status: GOOD (  10.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

Using mt8183 MDO0 and SOF0 definition instead of creating new one for
mt8195.

Fixes: 8fdb61f1933a ("soc: mediatek: add mtk-mutex support for mt8195 vdosys0")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 9184684baf1d..981d56967e7a 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -17,9 +17,6 @@
 #define MT8183_MUTEX0_MOD0			0x30
 #define MT8183_MUTEX0_SOF0			0x2c
 
-#define MT8195_DISP_MUTEX0_MOD0			0x30
-#define MT8195_DISP_MUTEX0_SOF			0x2c
-
 #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
 #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
 #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 * (n))
@@ -422,8 +419,8 @@ static const struct mtk_mutex_data mt8192_mutex_driver_data = {
 static const struct mtk_mutex_data mt8195_mutex_driver_data = {
 	.mutex_mod = mt8195_mutex_mod,
 	.mutex_sof = mt8195_mutex_sof,
-	.mutex_mod_reg = MT8195_DISP_MUTEX0_MOD0,
-	.mutex_sof_reg = MT8195_DISP_MUTEX0_SOF,
+	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 };
 
 struct mtk_mutex *mtk_mutex_get(struct device *dev)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
