Return-Path: <SRS0=VWIa=CK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC573C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 17:30:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E32B20866
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 17:30:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jh8oVJcq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pLFRoNLz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E32B20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AslmeNpo+U9BwhT7Z2rQbusuiT1T0XXgqJx8rgTmy5A=; b=Jh8oVJcq6+s8AhD6tEZ8lRwkwv
	J3hjkvMqbRLGezb45a2RNhnQyrMzvfa//tqAZO/tvlTzmhRyqS1lipLWfeSVQUTVC16f+MYFOG2lR
	stIUsr6qA+ob208UhjH1pLPdzklAFbNbiFUWazzvWonAmerf3JP+yJxQYpP6QQDdglLzb8M2LVBKo
	sZeo0WxtqwswSNfE/2Bnrdm5E64SeoZBzpmFx8Yu/4MTBmp8B+4XuzoDteaqPIhMwB8wVphvzVQNo
	sOmM7gtuHguJj2LXpUqsK+t1bHbxSeEUVoeN1+yQKkhBezKhiQpfu9W12Ep/VtWjIdC1beJETs7x6
	5YOjWGcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDA6Z-0006wc-Kn; Tue, 01 Sep 2020 17:29:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDA6U-0006uT-9S; Tue, 01 Sep 2020 17:29:55 +0000
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 91EE920866;
 Tue,  1 Sep 2020 17:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598981393;
 bh=+s+pCurhvidYuSPa5gLrpalcWwRdWwzFktQe+NIAdVs=;
 h=Date:From:To:Cc:Subject:From;
 b=pLFRoNLzcPgdZE4K1Nv9wRlDf1cGZh5X+Ixcih4U6XT2LYU/mxHz6sPJBunBRLh6c
 H9RVhxy6iW5YGyllgPQj3i0+qaNUS0qvzqyX6Wpt9cBjOawsurfGKA9UtGtrBvnSIw
 CA18o22vkpuDCKAO1pIQI7T3HOgOovl2kYaQnJmE=
Date: Tue, 1 Sep 2020 12:36:03 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jakub Kicinski <kubakici@wp.pl>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH][next] mt7601u: Use fallthrough pseudo-keyword
Message-ID: <20200901173603.GA2701@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_132954_384416_B70DE032 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
fall-through markings when it is the case.

[1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/wireless/mediatek/mt7601u/dma.c | 4 ++--
 drivers/net/wireless/mediatek/mt7601u/mac.c | 4 ++--
 drivers/net/wireless/mediatek/mt7601u/phy.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/dma.c b/drivers/net/wireless/mediatek/mt7601u/dma.c
index f6a0454abe04..09f931d4598c 100644
--- a/drivers/net/wireless/mediatek/mt7601u/dma.c
+++ b/drivers/net/wireless/mediatek/mt7601u/dma.c
@@ -196,7 +196,7 @@ static void mt7601u_complete_rx(struct urb *urb)
 	default:
 		dev_err_ratelimited(dev->dev, "rx urb failed: %d\n",
 				    urb->status);
-		/* fall through */
+		fallthrough;
 	case 0:
 		break;
 	}
@@ -241,7 +241,7 @@ static void mt7601u_complete_tx(struct urb *urb)
 	default:
 		dev_err_ratelimited(dev->dev, "tx urb failed: %d\n",
 				    urb->status);
-		/* fall through */
+		fallthrough;
 	case 0:
 		break;
 	}
diff --git a/drivers/net/wireless/mediatek/mt7601u/mac.c b/drivers/net/wireless/mediatek/mt7601u/mac.c
index cad5e81fcf77..d2ee1aaa3c81 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mac.c
+++ b/drivers/net/wireless/mediatek/mt7601u/mac.c
@@ -45,7 +45,7 @@ mt76_mac_process_tx_rate(struct ieee80211_tx_rate *txrate, u16 rate)
 		return;
 	case MT_PHY_TYPE_HT_GF:
 		txrate->flags |= IEEE80211_TX_RC_GREEN_FIELD;
-		/* fall through */
+		fallthrough;
 	case MT_PHY_TYPE_HT:
 		txrate->flags |= IEEE80211_TX_RC_MCS;
 		txrate->idx = idx;
@@ -419,7 +419,7 @@ mt76_mac_process_rate(struct ieee80211_rx_status *status, u16 rate)
 		return;
 	case MT_PHY_TYPE_HT_GF:
 		status->enc_flags |= RX_ENC_FLAG_HT_GF;
-		/* fall through */
+		fallthrough;
 	case MT_PHY_TYPE_HT:
 		status->encoding = RX_ENC_HT;
 		status->rate_idx = idx;
diff --git a/drivers/net/wireless/mediatek/mt7601u/phy.c b/drivers/net/wireless/mediatek/mt7601u/phy.c
index d863ab4a66c9..430ae4c1d7db 100644
--- a/drivers/net/wireless/mediatek/mt7601u/phy.c
+++ b/drivers/net/wireless/mediatek/mt7601u/phy.c
@@ -787,7 +787,7 @@ mt7601u_phy_rf_pa_mode_val(struct mt7601u_dev *dev, int phy_mode, int tx_rate)
 	switch (phy_mode) {
 	case MT_PHY_TYPE_OFDM:
 		tx_rate += 4;
-		/* fall through */
+		fallthrough;
 	case MT_PHY_TYPE_CCK:
 		reg = dev->rf_pa_mode[0];
 		break;
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
