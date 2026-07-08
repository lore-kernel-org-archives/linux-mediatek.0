Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7103FC43602
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 11:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=; b=nrghLI6xBIdDzf4EQ7gKcWy8fS
	A1cuv4NQlPMWJTlR2DWc7GvqIWyoBVBkE1vdXiJDWRdcDEY2KJw6mv4E2d8iUMo9KwBNF0NKvgzpv
	LRQ9rqN7+6hEsvyNNFIS0SocYs8Qxc6597EHVmwpJv5oJ8o2f2GVBBsIAO5XGiGTIaH0V1OA2btHF
	Vh3vNWQ8o1Q2F7p9IaUTW+H727sRtK3tu41f9zzg5ORhCQBfHpD85GZgLNvsoeOoVqIFBWyWlkIwc
	a0QMmgfOdBf7IuCeGY/BiPc4LYFzpT9n0wkzITdZAOxOSdN1UJWW+80AdycqDhgyVrXMWK5C6sDSz
	e+haJVgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQGu-0000000Gyli-1k3v;
	Wed, 08 Jul 2026 11:16:56 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQGr-0000000Gyi9-0f5S
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 11:16:54 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47dec32798aso564052f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 04:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509411; x=1784114211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=;
        b=SQ4Q2T1nSTEW2UoqXwYD0IH0pj/S6LL8wbsHDi3SRAwO/NjpKhOknvwtvDdRJ5CxQX
         SYIgvw+0SkYSll6JdipudUtHWxHbcgEP6/O+M+taLbwosMmY8MMCLiiTghJ3OMY0NvtR
         w7ldkjO33wKQ0/1OWW4G0/s/R4aTUzaf3sEAnlVcfFQfWIkGYRl5EtHqgXOZ5Ef4XRQX
         e9aISiW6m4Oc1zNe+xWmnfvegkx7pHLqRDlXGWgpu40kJKcwl/Ej151NVRpokaXFG2aJ
         ei7ZyplGoa386C6Qr2dQyipFuLJkwt+HSJJGEkhVRbhD/KLZLd5gTs1zIgfv0XpMQqvH
         vqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509411; x=1784114211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=;
        b=PVttJlYMt2fMVoW0p67klE3gxDh4IrJc4CwnJHj6fojupgFr5SLwZq0isd2DkWJ97s
         5Ex5SaAVZ+zOd4ljq04hmfJ/Bq8L0YXC5xqdQmE9TP7mRxfff/Vq7DsKWEObBWyZzHO4
         8M4qjNwvadfvER0mmDSfvvxsJIqrL6PxZXv1ffVUy/Q6Wq8Vm8qH1SZFeQLOeK/DzxA2
         WHlzGV9Djk+u8+wuZTEPNW3BPcZC7wcGZNk2BXLHuQyZCVZ2jV71dEdfp9J++tdnL+EU
         LuIcSzEy/o6MT46RVrwUx7UDkGL/QAcMSvme1Njq5eSONIof7IXKQNoIdkhJmnjIifVn
         bFTw==
X-Forwarded-Encrypted: i=1; AHgh+RricYR2kMhXz/PQ3LgnMnrKtnUyZwdk82LS7RxcR6LyKL17jRDxBzUDc7OnK5Rpg+X/a5TVgCEhN9E4z+tJIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzK0Et//Xjt8GUDn5dU4gYwsFyANzwF8H8N8K24Zr9XXgH8MKaa
	daRA3jP7fYPRRp9NX6Rj0UDOL9xubslH5zr7ViZfm5HuhHetz0mmXDBOac2pQOUsihw=
X-Gm-Gg: AfdE7ckXTEmRU6Tp/oNshtU2z2Nz9LJxFuIoadMh9i62kPQBpQ9BUYw/kfSP1nxKYJZ
	pB6MZQSZAsJzUzqeruKa86sOlUPl5NSGQTY3VPQVtpil1b/jqYXYZf9mfYlqWmQvPn3wTOMRVY9
	4PxRE86nJbJULUP/3iP+CsEPSDnesbLKWPFvMN5DUmddCiNiNU4htDPNR6aEsOp7BiL9Hz9UZOp
	yTc5IPRJhjUftqt7HHUh+yaBE5/0oDeZ4IuZQjpUJ02enjY4HgRNbK/iayngDa4AhWCF+WdkHIH
	ryhHNYfi+iDgf3qDddFrqK/GUMxnOqNnrXAWBjVpfYOqfvzqKcWDDsLqUwefGx43GnHNqIfhFb/
	XSebWAELkP0K+s14QPt0HM505Ojw8S9kpqOVIV+GdLME7BPyiK4qU+iOVKwDJNOSr8Hhz8Voi7I
	OJSZMj/l9eBDhgzk8Yr4HBMN31A7G3bXTAr89qmafxgOvkBV3DAXBRu/2+XImWRX39xOMVfVAQW
	nZB
X-Received: by 2002:a05:6000:4a11:b0:473:8f65:c978 with SMTP id ffacd0b85a97d-47df074e23fmr2309041f8f.1.1783509410912;
        Wed, 08 Jul 2026 04:16:50 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960816sm40326700f8f.29.2026.07.08.04.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:50 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 09/23] mfd: Drop unused assignment of platform_device_id driver data
Date: Wed,  8 Jul 2026 13:15:16 +0200
Message-ID: <6cdb070a4e773c2c8b84bd2c2dd3628545d7e7bd.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1375; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=qaHMCDQ0wnCBevuvFZFgR8vFowOppWXNbsk1WmPicyU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFUyx0qnP2zKCNNfgNq59gFkbTpytA6eHk24 hmc6ZVxsBiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xVAAKCRCPgPtYfRL+ TgqzB/9Bpu/S/yCAfq1ceJH388wa3hj9KYRwwsjLsRZ2wITDPFEIeAGSqN9eX6tfaS/ZeC1rBru RN0YVsdLzykyYbvWGsTFBRNnRWUKRWYeON725oyq3tPzWBgxPb/4M6ab/HM1HCsakAKN2Po/BL1 EMFbC0kr3R5f3F1QSj3tmoN8DesptbklIOW+WuwoGWR/mvnrmOPF1Lun+nBv8x6G3bsEJKflEeh 4h22Y9y8Gh7z5MG/cHlH1eIc2KfK0lwOm9Oyt0iNoQMjKt0AM/hMgHQiRNm0xlMgQGXmNg94cfD VQT2NL17J5x2Q1u4m/nI9EULzqea6htUHzmA0miZsGYP/p00
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_041653_220752_9922567C 
X-CRM114-Status: GOOD (  14.27  )
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

The drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index e253c753beb6..a933cb936da6 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -375,7 +375,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME, 0 },
+	{ DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index ea1d039477e3..7987583afc60 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -429,7 +429,7 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397", 0 },
+	{ "mt6397" },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
-- 
2.55.0.11.g153666a7d9bb


