Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296B3C43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:38:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E565A61993
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E565A61993
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cpM8OVPLvLhX768nfKsmAZQK47Oul4TMu4DYO4+VYoY=; b=AYmXmrhXP9Uc+WjahcHHoPQSQ
	VWvfJGZsF99NIz50kdhWsEkJJzRhunXySqPgKCnFHmyPZOfV6N8fIDiZqvNzaTCt95hYGe02vkfQc
	PdmWHG9b9scCsu5BaZa17WGEfzCyYM84QWHHmOasvQr3YGP+2V8yoPecZ6iCU64mj4zeL6eYuzSFW
	GQD3+WlxNTaJq5xr2EiYbFELKuN3UQHgZ2k4tLh2MBgL3sbQt3wMEkrb6zD45/L1K+spXUeluMW+e
	1s9BseoBsG6swvAbmdPFuwVUoKYiwss0HA5RiBnIVcSwYLVI/uSQMbl7oAaTXLOZzgpRlWW8INu6f
	BiPD6UkiA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKXn-001h11-Pa; Wed, 05 May 2021 16:38:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKT5-001eo3-GP; Wed, 05 May 2021 16:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=V5RXpg0w1ToDQZdR/KmdQfAO3+SLFSGvzjllH4a6x9A=; b=EkbhxarqkNyLQV+6yzdDMT6duO
 oX9J3jeyxw8tzz/kw3C6/WT2fJ+BaePXj3fKBDG+2viI5Me2XA/Lim8KhgirBriMkueebVMSA6dO4
 P2u1vChHH1M22odXgiSebRIgWfQILB/WWHuEAqAkh4RICLqv549na25yeFj8/75Y5MnbTOVwHuyWn
 yqAxztadmBHrE1ZXR8QWrGHNPc8FeN13WcxfM/a6wnTIY9EGW89waiM1R+AUybsFF+ZwVrKWXM2zS
 lK4fXwXirxF41oUnqes97zocuE+ny1vrI6rgekTpkCKvLoUMeGVUiejk5WVsp7dkglcvdMJsfXp9d
 0bnl4vjg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKT2-004wcr-7Q; Wed, 05 May 2021 16:33:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E196061412;
 Wed,  5 May 2021 16:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232423;
 bh=WxiO4EXeA5EqQoSx5olH+tfFxfI2Xf4bWODHUl7UKeY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HHcs2TG1XPUtV17b9vYGSigKgsjRSwdQ9OdmwzOrB1HcMkM5c3KrR9lRo7BDuErGV
 gOP0bGl7nkL07KfOLJxAKILIiM9SonDMHPquwVZnIX7muJtzoZ7g9lrVWw994OOk/I
 nMyxKfgRBFSyACZrIKzgPkoNJurILC3GDgC7Rb9JS+CxfKZTv0CjqOQzWVOgwxF4T6
 A6HCYZ16gsVUK8+h+8VRAovOb8CytRgvVmZVWV2Pb1qQq5DDQ+gp1i74Q8vUR2wSRu
 MnEOk0+cdqf+ngdSt4VPzmw6V9Qv+288eTUmj8LUgjVaxczXouDvvmfqdgqfh4xNJr
 mHavanr7uNeiA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Sasha Levin <sashal@kernel.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 098/116] mt76: mt7615: fix entering driver-own
 state on mt7663
Date: Wed,  5 May 2021 12:31:06 -0400
Message-Id: <20210505163125.3460440-98-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163125.3460440-1-sashal@kernel.org>
References: <20210505163125.3460440-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093344_309145_06EDB87A 
X-CRM114-Status: UNSURE (   9.76  )
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

[ Upstream commit 5c7d374444afdeb9dd534a37c4f6c13af032da0c ]

Fixes hardware wakeup issues

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 4ecbd5406e2a..198e9025b681 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -291,12 +291,20 @@ static int mt7615_mcu_drv_pmctrl(struct mt7615_dev *dev)
 	u32 addr;
 	int err;
 
-	addr = is_mt7663(mdev) ? MT_PCIE_DOORBELL_PUSH : MT_CFG_LPCR_HOST;
+	if (is_mt7663(mdev)) {
+		/* Clear firmware own via N9 eint */
+		mt76_wr(dev, MT_PCIE_DOORBELL_PUSH, MT_CFG_LPCR_HOST_DRV_OWN);
+		mt76_poll(dev, MT_CONN_ON_MISC, MT_CFG_LPCR_HOST_FW_OWN, 0, 3000);
+
+		addr = MT_CONN_HIF_ON_LPCTL;
+	} else {
+		addr = MT_CFG_LPCR_HOST;
+	}
+
 	mt76_wr(dev, addr, MT_CFG_LPCR_HOST_DRV_OWN);
 
 	mt7622_trigger_hif_int(dev, true);
 
-	addr = is_mt7663(mdev) ? MT_CONN_HIF_ON_LPCTL : MT_CFG_LPCR_HOST;
 	err = !mt76_poll_msec(dev, addr, MT_CFG_LPCR_HOST_FW_OWN, 0, 3000);
 
 	mt7622_trigger_hif_int(dev, false);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
