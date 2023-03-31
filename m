Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67461C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woMdJmPGwqbmkNZP2IiNYeJBaZIPhitmDLlx3uTqBlE=; b=CqU8qFs4PD+nHKIoO1U514r0Ez
	iEBnMF3cPgzOCUKD7qH/G6rK6vgk8H6Byi9QBNOGoj11+4PtOKfzIiaYZCLWRpbNt3P5iiD+lCZpG
	tDn7wVztuv0tP/55zN8UU6Ugqpqye+Q45BW+uxkKT3KzwCuVT9JqKxLoftihO8tiBsT2O+OChsmuw
	erbHBinFO+H15FQJ7W5Pqkkjdh7sW8hwy81Hr3soqmuxnChR64eLqDPf2hmbZ+qsVN+nirrWWcTlE
	yQxMN69mNXXMGBc5L7NBLtmS17ESsPjfeCKk7cpJjl+1fMxc+X0ie/9PCXge4EoiJmMfluRH84CPO
	/5nG0bDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBMm-006lkY-0X;
	Fri, 31 Mar 2023 09:48:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBMa-006lbN-2A;
	Fri, 31 Mar 2023 09:48:13 +0000
X-UUID: 1a7e9532cfa911ed8687db9d93187ff1-20230331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=woMdJmPGwqbmkNZP2IiNYeJBaZIPhitmDLlx3uTqBlE=;
	b=aJ1B8PIFPT6L2CEJH+H2McTj79ic49HEN9zKuRjrEWEW2TulJC/MhTfzn+hSoARpY7l9/odJbik1jr68/Fc9DACsaUnp+FEHbNP0CmHXqOdF6a2hVyTxdm+WlbagcJCaSejPY5CSlRCmqSH3SgNlzeI0eA1WL3tieFYq8dsvZLE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:24e5b26f-a720-4594-9e2c-06a3c0a7ea46,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:aa6f162a-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 1a7e9532cfa911ed8687db9d93187ff1-20230331
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <bo.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1745346304; Fri, 31 Mar 2023 02:47:51 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 31 Mar 2023 17:27:13 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 31 Mar 2023 17:27:12 +0800
From: Bo Ye <bo.ye@mediatek.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, xiongping1
	<xiongping1@xiaomi.com>, qixiaoyu1 <qixiaoyu1@xiaomi.com>
CC: <yongdong.zhang@mediatek.com>, <peng.zhou@mediatek.com>,
	<browse.zhang@mediatek.com>, <light.hsieh@mediatek.com>, Qilin Tan
	<qilin.tan@mediatek.com>, Bo Ye <bo.ye@mediatek.com>,
	<linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 2/2] f2fs: add __pack attribute for extent_info
Date: Fri, 31 Mar 2023 17:26:57 +0800
Message-ID: <20230331092658.72386-2-bo.ye@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20230331092658.72386-1-bo.ye@mediatek.com>
References: <20230331092658.72386-1-bo.ye@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_024804_813560_31ABDD22 
X-CRM114-Status: GOOD (  18.33  )
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

From: Qilin Tan <qilin.tan@mediatek.com>

Need add __pack for struct extent_info to align to memory
layout of struct rb_entry.

struct rb_entry {
    struct rb_node rb_node;     /* rb node located in rb-tree */
    union {
        struct {
            unsigned int ofs;   /* start offset of the entry */
            unsigned int len;   /* length of the entry */
        };
        unsigned long long key;     /* 64-bits key */
    } __packed;
};

struct extent_info {
    unsigned int fofs;      /* start offset in a file */
    unsigned int len;       /* length of the extent */
    union {
        ...
        /* block age extent_cache */
        struct {
            /* block age of the extent */
            unsigned long long age;
            /* last total blocks allocated */
            unsigned long long last_blocks;
        };
};

The new fields(age, last_blocks) are u64 in change 71644dff4811, it
cause the memory alignment based on 8 bytes in some complier. So the
field fofs and len are alloced with 8 bytes and using the last 4 byts.
Its memory is not aligned with struct rb_entry. the ofs of rb_entry
pointer to a invalid value and cause writing file failed.

struct extent_info's offset should be 12 rather than 16 from the
beginning of struct rb_entry.

The offset dump for the bad case as:
kworker/u16:6: [name:f2fs&]f2fs_lookup_rb_tree_for_insert:MTK_DEBUG: ino=1629 re=0xc675dc08 ofs=0 re->ofs=0, re->len=68 ei=0xc675dc18 ei.fofs=68 ei.len=277

Fixes: 71644dff4811 ("f2fs: add block_age-based extent cache")
Signed-off-by: Bo Ye <bo.ye@mediatek.com>
Signed-off-by: Qilin Tan <qilin.tan@mediatek.com>
---
 fs/f2fs/f2fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b0ab2062038a..7c690667a42f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -660,7 +660,7 @@ struct extent_info {
 			unsigned long long last_blocks;
 		};
 	};
-};
+} __packed;
 
 struct extent_node {
 	struct rb_node rb_node;		/* rb node located in rb-tree */
-- 
2.17.0


