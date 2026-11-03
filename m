Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054FC606A327
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 04:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=peMsCvCg;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mTqvrayv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ggqaj3bggsrUOqnPqyXrXYqxV+UfImDX5TnRZxULpTQ=; b=peMsCvCg1G8fOb
	c2tqbkniUY9c3sdjXKEUffqZUjvi+AsJ/txsbinGvPyU5hnpWuYB31f83qn6h+MB9uWJnniCajYuj
	tLDH+BdU7UgspB47pvYBr/wKXDkubwAa732YYFkr0c+6ZabuOSmxnI+d/LA+Ik6gdd6J09VJvbUAI
	2PihNSys+Juq7oHr1WVebjOUvV2cccZcM9LXDTawwErlcbZ+OMznMJColDubooYTeuQMcwbS8PPcB
	zhcX4yOqHuCIzjj7mAxlTANjGZ8mUsVfDpFF9M32JyYymzT9Nu0WKIryzOAvlTB1LMqHcEeZz97qT
	m0gnf7cRXG77iyJymURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6HU-000000013hO-3Aua;
	Tue, 03 Nov 2026 04:37:56 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6HR-000000013el-1zGH
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 04:37:55 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso2157287a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 20:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680672; x=1794285472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ggqaj3bggsrUOqnPqyXrXYqxV+UfImDX5TnRZxULpTQ=;
        b=mTqvrayvrPe1m781HPYFu4qkfdN/T0qrKUwiK4aq3HJFZ3ciSK+7eG2wngBOphcDWt
         8s40jrbU8rWOhXYkyrJ3uZIAkBtvHc61yX7CDdtkE/9c8HwO5hesXc0RYEdREJve4JF1
         2sgSzRb2sYRUiN4Tjq2OruAMrUlABLB/+jecs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680672; x=1794285472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ggqaj3bggsrUOqnPqyXrXYqxV+UfImDX5TnRZxULpTQ=;
        b=VhWUGUGWwKBQgXPhjGICPbtuobBbo+JHWA4zGvGrLFW0H5HqigWhLSH7QWfomLFt11
         PCnSQyAMPzAPXiqCCaKtKq+TVsirST5SK/RbeZBEP/ipP7bQ/7hTaePxqrFPGzs7I/A+
         Bs4Kc003f5yYTv3gbEgacrb8n4bbFYek+O358zLT6Bm9wVeeAJQahSGzJIZOmkVNopg9
         +Gn9x6lmS+dhXEdkUChHWwbrhpqoQNDHV52PkllGNniHdjVsJdqAQ69aNux6U4jf5mGv
         IWFqT2QwOKu+bUmdEfXuQ0xfofBxBwREaSI2Di/pqqmkTjglWV5Yz9t38+hLm9T4l+WO
         MqwA==
X-Forwarded-Encrypted: i=1; AKwUvBxR8aPffIvh3KbczX/OMiBj2M89/scqRmrUMbSkLUPgvzIShQ/fHGJyMTDKScWoT9D8djPg1aPvTj4vIWp7dA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8aQ2TjWVdw+EHQJrJTZPtdVqMDnu9jaK+TVuIChQ9Gvb4P+gSO
	6BxyeRk3yQNVefcoFn8rnL2iVflyLKplBfBZ2kWjLBKKhqvVa/COjFq2lqWHVwXGoQ==
X-Gm-Gg: AYBFou0C9vxW3cVATpYrqHe/UDORWwKBSRjqd/ZOfuUiY4YdEzQPjUAu1PodR9nkKGS
	KgoNEpiE3CGM/bDHGO51voDkzbiFkQuu0fSas82BjeEA2fBwF7wMQbM1/fODY80yCliVbajpj0E
	zHeRL1/27nbCC8k/++n9XmhXWQHkqdnKsSXkzn5qxJe57AAwQHkC1dcTifb1ZAR7Q60LMctqT49
	gMKVZl874FmPJAHD/VDnPT6Liido83HT0SLDoWmhrC2867UOCEzRk2qa9d89xY1vHiTfnBJxj24
	k5e47qnCYxsbGzvziGm1Ca4E9HiceL14N/NnrdEHvwLY4KDSyVQFwOQSv2k+6K5zJsFcD5AFfGa
	rKI87jl622ETTUQCcRC6cwLyEfaA1wKDQjoOYY/rXgZH5ynPossCsIybpUwE3sjrxe/BrZVcEha
	exBqbTk9C85PgTf/nUQAvhYdQDCSlsMFM9mjRWZpk8I8yuBvajrMMHv/gjBxOpSgbYUbGBRhRZn
	Q90NRRRFzd6fJJ0OPsOmyolcn73LSz43paBvpu9zYB8AA4EJjV/JiNKFb5BJr+7H0ZPPk0hiqmG
	aOP2h4A/MhNup2ACiw2I3OFtpOK3H4uz83zYptwUYjSsJgPBUxVd5N16S5Mijtm701M5vvmcyCV
	eXU7Q6rMxtuxX
X-Received: by 2002:a17:90b:562d:b0:3ac:8527:3fcd with SMTP id 98e67ed59e1d1-3ae898385a1mr9902090a91.39.1793680672423;
        Mon, 02 Nov 2026 20:37:52 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:37:51 -0800 (PST)
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
Subject: [PATCH v7 2/8] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Tue,  3 Nov 2026 12:37:26 +0800
Message-ID: <20261103043734.2179858-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_203753_528357_76AD3C7E 
X-CRM114-Status: GOOD (  16.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
2.56.0.385.gac671c819a-goog


