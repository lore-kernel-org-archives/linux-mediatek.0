Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CC6C5B572
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 07:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DDeFtTnxMBvDDeM+UXcBJoOG/+TlVBVJ2Mo0e9wRHls=; b=ogua3wXXW8o8RnXz+Kuzqb+dit
	80/V1ie/p9SdwR6/KPe/K0Xtl/a4Hvx54sstfPM4T3+w3Wv+tj2XRrQU3LwUesMQV7th4lbvOC7uK
	XkY+G+h85dAmO9jf8Dnk3qi3nmGAjaYSdWTKVNRrCbmb564LWMpWcwVm6ugQai7ZcFJihf3h1Itl5
	rGDNCIxBLnP4J+8qOr4YKRQrYV98iTpkXbeNRh9y3ZYajdVlTKpRoM5+PhRWH92ADAocPfu0g47qB
	RYD8MxtT8XAI+RdhqB0AScIyr7mk5UR4iAgZXVQvDTg2kl24W6dw93OKMNHaHJANTiz5I+zWq5qDZ
	v6Ox6BIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvs7i-00000005bFJ-1k5i;
	Mon, 17 Aug 2026 07:51:10 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvs7e-00000005bEB-32Ac
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 07:51:09 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49954b88fffso34424755e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 00:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786953063; x=1787557863; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDeFtTnxMBvDDeM+UXcBJoOG/+TlVBVJ2Mo0e9wRHls=;
        b=laHDzsSrq40dRqeTMQZeopZxOyY5HvOsQ2JPnk0cZyMAOCRL/mfXQcep/U3SmcUV+g
         IoOwETgH43d3g6/sF/LAgoHD7/h+3wcfHtVVEegUB17IZbKqIBr06jHSGri4cfTrraWL
         33B1/V/QPFcUi1KZlxUYXDlcWD6IFaSjPAw/OH4oSpIRHg1ZhVW76C1FhCg7eMZ/y3Mf
         lPcp/5N14txq3mPXm2Kzs2ZWgzK4oka45yb4tFrvUGCDWWiegy+rWrYsd3XqoF8sBSOL
         lFjIXPYS9gWLNsg0LKF4xXRlUm0UujgUR1F/5Ki4mFA8I6uTmJP6L9bSK/o0yZDY2Qve
         LJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953063; x=1787557863;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DDeFtTnxMBvDDeM+UXcBJoOG/+TlVBVJ2Mo0e9wRHls=;
        b=Wam3l1nxaQ1f4j5aoSTzYZLEx1MRpwULidJak5ssM53+nXCG4hxsZAZo1LExiKPnfy
         tz23+JDgCOrKTgMiaL08IkPoOmvl1qmDglQBVVmGoRR3cXrX3IDIznpq5u5DFiQhACrN
         BsyHZnbVHgEiYakkM3Fz/ZwGKkxbj/bwvPyf1snejBh4H9bMljYDbvpL8ats78mvxIEU
         hANgv3y2YK1NWVI4l2FwnmwkNYlkZw53cP8+/tH81/jD1dEp1MRrj9zg41qh0Uyrsaf5
         KzBqGET5AThwpAXrtWVUWo0WBT91EybbaXhwN5AifeOuIqwBBktEiKz106UkrQdns91Q
         pXPQ==
X-Forwarded-Encrypted: i=1; AHgh+RojEYUsio9G/kAvhbNLts02qqdWCZVqDk4e8aLTPIcqvR+hi1cEj8uPxlISNSkH/UmE49dBklqmHhqWwdSBaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfgbkTfACZbT289vd/efeEX8DhLC6S3kqJ0tZOClIoxRNc3S6D
	RLk59XkYtbImzKUUq34d/hYJvFC/JmE9iGRKkTtui5p99XP6TNZl5zlx
X-Gm-Gg: AR+sD13DgYfws8N5Cj0EzE0eKAxYVZHIHK8B8uwOXTgAFCD7DCAZSc726jcHKOL+g+O
	Hi0RcaD+PtnfXphqyeQil95vaEnXkSTflbwhc8ukugmPD9ZSdPKYiGu8l2KFH1SV/KmYXWfZP8N
	cuomaRe3pTX/2e0L5OoNoZrU74R3cvvDJdiMyFwor/JUgbKNlpO5/lxjJwYutYFfGV0Cn3YGduG
	S46peqkHcc3NvyTWQWAw/62/Am/+NhQDAXXjckos2OIl5NeBd0Q0aC4bh6yt5zxbiEmJkvXH6i/
	QCZxmDR8lCdo9rM6QBsSchD+pDSGVAuYmDtpKYQ/q8+PgRKA134Fa4nZUhTDjO3hNNZv/4/an5R
	NshbczWJaUM3/R8ix8iwy042Y6FVH9ZeNsF4Gd7hc5yQHNMzZcAehhnalOdq6Ww95FNncBAYidm
	pR30HVpKrUcWuAlyXAofxb34M2w5wRN2YU4/Hxw/d7trU3n5gaQ3Xit9sH1JkX54GW4Wl4XXBTC
	JI5Ww0aggJYH1VSmgf3mTRsccI29I8mmiddt4kQGxPeMC9Z54WNPSTd
X-Received: by 2002:a05:600c:3114:b0:495:63e4:7f78 with SMTP id 5b1f17b1804b1-49987971986mr331622695e9.10.1786953063033;
        Mon, 17 Aug 2026 00:51:03 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d11f073sm22486255e9.15.2026.08.17.00.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 00:51:02 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Leto=20Liu=20=28=E5=88=98=E6=B6=9B=29?= <Leto.Liu@airoha.com>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH net v4] net: airoha: Add retry mechanism to airoha_qdma_set_trtcm_param()
Date: Mon, 17 Aug 2026 09:50:39 +0200
Message-ID: <20260817075044.17691-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_005108_247779_918716CB 
X-CRM114-Status: GOOD (  13.36  )
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

From: Leto Liu (刘涛) <Leto.Liu@airoha.com>

CPU accesses QDMA via the bus. When multiple modules are using the bus
simultaneously, CPU access to QDMA may encounter bus timeouts and fails,
resulting in QDMA configuration failures and potentially causing packet
transmission issues. In order to mitigate the issue, introduce a retry
mechanism to airoha_qdma_set_trtcm_param routine in order to ensure the
configuration is correctly applied to the hardware.

Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
Signed-off-by: Leto Liu (刘涛) <Leto.Liu@airoha.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v4:
- Rebase on top of net
Changes v3:
- Init data
- Use continue instead of negative error for poll
- Add memory block after CFG_PARAM

 drivers/net/ethernet/airoha/airoha_eth.c | 29 +++++++++++++++++++-----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 79418e682f71..302f8c432055 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2712,14 +2712,31 @@ static int airoha_qdma_set_trtcm_param(struct airoha_qdma *qdma, int channel,
 		     FIELD_PREP(TRTCM_METER_GROUP_MASK, group) |
 		     FIELD_PREP(TRTCM_PARAM_INDEX_MASK, idx) |
 		     FIELD_PREP(TRTCM_PARAM_RATE_TYPE_MASK, mode);
+	int i;
 
-	airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
-	airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+	for (i = 0; i < 100; i++) {
+		u32 data = 0;
 
-	return read_poll_timeout(airoha_qdma_rr, val,
-				 val & TRTCM_PARAM_RW_DONE_MASK,
-				 USEC_PER_MSEC, 10 * USEC_PER_MSEC, true,
-				 qdma, REG_TRTCM_CFG_PARAM(addr));
+		airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
+		wmb();
+		airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+		wmb();
+
+		if (read_poll_timeout(airoha_qdma_rr, data,
+				      data & TRTCM_PARAM_RW_DONE_MASK,
+				      USEC_PER_MSEC, 10 * USEC_PER_MSEC,
+				      true, qdma, REG_TRTCM_CFG_PARAM(addr)))
+			continue;
+
+		if (airoha_qdma_get_trtcm_param(qdma, channel, addr, param,
+						mode, &data, NULL))
+			continue;
+
+		if (data == val)
+			return 0;
+	}
+
+	return -EBUSY;
 }
 
 static int airoha_qdma_set_trtcm_config(struct airoha_qdma *qdma, int channel,
-- 
2.53.0


