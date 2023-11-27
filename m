Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2B8C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 07:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfM/LFHjkcBsRth/jK9IUe/5rqKeTocfopTS7wMKfnY=; b=x60mQsjmbrHlX9tlG6+a89Ty2m
	UDIB6qPSXTovBUlqUD3n7EkA12HjtN5rUNKv7DDkNS8AyLmfIsk7MswownhTkZ7RYKZxJqDRBkcl6
	BMeuTDxEOTC8qUUy1EfiI8scukBmdzCWhOi/RLSM8FfM6fwkv476sqwS/SJDM1kKwzJBtYKsHuTTT
	906rg9v4waE6f0AFMJcnQdzWWemO1UHXggfmnsCDaR1bIBn88+DtOuz8cKL4EnrB17g/BpdNB+py+
	w3cECz+9aYzHUX+MoEAIwJlFbzpUmO6Y5rcAMBxevH0O7COaT4sGPDgH+0qU6lesUCMPr1OEjRgqx
	OuvzDrCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7VhV-001efg-17;
	Mon, 27 Nov 2023 07:06:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7VhN-001edd-2Z;
	Mon, 27 Nov 2023 07:06:32 +0000
X-UUID: 786c5c768cf311ee86758d4a7c00f3a0-20231127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FfM/LFHjkcBsRth/jK9IUe/5rqKeTocfopTS7wMKfnY=;
	b=ng3Bo+YQnERGOnT7ztC4R8StCtj6WolnTE4LvIKZ7dQT1JRUJWO2rFGHgENgExbBCUxQjeahPu+IECoaC/rWwRT5tf/rFt8mTxlerbQsluTRymZdmQRtIAiqb7+02OPzctgqTUc5B3PIcv9hVCxU+mZs7nUXIQ0S+1/xQ6f9llI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:5033c5c9-5aab-445a-b1f8-051a7e271e15,IP:0,U
	RL:0,TC:0,Content:42,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:42
X-CID-META: VersionHash:364b77b,CLOUDID:44c41b73-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 786c5c768cf311ee86758d4a7c00f3a0-20231127
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2028640867; Mon, 27 Nov 2023 00:06:22 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 27 Nov 2023 15:05:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 27 Nov 2023 15:05:19 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <casper.li@mediatek.com>, <chinwen.chang@mediatek.com>,
	<qun-wei.lin@mediatek.com>, <linux-mm@kvack.org>,
	<akpm@linux-foundation.org>, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 3/3] scripts/gdb: Remove exception handling and refine print format
Date: Mon, 27 Nov 2023 15:04:03 +0800
Message-ID: <20231127070404.4192-4-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231127070404.4192-1-Kuan-Ying.Lee@mediatek.com>
References: <20231127070404.4192-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.929400-8.000000
X-TMASE-MatchedRID: Av/pE9tNfKGWHmpvkeKJB0hwlOfYeSqx3xlpFMX5MCCQ2TbICkFOdk69
	FgKoS/097PSkEF73uYd7VWtw6SMI5Kawq2pdPD7UA9lly13c/gGb/LTS0T1K1k4K0IMk2m3GwVB
	JSJ8GjJw3fJWouRpjSXrw5BSR88yeSoBVPxvX5SSQOktEo73GFOTWKSbLQnNI0w5IABkoK4ejxY
	yRBa/qJcFwgTvxipFa9xS3mVzWUuAojN1lLei7RYYOtKqE9TMltcW9OiWFpt72ZzE2SrN70Z+eC
	VfOOV58l0THHo7ATW+guLN8VZYRFDky1wRoSxJfiCCOl1JcKQZai0D30EU35nmVKZusLp922v9O
	jYWA2uMMswg45VMfPXY3pGDmoik6
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.929400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 847D7A48C3336C1D5104C7B296990B2AD0769F6D258E074659F3A149850583532000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_230629_842558_6A7D31BD 
X-CRM114-Status: GOOD (  11.88  )
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
try-except block. Thus, removing the try-except block.

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


