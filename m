Return-Path: <SRS0=1xoO=IP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108BDC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 00:56:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A59A164FBC
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 00:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A59A164FBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W3bi4aKzfCb8ZfDmTpZvBsjUxu9BjFXP3hLnrsJyOlw=; b=E/LscHgl7FjKUXw/1t0J+AQNO
	nxXnExba8AVofRYe6H/9GXDBzL2BvVPUcf78pwQouVNw0bu/9hw4L2ZFRmYDiEAktyujjb/WLuOvC
	x+ya9LZJiKGwxzOtpo1L+ZMe3N/h7BL+g6WcXNrgV3Zb04P2VgbeD6BWcUSuF/q6Qm+bW2kvshMgI
	t60aHFH+NZi3QobEnvC//cmlskpp9tOKwFOAuPa9fgicY7lLq+v+VYn4JLwltxu/47m39M36ZBLrP
	9cKHhUIzhtY8cFscg4h4P/T8z+AjG+HjmiPs9dZgTRV9TMDeuRTn2VJhdxz/Pwb4fN1nRHtckWqLI
	5nJRUYr5Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMKTn-0026XW-9p; Wed, 17 Mar 2021 00:56:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMKTQ-0026UT-Md; Wed, 17 Mar 2021 00:55:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98EEC64F96;
 Wed, 17 Mar 2021 00:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615942539;
 bh=eA7/9pe2sz93Lf4T19BPa+kc4xC7T19g9c4E0cRbi8s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cuo+uFgP2+plQlzAeYBolHZjH5Gx3DWlEdCyWT+Y2zOPeb07hOzWSsvYMZ44Mw+fX
 LpoRWlS575KPCrA22pamHZAJQkdBKts3MOIyBB+Pha7/uWtmaaAZ3SgIrLJoVVkIk1
 nkphnKNbakg1aZK3PiO91MXX2Vw1HEclOIJX3GmoikbDGJqwyfpcQ9oSOPK5W0U7Ih
 6NeVEAJ2G5uy6zZRLhs5M3IRnRYDxtXtQUX+lTlaOpGzdqJaTat9vAwAXoUQtm01P8
 DVa18BMMUoArIMI6DsyDckvez9C1mBgWuJbOl5BHCO/L622t//oqPzvrEaj6pFykSC
 6uOqTUMurbS7g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Kalle Valo <kvalo@codeaurora.org>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.11 02/61] mt76: mt7915: only modify tx buffer list
 after allocating tx token id
Date: Tue, 16 Mar 2021 20:54:36 -0400
Message-Id: <20210317005536.724046-2-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210317005536.724046-1-sashal@kernel.org>
References: <20210317005536.724046-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_005544_996523_8AEBA2F3 
X-CRM114-Status: UNSURE (   8.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 94f0e6256c2ab6803c935634aa1f653174c94879 ]

Modifying the tx buffer list too early can leak DMA mappings

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/20210216135119.23809-2-nbd@nbd.name
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 1b4d65310b88..c9dd6867e125 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -957,11 +957,6 @@ int mt7915_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	}
 	txp->nbuf = nbuf;
 
-	/* pass partial skb header to fw */
-	tx_info->buf[1].len = MT_CT_PARSE_LEN;
-	tx_info->buf[1].skip_unmap = true;
-	tx_info->nbuf = MT_CT_DMA_BUF_NUM;
-
 	txp->flags = cpu_to_le16(MT_CT_INFO_APPLY_TXD | MT_CT_INFO_FROM_HOST);
 
 	if (!key)
@@ -999,6 +994,11 @@ int mt7915_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 		txp->rept_wds_wcid = cpu_to_le16(0x3ff);
 	tx_info->skb = DMA_DUMMY_DATA;
 
+	/* pass partial skb header to fw */
+	tx_info->buf[1].len = MT_CT_PARSE_LEN;
+	tx_info->buf[1].skip_unmap = true;
+	tx_info->nbuf = MT_CT_DMA_BUF_NUM;
+
 	return 0;
 }
 
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
