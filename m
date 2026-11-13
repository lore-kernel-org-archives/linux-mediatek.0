Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1984F606A321
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 05:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CfHAbFr/;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mdGUsess
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+cbGdzty0Be5iX/0odAUgwQdHjrUYqcWpVwGe9DdZsU=; b=CfHAbFr/ziUStJhlUjmwuLs/7c
	TAOhvjy2iBkONp3EGaTMMVo6YNl6iVYA9IVIo+11igSAcWE0SLvz5zzcGoD91mopnqr4RTvb+/Ibn
	ZGIhM6UO2S2bp3+mZGdgsoxltq8s7oiHfIiL7prHDC5FngW5RaH8/mBF/0bP4MCjbhScbxAqCjc7Y
	Qe/OJGACPYJ4HfLbugQqMDdRI9J/urMyY1gFTiO1myzRCKgmbamTcnIUpm1hw+tbZ8Q78KsDWXINT
	4Spti0VddPsZ0mzW1Ig+pyo+5pSGa9kA5NiKuCbyDAJ7aKrWs/ud95m9Ad/ySm224Xne1WdyGdrnl
	Qzro9BlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjqb-0000000Bgjo-38Ub;
	Fri, 13 Nov 2026 05:29:13 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjqY-0000000Bgim-0JxX
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 05:29:12 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so3505515e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2026 21:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794547748; x=1795152548; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+cbGdzty0Be5iX/0odAUgwQdHjrUYqcWpVwGe9DdZsU=;
        b=mdGUsessOO0qbUs8bYBUqGXV5FS5IrWn+Uq+uCdIMKD0AxNS7E4dKkni5EqHGhleDT
         2f/5/MbEl2VIZi/MRz6SEibozxwOlf5OxHa3MlKfO3iS+2+qGnmYg2Uu9miHpTCRId+D
         MnWLqiGuElPV0iP8uSyrpNhtgf98OSteKsrtdEDUj7LtuRTOJSQ4rtU8QaZCfAJ3XdB5
         aiVzDLLASIiTpdIGGXzEHTfADVuw4iZzNDX9pI2Cdyz3vvmlBVS9R5RryfmsG0sR+icy
         d6FKNl+EcdtZvpsBBxsML7856Ag2+4FUXEzgmz+kamGE8DzeBrfZQSjVP7q26iCzDrFI
         gfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547748; x=1795152548;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+cbGdzty0Be5iX/0odAUgwQdHjrUYqcWpVwGe9DdZsU=;
        b=HIvW6WCkkX9g1bi8VA+9hggXnY6qfjZlNCxS7ebpH3yvweNBBk/lCT3q1ySxcR/Mrg
         ysMI/wg0X1qB+LpvqGc7v0IF+Y6Ke3y+kbzcDX4zmz2LnJTXrnXkYkHGLHLh69QKy9LU
         COp9YErH1Ra6CcU6gDblygU4V9XpoDSZRXcT6PyFuqfkBoWdmNh3/eIV1oMb+zmoPS8z
         Sm7EOrSEOxlfSlWlcCWxStUF+ZKomr5rYrns45JQtkgL4rXSAQV5TKwjMIWzXcx/2XdL
         6y6aljJW78Aq/x3T2YwC6S/qXBilzfrg/ax8ev8SSRi40jYPiFO7tZxQgWiwqa5+E4dz
         azxA==
X-Forwarded-Encrypted: i=1; AL+hErHM0d6rS8+EuFE2kx7DfLEGISyWBEEx2IutWG8faxfWWPsco5Xq4q4fPMZ2hTIIQx4+qlwT5WL4MtTJYwuX5Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z/LR2UWGJwSmjYd0v/SHixDm3pZjkblUXaXl1tu60kutEVNcIJN
	qzdg9cUzzRv4/P2hvvADAL+nc48vv8meLDBg7cM5P8mwjVHOAPk6RGe49b1bZhW4daU=
X-Gm-Gg: AYBFou2yuRuQ3KqyQbZnJ4sQ8QHfT8LJGq9F0FV4Mt0sUBx+mSe7+YNr1GH5l5mZZe4
	DdtjNZ+4aYCFeZ48xypqXXs2lfJOl3oQKs/MSTYYHfoehNYAdBwCPuRPz/yR4jxaJjAF5X/GLWZ
	i47xPGIN4SLivkaZL1Ef0xu9k5EFuJzQ5689efAh70O8jUf3Tz6TrN7xWQ9rasZUuoE1qUYOVVF
	4NItd95d7kZk/ng/4Z69OBBNUmsLbS+JB/fxQHhudBW+QDbJRfhSn1MSWKBtyeQvCBYZpZ0/RnQ
	OpTIZ7yqfi1HUYGfW87T1PYh+iomp9Uz3SQDNVv3AFFSW8Dmx7xZscdB3bj/eu24GDB5I7g1Bz5
	Y5y9qXQ5IiFc8NsyMdl0cJFzHrdrwE38tcfQUyN7p4jhnCgm25q2Tksdl2EKqitc5VMonj27SpZ
	xv504efHj5bHAp+lAow8cnqIKgpvQJf40NtGa3ozPDxCAEwFzHjW0IIVENk6UHaqifck2vLC4wZ
	HrCkwHzQQXmH7AQiSbB2g+U86rkaz+5ayp4Iy/QPh4h0m8hFYzO5+CtySl0lW1fJeMnf5Wbgx6x
	EZTF0GkUKxkaMTn0yorj4FPqXiIhfmBXGnfWim/ZqiZ1Xw7sK+HoAeEr
X-Received: by 2002:a05:600d:2:b0:4ba:761:c0c5 with SMTP id 5b1f17b1804b1-4bb55a581e6mr21673295e9.5.1794547747666;
        Thu, 12 Nov 2026 21:29:07 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm11572365e9.3.2026.11.12.21.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:29:06 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 13 Nov 2026 05:29:02 +0000
Subject: [PATCH v2] regulator: mt6363: Serialize BUCK_TOP key access
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-rgp-91-mt6363-key-lock-v2-1-adbd48f0f830@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAB2g9moC/3WPy27CMBBFfyXyulP5EdsZVvxHxcJ2JuBCCLVN1
 Ajl32sC2y6vdOfcMw+WKUXKbNc8WKI55jhda5AfDQsndz0SxL5mJrk0QnAN6XgDFDAWo4yCMy1
 wmcIZjPUaUfakXcfq8S3REH838NfhlfPdf1MoT9q7kejnXhfLq8a8ywRhGsdYdo1F3irVBdW10
 vRWBj3Y0GPLZfDoqo6SzrpBsyf9FHOZ0rJ9MYsN9hbG/4RnAQLIKc+VswbR7r1bLtEn+qwK7LC
 u6x969KygHQEAAA==
X-Change-ID: 20261105-rgp-91-mt6363-key-lock-67b5992de5a8
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_212910_134713_9715BF1D 
X-CRM114-Status: GOOD (  16.44  )
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

The bits that select the FAST mode of the bucks only accept writes
while the BUCK_TOP key is unlocked. mt6363_regulator_set_mode() unlocks
the key, updates the bit and locks the key again, but the regulator
core only locks the buck being changed. When two bucks change mode at
the same time, one of them can lock the key between the unlock and
the mode write of the other. The PMIC then ignores that write, and
regulator_set_mode() returns 0 while the buck stays in its previous
mode. mt6363_va15_set_voltage_sel() unlocks and locks the same key,
so it can also lock it during a buck mode change.

Hold a mutex from each unlock of the key to its relock, in the FAST bit
writes and in the VA15 voltage setter.

Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
The race was reproduced on hardware.

The new mutex is static because probe already stores per-device state
in the static regulator table, so the driver only supports one PMIC.
A follow-up series could make that table constant and move this state,
with the mutex, into per-device data.
---
Changes in v2:
- Drop the gotos from mt6363_va15_set_voltage_sel() instead of mixing
  them with guard() (Mark Brown)
- Include linux/cleanup.h for guard()
- Link to v1: https://patch.msgid.link/20261109-rgp-91-mt6363-key-lock-v1-1-ea3b03a76997@baylibre.com
---
 drivers/regulator/mt6363-regulator.c | 53 +++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6363-regulator.c
index e6c4bd851fef..b4f5f33779b5 100644
--- a/drivers/regulator/mt6363-regulator.c
+++ b/drivers/regulator/mt6363-regulator.c
@@ -4,6 +4,7 @@
 // Copyright (c) 2025 Collabora Ltd
 //                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/devm-helpers.h>
 #include <linux/err.h>
@@ -12,6 +13,7 @@
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
@@ -114,6 +116,8 @@ struct mt6363_regulator_info {
 	int virq;
 };
 
+static DEFINE_MUTEX(mt6363_buck_top_lock);
+
 #define MT6363_BUCK(match, vreg, min, max, step, en_reg, lp_reg,	\
 		    mset_reg, ocp_intn)					\
 [MT6363_ID_##vreg] = {							\
@@ -388,6 +392,23 @@ static int mt6363_buck_unlock(struct regmap *map, bool unlock)
 	return regmap_bulk_write(map, MT6363_BUCK_TOP_KEY_PROT_LO, &buf, sizeof(buf));
 }
 
+static int mt6363_buck_top_update_bits(struct regmap *map, unsigned int reg,
+				       unsigned int mask, unsigned int val)
+{
+	int ret;
+
+	guard(mutex)(&mt6363_buck_top_lock);
+
+	ret = mt6363_buck_unlock(map, true);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(map, reg, mask, val);
+
+	mt6363_buck_unlock(map, false);
+	return ret;
+}
+
 static int mt6363_regulator_set_mode(struct regulator_dev *rdev,
 				     unsigned int mode)
 {
@@ -400,13 +421,9 @@ static int mt6363_regulator_set_mode(struct regulator_dev *rdev,
 
 	switch (mode) {
 	case REGULATOR_MODE_FAST:
-		ret = mt6363_buck_unlock(regmap, true);
-		if (ret)
-			break;
-
-		ret = regmap_set_bits(regmap, info->modeset_reg, info->modeset_mask);
-
-		mt6363_buck_unlock(regmap, false);
+		ret = mt6363_buck_top_update_bits(regmap, info->modeset_reg,
+						  info->modeset_mask,
+						  info->modeset_mask);
 		break;
 	case REGULATOR_MODE_NORMAL:
 		cur_mode = mt6363_regulator_get_mode(rdev);
@@ -416,13 +433,8 @@ static int mt6363_regulator_set_mode(struct regulator_dev *rdev,
 		}
 
 		if (cur_mode == REGULATOR_MODE_FAST) {
-			ret = mt6363_buck_unlock(regmap, true);
-			if (ret)
-				break;
-
-			ret = regmap_clear_bits(regmap, info->modeset_reg, info->modeset_mask);
-
-			mt6363_buck_unlock(regmap, false);
+			ret = mt6363_buck_top_update_bits(regmap, info->modeset_reg,
+							  info->modeset_mask, 0);
 			break;
 		} else if (cur_mode == REGULATOR_MODE_IDLE) {
 			ret = regmap_clear_bits(regmap, info->lp_mode_reg, info->lp_mode_mask);
@@ -508,20 +520,17 @@ static int mt6363_va15_set_voltage_sel(struct regulator_dev *rdev, unsigned int
 	struct regmap *regmap = rdev->regmap;
 	int ret;
 
+	guard(mutex)(&mt6363_buck_top_lock);
+
 	ret = mt6363_buck_unlock(regmap, true);
 	if (ret)
 		return ret;
 
 	ret = regulator_set_voltage_sel_pickable_regmap(rdev, sel);
-	if (ret)
-		goto va15_unlock;
-
-	ret = regmap_update_bits(regmap, MT6363_RG_BUCK_EFUSE_RSV1,
-				 MT6363_RG_BUCK_EFUSE_RSV1_MASK, sel);
-	if (ret)
-		goto va15_unlock;
+	if (!ret)
+		ret = regmap_update_bits(regmap, MT6363_RG_BUCK_EFUSE_RSV1,
+					 MT6363_RG_BUCK_EFUSE_RSV1_MASK, sel);
 
-va15_unlock:
 	mt6363_buck_unlock(rdev->regmap, false);
 	return ret;
 }

---
base-commit: 7904338c38426d72c5f7cd9402cb9a20232a7af5
change-id: 20261105-rgp-91-mt6363-key-lock-67b5992de5a8

Best regards,
--  
Alexandre Mergnat <amergnat@baylibre.com>


