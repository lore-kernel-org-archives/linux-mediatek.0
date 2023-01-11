Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49CFC5479D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 07:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoap/k5iBvhP1h15PeE1oi3mbQfqzU4RcOAgAgwn+qY=; b=ocN8slAZkv/MQId76ATX4tldPr
	tT7VQnIPuB3nhvmyBhgohmRSNEcK9GP1UdMF4woWLnUKoupGKwOamPGb6v+8lfc32I1FHBpzBUlzJ
	y0sTiYvabCrLe0IDywE+/yTadftCFJQGwUJOECoM9KCncFViq7aRVgqjlaXBWwm8jxrpSjcAuxjKd
	U/VBBBTxNyiuNka63TUGQTr+lPFWlnQrRadvinI9Pu93aAQ4XOGAv9C9hnu05xFTZ5Ud8NHmb8b/B
	ZbGhwkZxiGME5IPgO+LTDzAmhv4+/9PQOUuDdQB3MpoglKk57sTPCyP09Y6jieFqw6QLmhL2uFZoZ
	ZUc6DTww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFVod-00A6qZ-Hs; Wed, 11 Jan 2023 07:46:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFVoH-00A6eX-Mr; Wed, 11 Jan 2023 07:46:12 +0000
X-UUID: 00eb75f8918411edbbe3f76fe852e059-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xoap/k5iBvhP1h15PeE1oi3mbQfqzU4RcOAgAgwn+qY=;
	b=j7e15xNwrhQhJEk/ABbtCoDd+ou3+9r7j64PnY0/VgPzeWjDIFlfSNc8+tybQy4ZWoMezr2MY9bFb9gUj2OPE1StIEY0FxAjZs0tqCrMQklH0iOFEAxV+6d0JPbLdwMdDNS5ilm0+XbUZgOVP2MRyvi/Ya2kZoxqnsELn6sy2AU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:78281f0f-525c-4461-8e66-f54cf8710377,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.17,REQID:78281f0f-525c-4461-8e66-f54cf8710377,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:543e81c,CLOUDID:b6797df5-ff42-4fb0-b929-626456a83c14,B
	ulkID:230111154554GBLCGGPP,BulkQuantity:2,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:0,Malicious:0
X-CID-BVR: 0,NGT
X-UUID: 00eb75f8918411edbbe3f76fe852e059-20230111
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1051576313; Wed, 11 Jan 2023 00:46:05 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 11 Jan 2023 15:45:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 15:45:30 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 02/14] soc: mediatek: mtk-svs: reset svs when svs_resume() fail
Date: Wed, 11 Jan 2023 15:45:16 +0800
Message-ID: <20230111074528.29354-3-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230111074528.29354-1-roger.lu@mediatek.com>
References: <20230111074528.29354-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_234609_773051_3F19788A 
X-CRM114-Status: GOOD (  11.06  )
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

Add svs reset when svs_resume() fail.

Fixes: a825d72f74a3 ("soc: mediatek: fix missing clk_disable_unprepare() on err in svs_resume()")
Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 2df30a6bca28..a803b92afc3d 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1614,12 +1614,16 @@ static int svs_resume(struct device *dev)
 
 	ret = svs_init02(svsp);
 	if (ret)
-		goto out_of_resume;
+		goto svs_resume_reset_assert;
 
 	svs_mon_mode(svsp);
 
 	return 0;
 
+svs_resume_reset_assert:
+	dev_err(svsp->dev, "assert reset: %d\n",
+		reset_control_assert(svsp->rst));
+
 out_of_resume:
 	clk_disable_unprepare(svsp->main_clk);
 	return ret;
-- 
2.18.0


