Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2B7C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 08:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUWs0peHeFh8I8V0mHaov2V5/9takFBfLQgSzUIxJn0=; b=oO8rsfMqz3F4X33307qpgbj3YS
	VAWLjC1EzjSFstdBIbmOWCJDMB4Wv8T5oMOexIqXxQ7ZSym04vsmRDbNsUyWPwlswcQ3uJx5gcrSl
	wITjpOQ/b8Nz3vNQzpjRW6HXTZJ/tqFC0k7Ii7cZTw48src1dM0r3Ldj2+J4lnn1xZ6X/2RFBVsQB
	aNisICKAsRLcR05yR+ek0SL6YXt6PjF01OoFuQi1IlIoONdlxIYkHUzSEyARdU6X0xI4AWmtB9+zQ
	0DQ3i0XbAujvJDgJVf2/TMWg8XTR5o2hfq/uv/Zk4CD6WiErS49HShusqSmVOvW1/QKvL1ph+mslL
	ECO0mZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Iqi-00EkMf-MA; Wed, 30 Nov 2022 08:53:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Iqf-00EkKI-V5; Wed, 30 Nov 2022 08:53:47 +0000
X-UUID: 64b755c79e204cec93815e84da08d6d0-20221130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MUWs0peHeFh8I8V0mHaov2V5/9takFBfLQgSzUIxJn0=;
	b=JUgDJersQILyGgks6V+jTGR4BNCqTeBDlr7wVwFoPiNTcaXa2F77UVDQvw9HsEZw22R5+kW20stFeJNQ0iRMYesii4tlQmIgIQFxd0Ej9sBj4Dk0MCkWkPm+edPiwalDKJUlZC7jnBi7zrurHNEqt+swkl37eNjnw7YwzDHCJ2I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:000308e4-f949-4607-90c3-f61983389893,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:22503f30-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 64b755c79e204cec93815e84da08d6d0-20221130
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <andrew.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1583882258; Wed, 30 Nov 2022 01:53:42 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 30 Nov 2022 16:23:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 30 Nov 2022 16:23:06 +0800
From: Andrew Yang <andrew.yang@mediatek.com>
To: <rostedt@goodmis.org>
CC: <andrew.yang@mediatek.com>, <casper.li@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
	<mhiramat@kernel.org>
Subject: [PATCH v2] mm/writeback: fix dereferencing NULL mapping->host
Date: Wed, 30 Nov 2022 16:23:02 +0800
Message-ID: <20221130082303.30859-1-andrew.yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221129095620.4c1a8056@gandalf.local.home>
References: <20221129095620.4c1a8056@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_005346_023708_577081D9 
X-CRM114-Status: GOOD (  11.62  )
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

Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: andrew.yang <andrew.yang@mediatek.com>
---
v2: add parenthesis
---
 include/trace/events/writeback.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/trace/events/writeback.h b/include/trace/events/writeback.h
index 86b2a82da546..54e353c9f919 100644
--- a/include/trace/events/writeback.h
+++ b/include/trace/events/writeback.h
@@ -68,7 +68,7 @@ DECLARE_EVENT_CLASS(writeback_folio_template,
 		strscpy_pad(__entry->name,
 			    bdi_dev_name(mapping ? inode_to_bdi(mapping->host) :
 					 NULL), 32);
-		__entry->ino = mapping ? mapping->host->i_ino : 0;
+		__entry->ino = (mapping && mapping->host) ? mapping->host->i_ino : 0;
 		__entry->index = folio->index;
 	),
 
-- 
2.18.0


