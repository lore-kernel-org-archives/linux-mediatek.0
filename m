Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E35C41535
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Dec 2023 06:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3CfXjXK+ifyxmF7/x1t1E1bQ/x/4s3uHJnnqwy/VaAM=; b=CHO+nrfCxJudrYDEoE9ybCDqCn
	Kmd9X5ln+g8GjmoZ/sTgBQPNn/fIHDXDiS1shHU9oR6IXpo5gpALXu3vE5i9jaQTFCn9m9XDtDzF+
	GviMHYOY3DxliVb/egIa7S3266Ep/YKEw4G5fE+v6qvgBrMuo5K6W9bbxEajce4p/9vIOIusLPjnU
	CfrRWb6fMq9Ezfjvi9l3vo5GS1W3cvnYlKQpt/Z2gJ1r1jUwTPWvZUATKwYNfFZHhyJi29mKrh21Y
	jINYdxbddN94zBrX3fW/USitAfWtRKYtNoR6VKaJQgY7NR1eTsISKZsNdSQvlpyOiNXP1nQBrSm+Z
	Ud9UH6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGYwT-0054Bt-00;
	Fri, 22 Dec 2023 06:23:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGYwQ-0054Ao-1w;
	Fri, 22 Dec 2023 06:23:27 +0000
X-UUID: 987682aaa09211ee958cff29c719f35b-20231221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=3CfXjXK+ifyxmF7/x1t1E1bQ/x/4s3uHJnnqwy/VaAM=;
	b=uAlROctzkydn8hC38n5GO5+RLgEqs+x6W5c7fPpc1+uLHIkTmv5zOlBaRIA4A1r+7jvfl7wMW2HOWls8EAZ+w5Ym/czxCPIyBygf7ZgwHjWZy/lYTt8Bt1DYdkugXAxewPI7tDoV/1Hjo5enttWauoLdzlheUKO/YwXOnBi58kA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:c142b980-457e-4775-b662-9f7851a43074,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-35
X-CID-META: VersionHash:5d391d7,CLOUDID:07b10d82-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,D
	KR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 987682aaa09211ee958cff29c719f35b-20231221
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <mengqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1989942330; Thu, 21 Dec 2023 23:23:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Dec 2023 14:22:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Dec 2023 14:22:43 +0800
From: Mengqi Zhang <mengqi.zhang@mediatek.com>
To: <ulf.hansson@linaro.org>, <chaotian.jing@mediatek.com>,
	<matthias.bgg@gmail.com>, <mengqi.zhang@mediatek.com>,
	<wenbin.mei@mediatek.com>
CC: <yangyingliang@huawei.com>, <adrian.hunter@intel.com>,
	<avri.altman@wdc.com>, <vincent.whitchurch@axis.com>,
	<linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/1] mmc: core: Add HS400 tuning in HS400es initialization
Date: Fri, 22 Dec 2023 14:22:36 +0800
Message-ID: <20231222062236.26370-1-mengqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_222326_641549_BE1F4E28 
X-CRM114-Status: GOOD (  12.90  )
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
optional process. For Mediatek IP, HS00es mode requires a specific tuning to
ensure the correct HS400 timing setting.

Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>
---
the previous patch link:
https://patchwork.kernel.org/project/linux-mediatek/patch/20231201030547.11553-1-mengqi.zhang@mediatek.com/
---
 drivers/mmc/core/mmc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 705942edacc6..9760eea2c104 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -1823,7 +1823,15 @@ static int mmc_init_card(struct mmc_host *host, u32 ocr,
 		if (err)
 			goto free_card;
 
-	} else if (!mmc_card_hs400es(card)) {
+	} else if (mmc_card_hs400es(card)) {
+		if (host->ops->execute_hs400_tuning) {
+			mmc_retune_disable(host);
+			err = host->ops->execute_hs400_tuning(host, card);
+			mmc_retune_enable(host);
+			if (err)
+				goto free_card;
+		}
+	} else {
 		/* Select the desired bus width optionally */
 		err = mmc_select_bus_width(card);
 		if (err > 0 && mmc_card_hs(card)) {
-- 
2.25.1


