Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21215C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 11:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rA6xPRcCpI0277oPsTRr+M+DbjSu9YjPyZJZSbewd2s=; b=DwHWm/EijOR8YLBzbg+RzFTYqC
	aN6vVwsPzdBmX7DCEiYP1yp3vcRi5ytfOuqIR7RoShCPWVdYLpgADnmafl2COPQ0EmZUbN2q38+HK
	92+3JBM45fS/5iWHpnYiVFiqzLDQve8FwyUuW/sHqH4LqcyU5P3/IcZqJPoMmXjM8Jmnl5pjxE/zB
	vbNmU68HZYaegGbODAUER6Hto2fScq6EJmwRENCmRFmb1phZA2GD6iWLBtzDIjKv9rY7qMhPcdWCg
	FiMz/rB85agnM3uj9l1UcAjPPZPfA3ezKaWFayfuzoylWJExYB4B48ahZEj0JRvDHRjMiZe2c3Lg+
	yTD6cw8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCfrI-0014s5-4e; Tue, 03 Jan 2023 11:53:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCfVY-000yIY-Kt; Tue, 03 Jan 2023 11:31:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rA6xPRcCpI0277oPsTRr+M+DbjSu9YjPyZJZSbewd2s=; b=WMth9AAmKRvaYpIm82JVSgDiWx
	J82CKVLJx3UjSIgiVmDyEBjqj55+h+YWlHGcQMp9QiD3bHwCpffZyK45V6BcLolOSYE9N/tWA+s6+
	jZNEeJP/aan+tK0Danh/Z5J5upVqqFes9PwpjyQCQZBGUmQ18oyB0l9aDXIz5hFYy+2WrgPLzcIwn
	YM6u32sNCnzmbiHf3w1QGo26v3/tAwBwNIqpotZd9MVG0Djo+l3kQ9B5M/LOoxWM98mfpic6a5o9S
	xUTM6ayFkyEm8K44NJ+lTaJ48qJNpB5PEATlF9/VFo6vmi5hwdu8Ap5wVU7sn7DqnNHDoKUbOOD6f
	QxuWYf0w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pCfUq-000aBz-2C;
	Tue, 03 Jan 2023 11:30:58 +0000
X-UUID: ad2fb1099ac440518eae5284acc7a2ef-20230103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rA6xPRcCpI0277oPsTRr+M+DbjSu9YjPyZJZSbewd2s=;
	b=p0fO7b4JTv80/yhS7HeUrCKBUdqJS3/pRPQC7lzU+0eJJo9KS1KfRgfoukq37hpjZ4pyo+ZJ4CmotgR6A13FOh2oFlLx4l76F6VNh0DEVDoIHFL3q8BzI/anKHhbzR6PIFRCHKhtmaZSJNH4rMKi3sMUAWF/jkD+v6S6R/1Wod4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:9221ece7-451f-4083-bd54-1266b48e7f79,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:09771b1,CLOUDID:d5a01b8b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: ad2fb1099ac440518eae5284acc7a2ef-20230103
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 97228096; Tue, 03 Jan 2023 04:30:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
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
Subject: [PATCH v3 14/14] soc: mediatek: mtk-svs: keep svs alive even though debug cmd create fail
Date: Tue, 3 Jan 2023 19:29:25 +0800
Message-ID: <20230103112925.16554-15-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230103112925.16554-1-roger.lu@mediatek.com>
References: <20230103112925.16554-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_113056_353268_E94F393A 
X-CRM114-Status: GOOD (  12.52  )
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
 drivers/soc/mediatek/mtk-svs.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 581bb8373b0c..02ecbdb7aa32 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -806,7 +806,7 @@ static int svs_status_debug_show(struct seq_file *m, void *v)
 
 debug_fops_ro(status);
 
-static int svs_create_debug_cmds(struct svs_platform *svsp)
+static void svs_create_debug_cmds(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb;
 	struct dentry *svs_dir, *svsb_dir, *file_entry;
@@ -831,7 +831,7 @@ static int svs_create_debug_cmds(struct svs_platform *svsp)
 	if (IS_ERR(svs_dir)) {
 		dev_err(svsp->dev, "cannot create %s: %ld\n",
 			d, PTR_ERR(svs_dir));
-		return PTR_ERR(svs_dir);
+		return;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(svs_entries); i++) {
@@ -841,7 +841,7 @@ static int svs_create_debug_cmds(struct svs_platform *svsp)
 		if (IS_ERR(file_entry)) {
 			dev_err(svsp->dev, "cannot create %s/%s: %ld\n",
 				d, svs_entries[i].name, PTR_ERR(file_entry));
-			return PTR_ERR(file_entry);
+			return;
 		}
 	}
 
@@ -855,7 +855,7 @@ static int svs_create_debug_cmds(struct svs_platform *svsp)
 		if (IS_ERR(svsb_dir)) {
 			dev_err(svsp->dev, "cannot create %s/%s: %ld\n",
 				d, svsb->name, PTR_ERR(svsb_dir));
-			return PTR_ERR(svsb_dir);
+			return;
 		}
 
 		for (i = 0; i < ARRAY_SIZE(svsb_entries); i++) {
@@ -866,12 +866,10 @@ static int svs_create_debug_cmds(struct svs_platform *svsp)
 				dev_err(svsp->dev, "no %s/%s/%s?: %ld\n",
 					d, svsb->name, svsb_entries[i].name,
 					PTR_ERR(file_entry));
-				return PTR_ERR(file_entry);
+				return;
 			}
 		}
 	}
-
-	return 0;
 }
 
 static u32 interpolate(u32 f0, u32 f1, u32 v0, u32 v1, u32 fx)
@@ -2421,11 +2419,7 @@ static int svs_probe(struct platform_device *pdev)
 		goto svs_probe_iounmap;
 	}
 
-	ret = svs_create_debug_cmds(svsp);
-	if (ret) {
-		dev_err(svsp->dev, "svs create debug cmds fail: %d\n", ret);
-		goto svs_probe_iounmap;
-	}
+	svs_create_debug_cmds(svsp);
 
 	return 0;
 
-- 
2.18.0


