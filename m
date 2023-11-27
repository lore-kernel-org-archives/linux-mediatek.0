Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA86C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 07:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtK55VLY1NxyNBcORvef+jn+nTQMaITRftKAsWDHxMA=; b=tmG/ppq+nJM8i1b5ih7rg0TRgc
	ulZe113A/cQZ+Iz5vwgE9ycYQS0IvIIj7YcGUF/Zq7680doU5RRNrndB4zSWp0a5QJJ+pwRrAfnwB
	rT3ay7b0Jwg4CsCwtBURnP3VheYgU01VRSbfwk/wbIdFnrcsWRI3xMV0YftKsbEpDAkSCi0VAZi+u
	IKQjQ7FQ3WgtHNEYQDz6XzNSF59zuG0CtajvQcCC4A2Q2g1krBy8kai2AJh92J3nbesPvOeF1htZL
	vvtA1BXxf6PMlYMAjNwl0hO3eV/CIgsEa8jsnsDpEscRQzUrDuP7RzCleqHheVz4U1Cez6cdbIs9S
	enR3N/Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7VhQ-001eeW-32;
	Mon, 27 Nov 2023 07:06:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7VhN-001edc-2Z;
	Mon, 27 Nov 2023 07:06:31 +0000
X-UUID: 77dedd248cf311ee86758d4a7c00f3a0-20231127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HtK55VLY1NxyNBcORvef+jn+nTQMaITRftKAsWDHxMA=;
	b=OsroDviT3f+sXfQHzUzqntbZJSJIpZl3hkXyIl25Oavh1IfrItIqQ8ceP+yzuYgVZ0ooWiRWo+NenwnKH1xQPFiQeb0w2uAn8jJErGh1Oij42ucg5lK+0XyFl2ceQ9PPWvBbZyKA2VLE/VJBbxD5oJPrFOX4GfJt5TJFJ5QiALQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:3b8f619f-494e-4a1a-9d82-cc44a82ecad5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:d655d995-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 77dedd248cf311ee86758d4a7c00f3a0-20231127
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1936018134; Mon, 27 Nov 2023 00:06:21 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 27 Nov 2023 15:05:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 27 Nov 2023 15:05:18 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <casper.li@mediatek.com>, <chinwen.chang@mediatek.com>,
	<qun-wei.lin@mediatek.com>, <linux-mm@kvack.org>,
	<akpm@linux-foundation.org>, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
	Andrey Konovalov <andreyknvl@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 2/3] scripts/gdb/stackdepot: Rename pool_index_cached to pools_num
Date: Mon, 27 Nov 2023 15:04:02 +0800
Message-ID: <20231127070404.4192-3-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231127070404.4192-1-Kuan-Ying.Lee@mediatek.com>
References: <20231127070404.4192-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.010000-8.000000
X-TMASE-MatchedRID: v+sphrBU45Fo3s9tP0IpFpA6S0SjvcYU+KgiyLtJrSBh2fnHe1cil/vO
	+ii1kEU9/pKwAK6MbUrbCHv011Gy9Z8H7IRkmk143fn7n/ZHGqZ9LQinZ4QefPcjNeVeWlqY+gt
	Hj7OwNO22utO5qEfOUVc0Kd0RiPLSKIZsPfXtYDI2ZAMv1y9yYuiku9X3rg3DYrC60dTQ6lwgkV
	TLdeBsisRw65kGgQa5HA8v7nBpXwZAmtKtYco7Lkma3zYT97IFAYfQIAUhBayZvmCbKVb49sZL6
	x5U/HriPpCuffGH9zI=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.010000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3B0E1DE16128D260FD1688E220366A70E47761E071E403750C9EB17B147451602000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_230629_857777_9DCB5E35 
X-CRM114-Status: UNSURE (   8.96  )
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

After stackdepot evicting support patchset[1], we rename
pool_index_cached to pools_num.

[1] https://lore.kernel.org/linux-mm/cover.1700502145.git.andreyknvl@google.com/
Cc: Andrey Konovalov <andreyknvl@google.com>
Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
 scripts/gdb/linux/stackdepot.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/gdb/linux/stackdepot.py b/scripts/gdb/linux/stackdepot.py
index 047d329a6a12..0281d9de4b7c 100644
--- a/scripts/gdb/linux/stackdepot.py
+++ b/scripts/gdb/linux/stackdepot.py
@@ -25,10 +25,10 @@ def stack_depot_fetch(handle):
     handle_parts_t = gdb.lookup_type("union handle_parts")
     parts = handle.cast(handle_parts_t)
     offset = parts['offset'] << DEPOT_STACK_ALIGN
-    pool_index_cached = gdb.parse_and_eval('pool_index')
+    pools_num = gdb.parse_and_eval('pools_num')
 
-    if parts['pool_index'] > pool_index_cached:
-        gdb.write("pool index %d out of bounds (%d) for stack id 0x%08x\n" % (parts['pool_index'], pool_index_cached, handle))
+    if parts['pool_index'] > pools_num:
+        gdb.write("pool index %d out of bounds (%d) for stack id 0x%08x\n" % (parts['pool_index'], pools_num, handle))
         return gdb.Value(0), 0
 
     stack_pools = gdb.parse_and_eval('stack_pools')
-- 
2.18.0


