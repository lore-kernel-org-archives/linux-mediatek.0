Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EBEC2A073
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 00:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XH+kUxxNmkYGglYPogPQvwZMB6lkd5MT/5/E1Mc/8s0=; b=LPxXbq9kbtU/p7f/2dQRi7IO5m
	RjuPCugwT/jxZ1T/H3QfzRm/QHwDDrlerVMvEosYlCg8GgMy3tWlQZC3XVFflj6zJoCjwFYKzAiAY
	tey6fzlXZf/V7YXNtZ3wwRK3iBASmFurxCVpGDXvTojoEG/TvvlUH4mA7Y4itIF/87YZ9dZ8Tu3rr
	C3QT7RPYUcWW1WZqX5HlBxLTPt/sMwKmHFIU2wCUVyRHpOSmcVISobuwh/MYEwLzwx/oxp///MEnZ
	l9lWvafNYLh0yxh1MCBb0dma8Dyzkq7B3XMmuIMoiilq8LbZW87OkYSUFdIx7utzy640tstJAnwYl
	3p3GifMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYRB-0000000Aa5u-0rjh;
	Mon, 05 Jan 2026 00:27:09 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYR6-0000000AZzl-20a5
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 00:27:05 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so13871446b3a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 16:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767572824; x=1768177624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XH+kUxxNmkYGglYPogPQvwZMB6lkd5MT/5/E1Mc/8s0=;
        b=Omkn+OJ0i8MeJYDGKXpBC/vo1SAEYyzpV463IaIjBmfOSms8Fav8hXiZd280dtbR0O
         qUCGRg2cVKAhHIMFjoSYNskUnSa8U712l0EN5CqLM5WxJaEasyu20xtKH7t2d6ELWJBw
         sMpAXw3vkKZuAXvPSekQx2WF3hXls26QPqjwnkyXYVE8RmpLXUPSjZz2DEXDo9PIaKdK
         zFyk3ALneYKZvB3V3oXB1Z/8RB7E6bFVr8xCPBh0vqRnhQOb9Ak8asHcwFAb9oEICKdd
         qD3gTWvy93dEAcuMpiSPNyIRVHLCnT+dZEryMZr2C8apmcVsFi58neFn7YDePQBURsfY
         TvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767572824; x=1768177624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XH+kUxxNmkYGglYPogPQvwZMB6lkd5MT/5/E1Mc/8s0=;
        b=m0S6yQk/SP1tEuViYE9o8I6zI9anR7JkCu8EexpdjEfJ5i3DKmchD0BOeQore3hZ5x
         tBZegsqbiBUhX/hlvv/gHkYwAiu5zVuPhywEoXFnlS14Wy4os/8A7onm82sVtSDscpmx
         ivqFVLGfR2mjdu/xv7iNVUFsoZPSG136NX95ARgSr890/ATIvbxYBbKJFMT5vt8crCY+
         7hrv3to6SipVfufiB9y1EwLcHGRquNm4M3WF2xH0KYHbQyZXGwIwY7HcJDiAe56WBgwn
         sMAogTzALbcxKXVXH9dGcaq/BJHQ5U+vjcnP75bZv31Oph9ZAhHjNVvCFKfHdO94gaFS
         mTwg==
X-Forwarded-Encrypted: i=1; AJvYcCUBkOGdtAnKtUIq2HmCrPmOdg6v1anjOmhhLBopLObWYgeKTl+Yd5FM/CJmk378j3LJwVMo5IrA1aPG2HXdLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJEfxQ/lp9QuzXboA7E0SpvTZ6sdrMwlapHOOwdsk6NkCuhIMx
	lq9OX9EglSOTIBiaVCSnpfDVEPAjOPyxFfjmzDWq4Z6J/LwPgzd+O3yDBn9Wh4Am
X-Gm-Gg: AY/fxX7sGpk+ETEcMZxctTe3v/dYI+yHdyUs4QRSY2DkNsPnIyUj5v1MstSsJvU2MAU
	mt40jxhXtXH/B7iqy7/Amr5RsysntlbCJ8FGMh4q8s6sCQRfkwLEcTO1Mu7mtgBFg+6on3P5rVQ
	1euX/bMOMnqoZQ7sQdO/jXCn/1U9ohr68KmJr5klLF9eWOMtF0RDgQTk9hGsyVhkILpLzxAVvUF
	CB/zyCtpJ8tmnAKgVkaorKjD3/UjXTszyk5vNc+pRTsqW6KxrYBRlhoJN47wr5hxhthMsxfvHN3
	oqynO8HguA61IVHZkfth4C6VeGSxZMgKM/QoYwPSwz0w56+TVQ7gU52TaAzg4iCp5dy83AUfcVT
	mLhWlsAmTe30HK0L2Y8CE+6lzDcCXS3xYxNHFD+P9wNiwE1qfr0mHV26rDXC3vIRzywBVxEKzA1
	thUd/YQaBaxw0yhsI/5j8mvqg8UEoPTewYs96p0evQoxAnDGC0/7K/onnYamlnkKfPlcETqLU6D
	Q==
X-Google-Smtp-Source: AGHT+IHlVitLt85bPnu8RzuCU7BAPGF8BkeHdJkRJzJ94cVKx159KPw5GrT2Tq1B7JMG8uWETW358Q==
X-Received: by 2002:a05:7022:370f:b0:11a:b04b:3c2e with SMTP id a92af1059eb24-121722f3affmr27965097c88.29.1767572823527;
        Sun, 04 Jan 2026 16:27:03 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm133378109c88.8.2026.01.04.16.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:27:03 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: zbowling@gmail.com
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com
Subject: [PATCH 12/17] wifi: mt76: mt7925: fix key removal failure during MLO roaming
Date: Sun,  4 Jan 2026 16:26:33 -0800
Message-ID: <20260105002638.668723-13-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105002638.668723-1-zbowling@gmail.com>
References: <20260102200524.290779-1-zbowling@gmail.com>
 <20260105002638.668723-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_162704_532875_36981B41 
X-CRM114-Status: GOOD (  12.87  )
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

During MLO roaming, mac80211 may request key removal after the link state
has already been torn down. The current code returns -EINVAL when
link_conf, mconf, or mlink is NULL, causing 'failed to remove key from
hardware (-22)' errors in the kernel log.

This is a race condition where:
1. MLO link teardown begins, cleaning up driver state
2. mac80211 requests group key removal for the old link
3. mt792x_vif_to_bss_conf() or related functions return NULL
4. Driver returns -EINVAL, confusing upper layers

Observed kernel log errors during roaming:
  wlp192s0: failed to remove key (1, ff:ff:ff:ff:ff:ff) from hardware (-22)
  wlp192s0: failed to remove key (4, ff:ff:ff:ff:ff:ff) from hardware (-22)

And associated wpa_supplicant warnings:
  nl80211: kernel reports: link ID must for MLO group key

The fix: When removing a key (cmd != SET_KEY), if the link state is
already gone, return success (0) instead of error. The key is effectively
removed when the link was torn down.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Reported-by: Zac Bowling <zac@zacbowling.com>
Tested-by: Zac Bowling <zac@zacbowling.com>
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 852cf8ff842f..7cf6faa1f6f4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -605,8 +605,15 @@ static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	mconf = mt792x_vif_to_link(mvif, link_id);
 	mlink = mt792x_sta_to_link(msta, link_id);
 
-	if (!link_conf || !mconf || !mlink)
+	if (!link_conf || !mconf || !mlink) {
+		/* During MLO roaming, link state may be torn down before
+		 * mac80211 requests key removal. If removing a key and
+		 * the link is already gone, consider it successfully removed.
+		 */
+		if (cmd != SET_KEY)
+			return 0;
 		return -EINVAL;
+	}
 
 	wcid = &mlink->wcid;
 	wcid_keyidx = &wcid->hw_key_idx;
-- 
2.51.0


