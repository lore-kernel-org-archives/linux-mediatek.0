Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BE0C07E97
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 06:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+R9PEoL0ecclUC6WsOy0WMmNQrV/Y6UQqst6Epr4yM=; b=JvYEQKz6LBL3EKnYdy4KHTc+ID
	dIqML7jtbgVZu3WelYUXyGdOy7NTDSb1CpLrS5LrhwbiP+/C6M1lXxm6WoauqLs3+HeO8RVo8n+qO
	SX/sd9bh+qMf5jRLJu6vmou8wE8NUvG3EgRBzj0iQ4L8/Q94MDIJzz/Q/oyOhecrhGUH5Vg8JQl1e
	aSX+O6shH4If3f5Hb2vhbnZhhlMqSXtwAybFu8+woxsthIog7ebur/ty8V7iZAyXZyEY60x3Cu6sH
	L3jlvVYoonTxn5h/RIUwfv+EtM9ZNXsfUi46trYwb/DbIBq+D3AdacyZDg9VdigXg4G81gaVSTf5t
	vgQbu/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8EQw-007H3l-0w;
	Wed, 29 Nov 2023 06:52:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8EQt-007H2H-09;
	Wed, 29 Nov 2023 06:52:28 +0000
X-UUID: d7e1f30a8e8311ee86758d4a7c00f3a0-20231128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=n+R9PEoL0ecclUC6WsOy0WMmNQrV/Y6UQqst6Epr4yM=;
	b=V0o9TPNJcFSFmjfQ2E72V0bm5mC/33n9Mw1MKA06neCxe/rM9T/05c1qVE0NH8RH5Tk0cIWM1j1CxM1E1zIdIRz21Exp7YkQ2kREofcQSZ/nUF2Fi8sgAWkDLnzkhgMfmJjZI65y0l7gXisSX5Za/99TSsyDZECcE7nKQsw/TpM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:5a5b7f6a-8bf7-44e1-b63b-13fa0b4293d5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:abefa75,CLOUDID:79669b60-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d7e1f30a8e8311ee86758d4a7c00f3a0-20231128
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1440792775; Tue, 28 Nov 2023 23:52:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 29 Nov 2023 14:51:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 29 Nov 2023 14:51:46 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <casper.li@mediatek.com>, <chinwen.chang@mediatek.com>,
	<qun-wei.lin@mediatek.com>, <linux-mm@kvack.org>,
	<akpm@linux-foundation.org>, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
	Andrey Konovalov <andreyknvl@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 2/3] scripts/gdb/stackdepot: Rename pool_index to pools_num
Date: Wed, 29 Nov 2023 14:51:39 +0800
Message-ID: <20231129065142.13375-3-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231129065142.13375-1-Kuan-Ying.Lee@mediatek.com>
References: <20231129065142.13375-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.835400-8.000000
X-TMASE-MatchedRID: +ngMWxkROpBo3s9tP0IpFpA6S0SjvcYU2D9FbDg9BP4gOnjvjQ5gMV6Z
	DDGofYWNjwQarLbSitQRs1kezRVUMnAd/ISL1gqdA9lly13c/gFKKWJchzA/cTrJEXlYPBg2o8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqt8qdBHO1HlsES+YTonSEiTt0PqFWU/tup5zAcFqh011MOMd
	/q/g+8AskTTa0GhEGXTIXOwb8AX0MtexYu1hdC+zRYUfCeJoD9wZBgUyJVEbl6Fw8/PpTMRaVvm
	iAyeA2kc5MSfkiJFI5p3LlElBHTlw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.835400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7739E709B4D66CEF45A0A4020D64F3EA433CEF59176414BBAB9CD3D85FE3845F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_225227_090202_E6B6F1C0 
X-CRM114-Status: GOOD (  10.83  )
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
pool_index to pools_num.

To avoid from the below issue, we rename consistently in
gdb scripts.

Python Exception <class 'gdb.error'>: No symbol "pool_index" in current
context.
Error occurred in Python: No symbol "pool_index" in current context.

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


