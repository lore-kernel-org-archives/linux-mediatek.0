Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D3FC5DF81
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 19:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50u75fL6ptaG9Rq88Gv3OLx35FZRL72ZpUeu9/HT7x4=; b=lpj4uKVbpI+ln2v7d3TMpgBMyw
	crxwvqGdn443R+bHetDnV5AYPmyTLQQm3kEAptRkWjyr8EMNQMbwDb1yD/wH9+UFfqG5EAEalljxW
	iz0FfPWBBfAhabUnIZSpF45kSEbcKEhzjUigX6+8SwMjg0GNzVSnkn9jBXdR6niYJ3t2p+UO2/3tb
	ZelqQHWfuMQGHdq9bG7ZGxa4Wvj662yiRheMlucnKycC591jJJeOME7k4B63/daolXBmoSpj4Kaqj
	EI/ymsH7dfW7bc+s/zT1oLCjB0YMDKhwF+rve/c4A8twA1EPNvPc/dWZqbzxgIl1iYaooATRo6Zo9
	t2FsdbRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajN-0000000HKSO-3wgj;
	Mon, 24 Aug 2026 19:53:17 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajL-0000000HKQd-1yTp
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 19:53:16 +0000
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso3675337a34.1
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 12:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601194; x=1788205994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=50u75fL6ptaG9Rq88Gv3OLx35FZRL72ZpUeu9/HT7x4=;
        b=kQx/7LTsIumgEhETU90zuLDMHSsiKg6ixkS0BO7h5Sb9T/fJdqh0WJhy3gAf53psLK
         2ozl4KMzVsjiurUH0Qx4NL12z6NMejqy2ozXHuotL0jMETK6/f0kE2M0oLLHSiHr9+fn
         FF9bzpX65JqRQ7q64pTU45Xvx8gcZ8YqFJi4iqA6bo2by/Zl7uuPDf3GMjGxmy93NjGu
         bKdKETPs5OWl4ZWMSSwUtM9jbYDMmJ9PogywxbXRGpzdRFlSKhxV2Ob8IOmHXpyDx3Xx
         2jQ3wQeDgkEWjbHEAevAmPYs7kvpjGZHo5Ut6ZdCd4ES5AH7w7d8Es3llPCenMmyJ2c3
         9l2A==
X-Forwarded-Encrypted: i=1; AHgh+RpdUEW5WDsE57WhpvIQdT2EURiVddh1cvmJ3s6v7AQRpNEVfWbD+oLgVsINUXJ4R/CB9T41i3c/feBagB0T+g==@lists.infradead.org
X-Gm-Message-State: AFuF++nsgBMXPHkAWeHv5dsCxuAejdT1toA+XkO3f20DZw0zS5i6cDvy
	9ZnGkxwjnsbGDY5YVTKrdqx98q8QkDfbf7D+mUxZhoZoiFvWx4psaece
X-Gm-Gg: AR+sD13JokoHuXOD0BZIND+jH/sNDaCF1NdPEbMR66eXkp6rKPK9tKWzkC0I8qykRvq
	o6Toy9j/Nm51kwogn4744LvXtH04/2Rhl4gWCDEYDIwxth/7hZX1jY3KWjhwzy1Nafub6VZiHzD
	WA9tyuZgzoo1fBFySgKFmMp3eS8jAsug/EHGmPEG1YAc9g2qCzIbG3OeR4erLcByqBh5ScSwg33
	1UTkkFptv+SElw9RfE1dEUwKfdI9mtCGbURTmwUnWCN//SPXMfbH/SuwABXdFiblVh7rn2raLit
	tcsd6hS9rqAAa2mqoQpreVrztmFXWfsdW7/s9+lAGIRv8Zhh+jnUQdso0Y+iQgllprZ9ZnvNJbe
	qf6EVFrQuE+BlA6wAAKziQ1xxIZc3YQ/BxGr8JYTzK8+3WdhmC2zGI6mIc+fwTkuXx5JpgRK8Jx
	bv//PMqeSIPgMd4X8aisDf+ScURAXMBjWXM+RcvYlB+bSYDEQKLJEHujiGZQ4xUkjszkX7e4iql
	8Yndj3JQclkLe+xvx+qLaWSd/CFwcsji18tvBy5FuLx
X-Received: by 2002:a05:6820:f030:b0:6ae:774d:45ab with SMTP id 006d021491bc7-6b19048e8f4mr886552eaf.27.1787601193943;
        Mon, 24 Aug 2026 12:53:13 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-463835bcdcbsm5805896fac.18.2026.08.24.12.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:53:13 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 06/15] wifi: mt76: mt7925: drop deferred NAN local schedule update handling
Date: Mon, 24 Aug 2026 14:52:18 -0500
Message-ID: <20260824195227.12589-7-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824195227.12589-1-sean.wang@kernel.org>
References: <20260824195227.12589-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_125315_515664_CFA1C54D 
X-CRM114-Status: UNSURE (   9.60  )
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

From: Stella Liu <yu-ching.liu@mediatek.com>

The deferred NAN local schedule update path in
mt7925_nan_local_sched_changed() is removed for now; it will be
implemented separately. Drop the now set-but-unused ret variable
along with it.

Fixes: 0f3605e4f8de ("wifi: mt76: mt7925: wire up NAN operations")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/nan.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 5c6598a0f3b6..e6d6af4fc681 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -602,15 +602,12 @@ void mt7925_nan_local_sched_changed(struct mt792x_dev *dev,
 {
 	struct mt7925_nan_common_hdr *hdr;
 	struct mt76_dev *mdev;
-	bool deferred;
 	struct sk_buff *skb;
-	int ret = -ENOMEM;
 
 	if (!dev || !vif)
 		return;
 
 	mdev = &dev->mt76;
-	deferred = vif->cfg.nan_sched.deferred;
 
 	mt792x_mutex_acquire(dev);
 
@@ -627,19 +624,9 @@ void mt7925_nan_local_sched_changed(struct mt792x_dev *dev,
 		goto out;
 	}
 
-	ret = mt76_mcu_skb_send_msg(mdev, skb,
-				    MCU_UNI_CMD(NAN), true);
+	mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(NAN), true);
 out:
 	mt792x_mutex_release(dev);
-
-	if (deferred) {
-		if (ret)
-			dev_err(mdev->dev,
-				"NAN: local schedule update failed: %d\n",
-				ret);
-
-		ieee80211_nan_sched_update_done(vif);
-	}
 }
 
 static int mt7925_nan_peer_rec_tlv(struct sk_buff *skb,
-- 
2.43.0


