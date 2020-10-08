Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F2FC43467
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 11:40:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B329206E7
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 11:40:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BbhzEr7j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="P6budXWz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B329206E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=42hSYnhypMBzpENu+7kXRisMM9dDplnEFrQUsyPk2wc=; b=BbhzEr7jwLycLSozrh/qgwOYC
	hWPC6mdRPTUvxCPy1m4b+oMCHaoduSYKhvJeLeJcTnpKfQEDTO0buE8dlBhRDWtDhQwWpDvvxxtPr
	VgpoRoFOEgM7ZtleRgXVbaNWgHt4Yvl62OdG+B7Vn/1bfhmU7k6NeV8xiTSGnkJtVazBO5yTAvSV+
	+irCzQ9Rni6sArg2CUptI7GeR6e24n31HlsFOteHm4f1WiOp3glsw05b9Tr7FhWT/iD/0qeFzqRGO
	7XxFYSLAbj4UxqYpWjRH3pclODMQCP7ljmkMYk7yFGdclTLkZ8LgJii9hnYN04/yQaubsmS/hjFwk
	2FDH6XHtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQUHn-0004Tv-Uy; Thu, 08 Oct 2020 11:40:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQUHj-0004TE-JU
 for linux-mediatek@lists.infradead.org; Thu, 08 Oct 2020 11:40:37 +0000
X-UUID: 71260d4ab1ca47fc8dadcae9a5722507-20201008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lB2yOL1yHNpt3oHBOa9YeTNVGOoIXY9o4YvJcmDEOSo=; 
 b=P6budXWzEAsOi5mwsgK2I21NtBKVTLXZnDo9TC+bLrTnL3oTvpZzkzarlJgKarD4sIaTj4DUYKBs8UqOq7JdIhI082G3eTjJ0pC6AEozxmy4OiKt3xcY49dXZqQ+V7Ctd/6py21CvLW2A3iNgAV+oINYqHgARk2th7BN0gvC0EU=;
X-UUID: 71260d4ab1ca47fc8dadcae9a5722507-20201008
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1017763020; Thu, 08 Oct 2020 03:40:32 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 04:33:22 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 19:33:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 8 Oct 2020 19:33:13 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 05/10] mt76: mt7915: fix tx rate related fields in tx
 descriptor
Date: Thu, 8 Oct 2020 19:28:59 +0800
Message-ID: <20201008112904.10620-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201008112904.10620-1-shayne.chen@mediatek.com>
References: <20201008112904.10620-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_074035_906902_7EF5D934 
X-CRM114-Status: GOOD (  10.23  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Correct the bitfields of tx rateval and bw in tx descriptor.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
index 456bb81..0921b6f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
@@ -231,7 +231,7 @@ enum tx_mcu_port_q_idx {
 #define MT_TXD6_ANT_ID			GENMASK(7, 4)
 #define MT_TXD6_DYN_BW			BIT(3)
 #define MT_TXD6_FIXED_BW		BIT(2)
-#define MT_TXD6_BW			GENMASK(2, 0)
+#define MT_TXD6_BW			GENMASK(1, 0)
 
 #define MT_TXD7_TXD_LEN			GENMASK(31, 30)
 #define MT_TXD7_UDP_TCP_SUM		BIT(29)
@@ -248,7 +248,9 @@ enum tx_mcu_port_q_idx {
 #define MT_TX_RATE_STBC			BIT(13)
 #define MT_TX_RATE_NSS			GENMASK(12, 10)
 #define MT_TX_RATE_MODE			GENMASK(9, 6)
-#define MT_TX_RATE_IDX			GENMASK(5, 0)
+#define MT_TX_RATE_SU_EXT_TONE		BIT(5)
+#define MT_TX_RATE_DCM			BIT(4)
+#define MT_TX_RATE_IDX			GENMASK(3, 0)
 
 #define MT_TXP_MAX_BUF_NUM		6
 
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
