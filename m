Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FCCC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 10:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ZY4AZDYf3MqfVor9zqLlQKC36zLAsqpKfJ+7P47ujI=; b=H2kv5W3zoRt9lHZYgYAsBl2rkn
	CDv8rC88uxnNHIoEKosREWaBX3CFViA8NGCNQFX92EazTmMUn1nPOtuDaJzKm5aJ1PEAeR/ZS5HEX
	ZjKaO3Y+n/wyfLzTLdCpWHHdFLKCNtQMIUG1Exr/NyTQEbWK1aAaFNF3r64jB7YavCUkXcAv8ImR8
	vdXo4n6ECAnSoQU587af6aWGMJ97Wfvz8bXBnYq9BoMlD4IkBJChnH8PP6wkUZEjwIi0hwLXo8nC2
	SPyZDPrVAiQ8ptHg0TJmHcL7/IDIccovMhXOZqJB1i+X18MlFD0c/873ymT2oPgu7SREtYR7QQBqj
	ruM8P1KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9keO-0039gF-RA; Mon, 26 Dec 2022 10:24:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9keH-0039dl-0q; Mon, 26 Dec 2022 10:24:04 +0000
X-UUID: d96d049b5cfd47baa88abf27f23b3b19-20221226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+ZY4AZDYf3MqfVor9zqLlQKC36zLAsqpKfJ+7P47ujI=;
	b=iRqE5c1fBQfL9ilf9ed2Vj8bLdLF+Uuiep35H9CBSpFBhd1wB2QvdlX7Zvf2WfcAuR9Pj4o2B+4Bbx5/ajnldNn4UzHeeNXRVAA92mjfhWNCBpk/tzwQxD+dX+8d9oEQKGx98t81eQQL+xpzveomHDnNChVw7sK8MwqbvD1b1t0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:85217871-e7cf-4f88-b9bf-607c6eb83e50,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:b8fc6a8a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d96d049b5cfd47baa88abf27f23b3b19-20221226
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 909725868; Mon, 26 Dec 2022 03:23:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 26 Dec 2022 17:42:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 26 Dec 2022 17:42:51 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1 13/13] soc: mediatek: mtk-svs: keep svs alive even though debug cmd create fail
Date: Mon, 26 Dec 2022 17:42:48 +0800
Message-ID: <20221226094248.4506-14-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221226094248.4506-1-roger.lu@mediatek.com>
References: <20221226094248.4506-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_022401_514409_4356DB1B 
X-CRM114-Status: GOOD (  11.08  )
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

Some projects might not support DEBUG_FS but still needs svs to be
supported. Therefore, keep svs alive even though debug cmd create fail.

Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index af3a12e29e78..c780a115543e 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2390,10 +2390,8 @@ static int svs_probe(struct platform_device *pdev)
 	}
 
 	ret = svs_create_debug_cmds(svsp);
-	if (ret) {
+	if (ret)
 		dev_err(svsp->dev, "svs create debug cmds fail: %d\n", ret);
-		goto svs_probe_iounmap;
-	}
 
 	return 0;
 
-- 
2.18.0


