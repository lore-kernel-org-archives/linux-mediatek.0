Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294A9C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 11:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QANQRcbabz/e5AjGyrQQSnGD8OTyugIT5m3Sn9VmQA0=; b=hUkn1csLhBzyTy8B8zt2C5JT3d
	Mj8BgGXHdyiLZFT2jA8yeyaWJTSkfA5lbuN580CkCv7mtIR05XGl514eyN2CCZlHllPvpjv+alKDF
	LWdpouaWwKcDB5BSja0u2m8LjRiV+4A1U8g0dIzt6oQ4ntxyfIwi0tQdrsuxe3Zs5gq5aWHFI6EZ7
	cgXYU5fRVA5XtUxdEvBH0s+yGPBZuQ+parpqBk5fNouy/3kOGKUxliYLzpuh5JjJEz+1cgPNNTmJ/
	QY2h6Gv2FRAg0ftm1OH+Hrn8yvkumgeo7btMFc+hB8DXHt/jqwgFitrzCBBYuJN0VSY1sb32Nmpx1
	oROKVbGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCfr5-0014lS-KG; Tue, 03 Jan 2023 11:53:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCfVW-000yIE-J8; Tue, 03 Jan 2023 11:31:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QANQRcbabz/e5AjGyrQQSnGD8OTyugIT5m3Sn9VmQA0=; b=J66kyAjDMtp0+OrRm8dbv6JsIp
	HN/8STY0LNkv1uMY6WoQ2Ybu70G47fHqhWPPRO1ljt+/UvQi0jUpk2WmSucYwxEomCjvpAHLh/FHQ
	59ZEa/t1XMDKevFb/T65yfL7gRobkCjtjU3Ckm0YBoMJXzIfT34AbiUZ4YQdvS3h0IcFhFU2dIgpw
	uCTSassvVRMXNVz68XB2bWzmWdaURUvvlgcNXk8pmuiReTZHislpGwywC0C4TN6km3MMzDHy9+uf/
	shR9o2duBSPv99SgiVQZK3mSU/w0Je0GEpSImMofhnefU5NGmqp/bdv6Jkfx1iWq8nZaT0RZxNJeC
	SGptR0Iw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pCfUp-000aBy-3B;
	Tue, 03 Jan 2023 11:30:55 +0000
X-UUID: f1eecc800b8e46d5b093e2901a6ef0ec-20230103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QANQRcbabz/e5AjGyrQQSnGD8OTyugIT5m3Sn9VmQA0=;
	b=jm3Af5jRZXxLBJkPUb3avxeNITJekXai7qCZSdvvHdPAn4rLasVzeiyQhP0bh6KPdPSyHQLH7jMPjg1CHGo0un2icSjCbjZoKBMSNONvshkV9y8wzCSYNoN19xLaSCw4/boHYUJ4bt1GgtInD6QC7Zm2B7xv/OaNxXebgGLRBgM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:a752f76c-e00c-4f6a-9caf-a355488ed2cc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:09771b1,CLOUDID:15a78053-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: f1eecc800b8e46d5b093e2901a6ef0ec-20230103
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1126359415; Tue, 03 Jan 2023 04:30:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 3 Jan 2023 19:29:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 3 Jan 2023 19:29:27 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 10/14] soc: mediatek: mtk-svs: reset svs when svs_resume() fail
Date: Tue, 3 Jan 2023 19:29:21 +0800
Message-ID: <20230103112925.16554-11-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230103112925.16554-1-roger.lu@mediatek.com>
References: <20230103112925.16554-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_113054_061316_C24B302B 
X-CRM114-Status: GOOD (  10.47  )
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

Reset svs when svs_resume() fail.

Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index d8b759897fec..567536e32a46 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1621,12 +1621,16 @@ static int svs_resume(struct device *dev)
 
 	ret = svs_init02(svsp);
 	if (ret)
-		goto svs_resume_clk_disable;
+		goto svs_resume_reset_assert;
 
 	svs_mon_mode(svsp);
 
 	return 0;
 
+svs_resume_reset_assert:
+	dev_info(svsp->dev, "assert reset %d\n",
+		 reset_control_assert(svsp->rst));
+
 svs_resume_clk_disable:
 	svs_clk_disable(svsp);
 
-- 
2.18.0


