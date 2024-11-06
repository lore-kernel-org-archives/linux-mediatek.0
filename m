Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F9FD44D51
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2024 11:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vQpKY05JOYjPURTPx5+mIgiP69yD+/zLK9ykR+kpvfU=; b=qZxYn6AUJ6JyWrHYssFfFBckur
	CPw3ki4TrMZbMG+3cUl1u8yJEDEZsocWuAtK1maz0hYWKxzsAaF/SzqCYiUbApu5dJV01jsK8V9wW
	p1/O4bGByanAFp90BqSsCzDBWyQ75h82F3U4Xo07SSsdtF1M5v+Uyt01OWEdIIV2EDcFCfj28Md6L
	641Nkv+6y/apGQIKMu1E2UPpdhGlaZPUyK0F+qK8WoTJ2zW1K2ncwHrP5TS2U0VVJ54IjOQ62owip
	PW1JnsEXa4QJuNtjx4hbv74erNZOJsyUWzyp91aY7ckMNTAjWUCrFxoGg+aoX4Ki3oZflav5ohFF6
	LVBkQu/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eMH-00000002wcx-1iRF;
	Wed, 06 Nov 2024 11:37:57 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dSc-00000002mBg-0M5B;
	Wed, 06 Nov 2024 10:40:27 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20cb47387ceso63088725ad.1;
        Wed, 06 Nov 2024 02:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730889625; x=1731494425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vQpKY05JOYjPURTPx5+mIgiP69yD+/zLK9ykR+kpvfU=;
        b=CZt2dRJ2VmRkzL0nKcoi5+yRHYHPtgQGQwp1PJ4vCidoXXG7mCYsDBVpRVQSMMMv+3
         6pJ9kvBORZDjAwWoRsKOOgVyRx2LzgYEwB7BhyFPve2GJqEof6OdqkyVysGWfMmEqjof
         csvUpcalqTvgigKxFVGWZQnHw62jaUaiUH7myT5TNQSqUGr7oGuAjL1MvcZbCyoIKEHX
         JpEJK4lj9tQQNbR+8CBlBO12GGqJK2A0PYSTNQz6RwYzwPcsqFTXZ2UZCb8J1clL3hzX
         OYJp8tq+snj6I1stymGmfNTfTuYd+0cGZ4JZEPT0BiFwZfDkW/KFU4Ag/wQc4AkZXImS
         zi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730889625; x=1731494425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQpKY05JOYjPURTPx5+mIgiP69yD+/zLK9ykR+kpvfU=;
        b=R1mqSoUe1N2r1WOT1pRvYH+z7CrCZX3dD/OJu7ogBYUXYgdu93M1MwZnbRFrgCxOW1
         FtymLq3XChaCO40SSUswTXuNnGL2QPkfkjz176ruXTAnOeTSn1ZPW1z7j8cj3mvaFCfw
         AvkV8ml+GZBAyPkyayKwmOcTG2+q00pVFzB62VI0fR8y/73gAa/FjyFVQnZf5M4kwUlB
         ekAtrR0DYLOiQ6PUBc9wF4CGe5VFtRCibsG8jO0dUcUgQBX/P7hXu+pBJm0Aay7KvNy7
         owq46A0EY1WBfpMYv8Xoc5t75bZKIeYYbpTmeUaDK1JFrEV6uTLAMN7sLSVmTPt6r/fC
         oi6g==
X-Forwarded-Encrypted: i=1; AJvYcCVT/1mjAEjT/dnjZ9GG9GSIkHuv4RK4/S2roxydJEcpXjgwVxACdVi7YmTsNheRLeZO59uk5diR1Fv4wQTSThGD@lists.infradead.org, AJvYcCWtwwGJO87thryAXm6ZQCJyrG0ioC1b7Vy5BsQaaAjGqHYN7e4HX20PJcnq6HYTl0qIfrRy8VRPl5hR2/TtIPM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy02jGU/JH9xzQWNuS3PzJhbK27Omk2+L3oIF9xJmzv8gKaSoLz
	1ZSN8wMyuU+dtc84bYhH3ZmD2ZwAh9V744fHOWAXS7ZNOsziicof
X-Google-Smtp-Source: AGHT+IGvjohxVmrQdcKedikuyP9N2c3M9m+qVYjGg+QtCTZHvb6uatr86RbigY6MnbpF+FTXLqG9rw==
X-Received: by 2002:a17:902:d4ca:b0:20c:a387:7dc9 with SMTP id d9443c01a7336-210c69e32dfmr564467445ad.29.1730889624690;
        Wed, 06 Nov 2024 02:40:24 -0800 (PST)
Received: from localhost ([2402:7500:579:df4c:d854:3b57:31f1:c2a7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056eda5fsm93414575ad.7.2024.11.06.02.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 02:40:24 -0800 (PST)
From: wojackbb@gmail.com
To: netdev@vger.kernel.org
Cc: chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com,
	haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	Jack Wu <wojackbb@gmail.com>
Subject: [PATCH] [net-next] net: wwan: t7xx: Change PM_AUTOSUSPEND_MS to 5000
Date: Wed,  6 Nov 2024 18:40:05 +0800
Message-Id: <20241106104005.337968-1-wojackbb@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_024026_147082_D775925F 
X-CRM114-Status: GOOD (  11.00  )
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

From: Jack Wu <wojackbb@gmail.com>

Because optimizing the power consumption of t7XX,
change auto suspend time to 5000.

The Tests uses a script to loop through the power_state
of t7XX.
(for example: /sys/bus/pci/devices/0000\:72\:00.0/power_state)

* If Auto suspend is 20 seconds,
  test script show power_state have 0~5% of the time was in D3 state
  when host don't have data packet transmission.

* Changed auto suspend time to 5 seconds,
  test script show power_state have 50%~80% of the time was in D3 state
  when host don't have data packet transmission.

Signed-off-by: Jack Wu <wojackbb@gmail.com>
---
 drivers/net/wwan/t7xx/t7xx_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_pci.c b/drivers/net/wwan/t7xx/t7xx_pci.c
index e556e5bd49ab..dcadd615a025 100644
--- a/drivers/net/wwan/t7xx/t7xx_pci.c
+++ b/drivers/net/wwan/t7xx/t7xx_pci.c
@@ -48,7 +48,7 @@
 #define T7XX_INIT_TIMEOUT		20
 #define PM_SLEEP_DIS_TIMEOUT_MS		20
 #define PM_ACK_TIMEOUT_MS		1500
-#define PM_AUTOSUSPEND_MS		20000
+#define PM_AUTOSUSPEND_MS		5000
 #define PM_RESOURCE_POLL_TIMEOUT_US	10000
 #define PM_RESOURCE_POLL_STEP_US	100
 
-- 
2.34.1


