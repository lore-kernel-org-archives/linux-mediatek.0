Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397D1C11F7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:38:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08B7E61D8B
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08B7E61D8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d77hCL/v+hyjXl4Z8HOBzKjeBDyD6gpXxH5J9LLB9lA=; b=cztiNcofTfGPdE
	J6jCfs8Mtl/zuFmtAdJeY/L8Q9jXVu5p2Aw0gF/8n6zDes/LjAsWn0LOhE2Nx93QBONtz6ltsWhPa
	Tdm2hrspqTajQsscxlcCa++soSbBK7pxsvjVUrRa0JVQz273cFh3biPghttULxU8X1n2GudTeSv3k
	UZXtsVycYPXUvY+nvWHM5vGbuFf6TUDummZI/LAAAXHtgBJ8WbkU5jShOlJb34yK8Hyd8WrDqZYkz
	2Oehhs0qeCDxzMQZv98w3I8RgpR4HJn73r0rcL3Q2OeAzJtO65QVf39s1mksRiPCl1EP0AJAjI8g0
	QVZdkdiO9WMUJyirImLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0jPX-00BRsB-WB; Tue, 06 Jul 2021 11:38:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0j8G-00BGxY-H3; Tue, 06 Jul 2021 11:20:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3019C61D9A;
 Tue,  6 Jul 2021 11:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570452;
 bh=0Em+bgYmrDU1JOZhftUS5xrrOixdfruBKkFRuFCROBE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ezmbkfPPBgn08cZzpOT0MzDt+NOvKBVcgESV38rpBroP97DOkBn7PAp5A02Xco46X
 0Zzo3D8qE1a4bQ42deg9m3BPmAvQTXiQwtyFh6/QVsn0iX/WtlN0MR94Z9dBQ95ka0
 +DbKICXP1viYQKd+eyYW9MbnnWA7Fuk3bO9fC6KYfO9fn9Enyo0kP7VgvHewhDPZX7
 KYvsR0fjXOo6m4U/Pz/d9Dpu80DggStMO+11x5bADN6A1H77DnudWEMW+H18NWwmoX
 jzgKBU+bo75DoSQv7wPJA5XsWG4s/D36cfRerGsieBOihTsseY53DZLijy8m6Gha4v
 BbAwz06HDyXpg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Evelyn Tsai <evelyn.tsai@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 109/160] mt76: mt7915: fix tssi indication field
 of DBDC NICs
Date: Tue,  6 Jul 2021 07:17:35 -0400
Message-Id: <20210706111827.2060499-109-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111827.2060499-1-sashal@kernel.org>
References: <20210706111827.2060499-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_042052_625835_49BE6C3C 
X-CRM114-Status: UNSURE (   9.03  )
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

From: Evelyn Tsai <evelyn.tsai@mediatek.com>

[ Upstream commit 64cf5ad3c2fa841e4b416343a7ea69c63d60fa4e ]

Correct the bitfield which indicates TSSI on/off for MT7915D NIC.

Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
index 3ee8c27bb61b..40a51d99a781 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
@@ -116,12 +116,15 @@ static inline bool
 mt7915_tssi_enabled(struct mt7915_dev *dev, enum nl80211_band band)
 {
 	u8 *eep = dev->mt76.eeprom.data;
+	u8 val = eep[MT_EE_WIFI_CONF + 7];
 
-	/* TODO: DBDC */
-	if (band == NL80211_BAND_5GHZ)
-		return eep[MT_EE_WIFI_CONF + 7] & MT_EE_WIFI_CONF7_TSSI0_5G;
+	if (band == NL80211_BAND_2GHZ)
+		return val & MT_EE_WIFI_CONF7_TSSI0_2G;
+
+	if (dev->dbdc_support)
+		return val & MT_EE_WIFI_CONF7_TSSI1_5G;
 	else
-		return eep[MT_EE_WIFI_CONF + 7] & MT_EE_WIFI_CONF7_TSSI0_2G;
+		return val & MT_EE_WIFI_CONF7_TSSI0_5G;
 }
 
 extern const struct sku_group mt7915_sku_groups[];
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
