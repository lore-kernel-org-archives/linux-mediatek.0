Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF8BD47CAF
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewdMOqZu09vzVANg46kFx4cCu4Abbaa2QyPG4SOmwEs=; b=A6a4d3bp55zKOxnnq4ninos4r6
	er/qIdHRx8MWrHO9kLLN1Mr92sSwvSiPtNdwEWg3d4y61z1R8envFF7CLQCLWzYOu3PMbxxlJisSa
	Ftr6m5pJeq2sanv6W7p37mAHBnFJAiYFdQ+5DeXRB2Iv0E05ucu+6HWF5nBbRVBftA59P39djM652
	0ud6+0jxHIEXRyLOBX5wxqEO+VHNNxc4TRAejQsRiBBuJh+PrFGnpHAaOPzzzkGjlhNlMDftL0W97
	1LmEgwmWX3wEEcVr5O5I6I1TmElAaU2hGeQbCtmE1eJVU4ggOsTFhHhNI5L08Z1NHIPHy6alW9lUf
	TVQXxefQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHr-0000000DOos-1dbA;
	Fri, 16 Jan 2026 01:06:03 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHh-0000000DOjT-3kLv
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:55 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2ae2eb49b4bso3305616eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525553; x=1769130353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewdMOqZu09vzVANg46kFx4cCu4Abbaa2QyPG4SOmwEs=;
        b=BXhk2/xMMNfv2noZgc2YoM8anHNVAgQGkxgz978hjuKLOEGDzDN0jQgL7fwmoP4DrK
         Eb9wNMJA9RPxiZ/Hvu+C2P42eHV0mSK0bej+MqYSzZe1qOFXvAB7rMzVU9gTyqDhe04s
         vpuibvH0Wqpubk5+sDABt0vq3mZj6tJWvOj6Eaouu4qXceHomhWPwlK2FVBHxG9jobX5
         14QvTCe932F70j7k89AQjPFsxw+sU9NcA/IyR50abIVVfcE1xBNWmJY9NcvR0eThRCxF
         +nop4XS7jdBqiKKBwwWR2DNcfa4ljMLgKn93vsX/TS01Giw4gLb74rEb9Ji+l2rywR7d
         NmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525553; x=1769130353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ewdMOqZu09vzVANg46kFx4cCu4Abbaa2QyPG4SOmwEs=;
        b=ritwyjlpaw/25gE8OpKh9xN5bQXMK/TMw1dH0y7l3pN5n2kxmRPWZraJrEYHrUxMtB
         tl+npDw5GfVD1LBpaVzF2hWkiVutNmZ0qsnpkNo3LMotkZv1nbQ0uqe5A84AVOfT95ey
         A3w2QDfGjL4zP/G30rd83q0769xABs4JwHJSxQUI98YNfxJQro1apzHdKn5YiWHKGNKg
         EM/sKEWjduOeoK7IKXyBIWeObay1PHUi3tzyEO0jJvZrHbPytMMRCk9Uk5H6xSPy7YIY
         pGgF28ZGAhR9EJMP83a5w+lSnUsuHLFDEIb5+dnx2/CBv9KvNah4D6Oek4ZQZepuATW3
         e31w==
X-Forwarded-Encrypted: i=1; AJvYcCUoFF9tfnPg083XaDw1JTHhGJW6ze2dGMHg2hnhD9GbhQgN1EY6gTom0O9cXHtJGQRF1Fj0QXPsl/2GAsu6Iw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo21Qri5AerrjL2Efsf83oFfH2EFuOwOAEFfIumeyts46k/eaC
	TwtXbkXKHf85wxqvZRNnhvmiY5MViLjG7CqvzrQMOmxbbcwpFj+5IZ/s
X-Gm-Gg: AY/fxX5bL3G/y4kUrp680hIxb1ZNMBaAIaOPy2SCZD95Tpp2sypGenumFYULYjzH2a9
	ZTjdSQu55xEH/UVWZumsGRfa5+/nKXp38+5TyIf9t370H4VHDGwEcpG4h0ngykmI3Red2P64gZs
	FWLpkzlLgv3T3IXYg6N63Pge46+hyf9ljanTWaZoFmFoWbCwsWaqU5KAU18q69+NnMHzp7hVdxz
	8uc/EssPOtG4iNqR8FETCHeN1YHwgPhozSsbewAt9B1t18Q10zCY0AqLbhCsemFGc1HBJA2wkkm
	1D+U+AYq0vl89LEJrvx7ooPnP5O1eoB/6oAARGLgBRfeot4UZ2DVPeP9Kx5iJj8N0JfHTy5kAZ8
	/8+gqZL2ixfP62zUbY1calg1kvReo4psEK5ALpeTc8zVloCE6KDeP0dVniPb3jYC6laldpKEWMJ
	jbf0kvowf9p9o7H1+eMRISUVYSfaS5mwqLlZGxGAYQ+h5dotPjFvMypKx6Tn3Yv50/zhJRYYlq
X-Received: by 2002:a05:7301:1e90:b0:2ae:5020:afe1 with SMTP id 5a478bee46e88-2b6b402c47amr1281429eec.14.1768525552939;
        Thu, 15 Jan 2026 17:05:52 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:52 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	linux@frame.work,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	Zac <zac@zacbowling.com>,
	Zac Bowling <zbowling@gmail.com>
Subject: [PATCH v4 20/21] wifi: mt76: fix list corruption in mt76_wcid_cleanup
Date: Thu, 15 Jan 2026 17:05:18 -0800
Message-ID: <20260116010519.37001-21-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170553_936193_DB8CA8DD 
X-CRM114-Status: UNSURE (   9.49  )
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

mt76_wcid_cleanup() was not removing wcid entries from sta_poll_list
before mt76_reset_device() reinitializes the master list. This leaves
stale pointers in wcid->poll_list, causing list corruption when
mt76_wcid_add_poll() later checks list_empty() and tries to add the
entry back.

The fix adds proper cleanup of poll_list in mt76_wcid_cleanup(),
matching how tx_list is already handled. This is similar to what
mt7996_mac_sta_deinit_link() already does correctly.

Fixes list corruption warnings like:
  list_add corruption. prev->next should be next (ffffffff...)

Signed-off-by: Zac Bowling <zbowling@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 75772979f4..d0c522909e 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1716,6 +1716,16 @@ void mt76_wcid_cleanup(struct mt76_dev *dev, struct mt76_wcid *wcid)
 
 	idr_destroy(&wcid->pktid);
 
+	/* Remove from sta_poll_list to prevent list corruption after reset.
+	 * Without this, mt76_reset_device() reinitializes sta_poll_list but
+	 * leaves wcid->poll_list with stale pointers, causing list corruption
+	 * when mt76_wcid_add_poll() checks list_empty().
+	 */
+	spin_lock_bh(&dev->sta_poll_lock);
+	if (!list_empty(&wcid->poll_list))
+		list_del_init(&wcid->poll_list);
+	spin_unlock_bh(&dev->sta_poll_lock);
+
 	spin_lock_bh(&phy->tx_lock);
 
 	if (!list_empty(&wcid->tx_list))
-- 
2.52.0


