Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D79D47CA4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmoSCGQL2mRlPPuo0uD512LAshqRjYzmZB3+T0TG3ug=; b=EdFqlhxzbNfkzde66k1tujrbyv
	JbzN+5PyBewSYsxJOco2B7fdI9Loqdd4mLa1Ldf+T5QKTv3c2qmiFchXEmu0f+7PKAfuqyhJyK1Nn
	Xmh1f7e1kS95FkYCeziB8OhhDtn4BlDFsaJowSakUYx0GJD82UXgUkqx4An/GtLxaPWeBNOqUKHhX
	COEzrRoLTvByfw+Bix2ma7/HhB76R2cGULw8UwqpACf+ImJXC/KrBO/USPrHVs39SJW4B2woel8OH
	J3ses+BFdHGgWIBvBGeUtJw0PJYZnpqxlS69e36RePnionMiBpizLKNLOTdE3FOLbNxAdGRqx27t4
	O542D16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHf-0000000DOfF-0Fp3;
	Fri, 16 Jan 2026 01:05:51 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHW-0000000DOWl-20E0
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:43 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2ae5af476e1so771732eec.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525541; x=1769130341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmoSCGQL2mRlPPuo0uD512LAshqRjYzmZB3+T0TG3ug=;
        b=I5RS0pqCAQhvtsfhKi3eydjJwghZcN6x68B63Gl7fw+OUr2c39eJddS9Qo208ekwHn
         enkZ1v+I4JfLdoWVW9ti53ZZzbdnw+vOFEBIc/mKw2i9faJWgesYvw29vlywN6GDrXcL
         mOPWlojs/+pot/rIo11DGWvz2WkyVMrjpnwWrkEUokigi4Y45jGIFXNe3T4oGSBwSIfB
         mPZ7hhqEoI/sSA6PGoHKbovj0qsy+6arwqNckX8fPNnvn7gJY/37IWAi8Mm0QJVWH1kP
         X/iyLVNBJSoZV2FnmwyzavBfM6xDlgPJ3McOPSmG7AYl8Otc9hUYmwaY4v9Jl66tuvcQ
         lXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525541; x=1769130341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SmoSCGQL2mRlPPuo0uD512LAshqRjYzmZB3+T0TG3ug=;
        b=irv5ts4U7Eb1RTJJElSeRQyWPVhxNdsAPrMmgDedw5PUNuyr8NvMPq0Nt0TTUKWgnR
         KNGTP+0+SOjawbFBCzpkrkE7kkjRtRQIkURIUcYRGd5x9n5sOUcNHadQ3OewrCssh6Ws
         ifhh9wQZi+fwKTsuS/IE13J7FdKWJgR95VMZcLcF3qT7yrVUxIitbO/Oi5vNdTBV/tRY
         Zu+TVEXmxrQL+0W+oGUAQ46TcLpkZcZpoaqiOM+UyU7ThUaom6X8u+6VHTtHTw4g9awG
         WevILkQQ4hxtV/gVo303T4zaF1EFHCOqWZ87zKYWl9JHmRtxcX3MEhsM5btg42xZ0CXX
         bM3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaACeYuinkHuW3xW8XpSx/5T5yH1itCm1Gy3IEPFTKxLBXKSfdHaIwmpPPWLkijx5L+TIBz8+QzBsyprqZ6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoDHoM1wgCLOFxgcwEyqeiUh3Y9e/7MXXHtECp3eAruj0vTMf8
	CctA0WFENXxeUVk3kh4njhVZtR8oEMh1tulLY2tZXvvYIaPPP3yj5zVE
X-Gm-Gg: AY/fxX6+GXJhyb5OQGQh4klxiuikwtwL2KLUtAkfQVPW/oNrkK7QAgjc/HKQYJkej+Y
	H+IUpS88Kl5WkLQwRRVNYadpdY226KfeF5lWntkAROeWm+/HzCPuPtwWUumf9BTv8ke77s476Rd
	p/xzavctrzkCx03vD4gJ8cDkwxCCN+k62xOD6BhO7mLGd3L747FqqlQPtUOK0L0CsycLRIUMRlZ
	PbSKEIs9f/B67A0Ue5q1LaWNLo6XpcJJSX5+9bylQmk0H7YQKIqAWYa/1xeGXOwtq6oHKy15FO6
	JsqJ72TKS1RsBpxM4wNBe/+ty1Bqtd2vuu6my3QEGZld4hIOm6fXxR+XGy4bBAhTm19FuXHS8px
	A3LYUEtL80M228DWtf9NAKTKLHZ9dBLrjMW4EC6+eD9+AF38xiIuDxjThkNpuJVZ/rIltRiYS/G
	717oMeVsDjFKhgRz/mRRFUrmRn+qZgj+L8LCYRmZCetj/xXQ/iCv9Ppzrw6o3whA==
X-Received: by 2002:a05:7300:5353:b0:2ab:f490:79f9 with SMTP id 5a478bee46e88-2b6b35a1060mr1657052eec.21.1768525540952;
        Thu, 15 Jan 2026 17:05:40 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:40 -0800 (PST)
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
	Zac Bowling <zbowling@gmail.com>,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH v4 12/21] wifi: mt76: mt7925: fix key removal failure during MLO roaming
Date: Thu, 15 Jan 2026 17:05:10 -0800
Message-ID: <20260116010519.37001-13-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170542_521492_33BAE110 
X-CRM114-Status: GOOD (  12.78  )
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

From: Zac Bowling <zbowling@gmail.com>

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
index 852cf8ff84..7cf6faa1f6 100644
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
2.52.0


