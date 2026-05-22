Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F1CCD5BB1
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2026 13:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dxXaOJSuBxLpTcleO22YqCMwLnSiBPBLJ7fTD4JoKzI=; b=lVS95iJ9p9Qxd8LGT4xzIX4nch
	N5djbYDj3/5yu1dIj8mj1swidhrPeA0+LPxYrE1eMgYrZLzDnpUpxvmfzgq+IBtEVmcmjhlzlLJxO
	NGojhmvtRB69kgQASfeu7pznzqzn7DlQQmQKQnirqAxQChIHS6A/SacputDNd8XWq3A0Y41YuQvNX
	NZZpVNzhE4xcdgScxhM6RlfsFERXphVCVQcFHnnzHOU4lIGP6Y1p1nhVMRY+SUpPAFGDyNw/uVUZg
	MI4HH9MAq5t1JFec3O42lOTERLMTbgVDW62d3D7WCQWRvhkVHhj3qyDzdy8+mSznDpUF6hZXueG+b
	kJfTLGAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQC1-0000000B2PT-1Q0R;
	Fri, 22 May 2026 13:45:37 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQBy-0000000B2Og-2dRC
	for linux-mediatek@lists.infradead.org;
	Fri, 22 May 2026 13:45:36 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c8027e876fcso3194644a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 22 May 2026 06:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779457533; x=1780062333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dxXaOJSuBxLpTcleO22YqCMwLnSiBPBLJ7fTD4JoKzI=;
        b=dF6V1xPVPq4OsUkTbKwN/k2FC+C91jSslljNST3hOjGkX0V3mmw60GzsV2dwCAmjko
         TIVAt9wsiWwJVSoD2Yum/e9Sfxy1A3arswIN04CIrvjwz7Y6h3KwOA3MIjQ7MlMZ2Hx2
         cSueWbw9jXmQTTym2EZTJ1hkIBE5kZD+LvWZFNYYruQN59RiPGrypALi4j2O9Urag+1z
         thKdazbY63AEWfwyK/RonJwEMxn7MYL5PhfWTRVceTzCOV3l80vbqaUjtdlrObSeZyRV
         +UsaAUAmDCKHd8gPKnM6WuWBV8dy8H2I7E9427Zxyc4Jg5ZVgoVctCbALjJ59wZgTtXD
         tisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457533; x=1780062333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxXaOJSuBxLpTcleO22YqCMwLnSiBPBLJ7fTD4JoKzI=;
        b=Zg752fHI2L7as3t+fqnQKaKmxjLnF7vRw6PUAeam3qQwFkSzkJ6lStftsgdSrfKnDe
         u5L5mb5CgRUaq1cKmvNSFqGO0iXNy0Yr+pISbcqqwvtpJhlGyjmoiSM9cjxjMpJCCNoI
         vHIm+JQObUGw9ivyjCZ8HTNS1wdBRUpyIU/Z3qD+wKqshdV5FHo30/nrugehQF26K7NS
         1DzSaWIsIU4Y5LNNc0TjrrQVl+kMFMsox0JiA2AoeSdM7iX47QdGNTYORrJE8LaiMnCs
         n2Q9TwbTAM4eRFDO0MiWox0RtdlFWmQp1pcCGxUEEPyaR09oN0CGpkkdUSVz3+Bq2NI5
         Z7uw==
X-Forwarded-Encrypted: i=1; AFNElJ8NGFGNa4gvqu92mLTyrxVWC2MtAuwncoH/RbELR2JmSETgzn/KgSP+v1fAVq2mQbuGPBlIlL3J9I+3VRCVdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyY4QaXtryQUxIiuhF4LhFoAXZ4Z1J1cSW4nX+tpIdPTgZNErlb
	D+Xsq1M73fkHn1CP9Rh+sZyP+pCNCvzG3+saQxDd9vUZyyr21yCBrnu4
X-Gm-Gg: Acq92OHLx0UMgyFT6gXnNfw3XZLRu8N+azhPf6lok4JwJ4GVBElSnAXB0aPVD4mK41j
	+Jnag51ajUW2DRTyzE/T6VBuIp7SqEb4E/jovikxK0PPMIBVPzqQWy/N0iuyC0NaOW2P+NcY+gg
	dwFY+txSCnh5cXWWilzrmuVazfZD+MLObCxFPssv4eqoLLgTBYHB23BTujuCEGR0waYPM82r9ja
	ri1eUhHZHAhYeVFfUUmK88UocRW/fl60kCpLJleMM22QZMTtGbk/CxZe2kwxtooPLxxV0KbT5Eh
	ahWVnwi7PsLgwIl/XNP+c0Pqxer7HR8FKSbtfAysAEBcKSp85Sl/qcF033Sg7D18BplCKgyKjhQ
	bQWBbw9G7w2iaD8W0UmB9WCB8uVIqTVB8GrazFBnTT7pp2unWxPXKGGa+iahqdMI+6TeefB3XD1
	u3nFomp0osQwq0yRoXmP8R6zvJAvo1poC+CiABpNwazfL8EEJYKX5Qyu7bTkq+gzwXmV03ib2ET
	SwlT5g=
X-Received: by 2002:a05:6300:6d8d:10b0:3b2:8675:47ef with SMTP id adf61e73a8af0-3b328ed49damr2269027637.45.1779457533469;
        Fri, 22 May 2026 06:45:33 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb00b6sm2677299b3a.40.2026.05.22.06.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:45:33 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: james.lo@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH] soc: mediatek: pwrap: Remove obsolete NEED CONFIRM comments
Date: Fri, 22 May 2026 22:45:22 +0900
Message-ID: <20260522134522.368073-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_064534_671919_40F02EC8 
X-CRM114-Status: GOOD (  10.64  )
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

Remove the obsolete "/* NEED CONFIRM */" comments from the MT8196
configuration. These values were previously confirmed during review,
but the placeholder comments were accidentally left behind.

Link: https://lore.kernel.org/all/2a117e5fe9fe0ece39e9165a463082ef42be973f.camel@mediatek.com/
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 0bcd85826375..87bcbfa2d5f1 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2396,8 +2396,8 @@ static const struct pmic_wrapper_type pwrap_mt8183 = {
 static const struct pmic_wrapper_type pwrap_mt8195 = {
 	.regs = mt8195_regs,
 	.type = PWRAP_MT8195,
-	.arb_en_all = 0x777f, /* NEED CONFIRM */
-	.int_en_all = 0x180000, /* NEED CONFIRM */
+	.arb_en_all = 0x777f,
+	.int_en_all = 0x180000,
 	.int1_en_all = 0,
 	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
 	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
-- 
2.54.0


