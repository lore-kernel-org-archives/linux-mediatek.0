Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9A1C10F1E
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Dec 2022 16:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alUxZCacrkZCujGCH80jS5Ddw3oLzxgpHWbDtTd2Kmo=; b=Av3u/L8kXtr69NAEUD5pGZAchr
	bLtIRLfiICA4efMawhGaaBmwGUAWGFJyKjblaS3Jo7Vp8FBaqq2C51bGrPn/p2pj0wcm6/1WMSC0Z
	lVn7s3nDkwxata87rE2JgFWAyRbhMWXQ9QegCnS4ulRmwZQboRolUPtzKgpfIITm3Rx6/1AaLFfyP
	74xduumAct3roeSVtSm57gasexmwP9P1iVIUS30TXEJT2RJke6+VqaxVANCT3AkYDKL0HliuJOpD0
	YSLj0wsxXGraHzMlj7bktt9vjUO+orNQSGuaRvzSYr6vpURNPhvvOREPgbgX+nvi6kugJtUU7VFdE
	IOgCMvGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6wHb-002spP-8A; Sun, 18 Dec 2022 16:12:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6wFG-002rZl-Sj; Sun, 18 Dec 2022 16:10:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65D5F60DCB;
	Sun, 18 Dec 2022 16:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A1CC433D2;
	Sun, 18 Dec 2022 16:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671379833;
	bh=q7lfFyFR6E+o1kguI+ZUe/xB/1GBz8RnOY6mSvtFvtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IMDyY/wT2Z66DWs97d8esUtFQWwT77tXYbjWgPq9ocAGHyHyZwOQ0Xc22midM7ZFX
	 jqX8/d9LyCAlZ8DF1Cwb3Hog82mknkbV8t4D4gZ6hyRh+NEP4fIXdSMi3wnJgV+osy
	 HtMaRf7Eg1IXF5hl4LsWq9YdXo2T3C/iJcWJyYLgeMQYOQxBe8NYD3dKtQBzOrBYHo
	 kDjApLu+I1IAvCt7GdxNRBB80UcHYPDSPJd1tguFqvYlp0mg9zpYUN9BOcpstQ+SrI
	 KvZ9ESmvRu9RXmZXBdZ59iT6WkWabO71vC9YC9TK1yEFc1IEaCGIynkskiIIM3uHlE
	 JxLgFDp6v8qQA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.0 45/73] net: ethernet: mtk_eth_soc: drop packets to WDMA if the ring is full
Date: Sun, 18 Dec 2022 11:07:13 -0500
Message-Id: <20221218160741.927862-45-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218160741.927862-1-sashal@kernel.org>
References: <20221218160741.927862-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221218_081035_601671_F4C92103 
X-CRM114-Status: GOOD (  12.11  )
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

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit f4b2fa2c25e1ade78f766aa82e733a0b5198d484 ]

Improves handling of DMA ring overflow.
Clarify other WDMA drop related comment.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Link: https://lore.kernel.org/r/20221116080734.44013-3-nbd@nbd.name
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 5 ++++-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 5380caf0acc2..27e178599ffd 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3311,9 +3311,12 @@ static int mtk_hw_init(struct mtk_eth *eth)
 	mtk_w32(eth, 0x21021000, MTK_FE_INT_GRP);
 
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2)) {
-		/* PSE should not drop port8 and port9 packets */
+		/* PSE should not drop port8 and port9 packets from WDMA Tx */
 		mtk_w32(eth, 0x00000300, PSE_DROP_CFG);
 
+		/* PSE should drop packets to port 8/9 on WDMA Rx ring full */
+		mtk_w32(eth, 0x00000300, PSE_PPE0_DROP);
+
 		/* PSE Free Queue Flow Control  */
 		mtk_w32(eth, 0x01fa01f4, PSE_FQFC_CFG2);
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 0f9668a4079d..1c2a5fece126 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -121,6 +121,7 @@
 #define PSE_FQFC_CFG1		0x100
 #define PSE_FQFC_CFG2		0x104
 #define PSE_DROP_CFG		0x108
+#define PSE_PPE0_DROP		0x110
 
 /* PSE Input Queue Reservation Register*/
 #define PSE_IQ_REV(x)		(0x140 + (((x) - 1) << 2))
-- 
2.35.1


