Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FAB606A324
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 04:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=caZ2SWW/;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SUFdcEIG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jwXE6HVPE3u8H2VoPGvf+65Nm9Ko3QG6ghTmXH3WIyI=; b=caZ2SWW/PsXd0W
	gcD5EPK25ughlPLBUvHKniBOGlJUoCL1tIypWqPdQ+RuIeey/Fh+Kon/L8LkaN8s0bJ0S+bPjA6Ox
	UMd9tQyVCzIGJ5TKov6o3UyMXiNPC4kaQ8IX9lwLF4GAbYIgxUM06ArQsjm1bMUWiFMhh3Q/zLjZk
	KHJHZczQDB3RQTeuivbWNYRWvIh6G9De44de6WjDnSPfLS55HnpS1oYK0d99VRjimohRDaUpXb2IL
	38Q9j3jLfGAVPlUXYnOZ3mIL2kEI047C8S9XTMtL3ardTVgBP8tWhOfD9I1K8F2JkdmjO525KNpTu
	p1dZE7MxLvZUWcWCT88Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Hd-000000013qB-0kV9;
	Tue, 03 Nov 2026 04:38:05 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Ha-000000013mL-2oIF
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 04:38:03 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so2307459a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 20:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680682; x=1794285482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jwXE6HVPE3u8H2VoPGvf+65Nm9Ko3QG6ghTmXH3WIyI=;
        b=SUFdcEIG9mlsfmP723xCYWA6J/XJz0sJN4cHVZRreTpX6b8t/0F4r1c7l6YAgZdGt+
         zFrQRA+52Kzn7U2lBCCuKzSsJVZFxR0bE8SVMdZsIhGltN2xJmyomzQ231cddyTLsZGq
         0XdrYy3nro0TvHAOkOpaFohm4FuxKor2RzQ+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680682; x=1794285482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jwXE6HVPE3u8H2VoPGvf+65Nm9Ko3QG6ghTmXH3WIyI=;
        b=YUQiIQ6+/qmIpN3bNCtwDptBUDaVy+0O/9m3VYCOqpnti0Ma0jOZ+6SAyxjxD5Ie3X
         zwgv9r1hhbLiKcIdGRnelOS6NBnod4tfSYSF5TrA0wck6VSvVWnACcxf508Hl4QZcXbd
         IiiHUZ7dbSOB9HxLsua7wsKnKXgrAbe0FndV+aVi9zO1GtyBr1zqD6TPr7lrpgCxrto3
         Zx1CBRDSH8wFbypdVYrWj8YbXXL10pEYaCAQuQjUPxLajFz6yUGo/8u7MNPQ4ao3x5ZC
         qIlrOAvl7owfFv3gP0aT97FW00fZk9HVJHTjBnfxZoBXlNNe4WDzj5WqUe378J0KWgwr
         SEAw==
X-Forwarded-Encrypted: i=1; AKwUvBwyYiL5Jpac+H/Ya1+cRiTSLcKU3/fauCXil1dMSn3Xpe+pDeeGcqg9lCvT0tUuD78IkWqus8tJYawbHsL67w==@lists.infradead.org
X-Gm-Message-State: APuU4Z8m9MiDiBiDPgnTfF7W/XVILKt9okFjTQ9hlwNmYNjp9DUuK4bi
	3TN+c/K/gMcADp4FqoeLMylghqHZocfYsRSYujoMAEApCHfS+YPxvjtlu/mJV9kGRg==
X-Gm-Gg: AYBFou0qJLBCSEoOVRbnXU6ifxAHXiaF+SfH4CqrazE8pcyGaD4JIaPNxVtadr2Tm3q
	2xYTPRuNUUMC5sodNB+/TSeI2bDHDAgf1jGmJf9G6YsxNpqKGZUHlLfGCixXJYy4sRMn8rNXwJb
	9P3CvS2M3pq7DkKHbD6b6HCRvGr1EFOYIkZHOV+iMYhDMp5HkQtOsaSPyXy0eVZmjXvHOaBR6Rw
	fU3jLE2q/sTazltFKFL7H7dUsBUvMy+lBJwaoo86fTvTxsPE+MMeTJgynOO0HCFLp6M0uFOW2TI
	Fd3WFwyayh8Xq+0oZFT5oyoHlq2HzQZr/idXLY2KrYsnCm9nKvojkCmZQP0bnuN1rpQ+IWfcgy3
	EJJsfUPyTloCAMhmWjS0IbirWPSq3wF2Y+UHQl6p7VaOOdOo8h27AGQC50YOd5vyPFfzCN9t9qA
	vR8HLDONXtVbJZqActvbCffhPimQsvLoEgvlyCfbjT9QyqlpV3AO+hnxjIqY51hHgyIKjQYdICx
	7fd4HqXcFm5g0zT/5YEMMjSqPwhFalmFEGEmZ+tLRA1Nm201G8iSJQanTTaE/1PjrLtAmEKuUBk
	etcOm/Yzsj69TCJ2ZhXaER4hWmW9EHsb3vCDgawxqhcscg3sINsB956QNoxm7jJGLEgPW8FC+UM
	Mr4VAteD/n+tj
X-Received: by 2002:a17:90b:2fcd:b0:3ac:a7ee:6780 with SMTP id 98e67ed59e1d1-3ae8986606fmr10535707a91.66.1793680681667;
        Mon, 02 Nov 2026 20:38:01 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:01 -0800 (PST)
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
Subject: [PATCH v7 4/8] i2c: of-prober: skip post-power-on delay if powered on sufficiently long
Date: Tue,  3 Nov 2026 12:37:28 +0800
Message-ID: <20261103043734.2179858-5-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_203802_710784_74910666 
X-CRM114-Status: GOOD (  17.07  )
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

On some devices the I2C component is powered from an always-on power
rail, or the power rail has been left on by either POR defaults or
the bootloader. By the time the prober probes the device, the device
most certainly has finished initializing and can respond. There is no
need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree and the component prober. This is undesired, as the device tree
is not fully describing the hardware.

Switch to the new regulator_enable_and_wait() function that makes sure
a certain amount of time has passed since the regulator supply was
actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_enable_and_wait() API
---
 drivers/i2c/i2c-core-of-prober.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 6a82b03809d4..f9f3c0ef93ff 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
+#include <linux/time.h>
 
 /*
  * Some devices, such as Google Hana Chromebooks, are produced by multiple
@@ -226,13 +227,11 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 
 	dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
-	ret = regulator_enable(ctx->supply);
+	ret = regulator_enable_and_wait(ctx->supply,
+					ctx->opts->post_power_on_delay_ms * USEC_PER_MSEC);
 	if (ret)
 		return ret;
 
-	if (ctx->opts->post_power_on_delay_ms)
-		msleep(ctx->opts->post_power_on_delay_ms);
-
 	return 0;
 }
 
-- 
2.56.0.385.gac671c819a-goog


