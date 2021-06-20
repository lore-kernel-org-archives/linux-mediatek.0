Return-Path: <SRS0=SDo2=LO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CE8C48BDF
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 07:48:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DA6561156
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 07:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DA6561156
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IrpaZkCUclUv41Ql2Inf3OqMMrfGjOc7SNlPnXjUiI8=; b=qI1jEM3+trs1YP
	KFGebYf9wxZz1eA9HadmeMDxahQfo4w6QQPuLrDQFwW7z7de6pGUDIZqzMlknM+T/nemRwyb4LiFV
	daLhKHXqvE95WEOvLPTY30B4ys9mtZVpy6S0UZ5C/A55quupLK7kiuU6qOZ1DFt0PRoD2ATL5zSQk
	982oHdOhqGn0MxbECAHNHXmuw6jyizDgliZRD/TUgg3SVmDbYEx+JKnOvq2LOo6fPW4OvUsvzGs3r
	XzSIRyIl4qeGZOyb6UebfpnylWvFuIZDWZk4nL4uzo3/M0wWLMoW3XksFhG+iQK+HRBmo3S3sBiAV
	BxeNmlDR2i08rlNj57kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lusBp-000fGD-It; Sun, 20 Jun 2021 07:48:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lusBl-000fFO-VK
 for linux-mediatek@lists.infradead.org; Sun, 20 Jun 2021 07:48:19 +0000
X-UUID: 9114f4aaa15e49d1a6e94da6b65418e8-20210620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PhteC3bG/VLeJvOBSmeS8WgfffVCa9X1zHugNaISNu4=; 
 b=oiFiSBJXWrved29qiAHiDmgP0kbo9jtkDFHwbq0FVnxlLnMzPUj/JFg9eKJnxbZKPcQTd/fz9wfUQDWwFonn3mWv6KqLFpqxxn376+DP7O6wnYxUZIUxqQrSVj62nAwQqFvj1OcMNfNsX1OkX+Iumj7q0FDvBjSYjSzEa4i3lGg=;
X-UUID: 9114f4aaa15e49d1a6e94da6b65418e8-20210620
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1626395300; Sun, 20 Jun 2021 00:48:14 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Jun 2021 00:48:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Jun 2021 15:48:10 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 20 Jun 2021 15:48:10 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 2/2] mt76: fix build error implicit enumeration conversion
Date: Sun, 20 Jun 2021 15:48:07 +0800
Message-ID: <62c5ed786f81ddea6d3587647520e9e4254c8612.1624174954.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <9b704807383f3048898944d2b9cb74e6b4e8d83d.1624174954.git.objelf@gmail.com>
References: <9b704807383f3048898944d2b9cb74e6b4e8d83d.1624174954.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_004818_066002_3452025B 
X-CRM114-Status: GOOD (  11.10  )
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

From: Sean Wang <sean.wang@mediatek.com>

drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:114:10: error: implicit
conversion from enumeration type 'enum mt76_cipher_type' to different
enumeration type 'enum mcu_cipher_type' [-Werror,-Wenum-conversion]
                return MT_CIPHER_NONE;
                ~~~~~~ ^~~~~~~~~~~~~~

drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:114:10: error: implicit
conversion from enumeration type 'enum mt76_cipher_type' to different
enumeration type 'enum mcu_cipher_type' [-Werror,-Wenum-conversion]
                return MT_CIPHER_NONE;
                ~~~~~~ ^~~~~~~~~~~~~~

Fixes: c368362c36d3 ("mt76: fix iv and CCMP header insertion")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.h | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.h | 3 ++-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 863aa18b3024..c2e537a9c1dc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -111,7 +111,7 @@ mt7915_mcu_get_cipher(int cipher)
 	case WLAN_CIPHER_SUITE_SMS4:
 		return MCU_CIPHER_WAPI;
 	default:
-		return MT_CIPHER_NONE;
+		return MCU_CIPHER_NONE;
 	}
 }
 
@@ -1201,7 +1201,7 @@ mt7915_mcu_sta_key_tlv(struct mt7915_sta *msta, struct sk_buff *skb,
 		u8 cipher;
 
 		cipher = mt7915_mcu_get_cipher(key->cipher);
-		if (cipher == MT_CIPHER_NONE)
+		if (cipher == MCU_CIPHER_NONE)
 			return -EOPNOTSUPP;
 
 		sec_key = &sec->key[0];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index edd3ba3a0c2d..5b9b425bd836 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -1073,7 +1073,8 @@ enum {
 };
 
 enum mcu_cipher_type {
-	MCU_CIPHER_WEP40 = 1,
+	MCU_CIPHER_NONE,
+	MCU_CIPHER_WEP40,
 	MCU_CIPHER_WEP104,
 	MCU_CIPHER_WEP128,
 	MCU_CIPHER_TKIP,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index c2c4dc196802..81633be09e90 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -111,7 +111,7 @@ mt7921_mcu_get_cipher(int cipher)
 	case WLAN_CIPHER_SUITE_SMS4:
 		return MCU_CIPHER_WAPI;
 	default:
-		return MT_CIPHER_NONE;
+		return MCU_CIPHER_NONE;
 	}
 }
 
@@ -619,7 +619,7 @@ mt7921_mcu_sta_key_tlv(struct mt7921_sta *msta, struct sk_buff *skb,
 		u8 cipher;
 
 		cipher = mt7921_mcu_get_cipher(key->cipher);
-		if (cipher == MT_CIPHER_NONE)
+		if (cipher == MCU_CIPHER_NONE)
 			return -EOPNOTSUPP;
 
 		sec_key = &sec->key[0];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
index d76cf8f8dfdf..3334afd8aea9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
@@ -199,7 +199,8 @@ struct sta_rec_sec {
 } __packed;
 
 enum mcu_cipher_type {
-	MCU_CIPHER_WEP40 = 1,
+	MCU_CIPHER_NONE,
+	MCU_CIPHER_WEP40,
 	MCU_CIPHER_WEP104,
 	MCU_CIPHER_WEP128,
 	MCU_CIPHER_TKIP,
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
