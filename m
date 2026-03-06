Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DD0FCB638
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhrkUPLYEPGp9v5WMepaYyb+dL3jmL0m4QvuAMzcOMk=; b=gJkfH9pw8WaAfNpljXjJEAaDpC
	XPvrtLLoz2RB7Xv7slQzObFBEnzH1nS6m358exO/IC94A6eG9xnCrhd2ed+d4lvnDXXfjA4a73Jnp
	2AdtGrc9TG3r6x4akgtLj0sKIyJQmxunqV5IGVJWQKdrwuodgll9KY7E6/vbib5MboXsuaMVxfMPU
	hJfs/U+MUlNeHon0rLz105khkIctB/LBXENYd0M8sBVXGEofIhbValCgP+lCNrmq4WUx9sNmQXJ6B
	uhB1F4UDNyE0SlSEpsDSWUIjn6pDKLKloRP7riI7uhgCTMVCJ7MXvCE5ujV5MK95tRCFlosWR07lI
	21PelYtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeW9-00000004daW-1n7K;
	Fri, 06 Mar 2026 23:23:37 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeW7-00000004dZ5-0sMs
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:36 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-40f1a1f77a6so3099240fac.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839414; x=1773444214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bhrkUPLYEPGp9v5WMepaYyb+dL3jmL0m4QvuAMzcOMk=;
        b=R0qDq5q4u3Bv/LZB0trgRZyf+O34erKyN640dTDtL+H5MZR5LAnr1SutnVye+bcCwq
         VqlXdeUdcP+UN1mQExzakPNqyupq70d2LfrExOwgyc+4SqDjMFf1VTag+9Whbw6OsrNw
         ICFcyyCc1RgbUxSrEMstFDXCqbd9AANEEtG2ZCsaRuEKp854y+n9Tzwd9hXObYTfuk8L
         s4eKYCqiJIwgD6V0htZdJD4SquMZnl+hUNA7URWIKxpwhao4rXST+S5HulJFqgKwnEv/
         qSBJ9b2Sc45weUbgQNBC5OUmuuz3wrvTtH0z3oqVb5jN0dPhm9VAtl1x2aA689UI7+jw
         OQ8w==
X-Forwarded-Encrypted: i=1; AJvYcCWUhEDy5APPAoq8SU1ENb6kGq0gZmX3Am07SBUuo9qkhTLJoKtxrz0llAWcVsG4CfTDu48KVIbBcU9gOYWAkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoUi/1UrXFeXcMcLymosiMuo5JlmfdcRJwgZBIghOK8wXR11yB
	PF1hjZ5vcYE403tn3u8vZ+MjFfbPpurli0C1W7X1DtSl6OHueP90OAl/
X-Gm-Gg: ATEYQzwwwQQdjgFX5cJAhQ75vjBGKQomweRrsoTO9UMetrNRB8DRkplbGNgFWJ8BkFm
	oqNOlohLLWk66OvDILm/EVnPvwK4XG8vLoXcekIF5ZZRXUaNM9ZmBUrT5yzMmMbHiJrSItQN45/
	VK17t0FZhPxa5oZjhn5ylY6OEvm3RzSGu6Melat1+9fYhzrkQk6QgUuZ4xhzFal5i2FNyVGvfVW
	PPg+B1slm3uqnteZ5yBNKXmvZTYJzRHV0d+EluQ1dOxgzVJzLy0k0OHDMbr9Y7lC88w8xRIagjt
	yWWemBS2E+anUULA0CDq+nh8AKviWvi+5Q8yH73XCkv4+ek+YWT4GqOWIi0oq3GSH0beiTMPdfH
	rA+VFlj3ieyXwkogQ+0IxDQTRwCU4ofZR6ompssKOMrA4XIIkrk/M0QtZv482fxypPhNqvjN3Im
	ollbCBfXJjjgG8KK7laOnuCiSyKy5sMcxB1btHRCx+a2niBZQ=
X-Received: by 2002:a05:6870:8189:b0:3d4:fe66:28f6 with SMTP id 586e51a60fabf-416e403e732mr2191471fac.27.1772839414389;
        Fri, 06 Mar 2026 15:23:34 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:33 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 08/19] wifi: mt76: mt7925: validate mlink in sta_hdr_trans_tlv()
Date: Fri,  6 Mar 2026 17:22:27 -0600
Message-ID: <20260306232238.2039675-9-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152335_248940_D41CC80E 
X-CRM114-Status: UNSURE (   9.40  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Replace the dead wcid NULL check in mt7925_mcu_sta_hdr_trans_tlv() with
a WARN_ON_ONCE() guard on mlink before dereferencing mlink->wcid.

wcid is always derived from mlink, so mlink is the only meaningful
object to validate here.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index c474dd358650..03515b891643 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1082,11 +1082,11 @@ mt7925_mcu_sta_hdr_trans_tlv(struct sk_buff *skb,
 	else
 		hdr_trans->from_ds = true;
 
-	wcid = &mlink->wcid;
-
-	if (!wcid)
+	if (WARN_ON_ONCE(!mlink))
 		return;
 
+	wcid = &mlink->wcid;
+
 	hdr_trans->dis_rx_hdr_tran = !test_bit(MT_WCID_FLAG_HDR_TRANS, &wcid->flags);
 	if (test_bit(MT_WCID_FLAG_4ADDR, &wcid->flags)) {
 		hdr_trans->to_ds = true;
-- 
2.43.0


