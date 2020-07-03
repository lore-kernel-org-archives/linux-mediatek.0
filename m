Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A265CC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7387D207FF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="drJEE9tR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDw/Xa2S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7387D207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DU80U2TahDWgOU+n4+WwS5VLiGX1AWr800LEMgIh5ps=; b=drJEE9tRQD7qIfx7UNiMUQRYO
	Pge+wJxYNPiJm83nfkzrUvuECrotV1JT6FercnV5zTq9Xwzdj0aI/8q41+vVcVLNx51cI2P7QiQ7D
	vkjR5quf2SEJNY2YUftr1EjfBpARkIuAT8KXKhb9UvK16o76YJAH9q9C8Ue5Z/XLDPAg9n7YlbyzM
	vPjxsCJDviRtT9H/sLDFQEu42kjmNLwiLXQ6Ec4E9bez4yFnlU0DPY9my/W4d3gUQWQT6/bnJ7/ZX
	ufr9k73CJP1uq6+CDxWE2VPt8eAhz4LdC8OAYfQZe29y9sjtBKVOnT6Mz/m8ScYqn7wi57nbizir3
	A/o0bNdJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGsa-0006Pt-02; Fri, 03 Jul 2020 08:17:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGsO-0006CW-6i
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:16:53 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04A0B207DA;
 Fri,  3 Jul 2020 08:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764211;
 bh=vKTW3aj0dzI+HHz6az1EZ5O+wlYOTV+EJcjLep85Cr0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZDw/Xa2S2UKTnczXdFwwOirU/cekZe0KoxPMUlg8NUtoRcxqa59MJBE42+R0xu0P4
 /vZl/RUsTNjNanSatf4qmEEwzvF3sXC69AUdCxe0wyVOF2JURkis+ZjFXlsiZ9kPS0
 OrmmYonjgb61H6Gem2thnt7u1UDkCT0jm5mZflGM=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 17/22] mt76: mt7615: check MT76_STATE_PM flag before
 accessing the device
Date: Fri,  3 Jul 2020 10:15:56 +0200
Message-Id: <1379c3ecf027e745eeb5dde9c51782ec1f83e2d1.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593763584.git.lorenzo@kernel.org>
References: <cover.1593763584.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041652_355013_ACDEBCAB 
X-CRM114-Status: GOOD (  10.35  )
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
 ryder.lee@mediatek.com, linux-wireless@vger.kernel.org, sean.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Double-check if the device is in low-power state before accessing
registermap in mt7615_sta_rate_tbl_update() and in
mt7615_led_set_config()

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c     | 6 ++++--
 drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c | 4 ++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index de4230b2d7bb..0ce76472df2c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -664,8 +664,10 @@ static void mt7615_sta_rate_tbl_update(struct ieee80211_hw *hw,
 			break;
 	}
 	msta->n_rates = i;
-	mt7615_mac_set_rates(phy, msta, NULL, msta->rates);
-	msta->rate_probe = false;
+	if (!test_bit(MT76_STATE_PM, &phy->mt76->state)) {
+		mt7615_mac_set_rates(phy, msta, NULL, msta->rates);
+		msta->rate_probe = false;
+	}
 	spin_unlock_bh(&dev->mt76.lock);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
index 69cba8609edf..7224a0078211 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
@@ -70,6 +70,10 @@ mt7615_led_set_config(struct led_classdev *led_cdev,
 
 	mt76 = container_of(led_cdev, struct mt76_dev, led_cdev);
 	dev = container_of(mt76, struct mt7615_dev, mt76);
+
+	if (test_bit(MT76_STATE_PM, &mt76->phy.state))
+		return;
+
 	val = FIELD_PREP(MT_LED_STATUS_DURATION, 0xffff) |
 	      FIELD_PREP(MT_LED_STATUS_OFF, delay_off) |
 	      FIELD_PREP(MT_LED_STATUS_ON, delay_on);
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
