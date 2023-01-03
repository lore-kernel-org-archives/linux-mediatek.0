Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62242C46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 12:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JeE+5LqZ6k4NifYeA8Fk9/IcVz1Gx3PLSu0PON7bng=; b=lCL5A7lfOFtORyB0qsyGwFJxR3
	C5j8WkaxtCo5NHfnc/qNSKFDj8+L1q5cQpMBlSfx52QMw2YNjVsz/v38iQrNvJ3gVgyHRb+1N+JPn
	i+3AmsTT7NpgT7dlAJVqFHCQU/c6F2WPQIEVg0sxis28LCMntQn4kpJtYBXa4CAvgNSGe+cdr9fTP
	sF/08EhrDwJ6XWOmeYQLZF3e1+PXrFZP9u9uJapH4YBnlV5LGC36CGMRfJ8wBcHTYghu8koBNhul8
	9W+ZDFXRLlZtKjjHHNi8EECYt8BM/VGoYriaqOSeNAQy9utMLPbmSlg2k3/v5AYjZXDjhKdZC5wJj
	/KUQEuxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCgA2-001AR8-8y; Tue, 03 Jan 2023 12:12:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCfob-00142b-JA; Tue, 03 Jan 2023 11:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9JeE+5LqZ6k4NifYeA8Fk9/IcVz1Gx3PLSu0PON7bng=; b=g1LEO33Ajvoo2sUcznuUHinKTG
	RmI8S+sSz0FpmDexOgmcU8TaQLM50EpUWvwZaY5jZbDBP6uHTu/FILMIGIq1ZVslbn0Tw3EVTtn5v
	GN8ls2/Cw7A+DIcoblXputuMS15AFPdZMDZz8YC250Oj1vH1qFg97e4ioXkXPKtIYXu/O4T4542xH
	7sl/qqe8ANybKRijiIBMIY5OJxtGNAqnPc+V56zttcOS9z26uohXxciegRh+3yESEv9ACwHoq3HAy
	BU1pGLRrJv+GM+C8d7F4VZjmdsC/IC0zNNZRNwTuRsXzyvU4q9Z1L2tJeBTmug9PFntLuou+PZgGC
	5djE6idw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pCfoS-000aRj-1h;
	Tue, 03 Jan 2023 11:50:38 +0000
X-UUID: 303245ddadf44fb0a4078e561fd183f9-20230103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9JeE+5LqZ6k4NifYeA8Fk9/IcVz1Gx3PLSu0PON7bng=;
	b=u0jyPGc/lAFqCi8QD3naz6wyStcVPMK9Z/FrTdfn2Cx+jP47NJfHxUZ8XUZ0pgLf6xu1F2luh371ttJcHAk3ikdITY5cKgAx4E5bi8gu0CPZ/Y0BHKlDxgEKcOQtsypvwjCvNLy50KvWS+yHz3XEbdZQrB17fRk4zz7Ywy0+J6U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:4e393f90-33a6-4550-b264-0f37c5d75855,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:09771b1,CLOUDID:002a1c8b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 303245ddadf44fb0a4078e561fd183f9-20230103
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 55619115; Tue, 03 Jan 2023 04:50:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 3 Jan 2023 19:29:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 3 Jan 2023 19:29:28 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 12/14] soc: mediatek: mtk-svs: restore default voltages when svs_init02() fail
Date: Tue, 3 Jan 2023 19:29:23 +0800
Message-ID: <20230103112925.16554-13-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230103112925.16554-1-roger.lu@mediatek.com>
References: <20230103112925.16554-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_115037_154530_89B834FE 
X-CRM114-Status: GOOD (  13.18  )
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

If svs init02 fail, it means we cannot rely on svs bank voltages anymore.
We need to disable svs function and restore DVFS opp voltages back to the
default voltages for making sure we have enough DVFS voltages.

Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index f4382def9736..1b4798a9101c 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1495,6 +1495,7 @@ static int svs_init02(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb;
 	unsigned long flags, time_left;
+	int ret;
 	u32 idx;
 
 	for (idx = 0; idx < svsp->bank_max; idx++) {
@@ -1513,7 +1514,8 @@ static int svs_init02(struct svs_platform *svsp)
 							msecs_to_jiffies(5000));
 		if (!time_left) {
 			dev_err(svsb->dev, "init02 completion timeout\n");
-			return -EBUSY;
+			ret = -EBUSY;
+			goto out_of_init02;
 		}
 	}
 
@@ -1531,12 +1533,21 @@ static int svs_init02(struct svs_platform *svsp)
 		if (svsb->type == SVSB_HIGH || svsb->type == SVSB_LOW) {
 			if (svs_sync_bank_volts_from_opp(svsb)) {
 				dev_err(svsb->dev, "sync volt fail\n");
-				return -EPERM;
+				ret = -EPERM;
+				goto out_of_init02;
 			}
 		}
 	}
 
 	return 0;
+
+out_of_init02:
+	for (idx = 0; idx < svsp->bank_max; idx++) {
+		svsb = &svsp->banks[idx];
+		svs_bank_disable_and_restore_default_volts(svsp, svsb);
+	}
+
+	return ret;
 }
 
 static void svs_mon_mode(struct svs_platform *svsp)
-- 
2.18.0


