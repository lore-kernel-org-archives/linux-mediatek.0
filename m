Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4675C001E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 09:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=of+Yq84+TCPrRdlX79cImaBtdd9LrIudC8T+juj2xpM=; b=VAB692ERsfGl+HPIUy0fT4kzHq
	v4tFLpTLoVwrBz1Z5I7dczcv1WNUzF8/JXAQ1zWw792ewhheA9qxg944fODkukYd2S1BXy2i0Uwp9
	HK9GqZsmw0efDc2ZFvSTvglPJXkuBC/8W04gkfvpS6V7a4qBRu6SaHwGnxuBXlKpr0kIeUM0HN6O0
	xpWbHyw8c1bzvKDIX2ncpO/d4MHk9KSCBhrpR9OpUPRUEB+/ODUo+X0vjGlpeqRCNUL0/UOP6cTpW
	iW9MVofvqDc1IjSc0H0enohNdQ1X/BSeSfSc0JGx7UeYONql5StHjwL5KqPvmjy54CUZ5eApLzFIe
	ApYKjsGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOESd-006xgB-1r;
	Tue, 25 Jul 2023 09:36:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOESQ-006xZz-0X;
	Tue, 25 Jul 2023 09:35:55 +0000
X-UUID: a30ffba42ace11ee83ed1395ce914268-20230725
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=of+Yq84+TCPrRdlX79cImaBtdd9LrIudC8T+juj2xpM=;
	b=X9x68mWU8XgX5xftI3Ulh/FmCUOfxpQ6Jqk9gJxBbr5MZKksY/Y+rCjFk+nHyX0rt9rJOL862bd5wKxBo7qfkz0VZYwXk8SOrkvpwdRBWMsRKFNMVrmPr6A9u65fj0jdw2OHyNaRptdPGQttm/ZBSNaotPLBQa/0Erji+t9AI0s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29,REQID:f32dda41-722f-4905-95e0-ddcc47c571bc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7562a7,CLOUDID:f1a181a0-0933-4333-8d4f-6c3c53ebd55b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: a30ffba42ace11ee83ed1395ce914268-20230725
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2026009358; Tue, 25 Jul 2023 02:35:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 25 Jul 2023 17:35:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 25 Jul 2023 17:35:28 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <chinwen.chang@mediatek.com>, <qun-wei.lin@mediatek.com>,
	<linux-mm@kvack.org>, <linux-modules@vger.kernel.org>,
	<casper.li@mediatek.com>, <akpm@linux-foundation.org>,
	<linux-arm-kernel@lists.infradead.org>, Kuan-Ying Lee
	<Kuan-Ying.Lee@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 3/8] scripts/gdb/utils: add common type usage
Date: Tue, 25 Jul 2023 17:34:53 +0800
Message-ID: <20230725093458.30064-4-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230725093458.30064-1-Kuan-Ying.Lee@mediatek.com>
References: <20230725093458.30064-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_023554_215534_A5EBE3CE 
X-CRM114-Status: UNSURE (   8.65  )
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

Since we often use 'unsigned long', 'size_t', 'usigned int'
and 'struct page', we add these common types to utils.

Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
 scripts/gdb/linux/utils.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/scripts/gdb/linux/utils.py b/scripts/gdb/linux/utils.py
index 9f44df13761e..7d5278d815fa 100644
--- a/scripts/gdb/linux/utils.py
+++ b/scripts/gdb/linux/utils.py
@@ -35,12 +35,32 @@ class CachedType:
 
 
 long_type = CachedType("long")
+ulong_type = CachedType("unsigned long")
+uint_type = CachedType("unsigned int")
 atomic_long_type = CachedType("atomic_long_t")
+size_t_type = CachedType("size_t")
+struct_page_type = CachedType("struct page")
+
+def get_uint_type():
+    global uint_type
+    return uint_type.get_type()
+
+def get_page_type():
+    global struct_page_type
+    return struct_page_type.get_type()
 
 def get_long_type():
     global long_type
     return long_type.get_type()
 
+def get_ulong_type():
+    global ulong_type
+    return ulong_type.get_type()
+
+def get_size_t_type():
+    global size_t_type
+    return size_t_type.get_type()
+
 def offset_of(typeobj, field):
     element = gdb.Value(0).cast(typeobj)
     return int(str(element[field].address).split()[0], 16)
-- 
2.18.0


