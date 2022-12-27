Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBAEC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 12:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egOl5iq5coPFCtNJCs9nRdOS8+zQru1z7+L5Cup8Vb0=; b=QVDNGpMKUkUajmleAaaKR3Lc19
	5PTr/WTDgbACbyfBVWQrmjl6BTeO9ojyTFN0Wlyf99RCWVpqJaXIrjhicaz7OlroTEA1NdblXKwza
	4NxCYnW7jgZ4nspENFoTnRy9Nb9MbAqGWqXLlm44swW6XfYDluv/9Nms81u1gMjuTbiEWY3xZyusM
	0H560Q6QNMiBEaFHMDnXEDGKDCZVbLoKWJnkFHmyDLT01CIOcndY3NUGrr1ehiQv208w455G0ghIw
	5nlUfucgcWp5gbnv3W1Wyvvm1jo8sfjozv4U8dGAPagRDuaOgsunjliwQCoGd3WSCp4VSFa2PVFg+
	x2SRn6/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8yw-00Cp7Y-IE; Tue, 27 Dec 2022 12:22:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8wh-00Co0u-6z; Tue, 27 Dec 2022 12:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=egOl5iq5coPFCtNJCs9nRdOS8+zQru1z7+L5Cup8Vb0=; b=Aer5KIW/UDG/r6jM01gXLsmkU9
	m9XsIGP8zAjKD3mchmU16iszQJi++2jkOzNxGBjhF6oUxCfv9ZUpq3fUsDvWoS53FJU4oh7wImpKu
	FQk6BjoMczVLZVOIiT5LI73x2N3i8ZLEyCyvIbKpGybJArFzXUdddEGevYIlBrLqB4lvkjyucnXMs
	aqFxEo7pI5J1HL2p32NVNF/pGBhyu1zG0c9xGbR2U/feC0U+IHYRrh/9gyiAzJRQjddJIH+J669bg
	sMT2+gkWd9OzsUzLDdjeuGV30s8hbaELtQ/EYYzxS/Q5UJPOVPz+WoW3Q+ONTkfnMgXh2g0k/Zw65
	McK6crwg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pA8wX-00FdeK-0p;
	Tue, 27 Dec 2022 12:20:33 +0000
X-UUID: 3d834e24c4df4c18b3ff94d96e896548-20221227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=egOl5iq5coPFCtNJCs9nRdOS8+zQru1z7+L5Cup8Vb0=;
	b=FkDQKcBOAY6BZ8lO5wWELl+Nly7XOR7thNOIHN+xrxOVoEGTmG9tQULqwPxVPE7KI4adGD0TTO8tp7+G46vzBMKET2DhOYnNIOpr1cSQXFDptKRTrO52wlMS038mFD2TngYUsriUrGQEWz29CNyyD7OF+vdEalM/OUhQMudNIyU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:afcd8416-8f41-4de0-9bb6-e4f18af8a975,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:61bcee52-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3d834e24c4df4c18b3ff94d96e896548-20221227
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 126887511; Tue, 27 Dec 2022 05:20:22 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Dec 2022 20:09:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Dec 2022 20:09:18 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 13/13] soc: mediatek: mtk-svs: keep svs alive even though debug cmd create fail
Date: Tue, 27 Dec 2022 20:09:14 +0800
Message-ID: <20221227120914.11346-14-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221227120914.11346-1-roger.lu@mediatek.com>
References: <20221227120914.11346-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_122030_813873_186C8711 
X-CRM114-Status: GOOD (  11.78  )
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
index 8ef330175d39..89579276c09c 100644
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
@@ -2417,11 +2415,7 @@ static int svs_probe(struct platform_device *pdev)
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


