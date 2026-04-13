Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A34E9380E
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2026 03:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWai8sQZcAy73MJVvJe8OyZCghHwHKCcS0IqPiTlaK0=; b=v/DLQcYnha/Rps+DilzwP/NjOp
	PiS1OQ7Vv85WK++2U8zsg195JLkOYZ90lhHO1/Q5L07C1Q86f0DiQSswU2hgV9KM+0k/jAUwYeJPg
	PcbxbZyZUIKBZaHb0FaaRtJa7YgyJpxwhiMm4Pw4xUjVnOhmP75mWKbZcp+vSgKrw9Te5iQM9TRLJ
	e75x4KYjuD62dGrwp8N6Y2y3+Qizx0Tst/dC47vCwR+avzn7SQL18at9sN7a3qdW6k2U03yTB+en/
	7qwmnK6ZmfLxkCRRXN5vhEAF9pu0kVJ85R+AeDn/Qc8iRj2uC1S7Q+4/uVqCwTloy+JrsnJtr4amt
	J8ENtdOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC83s-0000000Ewju-1ztA;
	Mon, 13 Apr 2026 03:34:08 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC83q-0000000EwjW-0dGU
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Apr 2026 03:34:07 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488b150559bso30565965e9.1
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Apr 2026 20:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776051244; x=1776656044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWai8sQZcAy73MJVvJe8OyZCghHwHKCcS0IqPiTlaK0=;
        b=s6B549p9F1E0HlsmHjxKom6LYSFV/J/yY9ZAS8VFpJu3z4kpoZZMyc04XvPRUiRe9B
         lVx+Me92pGIq+xgC4hkCHJQr6eKVgoFgnQCLuaMoeYNBVosCpi36XMqDTPsb3w7Mkh5i
         49VM4d7eNYquCtT/OPhki1m4tbkQny0eGRrvebV5Ds7oxaj0K+Phq1my9nBP8Yxu10nQ
         ZPC56MSh85/r/jinmipvuo7whmBC+q0VWdRtIkn6/3gG89oxc488hG6sgmC7jExXpnwm
         3eg12sCpTRjj4jA0gF1+JXmB7mfG7oIUQpv2RHVRe2EAh9bUYZMR5lH1Me+qzaYd0cyK
         XxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776051244; x=1776656044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VWai8sQZcAy73MJVvJe8OyZCghHwHKCcS0IqPiTlaK0=;
        b=Krf3vcW2mdYrWeUg4vCj/yxclRwfN9lW+lDvkcWp4sh11eO4HBiWbdKnK007YQKrvB
         LliJGrr76CHXc6y4tzfmkeo69bHvkrKPKipc+qQVrFQ9SpcuEe4sXsYaXkoc37/wifwE
         McF2k/becE1J+M68DNk/ThOy4tS0/cjG5tOT4HL+lqNVe2r3vODjldBGF/X8Ht7aP5MH
         sWE1BCvqHjwc67/fp0m5KL7ea/wFz3zhaN2ClVaxq69JCjeUP6xFhRwL1xxf8NgWMz6I
         wssk2Eg5W4MU/7HBzkDmjmXlZczUEVvWv5QlOcS/H1qIVakF5VeDKntyS0ed3x60xmAq
         9E0g==
X-Gm-Message-State: AOJu0YxfpClxcrIVwCDoeWcdSf4Cu039X0OujO/EFHEdag3mcMjJ1ZFf
	v13mXChjAqPNxdcULmV4znyDCe8kVhUHs0MVt7lsMOEdIcCXVFCuWT/EanNZY9Yo
X-Gm-Gg: AeBDies80qILRxbw5lEHnK8LwuVkoR51GPmDQNCd/AeiUJRmG3h9SF2OkTBGiMJ3tK3
	ylSNTOgLKjtut6WekbhqAtzNfp+TXRD94q53N++1ggILmYpxR6YKJ/HKohqilC7zQDO2Te/SpkZ
	kJaIdaQyB4BpFMzbfVJm05vSSG76oYRiN2t/ZratsE39RHYZSKUOTirUQ2V32qkq4p3ICbvOueD
	kqIvsFiiFWEqKvwOsxDmEnOLw28qtmPKq3MmWMlA0ymQs3OQK3BTbBN/dhH6JIA6LKF+Ornny3J
	iug5OOeCV5soaU+xWQtqQ0dJOrDTMGGbIZ9hHHlwhQlacfCqqyFOBO95jECwaP7G9mDHz10Ovrx
	3z1r/WRrUYHd/cyvAV4jBglv85EiwceiwPgbwGslnTn7e0Kesd6QHFCBUpDdhgsCZCkn727zelk
	eUxaelnFOkjTlFzhK62SpM//fDiPgnkDr643JVtXi5jRU9I9WluIc=
X-Received: by 2002:a05:600c:64cd:b0:485:3cf3:1010 with SMTP id 5b1f17b1804b1-488d67df592mr163123525e9.2.1776051244197;
        Sun, 12 Apr 2026 20:34:04 -0700 (PDT)
Received: from localhost.localdomain ([87.71.34.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d6ee98sm114039175e9.1.2026.04.12.20.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 20:34:03 -0700 (PDT)
From: Aviel Zohar <avielzohar123@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	lorenzo@kernel.org,
	sean.wang@mediatek.com,
	ryder.lee@mediatek.com,
	Aviel Zohar <avielzohar123@gmail.com>
Subject: [PATCH 2/2] wifi: mt76: mt7915: validate skb length in txpower SKU query
Date: Mon, 13 Apr 2026 06:31:35 +0300
Message-ID: <20260413033136.5417-3-avielzohar123@gmail.com>
X-Mailer: git-send-email 2.47.0.windows.1
In-Reply-To: <20260413033136.5417-1-avielzohar123@gmail.com>
References: <20260413033136.5417-1-avielzohar123@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_203406_193390_F28825EB 
X-CRM114-Status: GOOD (  10.49  )
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

In mt7915_mcu_get_txpower_sku(), the response skb from
mt76_mcu_send_and_get_msg() is used in memcpy without validating
its length:

For TX_POWER_INFO_RATE:
  memcpy(res, skb->data + 4, sizeof(res));

where sizeof(res) is MT7915_SKU_RATE_NUM * 2 = 322 bytes.

For TX_POWER_INFO_PATH:
  memcpy(txpower, skb->data + 4, len);

In both cases, if the firmware returns a response shorter than
the expected size, the memcpy reads beyond the skb data buffer.
The data surfaces to userspace via debugfs (txpower_sku and
txpower_path).

Add length checks for both code paths before the memcpy.

Signed-off-by: Aviel Zohar <avielzohar123@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3532,10 +3532,18 @@
 	if (category == TX_POWER_INFO_RATE) {
 		s8 res[MT7915_SKU_RATE_NUM][2];
 
+		if (skb->len < sizeof(res) + 4) {
+			dev_kfree_skb(skb);
+			return -EINVAL;
+		}
 		memcpy(res, skb->data + 4, sizeof(res));
 		for (i = 0; i < len; i++)
 			txpower[i] = res[i][req.band_idx];
 	} else if (category == TX_POWER_INFO_PATH) {
+		if (skb->len < len + 4) {
+			dev_kfree_skb(skb);
+			return -EINVAL;
+		}
 		memcpy(txpower, skb->data + 4, len);
 	}

