Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D253FC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 17:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rY8/JCNCxGV6XsNclBP6t4jZ+yj7aG0gjOCHl/IH2jc=; b=LLgD0jV+pfanhKhyZBava7EKRg
	R5gjtVAmBUrLxjEb4pYmEUt2aawNZ3jm6NFD+00AaEd9i3n7uneBVoxaVJUxMQYw0enx86ZnQAFp4
	ohQyhP1tZoVTXcZapaQi3ITTSdvC3yWKEiAQRxCHWhTVjnSHdzezaoqQatkmxgBbGSL7cSSxL06dl
	T9SY5ZLDOAKnGh8EM0vOTpKvl9VCJuutFe3m6CUZPx5N9QdUjw3uWNRHdbv6lAb5Y4Oo4ylZmLqa8
	zwLbIO9KXMpIl7Ntd+CjMihOC3JStmBBgRXRmp0aGMRtH+P5bzWfo4+Xa8Pp+6xvszDKSaS3c3h2W
	DPElk8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oviry-00GPS3-G8; Thu, 17 Nov 2022 17:40:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovirt-00GPMW-9k
	for linux-mediatek@lists.infradead.org; Thu, 17 Nov 2022 17:40:08 +0000
X-UUID: b876b915eb0d40de8ccc1be1da1ab399-20221117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rY8/JCNCxGV6XsNclBP6t4jZ+yj7aG0gjOCHl/IH2jc=;
	b=ZrmupqGAJIzgqYhsqaCmq2MBrizfb0zearnBI+Ttgte229qTXhW7HEj391GEXD0lLzZEf+91bt7I49oWHzztrm2QAxxV3CJi1cISzvYtJfexregAOPxsZrCSCy47UmWRttvPS4hpbLL26vVFoSZ0Wd7OKcYHoBBChRNsvt6NRB4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:786fb3b9-859e-47f4-819d-06261570759f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:e29e7fdb-6ad4-42ff-91f3-18e0272db660,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b876b915eb0d40de8ccc1be1da1ab399-20221117
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1062132987; Thu, 17 Nov 2022 10:39:55 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 18 Nov 2022 01:09:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 18 Nov 2022 01:09:51 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7915: add missing MODULE_PARM_DESC
Date: Fri, 18 Nov 2022 01:09:46 +0800
Message-ID: <02bd118d5ffff286c080d27fd7669095064cb75e.1668704608.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_094005_390643_D8D81087 
X-CRM114-Status: UNSURE (   8.16  )
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

Add documentation for module_param so that they're visible with
modinfo command.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/coredump.c | 1 +
 drivers/net/wireless/mediatek/mt76/mt7915/mmio.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/coredump.c b/drivers/net/wireless/mediatek/mt76/mt7915/coredump.c
index bb4b70401af5..d097a56dd33d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/coredump.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/coredump.c
@@ -9,6 +9,7 @@
 
 static bool coredump_memdump;
 module_param(coredump_memdump, bool, 0644);
+MODULE_PARM_DESC(coredump_memdump, "Optional ability to dump firmware memory");
 
 static const struct mt7915_mem_region mt7915_mem_regions[] = {
 	{
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index 3c840853a2c9..4f85bfb8baba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -12,6 +12,7 @@
 
 static bool wed_enable;
 module_param(wed_enable, bool, 0644);
+MODULE_PARM_DESC(wed_enable, "Enable Wireless Ethernet Dispatch support");
 
 static const u32 mt7915_reg[] = {
 	[INT_SOURCE_CSR]	= 0xd7010,
-- 
2.36.1


