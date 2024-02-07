Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80D6C4828D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 09:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M+kTxpzDu2kDUAi4jAk/bznBJUbRFLEVKzbdXxscehs=; b=t1LH0UZRUqLuViISIgxSA0wZT8
	yqbXYvl69yLuRndn35laFPiLd0veZJq4S9MULqO0VEZVspq0XjtXdVUqDhu5ZopQ09H3aRaXwlvpo
	5aqx1befMquB0KVPubCUx83Qk+s60NGuTj8Gp+UG6WF5W9KgHqfRslPYzG7kqLfHJ1KqBrmCMhU/2
	cnHXFcMyteYXkVNLPOK+O8Hv1Lt69S0qylp6bWsadiWQRrW1mLRvOQ1LaGPSMFhlgL2rpr7hMGI1J
	zYMqcywZ/EM9Mvd1cNyCkRUd55je+LDkZUWyrdTqerm3sVxLSTEHXfVEXnu8oblyk9IbJbcplfJWG
	+FmVSiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXdw9-0000000A8Lt-1bRV;
	Wed, 07 Feb 2024 09:09:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXdw6-0000000A8KS-4BeW;
	Wed, 07 Feb 2024 09:09:44 +0000
X-UUID: 9e5cc9cec59811eea0bf134e88e6c2dc-20240207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=M+kTxpzDu2kDUAi4jAk/bznBJUbRFLEVKzbdXxscehs=;
	b=lilmk+5/mLqqqHRjzMEs5kXL/gY7vxjYUbQ8CqLB8dplwmOZhNvdSdOgJLmqALKEGvgEMEuh2ahqQxf8SWisDPcGQORI8Iq1wZ99n3EaHcWVD3RWOH3jixKUS7qfoKMxicReaVZSXaJ1JxNrEn3EUGsHYG4lagQxF0NpJGjjOIU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:254ce7a8-6f72-4d5d-bbc3-d0afb3424c35,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:5bd8b783-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 9e5cc9cec59811eea0bf134e88e6c2dc-20240207
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 788954509; Wed, 07 Feb 2024 02:09:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Feb 2024 16:58:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Feb 2024 16:58:58 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <casper.li@mediatek.com>, <chinwen.chang@mediatek.com>,
	<qun-wei.lin@mediatek.com>, <linux-mm@kvack.org>,
	<akpm@linux-foundation.org>, <urezki@gmail.com>, Kuan-Ying Lee
	<Kuan-Ying.Lee@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] scripts/gdb/vmalloc: fix vmallocinfo error
Date: Wed, 7 Feb 2024 16:58:51 +0800
Message-ID: <20240207085856.11190-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.540600-8.000000
X-TMASE-MatchedRID: BrNJR/3XBtYgNXYDo2rRhjTR2TFg0xG3MVx/3ZYby7+QxjD98JXG4+h5
	+ziVqzh1jwQarLbSitQRs1kezRVUMnAd/ISL1gqdj1RGQOB2VvlMkOX0UoduuU4K0IMk2m3G9pj
	ehf9ti8tk9BhA+RcEjMcIK6S4JS2iHN0r1kHymECjrlYm3WTU730tCKdnhB589yM15V5aWpj6C0
	ePs7A07ba607moR85RnkXbdvwlTfPByDSHDuWGW2ASvsZfW+OWOo0k1o6+bTZ4Q/FXPcvQ5Xo3o
	hZ25BJZsdQa7QcOV1BxvuJG1fpOeqHee+3ZfiRJSZrfNhP3sgUBh9AgBSEFrJm+YJspVvj2xkvr
	HlT8euI+kK598Yf3Mg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.540600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6999A9595D8F99E6A1C2B5598210605692699934082BAD3D5FB294C0F38FC4AA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_010943_052169_2FD3C0B4 
X-CRM114-Status: GOOD (  10.29  )
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

We met the gdb vmallocinfo issue as following.

(gdb) lx-vmallocinfo
Python Exception <class 'gdb.error'>: No symbol "vmap_area_list" in current context.
Error occurred in Python: No symbol "vmap_area_list" in current context.

Since Mitigate a vmap lock contention patchset [1], we
remove the vmap_area_list.

We need to use vmap_nodes to iterate all vmallocinfo.

[1] https://lore.kernel.org/linux-mm/20240102184633.748113-1-urezki@gmail.com/

Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Casper Li <casper.li@mediatek.com>
---
 scripts/gdb/linux/vmalloc.py | 56 +++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/scripts/gdb/linux/vmalloc.py b/scripts/gdb/linux/vmalloc.py
index d3c8a0274d1e..803f17371052 100644
--- a/scripts/gdb/linux/vmalloc.py
+++ b/scripts/gdb/linux/vmalloc.py
@@ -29,32 +29,34 @@ class LxVmallocInfo(gdb.Command):
         if not constants.LX_CONFIG_MMU:
             raise gdb.GdbError("Requires MMU support")
 
-        vmap_area_list = gdb.parse_and_eval('vmap_area_list')
-        for vmap_area in lists.list_for_each_entry(vmap_area_list, vmap_area_ptr_type, "list"):
-            if not vmap_area['vm']:
-                gdb.write("0x%x-0x%x %10d vm_map_ram\n" % (vmap_area['va_start'], vmap_area['va_end'],
-                    vmap_area['va_end'] - vmap_area['va_start']))
-                continue
-            v = vmap_area['vm']
-            gdb.write("0x%x-0x%x %10d" % (v['addr'], v['addr'] + v['size'], v['size']))
-            if v['caller']:
-                gdb.write(" %s" % str(v['caller']).split(' ')[-1])
-            if v['nr_pages']:
-                gdb.write(" pages=%d" % v['nr_pages'])
-            if v['phys_addr']:
-                gdb.write(" phys=0x%x" % v['phys_addr'])
-            if v['flags'] & constants.LX_VM_IOREMAP:
-                gdb.write(" ioremap")
-            if v['flags'] & constants.LX_VM_ALLOC:
-                gdb.write(" vmalloc")
-            if v['flags'] & constants.LX_VM_MAP:
-                gdb.write(" vmap")
-            if v['flags'] & constants.LX_VM_USERMAP:
-                gdb.write(" user")
-            if v['flags'] & constants.LX_VM_DMA_COHERENT:
-                gdb.write(" dma-coherent")
-            if is_vmalloc_addr(v['pages']):
-                gdb.write(" vpages")
-            gdb.write("\n")
+        nr_vmap_nodes = gdb.parse_and_eval('nr_vmap_nodes')
+        for i in range(0, nr_vmap_nodes):
+            vn = gdb.parse_and_eval('&vmap_nodes[%d]' % i)
+            for vmap_area in lists.list_for_each_entry(vn['busy']['head'], vmap_area_ptr_type, "list"):
+                if not vmap_area['vm']:
+                    gdb.write("0x%x-0x%x %10d vm_map_ram\n" % (vmap_area['va_start'], vmap_area['va_end'],
+                        vmap_area['va_end'] - vmap_area['va_start']))
+                    continue
+                v = vmap_area['vm']
+                gdb.write("0x%x-0x%x %10d" % (v['addr'], v['addr'] + v['size'], v['size']))
+                if v['caller']:
+                    gdb.write(" %s" % str(v['caller']).split(' ')[-1])
+                if v['nr_pages']:
+                    gdb.write(" pages=%d" % v['nr_pages'])
+                if v['phys_addr']:
+                    gdb.write(" phys=0x%x" % v['phys_addr'])
+                if v['flags'] & constants.LX_VM_IOREMAP:
+                    gdb.write(" ioremap")
+                if v['flags'] & constants.LX_VM_ALLOC:
+                    gdb.write(" vmalloc")
+                if v['flags'] & constants.LX_VM_MAP:
+                    gdb.write(" vmap")
+                if v['flags'] & constants.LX_VM_USERMAP:
+                    gdb.write(" user")
+                if v['flags'] & constants.LX_VM_DMA_COHERENT:
+                    gdb.write(" dma-coherent")
+                if is_vmalloc_addr(v['pages']):
+                    gdb.write(" vpages")
+                gdb.write("\n")
 
 LxVmallocInfo()
-- 
2.18.0


