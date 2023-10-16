Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57BECDB483
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 09:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8euwVlW0+neDLtR6WJGOGDQsPFxhlH1MmObbQBtDaA=; b=igYC69GhpDkU5SQiRKKapx+B2Y
	1bRESvQM/4VpSfg5I7/0qlAPiXaiX+/o0wkh7785vQDPCwiLH741B1I6sYoSQpkSb4TrJJghnP2lF
	pfeBuaktzRCe2xNx0oftDubmQ//dO3BrLIslbspOJ45WNrEv9sF6iYBzNTWfvP139qrEZjOv2RD6R
	j4/wEdxAuMZ+pGAhsCtcOdipGqSBav61BoSLfc0KCMGrv8MzdoGxp/eYWJQfIdzBjILC8cv7d2a+4
	YJKcHvSYnp8Z3aUH+k+YyBErjnZCS59QFvuIrTRysDQECUdnpLzl1jIdVGGtfYU0WK5gL84LADqfc
	tp1DuiHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJc2-008wJP-2Y;
	Mon, 16 Oct 2023 09:10:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJc0-008wIT-0C
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Oct 2023 09:10:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8905760DC0;
	Mon, 16 Oct 2023 09:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1BDAC433C7;
	Mon, 16 Oct 2023 09:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697447407;
	bh=kov4yMSQdmfTBSDB3yLwqivPB51jrQoms4p5iBEYCZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TQ1cDDXfCw/yeXO+omTf3GfjyILT7sSVWp7vziQTJ7t0epJ3DtVz9t/2wQN8SMVhP
	 QhwsTJfoBhcZyGPW3jRd9sRfyhEoYQr1P2j9Pi5J0Dun5tYBey4dGFfNKESklmnlC4
	 EKehZPnqyZq/FCcY0MltBXq5JSy2DsMn8/WzCz1trnwRSji0KddrixpnzLKm5veVgi
	 JtFXDltprMRL6oIgqhLm34rC0h8pssJHlXXiGod/k0ikl6Fvk5bY/xkOeJEUIdwSpo
	 IF3+EIkJJzwn3qVtCTZ9dSZDzhsRvoXvP1LowOUe6U34eROrbsqUaReKSo9/NACWp3
	 KUlqHlRgFdNQg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: lorenzo.bianconi@redhat.com,
	linux-wireless@vger.kernel.org,
	ryder.lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	shayne.chen@mediatek.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 06/12] wifi: mt76: increase MT_QFLAG_WED_TYPE size
Date: Mon, 16 Oct 2023 11:03:39 +0200
Message-ID: <8dca673261ac27abfd7f471663abfb45c442803e.1697445996.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1697445995.git.lorenzo@kernel.org>
References: <cover.1697445995.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_021008_138177_28AF740F 
X-CRM114-Status: UNSURE (   9.01  )
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

This is a preliminary patch to introduce WED support for mt7996

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 8fa0440f1686..fa33ecfbf72d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -29,8 +29,8 @@
 #define MT76_TOKEN_FREE_THR	64
 
 #define MT_QFLAG_WED_RING	GENMASK(1, 0)
-#define MT_QFLAG_WED_TYPE	GENMASK(3, 2)
-#define MT_QFLAG_WED		BIT(4)
+#define MT_QFLAG_WED_TYPE	GENMASK(4, 2)
+#define MT_QFLAG_WED		BIT(5)
 
 #define __MT_WED_Q(_type, _n)	(MT_QFLAG_WED | \
 				 FIELD_PREP(MT_QFLAG_WED_TYPE, _type) | \
-- 
2.41.0


