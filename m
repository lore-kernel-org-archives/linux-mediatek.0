Return-Path: <SRS0=jvDT=AA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A85BC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 07:54:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5D33207FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 07:54:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nJvp1AIz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tNBF4/Zu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5D33207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lfxtggg7nAEaCVaRDZ9vGPHnmkkm+c1lvCMRZoTWWeg=; b=nJvp1AIzEBt+xI
	o8CRj6ZEX7qiBIh2XsFdiRWwruTXGWG9ztTWJeQXAAgzaoBuYXJDFEuswE+xY63vEzTKDQ9LmlhVz
	dSkZtyX57M643s12Qb88GqfMlNytr0f0t1S2W7Cw7KCw6DA3rXFX2NpmqUm+yPiCYJiB3F84OFX5i
	2PVZilqPu767KFPpU4hu2HJVkS0N/juY0yLTu//s8qrTyjJGrdPzNqurKa1tKwrxRjNZ/D3eJpUAn
	SlbOBIH6VuwbeOcaQpvkaE7JC9XhDCellf/00PChtW+j1ZEUM+28fV3ALV7uufNrm6RfVRs5BAiHz
	Vf7HYBFVKz53UfZnGRlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmBrN-0005yM-FF; Fri, 19 Jun 2020 07:54:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmBrK-0005xm-IC
 for linux-mediatek@lists.infradead.org; Fri, 19 Jun 2020 07:54:48 +0000
X-UUID: 31c7f00b5bfd4288bdabdac52a8c8788-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=3ltb5nZixCRRCc99x3WnmbZJW+adF+mROtOvKeMYdTU=; 
 b=tNBF4/ZuvGZWBcVY0C/koL7QsD19l8PSVsWNiBtgOdKLC2chW5xyn6ukLxlONSbEhZmj8vpDfvdZ3/upqOYkysN3AHOLWGtEAh+XaM9+qldd96qpCc5/5AJlWSfbjXqDZo1dMiQajW/0rYR8OlqOS/+NawmQs2v1OH1vTV/ACuI=;
X-UUID: 31c7f00b5bfd4288bdabdac52a8c8788-20200618
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 264529489; Thu, 18 Jun 2020 23:54:56 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 00:54:41 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 15:54:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 19 Jun 2020 15:54:33 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v2 1/3] mt76: mt7915: add support for DT rate power limits
Date: Fri, 19 Jun 2020 15:53:54 +0800
Message-ID: <20200619075356.21998-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 93753E75486CD0CC19EF944C029F540EC5AF6B68F7BACB2C1D540A680174057C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_005446_602980_83E4190D 
X-CRM114-Status: UNSURE (   9.86  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable to limit per-rate max txpower from DT.

Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
v2:
 - subtract nss_delta from txpower_cur 
 - set txpower_cur to the return code of mt76_get_rate_power_limits

The series is based on Felix's https://patchwork.kernel.org/project/linux-wireless/list/?series=303913
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 44 ++++++++++++++++---
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index c8c12c7..1078770 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3068,15 +3068,47 @@ int mt7915_mcu_set_sku(struct mt7915_phy *phy)
 		.format_id = 4,
 		.dbdc_idx = phy != &dev->phy,
 	};
-	int i;
-	s8 *delta;
+	struct mt76_power_limits limits_array;
+	s8 *delta, *la = (s8 *)&limits_array;
+	int i, idx, n_chains = hweight8(mphy->antenna_mask);
+	int tx_power;
 
 	delta = dev->rate_power[mphy->chandef.chan->band];
-	mphy->txpower_cur = hw->conf.power_level * 2 +
-			    delta[MT7915_SKU_MAX_DELTA_IDX];
+	tx_power = hw->conf.power_level * 2 -
+		   mt76_tx_power_nss_delta(n_chains);
 
-	for (i = 0; i < MT7915_SKU_RATE_NUM; i++)
-		req.val[i] = hw->conf.power_level * 2 + delta[i];
+	tx_power = mt76_get_rate_power_limits(mphy, mphy->chandef.chan,
+					      &limits_array, tx_power);
+	mphy->txpower_cur = tx_power;
+
+	for (i = 0, idx = 0; i < ARRAY_SIZE(mt7915_sku_groups); i++) {
+		const struct sku_group *sku = &mt7915_sku_groups[i];
+		u32 offset = sku->offset[mphy->chandef.chan->band];
+		u8 mcs_num = sku->len;
+		int j;
+
+		if (i >= SKU_HT_BW20 && i <= SKU_VHT_BW160) {
+			mcs_num = 10;
+
+			if (i == SKU_HT_BW20 || i == SKU_VHT_BW20)
+				la = (s8 *)&limits_array + 12;
+		}
+
+		if (!offset) {
+			idx += sku->len;
+			la += mcs_num;
+			continue;
+		}
+
+		for (j = 0; j < min_t(u8, mcs_num, sku->len); j++) {
+			s8 rate_power;
+
+			rate_power = hw->conf.power_level * 2 + delta[idx + j];
+			req.val[idx + j] = min_t(s8, la[j], rate_power);
+		}
+		la += mcs_num;
+		idx += sku->len;
+	}
 
 	return __mt76_mcu_send_msg(&dev->mt76,
 				   MCU_EXT_CMD_TX_POWER_FEATURE_CTRL,
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
