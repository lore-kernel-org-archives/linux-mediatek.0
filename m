Return-Path: <SRS0=Mjju=62=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4358DC2D0FA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 20:03:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1701420731
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 20:03:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d2gRvtpl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQQF9BGV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1701420731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MG7HfyZNus0Oq6jL4McfU8+fbjizTcYy0XkOfgSRYMA=; b=d2gRvtplHPoMoD
	cXBK5KGD4LgxFy5CJ/o2fh+lK2futxDVRr40iZKPpCERNeYhmyvkwmWoLHhUO9PRH1vnZzJF16ZJB
	olffx75bs0gUqdwxxU7jxOsUkeTl9NEP/Mh4O0H49Ta7xpJ/8PYvvzfig3PPz3PzzqJ4ehWeM6i4E
	GpYWPfs9I/g+vVZ92s6M8X+4MlhA6L/SzSl1xuzw3Zl8+sUWdsMB3xurTEgAurf0p6wnjsKMR4G9E
	VTPYfbrm85awpiYNKu78UB7z1cmM073trNQYMEQ1V/jHV+LzHtjZeNIF6bJgy9d2NJaZ7/mINK6u5
	5PF1sDaP7oVaoqrMdEqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYb7J-0002C7-PT; Tue, 12 May 2020 20:03:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYb7G-00028q-Er
 for linux-mediatek@lists.infradead.org; Tue, 12 May 2020 20:03:03 +0000
Received: from localhost.localdomain.com (unknown [151.48.155.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA522206D6;
 Tue, 12 May 2020 20:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589313782;
 bh=MTUCgk4rciCF//7GPnewL+9mWSnuMUcygZkcZVrYiaY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SQQF9BGVhVWeeh9XhG7JrHi/dK/Ipqhycgmc/XKAMuSjIHF+8+EgUPWYuZUYme8WP
 6yPZdQR+SVhn2gGaDzr61xCP3CIAzw+31FZTPr+7PggNiEGoNJFeiCunS1dUOtKFje
 f8EfUaQvpwLirNgCM8Rk/643Acw4onN2JdokbLTI=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 2/4] mt76: mt7615: reduce hw scan timeout
Date: Tue, 12 May 2020 22:02:48 +0200
Message-Id: <c661734466cb9e14f15a37e5f8cc6d54e18cad3b.1589313659.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1589313659.git.lorenzo@kernel.org>
References: <cover.1589313659.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_130302_549743_EDDD4571 
X-CRM114-Status: UNSURE (   8.39  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Differentiate hw scan channel time between passive and active scan

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 9cb8a9bb912b..e9ae7e94d8fd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -2773,7 +2773,7 @@ int mt7615_mcu_set_channel_domain(struct mt7615_phy *phy)
 				       MCU_CMD_SET_CHAN_DOMAIN, false);
 }
 
-#define MT7615_SCAN_CHANNEL_TIME	120
+#define MT7615_SCAN_CHANNEL_TIME	60
 int mt7615_mcu_hw_scan(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 		       struct ieee80211_scan_request *scan_req)
 {
@@ -2819,6 +2819,9 @@ int mt7615_mcu_hw_scan(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 	req->ssid_type = n_ssids ? BIT(2) : BIT(0);
 	req->ssids_num = n_ssids;
 
+	/* increase channel time for passive scan */
+	if (!sreq->n_ssids)
+		duration *= 2;
 	req->timeout_value = cpu_to_le16(sreq->n_channels * duration);
 	req->channel_min_dwell_time = cpu_to_le16(duration);
 	req->channel_dwell_time = cpu_to_le16(duration);
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
