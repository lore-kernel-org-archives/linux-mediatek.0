Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1953CC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:45:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E77961423
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E77961423
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zYsOwjTMp8Ib+WPtNy1mYmXfSydCYS6PrnSoXkz4Kro=; b=jiJBOx86qbcY13ensfOhpyBQR
	XjGu+cBantPxfhIwlnAxLTQfjgqnoBvVnZVRcV6MGNgYwETHlf6cUiJ7P73NvTPE4lAlOe7yJU493
	RfwclHtiSHCgospTr3jTYoHh8ZzgGkZpvQC9imEirF44Uf3v1ZbWXiKHAV6Hx2mWMeF5EUPZRu90J
	TD4+5WYGk+/vn0EttmJMus+8ntaX3CEaZ7tm2qdYZGHyg+3xhLM2pjaUh8JCiv4Bv2l+SOGMtP3J3
	brfU9F6BU0M1hb7bL+Laah3QUIedfL9tE/W58/v5SLTsUbwni3SScS7BnoKToXploeZTqd4JiOlqU
	NuvKGmWvw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKeY-001jgi-2y; Wed, 05 May 2021 16:45:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKUp-001fdT-8z; Wed, 05 May 2021 16:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=1FJCUdsq6huqRWGgmuLgcRDyPqGy3gzDFWo106WjOZ0=; b=EaUgW72Ad55ck5zf/uo+aD7OMu
 nUcsqG5PHC3iibFDsMTmPREKndpLFsLaxj3xk1cTdZTJZ2QLwsSjwa8dmYsTok2eqagXcehpiKwsJ
 tFubu9p1SW0zZKXge1CTs0zO1FlZW9XowhM50JOizTDjDx+UTHiyYmJaNv/qCZlFo7JkuB8erpC3m
 al8kYQrTx2CgsEgCmrprhSBbfkt+kLvKXKBqfcGTFx5+N/+qvxjNv9YuoBYYthPqUPuLyYn2+/hF9
 lbL1YpjMyxPkEHIlSzzFUNQjSVeh/gkhtsoTp6SWG9CzY8yahfn0CKQnuhMU14FMItyXazOQ+uKtV
 5aIdbrXQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKUm-004x5p-ML; Wed, 05 May 2021 16:35:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54D806191E;
 Wed,  5 May 2021 16:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232532;
 bh=QJ+YkKBhnjMB154wdrYAXSTMHCG8sjOU2BZsUExpeco=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eNxOK18PZdz2niZXbLKtJqDuSZobOfksc5LnP/d3jWdJZQk9S5XewdCyjtQ2twfV7
 +99apIRTyfmzD6f1Mk0+mlSrI6Y1S9cGx/Gh0ufTiylBOOw8gjr87nfjXCWHKgccRs
 /HdCvpO8jDAqEGWg0BN5GgjevkKvSRBJ8QK1tNFq1yRSqXPMq05i+QGgtW90K1x35J
 P4MXL0HRMe0cQaTzDZLRycueJf+Ike5jHoGSiZLgk8j8SptyNoxuiK9vcLAh/6D7Cc
 i9gllcpusMNMTt0azEcoqrc3rWTwDQuon5/+1REO9dFi7DA7QDuSV/BZPi8/5ykVTu
 76FrflM8PFJ/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.11 054/104] mt76: mt7915: always check return value
 from mt7915_mcu_alloc_wtbl_req
Date: Wed,  5 May 2021 12:33:23 -0400
Message-Id: <20210505163413.3461611-54-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163413.3461611-1-sashal@kernel.org>
References: <20210505163413.3461611-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093532_774870_ADC3BE31 
X-CRM114-Status: UNSURE (   8.25  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit 45f93e368211fbbd247e1ece254ffb121e20fa10 ]

As done for mt76_connac_mcu_alloc_wtbl_req, even if this is not a real
bug since mt7915_mcu_alloc_wtbl_req routine can fails just if nskb is NULL,
always check return value from mt7915_mcu_alloc_wtbl_req in order to avoid
possible future mistake.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index e211a2bd4d3c..1cbae0eacfe9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1170,6 +1170,9 @@ mt7915_mcu_sta_ba(struct mt7915_dev *dev,
 
 	wtbl_hdr = mt7915_mcu_alloc_wtbl_req(dev, msta, WTBL_SET, sta_wtbl,
 					     &skb);
+	if (IS_ERR(wtbl_hdr))
+		return PTR_ERR(wtbl_hdr);
+
 	mt7915_mcu_wtbl_ba_tlv(skb, params, enable, tx, sta_wtbl, wtbl_hdr);
 
 	ret = mt76_mcu_skb_send_msg(&dev->mt76, skb,
@@ -1686,6 +1689,9 @@ int mt7915_mcu_sta_update_hdr_trans(struct mt7915_dev *dev,
 		return -ENOMEM;
 
 	wtbl_hdr = mt7915_mcu_alloc_wtbl_req(dev, msta, WTBL_SET, NULL, &skb);
+	if (IS_ERR(wtbl_hdr))
+		return PTR_ERR(wtbl_hdr);
+
 	mt7915_mcu_wtbl_hdr_trans_tlv(skb, vif, sta, NULL, wtbl_hdr);
 
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb, MCU_EXT_CMD_WTBL_UPDATE,
@@ -1710,6 +1716,9 @@ int mt7915_mcu_add_smps(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 
 	wtbl_hdr = mt7915_mcu_alloc_wtbl_req(dev, msta, WTBL_SET, sta_wtbl,
 					     &skb);
+	if (IS_ERR(wtbl_hdr))
+		return PTR_ERR(wtbl_hdr);
+
 	mt7915_mcu_wtbl_smps_tlv(skb, sta, sta_wtbl, wtbl_hdr);
 
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
@@ -2279,6 +2288,9 @@ int mt7915_mcu_add_sta(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 
 	wtbl_hdr = mt7915_mcu_alloc_wtbl_req(dev, msta, WTBL_RESET_AND_SET,
 					     sta_wtbl, &skb);
+	if (IS_ERR(wtbl_hdr))
+		return PTR_ERR(wtbl_hdr);
+
 	if (enable) {
 		mt7915_mcu_wtbl_generic_tlv(skb, vif, sta, sta_wtbl, wtbl_hdr);
 		mt7915_mcu_wtbl_hdr_trans_tlv(skb, vif, sta, sta_wtbl, wtbl_hdr);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
