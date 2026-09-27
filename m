Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC21C9832F
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6iyXs7a1DTzg1r/NsGNyMzWMeL+NXKIZqvuGpnvJ04=; b=44pmglPnn3YjXHtIPKEklVRGpc
	PxRhvdoLhcRAoM7GpWih4IWgho9YctZjdSsFSvmtT3nyxA88aZfaYoD12PE9uSnr8bDeOCl3EKxKB
	NgEds5spKENmYVbzJ6ejIGNTFQiqdXgY0I37kjObDO4HKyMndMbRnKrTbmI49XMZIW3PQcewr3ceK
	EqyVhx7pfx0UunQr/493zk6pb6vVAxihuy/EvnmZAIyIepkLn+yjaryadQ3gQKXIntJ2N3FnJgrdr
	B4IIL+wUH2S+aigI/VWrPC5gxC0ZAsK1SdiUMZ9gNJ6i5Cgp5SBVruicfHbcaOtdG8K3gagyRuEsU
	ah7wyN3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw8y-0000000GsCH-0Tep;
	Sun, 27 Sep 2026 21:10:44 +0000
Received: from mail-oo2-f42.google.com ([74.125.231.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw8v-0000000GsAE-17ld
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:10:42 +0000
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d78c92b8f1so713833eaf.2
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543440; x=1791148240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6iyXs7a1DTzg1r/NsGNyMzWMeL+NXKIZqvuGpnvJ04=;
        b=Ge9Ppa2V/ALnHrlNMw9T700sc+b5gpQFdyiU7sb4JGuCd3h92g8vej9h+x/1CnduVD
         UsGp3c7iPzOHB8PnnygqpbdQd5avW/tlYJtazPE+MspbwwD7UIE+4OB/+pTUnPG3mMTy
         WaIq+i3QZ8EblqPTvJKsXnCYgw/2PHAe543zm3Bu0a1xVmVs7cNToCUe3oBP/yObEHBR
         6UefUXfr0bVzJFr96ANbBt3OAU+QRQpNc8tLrtMcAaeTUOz77tWepzkX6NQapJ8rKM/T
         IrUVZ7ATa7UOWlUvehyJqgyiJlEH071WFwy0j+cpqadrJ2V3wF6vGoALPBPhtu3mbqqH
         1jsA==
X-Forwarded-Encrypted: i=1; AKwUvBz0PPwu0Xme4jIFzTge+sHiBIT63csXCwzBZECkKcoPVdJbNNWUZJ0eVN9kTqmvEwxtB+uM23HzMRbqR3A1NA==@lists.infradead.org
X-Gm-Message-State: AFuF++kci0b4szEx9e36Y3/XiSwzE0IwuGWE0MuAKOFOpL1CORNqWTvd
	wmdFzRYGp4Kw54LwXg1ceVe0/JPHcAMhBcQhW5NuwvlwT2T70zavlki24GvRq0JA
X-Gm-Gg: AYBFou08vdYe0WTrrBOPW3BqXuFOJz+WT4a7GlzNSgB2528mCSoy6vPpkxtcSHufc7D
	97/Y6Lsgu/+qZZeuHlOv+8R8wrTeM6i6hfgdZNee7ecT090lx2F1lzBjyyUwe3QS7zAJm5nEykt
	+meZH4vBgItqPgmUf52fsM+S77MCd73wH/6Ceugwm+i/hjWIHAWOt/+iTn4wsaZAdBPUf0aVLhZ
	MQAR8Ijn2rrFI9IFrSS5OurpvQ1DqZqxMkP6Y3LINc/rJD7hkt7j5vCXPZCngy2Ft2rqsh9dN36
	1+oM3ESyMbNVk2Bdm1w/ckQzNAvflibyjgWzR/eTw8/Li8RW3DJXSFjzehh3BJ+9NzWF6XDfxCx
	tsizNvsqCNHJWQKZMyuKk1elcAYsel5w02WC9dlWMhoBYZihN7eHgAcNLNhox1BCG2Xt2YsvmgU
	4rid3TG5Evp11Nz/seX0Ge9mhl8ycg5Kmbyv/4XCGTuz1TVIVDJRDcIqkL+2+GewnohtnHwOku/
	blwbD0gUR+O1YER2vOGLouXDTTXoA7g5bT0UX5dNWZumnyVPrHIcYmY70cgVLQA0md7HQ==
X-Received: by 2002:a05:690c:698a:b0:8a8:4d6:22be with SMTP id 00721157ae682-8a804d62da0mr47981787b3.15.1790543071036;
        Sun, 27 Sep 2026 14:04:31 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:04:30 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Jacobs Wu <jacobs.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 22/23] wifi: mt76: mt7925: bound the lifetime of NAN unicast management frames
Date: Sun, 27 Sep 2026 16:03:04 -0500
Message-ID: <20260927210306.737669-23-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_141041_305117_148ADDB4 
X-CRM114-Status: GOOD (  16.99  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Jacobs Wu <jacobs.wu@mediatek.com>

A NAN unicast management frame sent to a peer that has disappeared never
comes back to the host. The frame sits on the gated DW-WTBL queue, the
gate opens at every discovery window and the hardware retransmits, but
the retry budget is re-armed each time the queue is released, so it
never runs out and no TX status is ever generated. The host keeps the
skb in its status table indefinitely, the supplicant waits for a TX
status that does not arrive, and every later management frame on that
queue lines up behind the dead one. In practice a single lost peer stalls
all further NAN handshakes on the interface.

Set MAX_TX_TIME in the TXD for these frames so the hardware bounds them
in time rather than in attempts. When the limit expires the frame is
dropped with the lifetime-expired bit set, the host sees a no-ACK
status, and the queue drains. Forty-six units of 64 TU is about 3 s, six
discovery windows, which is beyond the 2 s NDP handshake deadline so a
frame that still has a chance to be delivered is never cut short.

Fixes: 0f3605e4f8de ("wifi: mt76: mt7925: wire up NAN operations")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c    | 12 +++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h |  3 +++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index f19d0451f373..75d2081b0920 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -815,8 +815,18 @@ mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 		struct ieee80211_hdr *nan_hdr = (struct ieee80211_hdr *)skb->data;
 
 		if (ieee80211_is_mgmt(nan_hdr->frame_control) &&
-		    !is_multicast_ether_addr(nan_hdr->addr1))
+		    !is_multicast_ether_addr(nan_hdr->addr1)) {
 			val = FIELD_PREP(MT_TXD3_REM_TX_COUNT, 31);
+
+			/* The retry budget alone never finalises a frame whose
+			 * peer has gone: the DW-WTBL gate re-arms it every DW,
+			 * so firmware holds the frame indefinitely and the host
+			 * never gets a TX status. Bound it in time instead -
+			 * about six DWs, beyond the 2 s handshake deadline.
+			 */
+			txwi[2] |= cpu_to_le32(FIELD_PREP(MT_TXD2_MAX_TX_TIME,
+							  NAN_MGMT_MAX_TX_TIME));
+		}
 	}
 
 	if (key)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 33782d9ba9ed..bc335740638b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -26,6 +26,9 @@
 #define MT7925_SKU_MAX_DELTA_IDX	MT7925_SKU_RATE_NUM
 #define MT7925_SKU_TABLE_SIZE		(MT7925_SKU_RATE_NUM + 1)
 
+/* NAN unicast mgmt TXD MAX_TX_TIME, units of 64 TU: 46 is about 3 s */
+#define NAN_MGMT_MAX_TX_TIME		46
+
 #define MCU_UNI_EVENT_ROC  0x27
 
 #define HIF_TRAFFIC_IDLE 0x2
-- 
2.43.0


