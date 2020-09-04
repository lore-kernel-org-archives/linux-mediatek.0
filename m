Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EEDC43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 21:16:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB8F42087C
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 21:16:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l3g1FDN5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fRIW1z90"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB8F42087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/IjQ95tRgMfALlqW6m2MHHm7viw9pEFmlWOeSlroU+I=; b=l3g1FDN5LwuEPjOWS6TY0zypg4
	vVkAScNVuAK4lq9ECxuG+K/63QmR5SJEmH2BMfDgrgttGvZpNLWKwlRSgm21VNR8fKC03LIJdOqh3
	EfaUB+dT7pyldAHbGLXQAWViHMNnRMFUyfjeoU8SWLWYY/j4w6Sf3AObIrcF7PKkW02aLTWcliQCi
	G5jEUcT1ldpUjnmEqbcqvq6PSaKLqT+jXHY9WjPMrNAavJK74AxCXrT2lsQlTv5SLRbDPRBGZMUyK
	ay10gNtM4rkPX0nA2qRBBFIXS7jJiQ08jO9eeyOv9DNZqRvhuXHmwelH8OGHgUfMYWBRGo37i4KNV
	2vTqRU5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEJ4N-0007vC-Ty; Fri, 04 Sep 2020 21:16:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEJ4H-0007uN-Ki
 for linux-mediatek@lists.infradead.org; Fri, 04 Sep 2020 21:16:25 +0000
X-UUID: c51d878fc1fe4c32b4cd18ca43cf8e07-20200904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=tlschwqKZgdubNfFxtjzpGyZVI9ZZHhyWThWKoFy9Pg=; 
 b=fRIW1z90qvTaZwYCnwHIw3dPbOojsVA5UVEOHb52CE90DwkAhOOaLhDNB0kuGmPoYhnk6SuQguuYuUHQ9Ho5gsgiGwUHOCoWcNFflzCKi4IGfOD91oKT8ew8rGqfjupUmQq1t8UE3ktWUO/p+5imLO/fqomd3q/6J5pwPELBGiE=;
X-UUID: c51d878fc1fe4c32b4cd18ca43cf8e07-20200904
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 488486662; Fri, 04 Sep 2020 13:16:12 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 14:16:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Sep 2020 05:16:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 5 Sep 2020 05:16:04 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7615: fix VHT LDPC capability
Date: Sat, 5 Sep 2020 05:16:05 +0800
Message-ID: <1ffbbae4ce3905ddf52b9edb3b8ef1c107f47fa6.1599251705.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: E76CA06A040520C10866A4FF875D5DA7323044EB342F9488C7D41543398306072000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_171621_847161_E31D4768 
X-CRM114-Status: UNSURE (   8.60  )
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
Cc: linux-mediatek@lists.infradead.org, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MCU field should contain a boolean 0/1, not the flag itself.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 mode change 100644 => 100755 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 074cdefba8aa..e61bf5850510
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1179,7 +1179,7 @@ mt7615_mcu_wtbl_ht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 		tlv = mt7615_mcu_add_nested_tlv(skb, WTBL_HT, sizeof(*ht),
 						wtbl_tlv, sta_wtbl);
 		ht = (struct wtbl_ht *)tlv;
-		ht->ldpc = sta->ht_cap.cap & IEEE80211_HT_CAP_LDPC_CODING;
+		ht->ldpc = !!(sta->ht_cap.cap & IEEE80211_HT_CAP_LDPC_CODING);
 		ht->af = sta->ht_cap.ampdu_factor;
 		ht->mm = sta->ht_cap.ampdu_density;
 		ht->ht = 1;
@@ -1197,7 +1197,7 @@ mt7615_mcu_wtbl_ht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 		tlv = mt7615_mcu_add_nested_tlv(skb, WTBL_VHT, sizeof(*vht),
 						wtbl_tlv, sta_wtbl);
 		vht = (struct wtbl_vht *)tlv;
-		vht->ldpc = sta->vht_cap.cap & IEEE80211_VHT_CAP_RXLDPC,
+		vht->ldpc = !!(sta->vht_cap.cap & IEEE80211_VHT_CAP_RXLDPC);
 		vht->vht = 1;
 
 		af = (sta->vht_cap.cap &
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
