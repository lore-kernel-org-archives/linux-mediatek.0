Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C671C54764
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 10:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/L4TPn2Q4JShJP0yVub7epn9w+mmtxiJMbsQbqv5v8k=; b=N2HNs8W3dIe/EnxrUOw+M8x+Ew
	7ctyxzrY/zViIIQcSKdPqkB8AGRxocg9YrzG9V5YB5khhuacku8+hQVP4BYeoaTEyDGcrlIOaUuzf
	BrBRAU5Ul6pN4l9uOY4Ak1agoZVHonSGKHjqOECfvtjR01N4g9bFxJXn6W4Mh8t4Xh12EToM7Ki0y
	KsDhm9+9EcXTuZz9RjK9BkpmXfpf+uE6aAHM/WRrYcV6DbOzBx1MV+gnygok5dQHDo2Ob83ISoioi
	tdMbqJcDhDDdJhaVCfpN7FU9QjZq0a/zA0nKeWRclzYtwRycxLmVpPCSQNhPvV6jbqnrKrjO7pT/K
	hQllpBBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc1FH-0000000A6do-0jcy;
	Mon, 19 Feb 2024 10:51:35 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc1FD-0000000A6cw-3mps
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Feb 2024 10:51:33 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d94323d547so26676535ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Feb 2024 02:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708339890; x=1708944690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/L4TPn2Q4JShJP0yVub7epn9w+mmtxiJMbsQbqv5v8k=;
        b=XGuQ1EH59Rize4bsMRiR94Yq0zI5oJ6M/Bs11UjDN9z6qk3LOeoXfsek3UjooF62GN
         84KvdFzYedMVRZVLT1wR/KJuxBxEug4od9hYDgATmdTf5ALXhRxOiHr63EIU9iEU1FAU
         amx0Uobow4rSitTrOTtlTIFSbJ9RKSqGJvoBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708339890; x=1708944690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/L4TPn2Q4JShJP0yVub7epn9w+mmtxiJMbsQbqv5v8k=;
        b=fgF2YiYPDVP3zPFIgj2DBRGIZE/0p3RbT6Qd6W4X4bJkQnhI2DMFKbLYOD7vQZPGeN
         f37U3+0xECA6D+34tEPcuSQZIWlGqpAV49lDqxdffborb5WVmOAXQxY9h6KLJsAVAy5x
         IcVZuiVPPWAe8SEFwAaRcy23awGFEU05+Uj6muGOvYENtcV167z+L5BOPrJ2UJ6O3x88
         vUeEVu5JBsLDpba5rTxTy8QOFjuuphaExEAX2A1JoR6d0TXlOgzyGuqSgQUqZ7RMleRP
         PkNa9EbaQMVgnSH8ywOyu5PqgP7/N6o9qMUctCeCcpz8xkwaegPcSIApH4KYVLEkzf8c
         mPtw==
X-Forwarded-Encrypted: i=1; AJvYcCWlD5bwhrF8Tj0VRvtPD6PnE4F8ZhFax6B016tfGNVRcPi0Lv5oQ4Q9f8tt1BIyP9bseIIpe6PQzRLVS98aSc4pMi0LwKf5XdduV6rz2Q0kHRex
X-Gm-Message-State: AOJu0Yw9W1JQKxOky8Rwr/vOMpQRPt5pNJKFjGeH+vbmQd6rNBnY5c78
	iZuyi9Fahc8RExG6Tc3qwkDAJWMToT/XC1YZZFgANuk14yxGe5bg8z3HHbW1Lg==
X-Google-Smtp-Source: AGHT+IHPxsNk8CcRBmex8+7iHAv2rbVy7LnqzC7zcg3vEHr8P63/RN+y2pbr/3u9rT1dt5y2Af/XIg==
X-Received: by 2002:a17:902:f542:b0:1d5:dac4:5015 with SMTP id h2-20020a170902f54200b001d5dac45015mr13208265plf.11.1708339890465;
        Mon, 19 Feb 2024 02:51:30 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:36aa:521a:5948:9614])
        by smtp.gmail.com with ESMTPSA id jh19-20020a170903329300b001d8edfec673sm4112281plb.214.2024.02.19.02.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 02:51:30 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8183: Correct parent of CLK_INFRA_SSPM_32K_SELF
Date: Mon, 19 Feb 2024 18:51:24 +0800
Message-ID: <20240219105125.956278-1-wenst@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_025131_975376_3B6ED3B0 
X-CRM114-Status: GOOD (  12.68  )
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

CLK_INFRA_SSPM_32K_SELF has the "f_f26m_ck" clock assigned as its parent.
This is inconsistent as the clock is part of a group that are all gates
without dividers, and this makes the kernel think it runs at 26 MHz.

After clarification from MediaTek engineers, the correct parent is
actually the system 32 KHz clock.

Fixes: 1eb8d61ac5c9 ("clk: mediatek: mt8183: Add back SSPM related clocks")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8183.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 6e23461a0455..934d5a15acfc 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -790,7 +790,7 @@ static const struct mtk_gate infra_clks[] = {
 	/* infra_sspm_26m_self is main clock in co-processor, should not be closed in Linux. */
 	GATE_INFRA3_FLAGS(CLK_INFRA_SSPM_26M_SELF, "infra_sspm_26m_self", "f_f26m_ck", 3, CLK_IS_CRITICAL),
 	/* infra_sspm_32k_self is main clock in co-processor, should not be closed in Linux. */
-	GATE_INFRA3_FLAGS(CLK_INFRA_SSPM_32K_SELF, "infra_sspm_32k_self", "f_f26m_ck", 4, CLK_IS_CRITICAL),
+	GATE_INFRA3_FLAGS(CLK_INFRA_SSPM_32K_SELF, "infra_sspm_32k_self", "clk32k", 4, CLK_IS_CRITICAL),
 	GATE_INFRA3(CLK_INFRA_UFS_AXI, "infra_ufs_axi", "axi_sel", 5),
 	GATE_INFRA3(CLK_INFRA_I2C6, "infra_i2c6", "i2c_sel", 6),
 	GATE_INFRA3(CLK_INFRA_AP_MSDC0, "infra_ap_msdc0", "msdc50_hclk_sel", 7),
-- 
2.44.0.rc0.258.g7320e95886-goog


