Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D26C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 11:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cwjDj+7KzBcAXPoTLJ3JC9JSJmT9wQOrir5TeBiIjs=; b=XEn1wUaOCNhyzCIYct0U/00qsy
	Vhpbd3JCfb85Jjye9cNxQlGAqR8x0S7zcl13JMbrX1Clt5hcrpJrkcQg02Y+9X7Tb1MxC5FbIpj+r
	Zjq0THQKrrq+palXOqgY2sWtLVOH1h2q/OJUPvPVkQBQ/QlU0grwyGbzssn+AHv2/aT8qHdomCDfp
	ZpYE0HsmMVrNmP44Bq6zDBqsJ039MIZVsDhsopJolg5l23HJMns0XfRbXQ+30mG90aBHMffasFSp7
	2gNcuCyEeG9SdoAZ0Lqn6//QoI11PUsVlM+klxtV3a114ehJyeVbWEi2FZfYVzRavVenmIJNTFm68
	toXaFhaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQH7-0000000GyxD-11cd;
	Wed, 08 Jul 2026 11:17:09 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQH4-0000000Gysk-2Lek
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 11:17:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493c83474ddso4873095e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 04:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509425; x=1784114225; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4cwjDj+7KzBcAXPoTLJ3JC9JSJmT9wQOrir5TeBiIjs=;
        b=hRyXAlSmkMp/IcY9menciLDWpLOkfwLr4CRdd/xVIReGipRjx/hyleT/iBiES6sfl5
         RYtXvWlXPhWqn9PUCCLpRxa5WgCTDBNbAb7puSydAYv33CMv2zLfMuJxkLcvasxK9XTm
         9GJUlnaSnQOnM/pBZ3Rum6SjkVjfvhr1JojrRYpRa9IdBio1wyOkdaKfofi+yZJaFw3H
         r+5HDnapoNO0EpJv3qaCPrnJXpxHGtCf26BhL7BVuzqX8mVXbkzb01inn7baGQSfem/s
         SrQZkuSb/vIySW289ju4oU/CVQd+lLyBS7cmGtK8MIdb/lKF5L7zpc15jJj7Wo1tTiIB
         8z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509425; x=1784114225;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cwjDj+7KzBcAXPoTLJ3JC9JSJmT9wQOrir5TeBiIjs=;
        b=k/IvcroBzhG4KdehZw5lbiu/oVrnMu4yWhSvMZjCApIgwdQCQNnTvexziYoS4oqtnX
         ZFKsh6BJ+Cq/XocLS0hzhsbxv+74GYyhSSAi85VUGsrtidu1d+q96JTFGIhjmvdeCL/R
         6sMoUUEzje7fnxjnXGzuz+FaDRsX//L4QMi8JIDI7LeORUoktsIa7DEXXghMRTAj5N0T
         9kgLi2YmELmvNjFQq8TaFYQp3w6A00Z0/19yNGNdDCrvA5BCqL8Wm9BmBTui4zDXgeM8
         eFcf/TJFjDFpy1dukTvCstVwQ/LXcEi6nOfV5Ua6i0OQ1t8aghCrM2WedazShYQrj8jZ
         uG6Q==
X-Forwarded-Encrypted: i=1; AHgh+RrzstwnOJo8I1sYRH9xsreRgtOy8jimyRlWvscEoNt5WO/cr756qQ0ExSLw1zzaQKCIULhxAaTHQu1K8xzJCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqA0nYoziRbkDlghIDf2LLp4Rae7m2EObdSbhFKMJRhrv/jx/1
	tVU2/vNRk37/wR+0+1sHBEhqadseGQVkWJeEj0Ly5KN6zIAbtv1QB5k5vb1TXg7Ffbs=
X-Gm-Gg: AfdE7cmhVx+WhUrYGCj2diDztdZhNPkXsUGKwOjK4wYoAWSzGJZQV145xwSqdIs2h1x
	vJvghlXUw8DqUWZlXMRhobiH93yFV9Duxg/1BhEDH8fXBGyED2VZjDzuZq0NrKKHFn7AKx7zJXt
	PURidhoedBt63KK18FFa/SK9NqEGpyfAbdjaoy0cGFsX/Er6HYQ5TqytSiB3CR157xbGCYvxF/l
	G6bwaLHVky86DUKRVyMf2cmqD80PtH2+RLLuUjzNtiFj29ZPnOutYyVgJcsc0DfT6C1zJ/+TSIa
	LBkDGhPoXsEwNJmSNesiEATjEy53OLnY5dgm7XIswwwrL071ptrTGhaFdA7oEpNTs4zQ+Q6Pw7K
	JQ6Sni3TR4KJ75LVCllNtdNUpaMw6t/WugVtMrJl4AVattqsW8Qa94lICSuEFaMSbKabxIi/GYj
	LN9kiy/aer/Z/UnWCsP2hHfijVD84oZHq92HIFGm01Za3VyweJS2uHZ7Hi9V0THs9Q/7FLPRxaW
	dYTtlcNg06OseA=
X-Received: by 2002:a05:600c:8b2b:b0:493:e79e:da6b with SMTP id 5b1f17b1804b1-493e79edb81mr14329665e9.21.1783509424549;
        Wed, 08 Jul 2026 04:17:04 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e0fbb410sm134582585e9.12.2026.07.08.04.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:17:04 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 16/23] mfd: Use named initializers for platform_device_id array
Date: Wed,  8 Jul 2026 13:15:23 +0200
Message-ID: <1bc763b0de24d50e83972b5f0dd31ae52dc558b0.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2575; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Yocslbbh2Ly5jl9ltyhoSfTRYYTxd9v0B/P+M4FNVM8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFzyT0ZErsr2QqgUI+ds7aThxCts2E7ekkXL BACi/D+1X2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xcwAKCRCPgPtYfRL+ TvLFB/9hN+VB2+hmD5mjaItFVbgfdSMKak8oAIsjfT3yy5d+i61CICxL9i+805fBO8WayHEw0J4 WWVSFrgdv9eWp60pkSg/voFbzW8yf6/lYZDDMlbiZzrL2qi/A717lcyifJT1aDB1ZCLuO6rijK2 SCC1e2pwmS5uh5lZAvOogmiDKp2ywDkbkQfcJNRk2cAAJ1ECRb0tcmjBh8fKG72bGDEenli4yN7 OMDXv0I3ISleKF6I+avOCcNIZXa+ycqDnLzR14Igy5ifsu6sIQhY0TmY/RdOe0hlDal6+N8d1nl wGO8Wq1G3/uz/qGLVcyHKpv9whEa/ciwhBlEHY3Jii5OmZ1h
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_041706_624049_C2CA4593 
X-CRM114-Status: GOOD (  17.21  )
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

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
platform_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Also drop a tailing comma after a list terminator to match the common
style for these device-id arrays.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/ab8500-core.c | 8 ++++----
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index f0bc0b5a6f4a..7c00c71ca4ba 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -1250,10 +1250,10 @@ static int ab8500_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id ab8500_id[] = {
-	{ "ab8500-core", AB8500_VERSION_AB8500 },
-	{ "ab8505-core", AB8500_VERSION_AB8505 },
-	{ "ab9540-i2c", AB8500_VERSION_AB9540 },
-	{ "ab8540-i2c", AB8500_VERSION_AB8540 },
+	{ .name = "ab8500-core", .driver_data = AB8500_VERSION_AB8500 },
+	{ .name = "ab8505-core", .driver_data = AB8500_VERSION_AB8505 },
+	{ .name = "ab9540-i2c", .driver_data = AB8500_VERSION_AB9540 },
+	{ .name = "ab8540-i2c", .driver_data = AB8500_VERSION_AB8540 },
 	{ }
 };
 
diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index a933cb936da6..baa6487abf9e 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -375,7 +375,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME },
+	{ .name = DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 7987583afc60..7bbd9b730b75 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -429,8 +429,8 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397" },
-	{ },
+	{ .name = "mt6397" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
 
-- 
2.55.0.11.g153666a7d9bb


