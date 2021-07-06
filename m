Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05EC8C11F6E
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:24:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7C5761C58
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7C5761C58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnlFZeatJFQxKkUFNlzD03xhUdLOSj1Hhwm3ibD/mDc=; b=fT6DKUVoJMn2rb
	wdmSL/WJTaIQUiTXX6NZZU/5k0qKnI1TXNOdst/WnRzBuI+aRBwAShM4xkWlesGGUWVHEnhabZuHE
	y84LzJoeVlED4Mjr//LIEpD2RqkHuUc6Lb4wzvBvA6VvPV/nvtVhW9DPZvweqzPE86+/NbSvKvDY3
	apNDi4+7T70lumVOl7w3SPafX4vzP8Us2Dqf02dD02mp2YC9tY2g1W+wArRpKvsXc73Q+8gRM/IY5
	n9Bg6R1xrZ4wOWoRw0/X6Xs1//zVuAM9sMccLGc7XhRc7qJciT4FJrZUVep2XfHlO6LS6TJJYSlTd
	di5WTfBjP0uxKKk7r/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0jBd-00BJ1A-QG; Tue, 06 Jul 2021 11:24:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0j4d-00BEN3-Cg; Tue, 06 Jul 2021 11:17:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2389261CC8;
 Tue,  6 Jul 2021 11:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570227;
 bh=dnqI7cLIPgkr4vrDpYP0+IEltAy8NgRLsokYw1F1ts4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y9XqmIgJ3eHYVfNKtFQfM0Qwr70K9V1OMSJFsk8tuaWzB09P8AZPVlSGqC/zTny8d
 crIqA8ddNMqa9MJaNuaK9qphVDM3nw3W9XsuIBENO0kXX86lUB23dp1V1DRZp/1fb8
 wcFX0Km2olyvIfuYoFuK6dJWbfDfJULRBpJEhlxP/3gAm3S/s1PWwrrD8Ezg1QVAlN
 apSpkVMdzs0ABoMp5snQdPcXPgwQwlycQyw8V3y60Scp6qygAW5CRcK94LxYRzcZvL
 svceHNUHslhb959C5mYt99lkLTv7fe9fuIspSRsGZxqeZO1O4Bc7ek5DrsWWsTdQeu
 anAJ59diyljMw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.13 132/189] mt76: mt7921: reset wfsys during hw probe
Date: Tue,  6 Jul 2021 07:13:12 -0400
Message-Id: <20210706111409.2058071-132-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_041707_487653_14D7B479 
X-CRM114-Status: UNSURE (   9.00  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit 01f7da40917923bf9d8fd8d5c9a6ed646004e47c ]

This patch fixes a mcu hang during device probe on
Marvell ESPRESSObin after a hot reboot.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/dma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
index 71e664ee7652..a70f0bd875f8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
@@ -402,6 +402,10 @@ int mt7921_dma_init(struct mt7921_dev *dev)
 	if (ret)
 		return ret;
 
+	ret = mt7921_wfsys_reset(dev);
+	if (ret)
+		return ret;
+
 	/* init tx queue */
 	ret = mt7921_init_tx_queues(&dev->phy, MT7921_TXQ_BAND0,
 				    MT7921_TX_RING_SIZE);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
