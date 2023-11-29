Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C747C07E97
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 06:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08vSeE6OW9EXx9SVxCK+5GtLZk0M4OycbZa7bfVQrkA=; b=DOetVs0EsD8tLoQzQjdD8kjrCG
	CPq04WMBup+aEum1Z/NcM/wsH5Qqbi8eWF5XCTCNGSGA1+Z9jyGt3oGlh9iYwD3uThQmvmnLNFk2r
	v3Bex3tt8m3KenttNxpN7WRs4O98tFgJGWGk1+lKmpHsL5HaEnh9VmVfMGAc/MJZVY6q9MapRohyJ
	z1AXaC6lyAUMhNUSxnNUDD6YiJ9a+k6QIxJeKR7HgGUb1qqoNrMOL0Um6do9tkkGbhE04ydUvBhVE
	K2X/JMLwWOxU1m/BNtrrAOy459tVe6Q+TnlX++hP1Z0KSK6yUGlc18DPCkIUVA8JEdqj0cDvHzG+C
	q5HGrZnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ER5-007H7Z-1s;
	Wed, 29 Nov 2023 06:52:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8EQv-007H2I-2j;
	Wed, 29 Nov 2023 06:52:31 +0000
X-UUID: d81f9f528e8311ee9b7791016c24628a-20231128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=08vSeE6OW9EXx9SVxCK+5GtLZk0M4OycbZa7bfVQrkA=;
	b=uUnShdgDLaoKix/086WA47nYc/91Xx9IKD49aLMmCKJnesFJqSBZGRR6QH5p6E3ypkiZiBAOIlLjywAdz//UFkq5nt7Ss82RivuByIfc9xjUCbzcdjbs4Zn65HxudOxL+HZf2GTw3WPcWPSY71n3D7eSgB4NUo2UItCTnUkIPAM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:9aef4303-3cc5-4e1c-8dc1-cea72f03f761,IP:0,U
	RL:0,TC:0,Content:42,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:42
X-CID-META: VersionHash:abefa75,CLOUDID:70e73273-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d81f9f528e8311ee9b7791016c24628a-20231128
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 152090873; Tue, 28 Nov 2023 23:52:21 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 29 Nov 2023 14:51:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 29 Nov 2023 14:51:47 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <casper.li@mediatek.com>, <chinwen.chang@mediatek.com>,
	<qun-wei.lin@mediatek.com>, <linux-mm@kvack.org>,
	<akpm@linux-foundation.org>, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 3/3] scripts/gdb: Remove exception handling and refine print format
Date: Wed, 29 Nov 2023 14:51:40 +0800
Message-ID: <20231129065142.13375-4-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231129065142.13375-1-Kuan-Ying.Lee@mediatek.com>
References: <20231129065142.13375-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.929400-8.000000
X-TMASE-MatchedRID: jdTirKra2+aWHmpvkeKJB0hwlOfYeSqx3xlpFMX5MCCQ2TbICkFOdk69
	FgKoS/097PSkEF73uYd7VWtw6SMI5Kawq2pdPD7UA9lly13c/gGb/LTS0T1K1k4K0IMk2m3GwVB
	JSJ8GjJw3fJWouRpjSXrw5BSR88yeSoBVPxvX5SSQOktEo73GFOTWKSbLQnNI0w5IABkoK4ejxY
	yRBa/qJcFwgTvxipFajoczmuoPCq19P2b/9z7kWHSNJjw0OCy9gb7Td4d4rgQuZNN5SUKmZTcKk
	lC0AO+P7Q3LxoZAUkRSnlLzDnqOReV52TIVUC4lGG2UoSCAHI/BkGBTIlURuXoXDz8+lMxFpW+a
	IDJ4DaRzkxJ+SIkUjmncuUSUEdOX
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.929400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1709499E65CB7E7AF41F04E97E4A617AD0E61BE14F55DA8E7D4C9D52B5C7303A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_225229_897083_85F04061 
X-CRM114-Status: GOOD (  12.78  )
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

1. When we crash on a page, we want to check what
happened on this page instead of skipping this page by
try-catch block. Thus, removing the try-catch block.

2. Remove redundant comma and print the task name properly.

Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
 scripts/gdb/linux/page_owner.py | 58 ++++++++++++++-------------------
 scripts/gdb/linux/slab.py       |  3 +-
 2 files changed, 26 insertions(+), 35 deletions(-)

diff --git a/scripts/gdb/linux/page_owner.py b/scripts/gdb/linux/page_owner.py
index 844fd5d0c912..8e713a09cfe7 100644
--- a/scripts/gdb/linux/page_owner.py
+++ b/scripts/gdb/linux/page_owner.py
@@ -122,27 +122,24 @@ class DumpPageOwner(gdb.Command):
         if not (page_ext['flags'] & (1 << PAGE_EXT_OWNER_ALLOCATED)):
             gdb.write("page_owner is not allocated\n")
 
-        try:
-            page_owner = self.get_page_owner(page_ext)
-            gdb.write("Page last allocated via order %d, gfp_mask: 0x%x, pid: %d, tgid: %d (%s), ts %u ns, free_ts %u ns\n" %\
-                    (page_owner["order"], page_owner["gfp_mask"],\
-                    page_owner["pid"], page_owner["tgid"], page_owner["comm"],\
-                    page_owner["ts_nsec"], page_owner["free_ts_nsec"]))
-            gdb.write("PFN: %d, Flags: 0x%x\n" % (pfn, page['flags']))
-            if page_owner["handle"] == 0:
-                gdb.write('page_owner allocation stack trace missing\n')
-            else:
-                stackdepot.stack_depot_print(page_owner["handle"])
+        page_owner = self.get_page_owner(page_ext)
+        gdb.write("Page last allocated via order %d, gfp_mask: 0x%x, pid: %d, tgid: %d (%s), ts %u ns, free_ts %u ns\n" %\
+                (page_owner["order"], page_owner["gfp_mask"],\
+                page_owner["pid"], page_owner["tgid"], page_owner["comm"].string(),\
+                page_owner["ts_nsec"], page_owner["free_ts_nsec"]))
+        gdb.write("PFN: %d, Flags: 0x%x\n" % (pfn, page['flags']))
+        if page_owner["handle"] == 0:
+            gdb.write('page_owner allocation stack trace missing\n')
+        else:
+            stackdepot.stack_depot_print(page_owner["handle"])
 
-            if page_owner["free_handle"] == 0:
-                gdb.write('page_owner free stack trace missing\n')
-            else:
-                gdb.write('page last free stack trace:\n')
-                stackdepot.stack_depot_print(page_owner["free_handle"])
-            if page_owner['last_migrate_reason'] != -1:
-                gdb.write('page has been migrated, last migrate reason: %s\n' % self.migrate_reason_names[page_owner['last_migrate_reason']])
-        except:
-            gdb.write("\n")
+        if page_owner["free_handle"] == 0:
+            gdb.write('page_owner free stack trace missing\n')
+        else:
+            gdb.write('page last free stack trace:\n')
+            stackdepot.stack_depot_print(page_owner["free_handle"])
+        if page_owner['last_migrate_reason'] != -1:
+            gdb.write('page has been migrated, last migrate reason: %s\n' % self.migrate_reason_names[page_owner['last_migrate_reason']])
 
     def read_page_owner(self):
         pfn = self.min_pfn
@@ -173,18 +170,13 @@ class DumpPageOwner(gdb.Command):
                 pfn += 1
                 continue
 
-            try:
-                page_owner = self.get_page_owner(page_ext)
-                gdb.write("Page allocated via order %d, gfp_mask: 0x%x, pid: %d, tgid: %d (%s), ts %u ns, free_ts %u ns\n" %\
-                        (page_owner["order"], page_owner["gfp_mask"],\
-                        page_owner["pid"], page_owner["tgid"], page_owner["comm"],\
-                        page_owner["ts_nsec"], page_owner["free_ts_nsec"]))
-                gdb.write("PFN: %d, Flags: 0x%x\n" % (pfn, page['flags']))
-                stackdepot.stack_depot_print(page_owner["handle"])
-                pfn += (1 << page_owner["order"])
-                continue
-            except:
-                gdb.write("\n")
-            pfn += 1
+            page_owner = self.get_page_owner(page_ext)
+            gdb.write("Page allocated via order %d, gfp_mask: 0x%x, pid: %d, tgid: %d (%s), ts %u ns, free_ts %u ns\n" %\
+                    (page_owner["order"], page_owner["gfp_mask"],\
+                    page_owner["pid"], page_owner["tgid"], page_owner["comm"].string(),\
+                    page_owner["ts_nsec"], page_owner["free_ts_nsec"]))
+            gdb.write("PFN: %d, Flags: 0x%x\n" % (pfn, page['flags']))
+            stackdepot.stack_depot_print(page_owner["handle"])
+            pfn += (1 << page_owner["order"])
 
 DumpPageOwner()
diff --git a/scripts/gdb/linux/slab.py b/scripts/gdb/linux/slab.py
index f012ba38c7d9..0e2d93867fe2 100644
--- a/scripts/gdb/linux/slab.py
+++ b/scripts/gdb/linux/slab.py
@@ -228,8 +228,7 @@ def slabtrace(alloc, cache_name):
             nr_cpu = gdb.parse_and_eval('__num_online_cpus')['counter']
             if nr_cpu > 1:
                 gdb.write(" cpus=")
-                for i in loc['cpus']:
-                    gdb.write("%d," % i)
+                gdb.write(','.join(str(cpu) for cpu in loc['cpus']))
         gdb.write("\n")
         if constants.LX_CONFIG_STACKDEPOT:
             if loc['handle']:
-- 
2.18.0


