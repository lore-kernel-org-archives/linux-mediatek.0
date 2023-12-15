Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C137C4167D
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 02:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCgeOvRb6HG52ZNdXQ5z0L9bAUM2zdPsnkmdDHpnW5w=; b=QjHJyyHrRNnCRKWcJ4fUEh3+zN
	chDoI5YnvjPlPFCDHEb3QVAvoU55MqqgwXPV3YgS39GkFIm8lXgouYF3n1pQ4Dj6TOGDiA4pr1nfv
	xWrFz/k7Urf6JPS+HkuRulGOgMSF/71iRUmgjMbJkbqEp+jJL3JiyCIOh0d0pvj9qmjARoukE4j3u
	tWnQwcLuC/BEj8PTKb1vodaQghDPKTY/eHKjA/QnBYfIqAAbQfo1T6XwDdXLIcBiAWYSUvGm5ETHl
	S6Ta0pqVjDFR6AnNu0i91tpEREEtKY+/ar/e5PhG6jwNKzITgOmn3o1d8lyfSAKTwNL7bIgHjPuW0
	FSloZjIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDy43-001oDC-0c;
	Fri, 15 Dec 2023 02:36:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDy3z-001oBy-0n;
	Fri, 15 Dec 2023 02:36:34 +0000
X-UUID: bde2fbea9af211ee958cff29c719f35b-20231214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PCgeOvRb6HG52ZNdXQ5z0L9bAUM2zdPsnkmdDHpnW5w=;
	b=I20kg2ntpE6m/CRJX+J8wOPWd7YvJihRXcz/bKlt6QRm8vFoNK4HZSnEkoYvYH7R+s/s1zdRjn7/DBEC45AZdDfFKsHEaRlYyIZIZzmrXtCegXKbXTpuUeO+P9N73mX2FHMjhc13Frn5vauzQfkbc1SUBOhn7J095uuuqqvUXZg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:18182426-06ed-4650-91e4-6a8d51016231,IP:0,U
	RL:0,TC:0,Content:38,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:38
X-CID-META: VersionHash:5d391d7,CLOUDID:a3d0cf73-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bde2fbea9af211ee958cff29c719f35b-20231214
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1947168875; Thu, 14 Dec 2023 19:36:25 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Dec 2023 10:35:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Dec 2023 10:35:48 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
	<jkardatzke@google.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>, "Johnson
 Wang" <johnson.wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>
Subject: [PATCH 1/2] mailbox: mtk-cmdq: Sort cmdq platform data by compatible name
Date: Fri, 15 Dec 2023 10:35:45 +0800
Message-ID: <20231215023546.6594-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231215023546.6594-1-jason-jh.lin@mediatek.com>
References: <20231215023546.6594-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.584800-8.000000
X-TMASE-MatchedRID: L2v4vcuOsZVZu9hLABfNkAPZZctd3P4B7f6JAS2hKPgWSEXGM06qpaPF
	jJEFr+olwXCBO/GKkVr3FLeZXNZS4IzHo47z5Aa+lgSG+spk3w9Q+JIYiI4PYNtL0IhTgIOeOq+
	kkO0fZhEwklhWf+km1PLnEo5QIi8g59aBrH1Sfe9t7R3YkHuq5gxtAkJv798AeZUpm6wun3ba/0
	6NhYDa4wyzCDjlUx89p2y3mIB+it9WXGvUUmKP2w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.584800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A80F0F3F31302333987C850B4A5C5C48C984EFA17D0BD0E07EA5E1F345BDBD5C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_183631_285503_28EAE471 
X-CRM114-Status: UNSURE (   9.60  )
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

Sort cmdq platform data according to the number sequence of
compatible names.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index de862e9137d5..76e5f762628c 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -750,10 +750,10 @@ static const struct gce_plat gce_plat_v7 = {
 };
 
 static const struct of_device_id cmdq_of_ids[] = {
+	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_v4},
 	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_v2},
 	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_v3},
 	{.compatible = "mediatek,mt8186-gce", .data = (void *)&gce_plat_v7},
-	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_v4},
 	{.compatible = "mediatek,mt8192-gce", .data = (void *)&gce_plat_v5},
 	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_v6},
 	{}
-- 
2.18.0


