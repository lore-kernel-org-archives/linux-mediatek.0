Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3C0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 07:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vZTNVPSxg8ef4/Fm2BUC+i+HmQcoaSZ7MeKFRd3dzEo=; b=gyG5CL8dX53cWN
	pGzG8wRtVezDu3fsjk8GoDSVWdmk3+VA83OCmuTMzIlr96KHca7COjIm/PlJ8VV4GRF1KuNtR27PF
	R5bAlEXA8GxaBqkWd40pufRAKY6GBNtDCTF3PsDvT9de3/2ZzEotBUDfRog++p+6GrxpjtjHwtteH
	fpYH0ujADQ5t8daLcnjW6FG2aIcRG0MpnzWfHcMC4DLhNXzoWtnXxnt3gLpnYwzV0D6iJ4nGuGOJ4
	BVh0maErYu6g4IB9zRu/CsjAgo9yQhPz//i9tNVAn0NCkeaDCHRyxJPZQb9nyJlhvPlBqaO+0mRqg
	aWdL5le6PB6VEe8WjInQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzYtB-006NwJ-UR; Fri, 10 Jun 2022 07:17:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzYst-006NpD-Da; Fri, 10 Jun 2022 07:16:48 +0000
X-UUID: 56133762e328438f9f802670943036d7-20220610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:cbd1bc43-6640-4526-8868-e89395b340f9,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:436be97e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 56133762e328438f9f802670943036d7-20220610
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1599536713; Fri, 10 Jun 2022 00:16:34 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jun 2022 00:15:05 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 10 Jun 2022 15:15:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Jun 2022 15:15:04 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Masahiro Yamada
	<yamada.masahiro@socionext.com>, Andrew Morton <akpm@linux-foundation.org>
CC: <chinwen.chang@mediatek.com>, <nicholas.tang@mediatek.com>,
	<casper.li@mediatek.com>, <andrew.yang@mediatek.com>, Kuan-Ying Lee
	<Kuan-Ying.Lee@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] scripts/gdb: change kernel config dumping method
Date: Fri, 10 Jun 2022 15:14:57 +0800
Message-ID: <20220610071500.9656-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_001643_491312_2664257E 
X-CRM114-Status: UNSURE (   9.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MAGIC_START("IKCFG_ST") and MAGIC_END("IKCFG_ED") are moved out
from the kernel_config_data variable [1].

Thus, we parse kernel_config_data directly instead of considering
offset of MAGIC_START and MAGIC_END.

[1] https://lore.kernel.org/lkml/1550108893-21226-1-git-send-email-yamada.masahiro@socionext.com/

Fixes: 13610aa908dc ("kernel/configs: use .incbin directive to embed config_data.gz")
Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
 scripts/gdb/linux/config.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/gdb/linux/config.py b/scripts/gdb/linux/config.py
index 90e1565b1967..8843ab3cbadd 100644
--- a/scripts/gdb/linux/config.py
+++ b/scripts/gdb/linux/config.py
@@ -24,9 +24,9 @@ class LxConfigDump(gdb.Command):
             filename = arg
 
         try:
-            py_config_ptr = gdb.parse_and_eval("kernel_config_data + 8")
-            py_config_size = gdb.parse_and_eval(
-                    "sizeof(kernel_config_data) - 1 - 8 * 2")
+            py_config_ptr = gdb.parse_and_eval("&kernel_config_data")
+            py_config_ptr_end = gdb.parse_and_eval("&kernel_config_data_end")
+            py_config_size = py_config_ptr_end - py_config_ptr
         except gdb.error as e:
             raise gdb.GdbError("Can't find config, enable CONFIG_IKCONFIG?")
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
