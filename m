Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2649AC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 22:59:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC15060EB2
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 22:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC15060EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DnBmNNcY4AP5ks4XCY+sMC7En0xUVLY+FbDtekN/lcE=; b=oWFj0I46Ce/pXM
	yZCyHGU3VF6TBexPKzag8noin6ud4AijBu84Q3ieDNwGqPoSjpHmR78cJ8G+V08LDaob9KMfWJ7KE
	vj6lZn3srgbDzj7daxaPfdkjeRrISNs1NmAcD0tzcoC1aEb2AWyRHYNM4y8cvuuoc7YHZgKrTaK12
	il+/rOaz4uujSdndAVQyjAecQGCgb+NvO+ZAtlX1ZIDO8kUwftDjG0X4TZt6Ca2LVu3kJR/xeD5sE
	a2Epl+0OeM2UQcvUb4MuoAihkUZo95xlAUvsX7rRC8SDHoHQ1LwO+rjuJlSrH9vpJBijfr+29LuAl
	3R5/pZcy/+2rtf5tL0DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8W30-00GauI-Du; Tue, 27 Jul 2021 22:59:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8W2x-00GatN-Ej
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 22:59:36 +0000
X-UUID: b95e9f1460ba48e6a88fa66d0a276eca-20210727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=BhxCQniFMlqjYab+LybQJVlNktVCMkAkeL/sBSEQqpI=; 
 b=Ycn3OEQca/k8OkNSiRuH5E1ZYFKCEw68B3cg1JLn+Kac29Dd6Pu8/iYKAACfo0Id5zAAalP0m6kGgUQ7Ha2A81i8G3JO1Seq3NkUhKsV1RsalFNCJW9y0MWi9NOo3qMNNxnJcrCn21bioktLAsr82PnxHm6q6p3pA0ItGptiPNU=;
X-UUID: b95e9f1460ba48e6a88fa66d0a276eca-20210727
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 851294002; Tue, 27 Jul 2021 15:59:33 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Jul 2021 15:59:32 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 06:59:18 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 28 Jul 2021 06:59:18 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/2] mt76: connac: fix GTK rekey offload failure on WPA mixed
 mode
Date: Wed, 28 Jul 2021 06:59:16 +0800
Message-ID: <1627426757-14811-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_155935_540377_8744083C 
X-CRM114-Status: GOOD (  12.91  )
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

From: Leon Yen <Leon.Yen@mediatek.com>

Update the proper firmware programming sequence to fix GTK rekey
offload failure on WPA mixed mode.

In the mt76_connac_mcu_key_iter,
gtk_tlv->proto should be only set up on pairwise key
and gtk_tlk->group_cipher should be only set up on the group key.

Otherwise, those parameters required by firmware would be set
incorrectly to cause GTK rekey offload failure on WPA mixed mode
and then disconnection follows.

Fixes: b47e21e75c80 ("mt76: mt7615: add gtk rekey offload support")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Leon Yen <Leon.Yen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.c  | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index a2555dc0f003..d71393b1c5e6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1957,19 +1957,22 @@ mt76_connac_mcu_key_iter(struct ieee80211_hw *hw,
 	    key->cipher != WLAN_CIPHER_SUITE_TKIP)
 		return;
 
-	if (key->cipher == WLAN_CIPHER_SUITE_TKIP) {
-		gtk_tlv->proto = cpu_to_le32(NL80211_WPA_VERSION_1);
+	if (key->cipher == WLAN_CIPHER_SUITE_TKIP)
 		cipher = BIT(3);
-	} else {
-		gtk_tlv->proto = cpu_to_le32(NL80211_WPA_VERSION_2);
+	else
 		cipher = BIT(4);
-	}
 
 	/* we are assuming here to have a single pairwise key */
 	if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE) {
+		if (key->cipher == WLAN_CIPHER_SUITE_TKIP)
+			gtk_tlv->proto = cpu_to_le32(NL80211_WPA_VERSION_1);
+		else
+			gtk_tlv->proto = cpu_to_le32(NL80211_WPA_VERSION_2);
+
 		gtk_tlv->pairwise_cipher = cpu_to_le32(cipher);
-		gtk_tlv->group_cipher = cpu_to_le32(cipher);
 		gtk_tlv->keyid = key->keyidx;
+	} else {
+		gtk_tlv->group_cipher = cpu_to_le32(cipher);
 	}
 }
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
