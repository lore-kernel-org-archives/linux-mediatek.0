Return-Path: <SRS0=9cIZ=6F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB6DC2BA19
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 05:21:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E82A208E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 05:21:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IpdvRaOf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ko+mZgkJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E82A208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nhAZ4gZN8nDq1ZjwKnaz8XlwXJkfnid1cBg31D5KhYk=; b=IpdvRaOfSzNKOv
	XJFeDlTlYBCN6Wx4RQNS8z0cUbkpz3nAKS5xJ/DzBloTrM3vP0NYDqDtuDSztx6p6cEvmuQWhfGie
	TlIZY/hb3Hiq5aa5FxUeb3tHc1WO3Bny+/Y3kDH1+vTs+a3ryPcjuICKRtZFCC1sNgmBlDVeAn4zb
	lEpEyKGZ061XzrDe+qt4D/CxtcJv+7ShSdINYb6FEyasVanRn+c/+GlxSe55QagTukal2mtjNsA46
	FLOxSqNV6pV6w08W353fLxuj9NUJvqmvW2YtHiVnqMRwGJ1IS6OQmKdQeVD4Q47zpIQMRBbT39bK7
	eF5Jk22FsGtI3Z9zktUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQlL5-0005kO-IQ; Tue, 21 Apr 2020 05:20:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQlL0-0005gx-J2
 for linux-mediatek@lists.infradead.org; Tue, 21 Apr 2020 05:20:51 +0000
X-UUID: 5a24543ff4964905a60b25af8f9ea9b5-20200420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HnBBAl5ApGkX57RqSlJeWzPnI68bVoLjmJ43j6pkVuk=; 
 b=ko+mZgkJiw3LjjIWQKymS0DMxm+IbmHhsORciSU3nGSkVHzq455FQVtVauWiDompzqLPXnMRgl/d027sFsVwWMwo52+Lezk5F/6WmW1sA6jeUgU+VTKT5f1APKvuu8k1vEHi9rgvydmCkv3nMEJsxFGRM51Xy9A0F3U6SOPvyU4=;
X-UUID: 5a24543ff4964905a60b25af8f9ea9b5-20200420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1693893861; Mon, 20 Apr 2020 21:20:40 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Apr 2020 22:20:39 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Apr 2020 13:20:27 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 21 Apr 2020 13:20:27 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH 3/3] mt76: mt7663: fix up BMC entry indicated to unicmd
 firmware
Date: Tue, 21 Apr 2020 13:20:23 +0800
Message-ID: <99b919b29ad60437749d5f30dc8c68ccb3df89f3.1587445885.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1467d47fd111b5711fa74410833153bdc9e01b72.1587445885.git.sean.wang@mediatek.com>
References: <1467d47fd111b5711fa74410833153bdc9e01b72.1587445885.git.sean.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9B03E7B10743E9A1174ED658E4FA1FEFCC51863DC180DF2666E119831E7EE7A92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_222050_624806_B8888F74 
X-CRM114-Status: UNSURE (   8.27  )
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
Cc: linux-mediatek@lists.infradead.org, Soul
 Huang <Soul.Huang@mediatek.com>, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

BMC entry for MT7663 unicmd firmware should be a broadcast/multicast entry,
not a unicast entry, that is GTK rekey offload would rely on.

Fixes: 138860679b2a ("mt76: mt7615: add more uni mcu commands")
Cc: Soul Huang <Soul.Huang@mediatek.com>
Suggested-by: YF Luo <Yf.Luo@mediatek.com>
Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 045bde7f554d..e8caa2c7981e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1339,7 +1339,7 @@ mt7615_mcu_uni_add_bss(struct mt7615_phy *phy,
 			.short_st = true,
 		},
 	};
-	u8 idx, tx_wlan_idx = 0;
+	u8 idx, tx_wlan_idx = mvif->sta.wcid.idx;
 	int err;
 
 	idx = mvif->omac_idx > EXT_BSSID_START ? HW_BSSID_0 : mvif->omac_idx;
@@ -1349,10 +1349,9 @@ mt7615_mcu_uni_add_bss(struct mt7615_phy *phy,
 	case NL80211_IFTYPE_MESH_POINT:
 	case NL80211_IFTYPE_AP:
 		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_INFRA_AP);
-		tx_wlan_idx = mvif->sta.wcid.idx;
 		break;
 	case NL80211_IFTYPE_STATION:
-		if (enable) {
+		if (enable && !is_mt7663(&dev->mt76)) {
 			struct ieee80211_sta *sta;
 			struct mt7615_sta *msta;
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
