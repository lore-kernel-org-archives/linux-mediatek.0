Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8015C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Dec 2023 09:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czFD26N8OYC/3DSto6FsZIsjge+0OKu4XVhJ0fL5OF4=; b=lofWxwUaTKY31XdbyWrPcV7jjs
	f1zbl66++eEXnswyAihmRCoKSY8hZPJyBNSn7wB/w2VkPmZpNc2p6vnyBhtWjMZs84sCN5hBHwSWE
	bV4rZsKsJ/bI/Xq7x+/cjTFw+h8v/sp3y+TTWZsOjthp0c7ujy6Frwb4h2QiQLCrOgf+x6eBi8A5Z
	cQJNzB/sVYsmEfaDlWjbUc7eyCnGMqWADpGml9k1WhMCjqJvryxOubdJC/T5Qfh4Spiz4Dy9eQ1HU
	d2cQusy10AoCN+8SzBmpXJl4nRrFh5uqqf0q7ahhwDMz9GXf7y7VInfR0HHtoyVCyNyTRp9yD0wvx
	HLNmSQuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHhR8-00AU0d-22;
	Mon, 25 Dec 2023 09:39:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHhR6-00AU0B-0x;
	Mon, 25 Dec 2023 09:39:49 +0000
X-UUID: 89d45348a30911ee9b09ad09c76753c8-20231225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=czFD26N8OYC/3DSto6FsZIsjge+0OKu4XVhJ0fL5OF4=;
	b=kGywvtXGXSAutyHvttY4edEMzHtz5sx+HKb6c2Gk50nxVBPi3rOCS39KtVHsBlcCXmikPYrX9yEpjXek9AXm8XjYaXZNyFhZcbFWGnDaEgOla1A5O8tcVM2Ttun2apNsZnRui7PWdgULYA3Yt6Glj6CIzdSHWgRoMzetEd3feSI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:52effc6c-9d54-487e-a899-082a9ed15903,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-35
X-CID-META: VersionHash:5d391d7,CLOUDID:a378a47e-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,D
	KR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 89d45348a30911ee9b09ad09c76753c8-20231225
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <mengqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1953490885; Mon, 25 Dec 2023 02:39:45 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Dec 2023 17:39:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Dec 2023 17:39:42 +0800
From: Mengqi Zhang <mengqi.zhang@mediatek.com>
To: <ulf.hansson@linaro.org>, <chaotian.jing@mediatek.com>,
	<matthias.bgg@gmail.com>, <mengqi.zhang@mediatek.com>,
	<wenbin.mei@mediatek.com>
CC: <yangyingliang@huawei.com>, <adrian.hunter@intel.com>,
	<avri.altman@wdc.com>, <vincent.whitchurch@axis.com>,
	<linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/1] mmc: core: Add HS400 tuning in HS400es initialization
Date: Mon, 25 Dec 2023 17:38:40 +0800
Message-ID: <20231225093839.22931-2-mengqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231225093839.22931-1-mengqi.zhang@mediatek.com>
References: <20231225093839.22931-1-mengqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_013948_344373_790C2956 
X-CRM114-Status: GOOD (  11.88  )
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

During the initialization to HS400es stage, add hs400 tuning flow as an
optional process. For Mediatek IP, HS00es mode requires a specific
tuning to ensure the correct HS400 timing setting.

Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>
---
v1 https://patchwork.kernel.org/project/linux-mediatek/patch/20231201030547.11553-1-mengqi.zhang@mediatek.com/
v2 https://patchwork.kernel.org/project/linux-mediatek/patch/20231222062236.26370-1-mengqi.zhang@mediatek.com/
---
 drivers/mmc/core/mmc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 705942edacc6..d5173a9bb4b0 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -1822,8 +1822,13 @@ static int mmc_init_card(struct mmc_host *host, u32 ocr,
 
 		if (err)
 			goto free_card;
-
-	} else if (!mmc_card_hs400es(card)) {
+	} else if (mmc_card_hs400es(card)) {
+		if (host->ops->execute_hs400_tuning) {
+			err = host->ops->execute_hs400_tuning(host, card);
+			if (err)
+				goto free_card;
+		}
+	} else {
 		/* Select the desired bus width optionally */
 		err = mmc_select_bus_width(card);
 		if (err > 0 && mmc_card_hs(card)) {
-- 
2.25.1


