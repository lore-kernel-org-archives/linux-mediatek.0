Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D86C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:26:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC93320B1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:26:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fpw2Redu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjENw/Te"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC93320B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xPAXGb5oPAwD4zq9g/ZYuGRGoTF7fRTHv0HzWuYfx8w=; b=Fpw2Redu+7ENM5iWdu81Ax0Dv
	A3IAP6iJ6eh+qCkho5i2Br6OxawCmMnNqrbuj4MQ+YvY6JKFDd4uiTl+6psBZHfGWYHb4XXFuW7Zc
	CPRfyxOwuIWzR2yM+7Pg48eSEWoFCoojmSECm0h/YY8sN+Km5o+pwVXdxQXYVuIuhFm8bJ5bFiqub
	capFe0ofQ/7b7UOicjmQ2ej1g0a03oB1eaacAfBV8UOfME1nkK7ofMsw8fH4jBLnHIJrHzjxBbn9L
	dUuOJPjyGJohFstb997S/OidHnGvvrU7hid13cxA+MTZYamvSk1Tw7uzj3bxAM7e6C8DFemItyeBT
	vKAGqZhww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jovrI-0002Cx-Bb; Fri, 26 Jun 2020 21:26:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jovr8-00024z-Mp
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 21:25:56 +0000
Received: from localhost.localdomain.com (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C358B20B1F;
 Fri, 26 Jun 2020 21:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593206754;
 bh=cNm4vevn52MHqQhVmtkazDdt9Txp0Mki2vNXGAapXMk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SjENw/Te39bMyb1oB0Ze08+Jvd2GghjzIv2bwr8GIlLEkswEMCUSbTbXn1Qs5ODsj
 eAFaIvbx6KhaFIqaCcTfC4735b72L4EjYahmW82DDD2IXkOPwJKLePxeRV1YG+QLzv
 0dTIehGDO97HzHbrT9xF7fD+Nq9loCTlb+t+A36M=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 12/17] mt76: mt7615: check MT76_STATE_PM flag before accessing
 the device
Date: Fri, 26 Jun 2020 23:25:12 +0200
Message-Id: <1aeb01ddefdd112ffbabca0f488ca3cd0c4ccd3e.1593204577.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593204577.git.lorenzo@kernel.org>
References: <cover.1593204577.git.lorenzo@kernel.org>
MIME-Version: 1.0
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

Double-check if the device is in low-power state before accessing
registermap in mt7615_sta_rate_tbl_update() and in
mt7615_led_set_config()

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c     | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 32f060014bb7..3ab8e7e9be44 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -652,7 +652,8 @@ static void mt7615_sta_rate_tbl_update(struct ieee80211_hw *hw,
 			break;
 	}
 	msta->n_rates = i;
-	mt7615_mac_set_rates(phy, msta, NULL, msta->rates);
+	if (!test_bit(MT76_STATE_PM, &phy->mt76->state))
+		mt7615_mac_set_rates(phy, msta, NULL, msta->rates);
 	msta->rate_probe = false;
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
