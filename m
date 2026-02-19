Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F0AE9A04E
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 00:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqnEDY5rPm6avb1ZLa7TTBT9hEe6l1pmetOvQRaRsnM=; b=icgMlJ2cgEr36OP/ooEyiuZRFA
	HxwBYdw8oan3nIPZ6IPFOpQRstNUPn+4A/AJ5POh5pDrwRqCwpl154qgW8CHo4wtpeClSQwrJ2egZ
	1Z/X2lRlZR2WyHYKZxgz+85EYNWGE4lxqDuj6ym5C0KTnlOmur/VNgq1fW5m1vdI14KhRtqeLQ6mZ
	YsxPgbSgBSTBz3qKhyyqdLD57Adj89l5cDrTysvTZggo1ffN5V4bZkuMB0pSqhdSx9pX3+nl9ZUjU
	G6LKiFF8K2y8+KXmPm1/TcYfQHbelolAqjFvnl+SqrNCjkWj/dxncdyKBI87PEIRDR+dB+uZTJfI+
	Umc104hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5Z-0000000AeaT-0RNo;
	Thu, 19 Feb 2026 00:40:17 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5W-0000000AeZ8-3E9w
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 00:40:15 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-413c2977db8so252458fac.3
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Feb 2026 16:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771461613; x=1772066413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BqnEDY5rPm6avb1ZLa7TTBT9hEe6l1pmetOvQRaRsnM=;
        b=u5m2H4xKjekJB7jEDq/z6jh6X+qiM+1j/JSZrOas9961o9z0QGGLTLJFssRpRck32M
         ytlBmeL/q9hAJkCpH8wXfbh8As+oDV8KbcysETectCv3MKE5jDHVPCuOZGathxTQW2YD
         ofFuXLbYrgGyz0/lhdcNDWE2nUpasE1GcmbTnxFl2z3i5lCxyXQKs57X6/suc+Vr4iTS
         wbRqv6a+7pakJ8k0ERau3YAE2lGik8q24+qdcA3S/dINz9iAT1Wodg5O1vYKCv9E6IiB
         //zH4XaNEsJAE/NKvLy0g/pIHx/v4vGmU9YY915VG+PohLPeUwEKlikj4P6TxTYefuVe
         n8pw==
X-Forwarded-Encrypted: i=1; AJvYcCXpIPlujST0hTvUslajBEXwPig8xoYhSoJFya0MUyelgR4DSexhxTa9DyY3DXs90SHz6mhB6zViNPfcBwTiog==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtVLhhpqnosvHOgUIBkieHChpfXCcdTxPQfm0jNIXHICPUNOrm
	b24lfugNZX/nm/ic5OhxEBaR6RjZwO8Fnt6phnJDzIwDzVNBiA02IzCV122yWw==
X-Gm-Gg: AZuq6aJZyYR0gMeXE+rvZbDGRTjj8fxSEm7/E9SDriwh163SLBQR2ZDLI60snQaLM1i
	sdqg7VjtKj5cJ6qwUxSIyvoWvim1PNR1Nzmdft1hb/hj36ARO/zsGPN/mnSkrwnp9SLKrqd6F0B
	i3vVI4TbcEM4OMdfF05Fti41d9G/jOYBbCkxU8ZWLtdbXbYotGmWrZxWraJaT+o0ZudK8Pi2cW8
	i7ghuE9yx9FH4pKlOi2tRm/kekutBq5Wd4HwMSH64CzynjkO7LeIMBXmd7GKdBVb9AhBUrgOsbn
	BtGWc+OW1CZB0RK1BNZrZSYElbaegVir0YZJvvx6LkdXJdgQqa8ovgfCDs3HwbYdL6xDxP+iLQq
	b6nV5w4OCvd2fN8tVD2MdCAKE4021BXFExwR9CCc8Br0QDXYIf4fBb12eeImV6g857QpdaEepF5
	mUgk65017TEueUKRR+oflKIHGuZDlt+6l3S/MZJ9mB5bSkh5A=
X-Received: by 2002:a05:6871:c941:b0:409:60ad:2b1e with SMTP id 586e51a60fabf-41539d180f1mr622220fac.18.1771461613219;
        Wed, 18 Feb 2026 16:40:13 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm23477659fac.1.2026.02.18.16.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 16:40:12 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 02/11] wifi: mt76: mt7921: use mt76_for_each_q_rx() in reset path
Date: Wed, 18 Feb 2026 18:39:58 -0600
Message-ID: <20260219004007.19733-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219004007.19733-1-sean.wang@kernel.org>
References: <20260219004007.19733-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_164014_813734_39440961 
X-CRM114-Status: UNSURE (   8.65  )
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

Replace explicit napi_disable() calls for RX queues with
mt76_for_each_q_rx() in mt7921e_mac_reset().

This removes hardcoded queue indices and disables all configured
RX queues during reset.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
index 5ec084432ae3..0db7acb3a637 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
@@ -71,9 +71,9 @@ int mt7921e_mac_reset(struct mt792x_dev *dev)
 	mt76_txq_schedule_all(&dev->mphy);
 
 	mt76_worker_disable(&dev->mt76.tx_worker);
-	napi_disable(&dev->mt76.napi[MT_RXQ_MAIN]);
-	napi_disable(&dev->mt76.napi[MT_RXQ_MCU]);
-	napi_disable(&dev->mt76.napi[MT_RXQ_MCU_WA]);
+	mt76_for_each_q_rx(&dev->mt76, i) {
+		napi_disable(&dev->mt76.napi[i]);
+	}
 	napi_disable(&dev->mt76.tx_napi);
 
 	mt76_connac2_tx_token_put(&dev->mt76);
-- 
2.43.0


