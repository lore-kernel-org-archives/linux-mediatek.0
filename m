Return-Path: <SRS0=GVU/=5S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D934DC43331
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 13:08:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AC5120678
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 13:08:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rK38HVBC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="H3t10Qyx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AC5120678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRp5lohcOyln0iVvhlDcdYSh8gnIA6b6GD9Na2T/Cbw=; b=rK38HVBCLUF3qV
	6JRNq7L8AduqxLkZHgA4/xcwU7QZdB2vx5gtgch+r5Ra5YESlxrSUDiwhONwXlGRnmqTO1qnOm2fh
	jmaAsdRozHe1eRV8SLUkBjcbkMhrnhFvD1paMdyq9jU7ee4TnlfnwzQSlxVXqZbb65b2ixpW1+gwZ
	66kk8EiCk0ncqVl/DH5Bl5Y64Sy90sE9TbnVVtD/K0DeLRIISjeRG8+0rLz7dczA7ukyzplELrMUX
	GDirKg9sBC5LU0V0UVVy/Isft7voD+yM7XbMg5XsIE08SZ2sRUpQKbfkmPXJBlvGZOdvg50nE5hL+
	O5rWO5uE4Qzau2+sBFSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJzZl-00053k-Fh; Thu, 02 Apr 2020 13:08:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJzZi-00052v-CU
 for linux-mediatek@lists.infradead.org; Thu, 02 Apr 2020 13:08:03 +0000
Received: from localhost.localdomain.com (unknown [151.48.151.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B556920678;
 Thu,  2 Apr 2020 13:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585832882;
 bh=Uh6JOT0aZYC6AsgluYPttqMIAwnEgeKrzLqMAFlWKfI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H3t10QyxT/pnC38gVB678cXXPrH/BITM1aibUHjCMGhAI4Abd4clpGUZe1FgpFmLW
 FD63+Fe/LnO2BAXpeYu+F24TgLhtfVdp44AXAMDZoWjLp3ZJUDAdq45Yxo+LHH7BU2
 fyvgOVSQ3OZK7F9qwiJWZBIPyacy4Le8bW5dn38o=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 07/12] mt76: mt7663: keep Rx filters as the default
Date: Thu,  2 Apr 2020 15:06:37 +0200
Message-Id: <52286a3c4f11f494d12575dc12feeb7aeea25118.1585832458.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585832458.git.lorenzo@kernel.org>
References: <cover.1585832458.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_060802_440956_7B81C67D 
X-CRM114-Status: GOOD (  10.01  )
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

From: Sean Wang <sean.wang@mediatek.com>

Keep Rx filters default value if the firmware supports offload and
low power features.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/init.c  | 24 +++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 8b7d8118d9ab..96b37f6ebf1e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -22,7 +22,7 @@ static void mt7615_phy_init(struct mt7615_dev *dev)
 static void
 mt7615_init_mac_chain(struct mt7615_dev *dev, int chain)
 {
-	u32 val, mask, set;
+	u32 val;
 
 	if (!chain)
 		val = MT_CFG_CCR_MAC_D0_1X_GC_EN | MT_CFG_CCR_MAC_D0_2X_GC_EN;
@@ -62,15 +62,19 @@ mt7615_init_mac_chain(struct mt7615_dev *dev, int chain)
 		FIELD_PREP(MT_AGG_ARxCR_LIMIT(6), MT7615_RATE_RETRY - 1) |
 		FIELD_PREP(MT_AGG_ARxCR_LIMIT(7), MT7615_RATE_RETRY - 1));
 
-	mask = MT_DMA_RCFR0_MCU_RX_MGMT |
-	       MT_DMA_RCFR0_MCU_RX_CTL_NON_BAR |
-	       MT_DMA_RCFR0_MCU_RX_CTL_BAR |
-	       MT_DMA_RCFR0_MCU_RX_BYPASS |
-	       MT_DMA_RCFR0_RX_DROPPED_UCAST |
-	       MT_DMA_RCFR0_RX_DROPPED_MCAST;
-	set = FIELD_PREP(MT_DMA_RCFR0_RX_DROPPED_UCAST, 2) |
-	      FIELD_PREP(MT_DMA_RCFR0_RX_DROPPED_MCAST, 2);
-	mt76_rmw(dev, MT_DMA_RCFR0(chain), mask, set);
+	if (!mt7615_firmware_offload(dev)) {
+		u32 mask, set;
+
+		mask = MT_DMA_RCFR0_MCU_RX_MGMT |
+		       MT_DMA_RCFR0_MCU_RX_CTL_NON_BAR |
+		       MT_DMA_RCFR0_MCU_RX_CTL_BAR |
+		       MT_DMA_RCFR0_MCU_RX_BYPASS |
+		       MT_DMA_RCFR0_RX_DROPPED_UCAST |
+		       MT_DMA_RCFR0_RX_DROPPED_MCAST;
+		set = FIELD_PREP(MT_DMA_RCFR0_RX_DROPPED_UCAST, 2) |
+		      FIELD_PREP(MT_DMA_RCFR0_RX_DROPPED_MCAST, 2);
+		mt76_rmw(dev, MT_DMA_RCFR0(chain), mask, set);
+	}
 }
 
 static void mt7615_mac_init(struct mt7615_dev *dev)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
