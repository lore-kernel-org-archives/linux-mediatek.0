Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD2B606A338
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 04:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IryMcUxp;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JlLclIss
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+m0KRotnRI6Y4M0Q7c+lnB20WP0kpPO3hQuPyKu7qTg=; b=IryMcUxpD09WWY
	TTIsPTYDVIAVJR7mXPr0PidholQ9ts/9bd+7y5DRf1Rj431rRaTc8ARkiyaECACcG/O6t7+BSGPj7
	n9B75IDToWiW1PT4drK2d2pNZ3gZt3YpGE2Dw+HX5jpJCup5PsJV28kahGqN/A7M4tXGGjvmwiWXO
	58JrUvIHDsCueBv5lZZDPJUNIThSAseRth+ea87/4kcBjyCqPF7CQkM2FAdB6/vGvgtW2vtZ8jnD2
	fbRrf7Y4y/WkWSZFIY7Q30t1bJVU+frUemrJ4JsSN4bVHpwTaE+JaKn8D8nrU+pys/gGM1yndI4dc
	5YnL5L5ioDIOCSOEXcbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Ha-000000013m7-074I;
	Tue, 03 Nov 2026 04:38:02 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6HW-000000013iU-1p5H
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 04:38:00 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1650723a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 20:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680677; x=1794285477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+m0KRotnRI6Y4M0Q7c+lnB20WP0kpPO3hQuPyKu7qTg=;
        b=JlLclIssiiJ8YUZIqkTWVdwifqmeJQEfcl6c9x8Rze6slYVUMJpYKW+ERNATyXDRwW
         WUCT85Yt8RElsShKgBmgmxbToYgsd1/rhkez3xFOQnyORqjksrTu2RLBYhyFfzaMLn4f
         UWf8fM4Ei9Hc8tYRyDBbA2LXdv08A+jeq6GL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680677; x=1794285477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+m0KRotnRI6Y4M0Q7c+lnB20WP0kpPO3hQuPyKu7qTg=;
        b=AtNDnQPmd1hbK2xX8bu8fQeXZE1HVA3Inb9BNQ5xwPjW6uB4mPDfvimu+k9PDK4AgV
         IR7Ray1nc/oMMU2T8aBMBdWyOnsVBPcszBdf5Q7CYg6+jZubWbIVnYQ7K5ylEBSe5mII
         JA1bGYlyD+2AfQ6CDtGkthaHbn0YGRGbo7i2tEFbn/UG2chdgJCoQ9lw+Pu3HpAOixVV
         6tX6d2CSYzmiNpQqN5TF/bzd+oydoY4ZkRcO5qQGComDf+dJlRdTSk1FPbwT7ioTUzyM
         B5DPVQUhdUawESeId/jtyxu8AkLcuWK0kPOd4utD/koTNsyijB3ey0bLigth8+STGXdO
         6YQA==
X-Forwarded-Encrypted: i=1; AKwUvBybhq4mUY94MY5NMbXTpGFaoMu6uPWuVbp8PzL22tUdyojua8avMQd725sXYZJg18TPSvJE1693ilU1PssIOw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/azuuirC49/fMvLKCU3e648W/OCiAbwGrtEMhzgJ0xhwfrh1Na
	0amreiLAsOhF+X3sToLz1NRGf7d3i5SENF77H8wfQ9Kg6Wt0x4O6J8sovem+04t0zw==
X-Gm-Gg: AYBFou0S5l9AfR2cUzC706UKXtOZXZvM+kIpshGDs/qXPINZGUGxJ7XoUvLeGawe+Fd
	5hfMr9dLsoclyw8ZoY1o8F1niIUHdDzQiFMg8MZX9virkhwVHwvMZfvKi17Ho/Cbjm8dG6HhrvA
	NG/lACh/Adm1XQfkWJRZSPwmNQ5xqE9UAhxujKa6aDDGvmGLgkHFMDOp0B2OId2OtWiNEhg+Qb6
	s7OshHtH50boZ7ekskhvCuinqkTpl7InV+YZmFhFA3k40WhL0bgL0x7c6YB0UrSTED/gXnOZaa9
	byM7OfFre0GJWRgerTMDFf4+3dIwd6hqNVt14QpDAUYQohkCfDnMB5VYvzVgKZYB8SfkEpku9c3
	OAj7oca6XEER3dwB9RCJqeozgo2wtHAOpU2wuIT/CIZGIFbavJXvPuI6SVOAZgYcNvEVTdNTYon
	R2CAGNvpVwgJg8/eMvqD354oxYcd07W+h3AA3XpuaenyH1uPw0NhZJ3VPCZO71p7oSsYrMbVs06
	f1BrrYnXsgUXkhgAXs9ZTwDKWLlqdYpDMLvlzZxj48xk1N35IfI8lRCPcG2h9QFVz1iJWI5aFIU
	vI2woEAGVCyYvVoBkqlvtNdVMWcA8ggc7pIukOh22qf/GDk1ucPGGGL12euC59uCnUeFHA/Iyyx
	i2w23bvemGnk5
X-Received: by 2002:a17:90b:3b51:b0:3a0:cbe2:9e0c with SMTP id 98e67ed59e1d1-3ae897c8800mr10534419a91.63.1793680677425;
        Mon, 02 Nov 2026 20:37:57 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:37:56 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/8] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue,  3 Nov 2026 12:37:27 +0800
Message-ID: <20261103043734.2179858-4-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_203758_511072_CE3C1799 
X-CRM114-Status: GOOD (  18.10  )
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

On some devices the HID device is powered from an always-on power rail,
or the power rail has been left on by either POR defaults or the
bootloader. By the time the driver probes, the device most certainly
has finished initializing. There is no need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree. This is undesired, as the device tree is not fully describing
the hardware.

Switch to the new regulator_bulk_enable_and_wait() function that makes
sure a certain amount of time has passed since the regulator supplies
were actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_bulk_enable_and_wait() API
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 59393d71ddb9..fdaad451e710 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/time.h>
 
 #include "i2c-hid.h"
 
@@ -48,16 +49,14 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 	struct device *dev = &ihid_of->client->dev;
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_of->supplies),
-				    ihid_of->supplies);
+	ret = regulator_bulk_enable_and_wait(ARRAY_SIZE(ihid_of->supplies),
+					     ihid_of->supplies,
+					     ihid_of->post_power_delay_ms * USEC_PER_MSEC);
 	if (ret) {
 		dev_warn(dev, "Failed to enable supplies: %d\n", ret);
 		return ret;
 	}
 
-	if (ihid_of->post_power_delay_ms)
-		msleep(ihid_of->post_power_delay_ms);
-
 	gpiod_set_value_cansleep(ihid_of->reset_gpio, 0);
 	if (ihid_of->post_reset_delay_ms)
 		msleep(ihid_of->post_reset_delay_ms);
-- 
2.56.0.385.gac671c819a-goog


