Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E82C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 22:17:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB019613D0
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 22:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB019613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vQ8bI8kGaan6RGQikEBFwnW8WAk6uvSnH/MR3L0Ll+Y=; b=ASBaPpfYyTNTsZShlr9HPMqYVh
	TN5fVStuKPbC0iQx4lzkM+czgPx/8Ds9EcmEXamfGoSY7jbIZZndpFJI9o471W+ONg57B2OqmUwrN
	NZWtXc03tZKclqS9itfvoJQ/gGZyc6TRNLyEJmZPbFTarrLEJVUvGgNsKSeENwQcJU6RryNztiDcq
	fXEtZKl/jP0SPN1knWdqZAZ/k+hvK0cEN6amoJGlT5a1hfNzbCGiSL3UjeF74o8MgIMgIJgWVaA0W
	PPo49GapPpL6NtDuvs6ihSTsgiOGIMtw87rvYpLBaSu0gbim2SIEKgyZyT+OOjyR8aW9+AvWPg8xv
	j1v8GhRg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXWlW-003Yv4-LM; Fri, 16 Apr 2021 22:16:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXWlO-003YtH-H5
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 22:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=CJQ69MfHMXgd5kir0lSN1t30ZupgEWXln15bOl2TzI8=; b=kervzWVEMSaFx0oAw8OxaJ7Sq/
 9SemmItqwPY4d3puFq/P99/f3hcOwmLtTniJbvUXpHiyd6p5XLEGUYcR74SmLIDmj8HaQO+vzBaxg
 gdygxHn7mvprZmru6AEhyOHGECgNdz+kjEqwsQXg1pyyey/UMlZVpjIGota6S/DSUUHMnybkKGTVE
 Cd7Yl97iJu5hFrOaE8NQK6XpsrpepB7LDz1dn53X3RWZW3oQO4OeteAeKStt6nJWN2+sx01rUuQp8
 c9Bga7vWR2aAnWAzKeCoP+AT/b9fK43pBK3R8ZPw+eW/6q5kMgo0eiqELnb3NuMDcd+FqYMHlJtAn
 IxoAMjgQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXWlI-009kHZ-GK
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 22:16:32 +0000
X-UUID: c6eafee1442b4d709b7dd1677e9b2863-20210416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=CJQ69MfHMXgd5kir0lSN1t30ZupgEWXln15bOl2TzI8=; 
 b=kOKtQcQJIxfwl+I01A/nOBa4QAj5L/6F2SK9sOBjIK+vmErFh7y1bi35vFHZDjv4xoOB0zfiaLEe1Ic71f7fb95gqmV8QygwqCZfjT1Ak/aTv7IvnWvl5gn2KWSQvkBPDhFnJjteoclgI0JoHqJMFfJiwGUs3kU8ijWSfoUCHzU=;
X-UUID: c6eafee1442b4d709b7dd1677e9b2863-20210416
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 14751291; Fri, 16 Apr 2021 15:16:23 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 15:16:22 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Apr 2021 06:16:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 17 Apr 2021 06:16:20 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/3] mt76: mt7915: add support for DT rate power limits
Date: Sat, 17 Apr 2021 06:16:17 +0800
Message-ID: <6c1be8713dfd1154b5ec61b2b094eb156d9fb659.1618609024.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_151628_574873_AC2A79BB 
X-CRM114-Status: GOOD (  11.26  )
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

From: Shayne Chen <shayne.chen@mediatek.com>

Enable to limit per-rate max txpower from DT.

Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 44 ++++++++++++++++---
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 0b739ed8ce33..3d88a05aad5d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3375,15 +3375,47 @@ int mt7915_mcu_set_sku(struct mt7915_phy *phy)
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
+
+	tx_power = mt76_get_rate_power_limits(mphy, mphy->chandef.chan,
+					      &limits_array, tx_power);
+	mphy->txpower_cur = tx_power;
+
+	for (i = 0, idx = 0; i < MAX_SKU_RATE_GROUP_NUM; i++) {
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
 
-	for (i = 0; i < MT7915_SKU_RATE_NUM; i++)
-		req.val[i] = hw->conf.power_level * 2 + delta[i];
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
 
 	return mt76_mcu_send_msg(&dev->mt76,
 				 MCU_EXT_CMD(TX_POWER_FEATURE_CTRL), &req,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
