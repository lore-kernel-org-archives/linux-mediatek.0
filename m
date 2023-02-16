Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDCEC636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 13:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jC/44U9ggSgBJrhBDKLr2l+gbCEuEsIxD9KWU3fY9AI=; b=qgwFSqKSiIShf11YO5J18Rw+qZ
	xPKAIVPT2Ebl7zHRxqEV90oB057uwrZoH4M9qA/ZqQzo/D6fRAYBiu0CCdDl2KPV1sOBON0QK8cPK
	pBytxUDUfj353qYezmN3ocFPI10h4s7c3zggIQUF8ysOikY9nwxwUF13PzA6O9A1ef07bAsDAmqIF
	HfUikl+jMhnaLPMMlKXfmKhp45K4B/AkcE7nLTITI0KJWZppkdgH4ArALZW+LkQyQ0S2xNnZqmMHj
	FlIn7XrxQsvW/RadYu5cRZCv0Oh/tPtjn78s+RShisguwtQN+xkV36mcURTM7zLhTRp9MZ4ELewvv
	HoxypB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeGx-00AKS7-Nx; Thu, 16 Feb 2023 13:26:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeGu-00AKQZ-9K; Thu, 16 Feb 2023 13:26:01 +0000
X-UUID: 6c145238adfd11edbbe3f76fe852e059-20230216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jC/44U9ggSgBJrhBDKLr2l+gbCEuEsIxD9KWU3fY9AI=;
	b=Grlid5vj+MrP6NoXWfg17r07PKVghwWOEit2u0SzbQ6FQVBtAxFIOYC0wPKMyyOhCqMBqCXF3CRxHNah+NMYbuLNJUsuqG6JBB9vlD1/0TVJwzEWUaCzUi0y8hSKI1uXHBS5thlM/i9HaVBSI3oaDbpkrKnakSscREePQ/caRWg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:d3a45620-335b-49ae-9a63-057e8e3e4808,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.19,REQID:d3a45620-335b-49ae-9a63-057e8e3e4808,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:885ddb2,CLOUDID:6ab136f3-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230216212548Y2VVW4HZ,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 6c145238adfd11edbbe3f76fe852e059-20230216
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 859673882; Thu, 16 Feb 2023 06:25:46 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 16 Feb 2023 21:25:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 16 Feb 2023 21:25:44 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: soc: mediatek: mtk-svs: fix passing zero to 'PTR_ERR'
Date: Thu, 16 Feb 2023 21:25:43 +0800
Message-ID: <20230216132543.814-1-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_052600_354170_7B504D2A 
X-CRM114-Status: GOOD (  11.44  )
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

nvmem_cell_get() cannot return NULL so checking for NULL is wrong here.

Signed-off-by: Roger Lu <roger.lu@mediatek.com>
Fixes: 6c7174fd90a4690 ("soc: mediatek: mtk-svs: use svs get efuse common function")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/r/202302160720.N64SWT4l-lkp@intel.com/
---
 drivers/soc/mediatek/mtk-svs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index a7eb019b5157..8127fb6d587b 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1726,7 +1726,7 @@ static int svs_get_efuse_data(struct svs_platform *svsp,
 	struct nvmem_cell *cell;
 
 	cell = nvmem_cell_get(svsp->dev, nvmem_cell_name);
-	if (IS_ERR_OR_NULL(cell)) {
+	if (IS_ERR(cell)) {
 		dev_err(svsp->dev, "no \"%s\"? %ld\n",
 			nvmem_cell_name, PTR_ERR(cell));
 		return PTR_ERR(cell);
-- 
2.18.0


