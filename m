Return-Path: <SRS0=kQBs=A2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE3AC433EB
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 12:47:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1D0920658
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 12:47:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0DdUcU09";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VI56JxnZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1D0920658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zySFnVyCaOLKwybKcPvj8DQ3/QA4PQ/OjSut4aM1vkc=; b=0DdUcU09/TgNoHGZM4GcESmg6
	uUStM5iVlRskhKWz8ohdtbNb1yFsZFUBQFxJ3Up/y7f0XoSsa6YLKftUw7Y1WSe5d+wRy5jcueaAt
	gzYX5xIUgh6Upb2Aw8oNkafZL0OuSn7Iwz4iC9L/6NLBQ46V8irLCEUmsvie6K1REW0FVpCDbS/72
	JUBdC1fcGYaU5yfAgQ1aerIaVzv8N8lL6h9aNNr/Wvbx6iXuPmFov+sxqqYtvFfD5AyNAGfccWTil
	z2QnzdRhoR+hGKwMxJcOUwGWavUekpx+9Jl/ZAr/+kKFgC1jpKaOCbwJ9A7vPipCAz7wQx+vK1hyf
	IMRAohvpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvgoI-0003WD-EL; Wed, 15 Jul 2020 12:46:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvgoG-0003Uz-Dl
 for linux-mediatek@lists.infradead.org; Wed, 15 Jul 2020 12:46:53 +0000
Received: from localhost.localdomain.com (unknown [151.48.133.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 61D7D20578;
 Wed, 15 Jul 2020 12:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594817211;
 bh=LUQQhBBASoPZElhUy4axpOH/WkASNyRO6lpmJu3TVp4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VI56JxnZNOiGDaX489hQtK8c2CJh2yuxy2RPc9v3+GENBvjOAu8v3cCNEYBAlODSE
 HWz2LB8RL7Vz4pzm44ZVgnxNVqJCNVePZU9xSMyVs7g8Ns7rY7Ux6J4Oz0ylZ5ytrQ
 HwUFnfsQD1D5SkRorCRkefKFkc1h019E3K0X66lc=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 3/6] mt76: mt7615: sdio code must access rate/key regs in
 preocess context
Date: Wed, 15 Jul 2020 14:46:28 +0200
Message-Id: <1d237c95444232a13e90f315048480242699424c.1594815602.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1594815602.git.lorenzo@kernel.org>
References: <cover.1594815602.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_084652_592877_F30DADAF 
X-CRM114-Status: GOOD (  10.47  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As usb, sdio relies on mt76 workqueue to configure tx rate or upload
keys to the hw. This is a preliminary patch to add SDIO support to
mt76 driver

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c  | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index afac8d81d317..3dd8dd28690e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -967,7 +967,7 @@ void mt7615_mac_set_rates(struct mt7615_phy *phy, struct mt7615_sta *sta,
 	struct mt7615_rate_desc rd;
 	u32 w5, w27, addr;
 
-	if (mt76_is_usb(&dev->mt76)) {
+	if (!mt76_is_mmio(&dev->mt76)) {
 		mt7615_mac_queue_rate_update(phy, sta, probe_rate, rates);
 		return;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 79453c890f20..2d0b1f49fdbc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -417,10 +417,10 @@ static int mt7615_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	mt76_wcid_key_setup(&dev->mt76, wcid,
 			    cmd == SET_KEY ? key : NULL);
 
-	if (mt76_is_usb(&dev->mt76))
-		err = mt7615_queue_key_update(dev, cmd, msta, key);
-	else
+	if (mt76_is_mmio(&dev->mt76))
 		err = mt7615_mac_wtbl_set_key(dev, wcid, key, cmd);
+	else
+		err = mt7615_queue_key_update(dev, cmd, msta, key);
 
 	mt7615_mutex_release(dev);
 
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
