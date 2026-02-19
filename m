Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA3FC531E7
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 23:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XOpRViDdy95oUvtjIbD1yNnLGcXCFi8ZfYmxd9/IW/Q=; b=4IoBagmtmGCTGALIIWmw2T2/dS
	aedTdfaJ53JfZNeC5L/bqCueO/eEE+tqRSE0DPtNid/+FotT4GrL8uxLxan55tc7V/S1HxQSpXZi8
	6OB6Ce0a4vjauWKQWNrog5Mc3QRTPBW/aUcahCTGeWeWhY62+PEvD3OR4vrLaDZ2PFmyjSGr/1rKz
	JgwRA7mgaNM4Swe2dSNalLH/2hszGWRCZdgJYJwa3z5YkkYokMr2Rh621bbhwUrh1JcnNXWnTzPtX
	6GHM9U59hdmWvFleN6zfjvGCPRZz1nXZxPI+Y16k/NaYiJ5SFbGiO47B725rTBfxWs0lV3Se3Bvxl
	JBOMDu0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtDG8-0000000CRwy-30Rs;
	Thu, 19 Feb 2026 23:16:36 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtDG6-0000000CRtw-1Ykf
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 23:16:35 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-40ee486a76eso931103fac.2
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Feb 2026 15:16:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771542993; x=1772147793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOpRViDdy95oUvtjIbD1yNnLGcXCFi8ZfYmxd9/IW/Q=;
        b=opIQ1YN+8SDLqYXh92KVEn9WDanVXk6VFBlLcRI8trBldeDsGVVonmIU+X+PvmSHt3
         OockwlJCK4nLWKL4XW/rhIYzTx6SkJOPGUku0rsqtzLW7UW0wbb2XhNi9jpyyP7Ghz/L
         jK2Y/WXFgzGYwmC7wcHGt2tHJ42mPQHrNAQz2KYcnoEX8+DSDDHrmobAESL5NNfV6t8r
         z37zuBqZc2nVBT1LwmZzEoLkQTVzEKYK8rF0zKpp1gFG+P+Wxl66MgkpDxYkw/69r6k6
         auWFpWMy9GlIu3MHVjUYGds+Gwd3Gkyi7IOrBJEbvtKjg0Ww8pnwZxat0PuwBEXJlRdT
         2nlw==
X-Forwarded-Encrypted: i=1; AJvYcCVYKCf8KDKrMsQ+Z/qcVR0JkByJ37qvMPSH6z/B0gHEYk2iN0kZHOvUkVXZNklw659Stmb57QED9qgR4oECjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNLn4OwacWFidck4UJZLrYJRJL3piFSTclxp/UBXBLLmyuvWan
	kt9VhY00+iuFxlXIoK248AXBB2kkFzLSf5/rMI6HFFGdKNPwtc6lBU+tSe7n7A==
X-Gm-Gg: AZuq6aK5qUB6lhP93m4S+rpCwTEdyqFKICnRtCPqoSvpfC2zQNfpH3JTNxilwz+tlFH
	nj90lF7vD6jfzJerDZMpJrBp1toeTgSBoqzdknRxT8RpgVUvbZwBf4NRIC2uXDoALj84c5v75GL
	y7u5nyOjyR1U87io5Simc7LOvLi/YyIsgtyR9kJbI0B+4aoVT3O1s3bF+aRU2e5ZRJL5Vgq9ak8
	00svy0ILSRUq26sUjUCT2v/ClfKAC4Ahfr+VX03+06iSEuKweVyZdFs+QY4wwmHAPPEVVkhGR52
	g/IH8eayp5BzGwSZfdDutAkmdgDcdBRNKD8CQRIdrdgMCOjPuGeiyGC3yVOs2sASFmvD3ChcOt5
	/Fj90uULhNTXHBD4nsasMTG+XZ78W4tdUpcZfcRv1ZIY2ZXnOcfyqg95EWcdt53+6I0+rsbinY2
	ggfr1LYgV+9ruywd4S16KPtenMKbRAltDVgep0MfirBeETf8s=
X-Received: by 2002:a05:6870:1405:b0:40e:9550:3242 with SMTP id 586e51a60fabf-40eeea800famr13275159fac.16.1771542992946;
        Thu, 19 Feb 2026 15:16:32 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm26719644fac.1.2026.02.19.15.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 15:16:32 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 1/4] mmc: sdio: add MediaTek MT7902 SDIO device ID
Date: Thu, 19 Feb 2026 17:16:21 -0600
Message-ID: <20260219231624.8226-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_151634_414555_3031D544 
X-CRM114-Status: UNSURE (   7.65  )
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

Add SDIO device ID (0x790a) for MediaTek MT7902 to sdio_ids.h.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 include/linux/mmc/sdio_ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mmc/sdio_ids.h b/include/linux/mmc/sdio_ids.h
index 673cbdf43453..97cc834fb3d5 100644
--- a/include/linux/mmc/sdio_ids.h
+++ b/include/linux/mmc/sdio_ids.h
@@ -112,6 +112,7 @@
 #define SDIO_DEVICE_ID_MEDIATEK_MT7663		0x7663
 #define SDIO_DEVICE_ID_MEDIATEK_MT7668		0x7668
 #define SDIO_DEVICE_ID_MEDIATEK_MT7961		0x7961
+#define SDIO_DEVICE_ID_MEDIATEK_MT7902		0x790a
 
 #define SDIO_VENDOR_ID_MICROCHIP_WILC		0x0296
 #define SDIO_DEVICE_ID_MICROCHIP_WILC1000	0x5347
-- 
2.43.0


