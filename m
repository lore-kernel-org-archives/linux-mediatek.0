Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7689DC61DD6
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 07:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppTKN+ViX0ps4m1x8WbWgM6kLhXVltmE87oNPgspGL0=; b=xYBW9N0euq9reaOYI/6ebBI+Tm
	cULBj3DHZKBi/EGw7TBZlR0vNASbQ6l8xc38IpfGG7jhkW5d4E3pR9C/7p+6kAMMg/IdWhSn0bvdF
	fGS/K6a31D3L+vK7bkNGyL9UaubPN43mQtwrQFhgBdbxHucXkeuTRdMq2+HF89+QxLiQDDvy0HTUZ
	Nc8x5cAUWRl6g56LrG1IS5C7/foSc1pFkVIvoEk8RcqKsyz97N0CLU9TWr02mOaHYrjqW0jUTFwa7
	xG5OLdrbmlvlovnL+dE2FY0ReuCnrc3OwJs6t0+wWxrC9rCW3ImWxlNeR6hCSdhIRc4HODqXGEP77
	/FbZi5Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JFp-0000000BA6E-1SNU;
	Tue, 01 Sep 2026 07:50:01 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JFm-0000000BA3Z-1AUk
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 07:49:59 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2d53197d8b5so37592235ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 00:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788248997; x=1788853797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppTKN+ViX0ps4m1x8WbWgM6kLhXVltmE87oNPgspGL0=;
        b=XviRev0wWx7tIa9pgyPcTQbGrCoaWs3yJ0oMQu11T9CCB+QQiHkoV/PbqX7jC+AxzR
         4G4YTX+n+7Ux9cA4CC3l+LDDeCYLf4iWhYVc0r4VawNqEAeL1eE9M9v9LPD4bnEM3rIH
         t8C1GqEVTCthM3mBDzjQYf2gJUSO3z8MIGwPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248997; x=1788853797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ppTKN+ViX0ps4m1x8WbWgM6kLhXVltmE87oNPgspGL0=;
        b=i38CnXJa8jMkoi5kJx+js1yRHU0yvW+gyAqqCv1fo6Kp2aZA3yzjIy3TX+bP3WfCUt
         86qDmaII7HdV7g8M6SiY7QMmPAnllt2DN93kgp22BJXhCk2anG/p/mO3j6zZbQ2Lv3Nk
         1gqIgkwf1ldE++ksmJGjN6HG5Zm0MPaSigTDtsd/96Qmz4hX0ykicCGqHi0uSsEsjYjs
         mHQRpyxHvJTKymcoyUyAAqcW8d7AZBPggJdedCfFjhh9YSplsCmHtmuEUpcUZl3OwCBc
         cGf8+1+epppkfBSIlPDEVbAawhFCbGXQjB85iGzbT/erDemvfAn9aPyKIhq6QD5zmbWZ
         WCVA==
X-Forwarded-Encrypted: i=1; AKwUvBxslAWNYefVVe2DCv81yDpwYSSaDzfmK00V8HhKD21dzsIe5BoKBa1ittxMaQk6Zs+hgpZpuIlkoFPwit83xA==@lists.infradead.org
X-Gm-Message-State: AFuF++koQVrKNKBaqi7NGtqEoDh3AF5bgg3+KyT84IGDEPLmbbbdLK+g
	1WB0gFMwjBeroDByXcnImEbvL5iVQzk5Wmu0KfCXVyii5Ogok+2IVGZBIfYMprTWKA==
X-Gm-Gg: AYBFou1Ngbcq1/7Gpom5gIvPn+ZBDndCIJ9hDtEhm+ZzY1b5oZN6olshOKbx46AVk2K
	1wSnhNUsnlNldK/yjc3cFXisukslu9UL/n/zZWn8J4KDegmi2Q//K7cCswBi04sGhjK7byUaUnh
	Pz6SjLKs2kXZ60oQ9TT2aaApynMWOdXe2tGi9Hcvcs1SxbSyu675SvtHo+mNJpVZDSZBKDi7uBw
	380xAia0zzVbb/5vnQxRf0LqJmDCbSH+ieiw7slGZVPvfePYcEVJZzF/27Mkl++3yWRC1zpfH81
	lO6/vIOqSLbQruY9uPG44thFHPR+L3yfnxXf4HZWE7TtKi3dbUXfq4FeG2HqRmKmaPW6OpZZXJm
	cfIP1/0+G9yJztzgMdESP6pqXkLFgkctx0YCNaoqV+yTzDshiC96RoncTqHoA9hE9X2c72vruBM
	4lz0yPZdZezje8ERtRru937wd+N8Q+940Ses730oFezqJRa9XM0yFCGwvjyc42wD3vxlU9ODjxc
	qKSUQrVBdv5ZXdD3TBJsXxKjz9dgBXAHKbIJF9MoO9EPUI=
X-Received: by 2002:a17:903:3883:b0:2d9:216a:cdd3 with SMTP id d9443c01a7336-2d94a93609cmr90196685ad.18.1788248997383;
        Tue, 01 Sep 2026 00:49:57 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:49:56 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v6 2/8] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Tue,  1 Sep 2026 15:49:20 +0800
Message-ID: <20260901074930.764550-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_004958_323964_CB21E0AB 
X-CRM114-Status: GOOD (  17.14  )
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

Elan trackpad controllers require some delay after enabling power to
the controller for the hardware and firmware to initialize:

  - 2ms for hardware initialization
  - 100ms for firmware initialization

Until then, the hardware will not respond to I2C transfers. This was
observed on the MT8173 Chromebooks after the regulator supply for the
trackpad was changed to "not always on".

Switch to the new regulator_enable_and_wait(). This makes sure that
enough time has passed since the regulator was first enabled, satisfying
the power sequencing delay requirement. This allows the delay to be
skipped if the regulator supply was already enabled by some other part
of the kernel, such as the I2C OF component prober.

Fixes: 6696777c6506 ("Input: add driver for Elan I2C/SMbus touchpad")
Cc: <stable+noautosel@kernel.org> # needs new regulator API
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Added noautosel tag

Changes since v2:
- Switched to new regulator_enable_and_wait() API

Changes since v1:
- Delay only if the regulator was previously disabled / turned off
- Link to v1
  https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/
---
 drivers/input/mouse/elan_i2c_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index f5e505edbc33..4bbc6cef8be6 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -36,6 +36,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
+#include <linux/time.h>
 #include <linux/uaccess.h>
 #include <linux/unaligned.h>
 
@@ -47,6 +48,8 @@
 #define ETP_FWIDTH_REDUCE	90
 #define ETP_FINGER_WIDTH	15
 #define ETP_RETRY_COUNT		3
+/* H/W init 2 ms + F/W init 100 ms w/ round up */
+#define ETP_POWER_ON_DELAY_US	(110 * USEC_PER_MSEC)
 
 /* quirks to control the device */
 #define ETP_QUIRK_QUICK_WAKEUP	BIT(0)
@@ -1260,7 +1263,7 @@ static int elan_probe(struct i2c_client *client)
 	if (IS_ERR(data->vcc))
 		return dev_err_probe(dev, PTR_ERR(data->vcc), "Failed to get 'vcc' regulator\n");
 
-	error = regulator_enable(data->vcc);
+	error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 	if (error) {
 		dev_err(dev, "Failed to enable regulator: %d\n", error);
 		return error;
@@ -1416,7 +1419,7 @@ static int elan_resume(struct device *dev)
 	int error;
 
 	if (!device_may_wakeup(dev)) {
-		error = regulator_enable(data->vcc);
+		error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 		if (error) {
 			dev_err(dev, "error %d enabling regulator\n", error);
 			goto err;
-- 
2.55.0.897.gb25b4bd76c-goog


