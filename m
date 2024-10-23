Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9353BCDDE5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2024 10:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bd1HfFQMWC9g4f0GP0KU25BIxdhvF3UuIyAywYBFMAY=; b=RPxXv9zEk8A1It
	gP3op5dv60s0dt4fttL66ko/GxNXizypst888oM4iQP8dRCM7QRl1cn278C1fFXGG1gjVapb42qZP
	X0VuRiKi55zPxjq0ZlP00u13CdjGUmaYkcoYIdh1fysqUcH/zBby2CsnSh03x56dfCV1te+MagFuN
	weKTBwtDocIjH5QunT46NjyOrYqZezK3+ybiAQVcIMoKjNTJD+Gb12g4QCAv9LxF9tsmjTafuLJ0r
	mma3GIei/tAzK6geRH1XWmt+hKfEDt6Yf5C8gG/9dJmfyVLrZXuhZCkjAG+AQ7mfQ+7WO8tPIZ849
	AOEgNALehudEpitKjS/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YWc-0000000DyKi-06Xs;
	Wed, 23 Oct 2024 10:23:34 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YUQ-0000000Dxqn-19Ao
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Oct 2024 10:21:24 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3a3b450320aso24302225ab.3
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Oct 2024 03:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729678876; x=1730283676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bd1HfFQMWC9g4f0GP0KU25BIxdhvF3UuIyAywYBFMAY=;
        b=mJg6ShOfYOtupSJuxPsdwck0RvDfcrV8WCmHCX9SDrionN1uYWoEZ3ghZIp6fZ9mii
         V+Sr1haGEa2m/o0S8qdA8mgdF+6kexTnOKmjGliCQYwxXrRkKEJ15+XAoiXuhU5wo9QF
         wwAUm8/2qE/FrS7myXvBr/GMbKJe6Gfnom5Uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729678876; x=1730283676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bd1HfFQMWC9g4f0GP0KU25BIxdhvF3UuIyAywYBFMAY=;
        b=I3x3ARUuNcY4tC5QB1IDTXw2dCFyHivWokLJnC0VZIddGKN+/xApqsZHjo2AMSEwpd
         HxQaJ4rP2zoiZR80CAyqzn1ysKToco/wNOYxTRNEe/SB/qY9gsfAS9iURy9wwYepI7vP
         aJp32TElPj8+hlmY37zjF5ANNNLB4nyuHF2+LZEzcyMq3IoXTj/IGqVt+4rvmFOXHUFY
         bQBs6KcYdEwiFnC6MbkqWBc+bIvTUPjibfwlcMksxHQpVndD0u/5+4d9WF0ykU1h0G0g
         8nNKCfizB5vrfqZd2whyE39/rOWs8mBAeC/7GRpz/KBKsUP1Bqj5nzKt9t42l0kryENj
         0fvA==
X-Forwarded-Encrypted: i=1; AJvYcCWhWfCWydGFfWW+NfhnQEIA/p/bIG+szPuRLJwV/Ug2DBfr+IHjv0oX5V22RLJgr02xdXAT2C1UXKXvnKA3NQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZMPmCjrdoBayFpmZ9iYSY28ReL3gY/N1WBldPSiyUylozgqh/
	JFXiZxFikQkv/VLTfbw+bnSH7eNrfR4HQbPRiECijBgpDwxH23BZq7E/n1IQ7A==
X-Google-Smtp-Source: AGHT+IE6QFForZlKyA0hU2+8la5Uo19ZimvhbDp1m01L+egZ+QO08x2ndnoyS7s4J9Oe9465zQjmlQ==
X-Received: by 2002:a05:6e02:219b:b0:3a3:9337:4cf4 with SMTP id e9e14a558f8ab-3a4d592cbe7mr20862945ab.4.1729678876040;
        Wed, 23 Oct 2024 03:21:16 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:eb47:48a4:644a:4aed])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab583d9sm6526349a12.49.2024.10.23.03.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 03:21:15 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] soc: mediatek: mediatek-regulator-coupler: Fix comment
Date: Wed, 23 Oct 2024 18:19:21 +0800
Message-ID: <20241023102059.512352-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_032118_606161_E373EF6E 
X-CRM114-Status: GOOD (  13.75  )
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix two minor issues in the comments.

1. We balance VSRAM voltage based on the target VGPU voltage, so the
   comment likely refers to VGPU.
2. .attach_regulator() returns 0 on success and 1 if the regulator is
   not suitable. The context suggests a successful return value (0).

Fixes: c200774a6df4 ("soc: mediatek: Introduce mediatek-regulator-coupler driver")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/soc/mediatek/mtk-regulator-coupler.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-regulator-coupler.c b/drivers/soc/mediatek/mtk-regulator-coupler.c
index 0b6a2884145e..16df12d1c2e0 100644
--- a/drivers/soc/mediatek/mtk-regulator-coupler.c
+++ b/drivers/soc/mediatek/mtk-regulator-coupler.c
@@ -74,7 +74,7 @@ static int mediatek_regulator_balance_voltage(struct regulator_coupler *coupler,
 		return ret;
 
 	/*
-	 * If we're asked to set a voltage less than VSRAM min_uV, set
+	 * If we're asked to set a voltage less than VGPU min_uV, set
 	 * the minimum allowed voltage on VSRAM, as in this case it is
 	 * safe to ignore the max_spread parameter.
 	 */
@@ -108,7 +108,7 @@ static int mediatek_regulator_attach(struct regulator_coupler *coupler,
 	 * this means that this is surely not a GPU<->SRAM couple: in that
 	 * case, we may want to use another coupler implementation, if any,
 	 * or the generic one: the regulator core will keep walking through
-	 * the list of couplers when any .attach_regulator() cb returns 1.
+	 * the list of couplers when any .attach_regulator() cb returns 0.
 	 */
 	if (rdev->coupling_desc.n_coupled > 2)
 		return 1;
-- 
2.47.0.105.g07ac214952-goog


