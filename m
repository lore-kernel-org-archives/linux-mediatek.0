Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960A2C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 03:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=chkAIHmegmyVzd+tdd1i+sV1+2hUP1r7GSczTaWti94=; b=r46hoqINujYAm/RnbefNd0Sb3r
	UYvpUz7RBmW7Y1NMPIv00fGZ6Cnm80G/4XkakPjT8NvCcDV4MBPFRnmv6IURu9zgYroEj3xhIXI6Y
	1EZdk7fPBHAKXP3AAaiY29EwbdxZs9OWxLwgx3Jnyk6FtxYCKIPeVbMhr7igTzT0GXRH5hqXohof5
	5ATElA5kmKLTVxLzSLUqAVYf4Bl3PaKixTJaVRh+TydakYCCIP7QuiaESjgn9GLOqMhwqkAFODYYJ
	iCmWDzVPGvXXrxV9JI6LcGTTbxDf6a5iWRvfD9DR5PeDFAwwrACTZqFsYF+6GjRLlcUmWHnHeymlu
	nt6RH3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozrNl-005kg3-6Y; Tue, 29 Nov 2022 03:34:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozrNh-005kca-Nd; Tue, 29 Nov 2022 03:34:03 +0000
X-UUID: f8a7d1c3e6a9426da8efd7ad5bbdea2d-20221128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=chkAIHmegmyVzd+tdd1i+sV1+2hUP1r7GSczTaWti94=;
	b=MeoLvWj/DvkZ5dSHmvgXPEXGzl9yC8wFh3RpG2UjSLw8jjNZIHuaTB3XxQ/rkADADAuMlv5f9hkAY0I9YG6D9AkWHs19RsT6PxTElJI04DCqpotsqI89YoKWrihlauP0AcTXJ4Sp6cL/bzMjosrnNcYJFAfCrj3P/3vNz65SEuw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:da4324ff-91b3-4bcf-a058-c63246f21c46,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.14,REQID:da4324ff-91b3-4bcf-a058-c63246f21c46,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:dcaaed0,CLOUDID:ac531730-2938-482e-aafd-98d66723b8a9,B
	ulkID:221129113323BOCVU8WU,BulkQuantity:1,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: f8a7d1c3e6a9426da8efd7ad5bbdea2d-20221128
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <andrew.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1289506605; Mon, 28 Nov 2022 20:33:54 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 29 Nov 2022 11:33:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 29 Nov 2022 11:33:21 +0800
From: Andrew Yang <andrew.yang@mediatek.com>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
	<mhiramat@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Casper Li <casper.li@mediatek.com>, andrew.yang
	<andrew.yang@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] mm/writeback: fix dereferencing NULL mapping->host
Date: Tue, 29 Nov 2022 11:32:59 +0800
Message-ID: <20221129033304.4465-1-andrew.yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_193401_839486_C732802C 
X-CRM114-Status: GOOD (  10.25  )
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

From: "andrew.yang" <andrew.yang@mediatek.com>

Check before dereferencing mapping->host

Signed-off-by: andrew.yang <andrew.yang@mediatek.com>
---
 include/trace/events/writeback.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/trace/events/writeback.h b/include/trace/events/writeback.h
index 86b2a82da546..56f6e114d3ed 100644
--- a/include/trace/events/writeback.h
+++ b/include/trace/events/writeback.h
@@ -68,7 +68,7 @@ DECLARE_EVENT_CLASS(writeback_folio_template,
 		strscpy_pad(__entry->name,
 			    bdi_dev_name(mapping ? inode_to_bdi(mapping->host) :
 					 NULL), 32);
-		__entry->ino = mapping ? mapping->host->i_ino : 0;
+		__entry->ino = mapping && mapping->host ? mapping->host->i_ino : 0;
 		__entry->index = folio->index;
 	),
 
-- 
2.18.0


