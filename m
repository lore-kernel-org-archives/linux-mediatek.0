Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6679C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 11:31:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 716D7229C5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 11:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 716D7229C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/ZCt4AgmAr2/6eByoxc7uWtJCkX1pe5P/Ik8bEdyMSY=; b=HioDn3riTb7oXRobcl+Gx4A3O
	J42wrloUNFYCEcBd3zFfJmAjayoHtgwF+9sBLXDE7yzr4+2IaNWVaxxtfE/qt5+/eUPjRLYlgbFiU
	GRmkRZDfGxUAtLbrRbUDSBxbiRv5sdHVVW8xQAe2CcG6wDN2PBCXhyBCMf3fMc7N/suJgyl4mceAc
	vOaRurxB3/ntphPpUrK86n3mw4RkE3pqvrZwLHsaI09tqbBGO89e4+HzPOYQtH2sE2IxpG9YB0a0A
	I/fghhBFfYcgYtdOjtyf5YtG+tGkFoa6fm1p4INfUPbnNiCb2Sq/HQGNa8m+uaf9KcPuL7f6D2Ie5
	/Tu0aDj/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwkYl-0006EB-5a; Tue, 05 Jan 2021 11:31:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwkYj-0006CT-26
 for linux-mediatek@lists.infradead.org; Tue, 05 Jan 2021 11:31:29 +0000
X-UUID: 1259a0d5461845938b5bcfbc63bfa69b-20210105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=c0bisdobE0CDjBCgbDQ7+r8rxnhELKOhNI7QT5CFFdE=; 
 b=UhOUZ59i6IwH3c8R2TJGSSMHIJgz3pxa8JldtPIDqQ1GCMO39bk43Dy1x7xtSOGl5iCU0PziTw61tm8iRaIYCv5otduUn5TW1kgpAgykHLqeu+hhJqpT13mTkDuS0mIql/ge8esfhI9v1olxhSRFsUZ2qzoYWna75JCsr42LVAI=;
X-UUID: 1259a0d5461845938b5bcfbc63bfa69b-20210105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 389518294; Tue, 05 Jan 2021 03:31:18 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 03:31:00 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 19:30:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 19:30:58 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 2/4] mt76: mt7915: rework set state part in testmode
Date: Tue, 5 Jan 2021 19:30:43 +0800
Message-ID: <20210105113045.17815-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210105113045.17815-1-shayne.chen@mediatek.com>
References: <20210105113045.17815-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_063129_286039_F7CCC519 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

This is a preliminary patch to simplify setting state in mt7915
testmode, for adding the new continuous tx state.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/testmode.c  | 22 +++++++++----------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index 6f6e02038c6d..e5af42c70e12 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -395,9 +395,8 @@ mt7915_tm_reg_backup_restore(struct mt7915_phy *phy)
 }
 
 static void
-mt7915_tm_init(struct mt7915_phy *phy)
+mt7915_tm_init(struct mt7915_phy *phy, bool en)
 {
-	bool en = !(phy->mt76->test.state == MT76_TM_STATE_OFF);
 	struct mt7915_dev *dev = phy->dev;
 
 	if (!test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
@@ -502,16 +501,15 @@ mt7915_tm_set_state(struct mt76_phy *mphy, enum mt76_testmode_state state)
 
 	mphy->test.state = state;
 
-	if (prev_state == MT76_TM_STATE_TX_FRAMES)
-		mt7915_tm_set_tx_frames(phy, false);
-	else if (state == MT76_TM_STATE_TX_FRAMES)
-		mt7915_tm_set_tx_frames(phy, true);
-	else if (prev_state == MT76_TM_STATE_RX_FRAMES)
-		mt7915_tm_set_rx_frames(phy, false);
-	else if (state == MT76_TM_STATE_RX_FRAMES)
-		mt7915_tm_set_rx_frames(phy, true);
-	else if (prev_state == MT76_TM_STATE_OFF || state == MT76_TM_STATE_OFF)
-		mt7915_tm_init(phy);
+	if (prev_state == MT76_TM_STATE_TX_FRAMES ||
+	    state == MT76_TM_STATE_TX_FRAMES)
+		mt7915_tm_set_tx_frames(phy, state == MT76_TM_STATE_TX_FRAMES);
+	else if (prev_state == MT76_TM_STATE_RX_FRAMES ||
+		 state == MT76_TM_STATE_RX_FRAMES)
+		mt7915_tm_set_rx_frames(phy, state == MT76_TM_STATE_RX_FRAMES);
+	else if (prev_state == MT76_TM_STATE_OFF ||
+		 state == MT76_TM_STATE_OFF)
+		mt7915_tm_init(phy, !(state == MT76_TM_STATE_OFF));
 
 	if ((state == MT76_TM_STATE_IDLE &&
 	     prev_state == MT76_TM_STATE_OFF) ||
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
