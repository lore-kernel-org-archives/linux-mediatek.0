Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6AFC43464
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 02:02:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB1AC221EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 02:02:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1gU17Lg9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KH9k5XVO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB1AC221EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zg41DOiFFrZGikwirjSUHhechoOXmiRpRvz4emefZWw=; b=1gU17Lg9DSvg1MWF4NGKgLp9Q
	2XcO3Kklk+VqkeVpksLCrzFMH/X2ZAotSEEsm+TLu34VGkoscyXJ1CJgvY8KCv04eINXrcZpoS+pk
	0Bz9bJUIqJFy6jUaYR2i9uztbhiQdFhbTBmAekTuD5nuQX2mGEvYZ8mUw2wvQJ4oraf6faeizipuO
	N3m9/ydSQvDOxu5Fh5ABwKdaJoIf64bwXQTqLaUKFNm3QvXs6GHPKW5yWT6jqjheKShBqe4Y30y3L
	0BO5EbEIsc44fG7gEM7rrbnf8htUYRO5l7GT6b4I5RSJqp54kVxtyRSoR8c2JATwyO9+XMohtNDel
	EZD1vJS2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ5jJ-000275-Rb; Fri, 18 Sep 2020 02:02:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ5jB-00023X-4p; Fri, 18 Sep 2020 02:02:22 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 866A3235FD;
 Fri, 18 Sep 2020 02:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394540;
 bh=JABLUdjNq2imK1wjeCunrhCzek4I+Lgbd0ewlVoivLU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KH9k5XVOfAQpnXr8hpao/KyqO8RSUO8JZhFP8zojlpHBinJS7/5xaK8BrFOBYKjXl
 rP4WkIPtKrtl+vMnZRPDVvq77/VqeOO/nltI1fh8UUK2D3jImolZDjIYbz38ypXBN4
 HouTW19P9zfVGwrG2y85v7bH/eWRd68p147z1KVI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 058/330] mt76: do not use devm API for led classdev
Date: Thu, 17 Sep 2020 21:56:38 -0400
Message-Id: <20200918020110.2063155-58-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_220221_285566_23FC8B08 
X-CRM114-Status: GOOD (  14.13  )
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
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 36f7e2b2bb1de86f0072cd49ca93d82b9e8fd894 ]

With the devm API, the unregister happens after the device cleanup is done,
after which the struct mt76_dev which contains the led_cdev has already been
freed. This leads to a use-after-free bug that can crash the system.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 1a2c143b34d01..7be5806a1c398 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -105,7 +105,15 @@ static int mt76_led_init(struct mt76_dev *dev)
 		dev->led_al = of_property_read_bool(np, "led-active-low");
 	}
 
-	return devm_led_classdev_register(dev->dev, &dev->led_cdev);
+	return led_classdev_register(dev->dev, &dev->led_cdev);
+}
+
+static void mt76_led_cleanup(struct mt76_dev *dev)
+{
+	if (!dev->led_cdev.brightness_set && !dev->led_cdev.blink_set)
+		return;
+
+	led_classdev_unregister(&dev->led_cdev);
 }
 
 static void mt76_init_stream_cap(struct mt76_dev *dev,
@@ -360,6 +368,7 @@ void mt76_unregister_device(struct mt76_dev *dev)
 {
 	struct ieee80211_hw *hw = dev->hw;
 
+	mt76_led_cleanup(dev);
 	mt76_tx_status_check(dev, NULL, true);
 	ieee80211_unregister_hw(hw);
 }
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
