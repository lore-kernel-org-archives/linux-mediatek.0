Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E934CC43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 17:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cwjDj+7KzBcAXPoTLJ3JC9JSJmT9wQOrir5TeBiIjs=; b=EARKp4mtHiZ3yoiscsY7eO9mgv
	mngcXzNJDRQTLmBPguyCmC8UXn9Oqn1Y0Bsl1pL1Gk6lskUDG+ph4cUN1y+x7NRH4dj23daJe5WX9
	e7GQXHpPla2zd6dORtqtNwqhYjkID+PDuZjiVF+UpQ7ndCRyiTAbPUzryKQYxrVcTMUiaIwXtIe8v
	bIDn+9lAMdhQ8vjBSNHC/Fun85WNvj11NACGaemS41uQjODE+9JfVpYuYoqiEO2w5tP/gWn759VNP
	YdsModvwoZfPTuW8kLTQ13vZHVPhoYBIKUaqRAvP2oSlt6i4mGV/pQPn/ywYF4R4ziF3rAKpl2W7g
	+Rgq4x0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs6y-000000035CE-3QQN;
	Thu, 09 Jul 2026 17:00:32 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs6v-0000000358Q-3fmM
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 17:00:32 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so277645e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 10:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616428; x=1784221228; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4cwjDj+7KzBcAXPoTLJ3JC9JSJmT9wQOrir5TeBiIjs=;
        b=NwfB73pjVjM21+GU02Gc5rDxRUocHHfUvmoACYIVwKXo5HUU9mxVYJYbMNEZk4nQQI
         lqlo1GwCs3YET6ixmxaUbt9bigoDicioNaPPVQX21+TPGkZT9KMB+IFhKC4VS/Rxf6Hl
         JYC5Z32DDPXbx+GBgFoonbEIiIvq66CmrxZh7WvE3r/chX2lZuhW4iNQTvizGVlQ5RFu
         xvRcMT2TMRcNJUfDV72VQnrUq1tPibAopQl3etIhnJEON5a1PhyGJMpvg0JvmhmvYOl+
         Mx03aaOmMOq19SiXambYP0DBCSoRGBJxTVMR32j+6XafSTQttzPdiqbR3Xnh5WVW6rBa
         6MZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616428; x=1784221228;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cwjDj+7KzBcAXPoTLJ3JC9JSJmT9wQOrir5TeBiIjs=;
        b=jVXRWy296RFzyRg/mEEvmftjCTljVGfnw+qJtaBrni8JdK2TAlPLUnt43g77yUqovR
         q8uqiK/qUMBt8MbrovbpW9NgsWlrgF0Yd4t8ASvXCLaDSHjO9Nc2ZTZpq5vRPN12xFwR
         yZUk8WMgL88YoR9qa7cRnOPDDZH8vNXV+Wb1+fKdxOAQUxgqGbQXBV4Pe38m3/Kfucyb
         xV/6Ry4DygYozBJuKVta/RkkJ1Zi/OiDNJSl12POQDr7Q/ojOI+k2zXfJhHNy/WnIKMr
         Ayhls6iwxaBlVoEipVo7/bCi4Mt+O4z9l/eKskgD9a8PDmQERTeC2pnR10ymsA/xg8ex
         WUhw==
X-Forwarded-Encrypted: i=1; AHgh+RqqV1aoGhdS1BH2G5QpUIxWImCoxWdI7bRLLurUwgGC3tDuLJ8WCNessdbAk+x+MU78sXmcTqKE1GnmDoG6NA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzelmo/Wt8/PwVUl/MC9nRePuNI4VWTg8ECs/WNArbulr/eYuoR
	PTv+g4WYURKeio16m5X+XevVUgThziRROzjJOOMXjsi9lgFSBnlow7vSYkn58zvtuwU=
X-Gm-Gg: AfdE7ckKPgsNJKkxmtf0zDks1DbQjntvA9psp+5VG5qILudN8aSwxv+Uc8bu2QVVUle
	rCRtHZ/FTTQhNlgtBRohr5Ez5tdZqhKY7vgB4dKkUrrYYddEL86td9mGTTkVw7265LFnYZddxt0
	Dg21hHoSEimgVRU8F2QFuCD2DVhCxnwVFKYyHxxTSuvn6+0hK6Mgv/8y6ccSkhyu+Dcn992742B
	e1c01pECMwWJDA8yS54B/ZEdLImgn2cIrHmuA/tyavQh0Z+ncNPaWqfn+Kzi684P9KZTCMliB7r
	2ek++j3OGltFsdEVcfpdUgKKcPoppjgO21FoQHWj3vaGxAur3XKbNNr2fhJZeN97TAB1q+s8QGR
	ZSoDV+3XzO3RvNmexieTIiu95uB4jIPA8FPQ/2vu5GzdnzV+RwQ/6y41gHyjOT3MENFvp98ooen
	21s2VXOl2NhjDjnrHOgni6U+2XFoC2Cdlj/nvdryOoghdCXYgEYRZ75fCuSjLpKNj9pAdkFo/eg
	ok/
X-Received: by 2002:a05:600c:3b28:b0:493:bb2e:11a5 with SMTP id 5b1f17b1804b1-493e68c689bmr85633925e9.15.1783616428141;
        Thu, 09 Jul 2026 10:00:28 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493f2a2e499sm2548325e9.0.2026.07.09.10.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:27 -0700 (PDT)
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
Subject: [PATCH v3 16/23] mfd: Use named initializers for platform_device_id array
Date: Thu,  9 Jul 2026 18:58:35 +0200
Message-ID: <c7390ea19a88cbfe80e86b7ff308664a2eec27a2.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2575; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Yocslbbh2Ly5jl9ltyhoSfTRYYTxd9v0B/P+M4FNVM8=; b=owGbwMvMwMXY3/A7olbonx/jabUkhiz/y5FP8p6Y/xAWruic5Prv2/Jq9oNxS7qtlldzHWtpr jLl3GHSyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBE7tSy/xW/zaVm6TOH4X4O a7V8Fvd/6ULDU0ZMRy+ziwQkJov8+f3ocouBw6b3OSdvsiW8fJ+5Xzlq47cuobVF/yXWv5dIvGy o2fddfJPewfAH9wtKMx1NjBVqH/r/nHnQJe3z+cA7HNLSCt9fnolg8/v4g/m6+aJOrbm7TF696Z y168zJM2t71JKX/k9mtDpeOCXKI9XN469wQLGacbWs1OVfYnxMZ05eWVSccM7uSRyLiLT7rCuN3 lLZe64yXq2RaGJO2sRS+/jllddvXWeIiVV8P628uTbrvGoXk96PpEqzfD/rFvWZMsEPzh6Vr73H wCRfd6X6XUXt9q99NtcqJhnNm2v9JtlbadUBsdsh7NvNAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_100030_367930_68F86302 
X-CRM114-Status: GOOD (  16.65  )
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


