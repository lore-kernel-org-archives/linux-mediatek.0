Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2A2C77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Apr 2023 03:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2lcib0V3+/ELO569Iy00GQ8fHxNyEHZ4Blfo69bvdqM=; b=uw0jdL+0y6krxQ
	O7fSALpskVxeIWQNRw1zb6WxwZh/1JK1G2XV5pszTWMLMccbEii7Lmks2xOZNAZhy6oaiVeAwFtcu
	fghNBN6ubJ3HwoPWTSdx5JjzYJgo72KxEldERrCR2bQucTPCnClqsbJB8eyljI9OewwnuH6tY0+ui
	2phTdgRqsaURsD6e0Kv3nM7+wdy2Yq3N2JdrA94vqqv0GOKQIQfKUGhc9ezsn7msWvbZSUYKEPobS
	Rhs3HZFZqwxoZLefVCG8zjtNIWGwrJ4wQRx59BmYKkfbdz4n9im9tfJFjUoMCAWDN1DhUyM8Sz1sH
	Gp9bXMF4hvxpEwnx+LNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prsl7-005OAY-39;
	Thu, 27 Apr 2023 03:57:29 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prsl4-005O8l-20
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Apr 2023 03:57:28 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-24736790966so6675440a91.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 20:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682567845; x=1685159845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lcib0V3+/ELO569Iy00GQ8fHxNyEHZ4Blfo69bvdqM=;
        b=g9HKfptZk20Ox+mkmRYcscaSTzFpFspwaR35VpaZ4cOjbiahSU4aCyso5kM0SyPoYf
         VzH873PNU/UK3fVyVxOM3/dTsSb6FlwtpkW8xWnCiE0w6zzSO4aeGwdbqMcNtMvcBQkH
         hgjQabfDwFB8yagiqZMvfZQRehUsU23zNDQlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682567845; x=1685159845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lcib0V3+/ELO569Iy00GQ8fHxNyEHZ4Blfo69bvdqM=;
        b=NH/kPxQJ5HAMw97PLokwsAj3Q15OZWNPt2u0PEggRRmq8Ix8FoUhQKXVAoPTit8zER
         lO6ISsN4VGty4Fe1sVG1MrayfMv2SlmGbIXSHNBvZ+j41I76iDrdoNh7UHTTuPgyZFf/
         w8Ay/DcBTeNkkTkA89mLdZgC4CIFcB/RBMfBfIA59cv9lcZQz/CvEeaveCVR9apluaWe
         Ep92SgP8YbBCeGHg97oKgRjbQSpTfwBuy4gH2zH/7cDUFQ5I4NDhg1WDGxBLzQCI2f2w
         gcaTouDuStRxSRAHSSJvXo7pfZpds/exHlJZ89HcOqyVskU+ZEMBvGtNpH2hgcngmtJm
         F4vA==
X-Gm-Message-State: AC+VfDyDg1SudtXnRrj+Ekmc+1RTZs3NwhONi2lGyqlxvMoiBrSGh6bU
	NuI1WzCzI8wUX72XqXNk9zvzww==
X-Google-Smtp-Source: ACHHUZ7BZJGgxXIMRw2e+qA72i2MWL4JOJIFF97S0AujZ/KH7taebd8zyS3xLyIei7CZAbhQN6l7Iw==
X-Received: by 2002:a17:90a:ce8a:b0:24b:fd98:f760 with SMTP id g10-20020a17090ace8a00b0024bfd98f760mr647297pju.0.1682567844860;
        Wed, 26 Apr 2023 20:57:24 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:dcf6:797f:140d:6d])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090ae00100b002471f9a010dsm12214092pjy.21.2023.04.26.20.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 20:57:24 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Jeff LaBundy <jeff@labundy.com>,
	Douglas Anderson <dianders@chromium.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 2/2] HID: i2c-hid: goodix: Add support for "goodix,no-reset-during-suspend" property
Date: Thu, 27 Apr 2023 11:56:56 +0800
Message-ID: <20230427035656.1962698-3-fshao@chromium.org>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
In-Reply-To: <20230427035656.1962698-1-fshao@chromium.org>
References: <20230427035656.1962698-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_205726_664933_945DBD35 
X-CRM114-Status: GOOD (  22.42  )
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
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Stephen Kitt <steve@sk2.org>, Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, linux-mediatek <linux-mediatek@lists.infradead.org>, linux-input@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the beginning, commit 18eeef46d359 ("HID: i2c-hid: goodix: Tie the
reset line to true state of the regulator") introduced a change to tie
the reset line of the Goodix touchscreen to the state of the regulator
to fix a power leakage issue in suspend.

After some time, the change was deemed unnecessary and was reverted in
commit 557e05fa9fdd ("HID: i2c-hid: goodix: Stop tying the reset line to
the regulator") due to difficulties in managing regulator notifiers for
designs like Evoker, which provides a second power rail to touchscreen.

However, the revert caused a power regression on another Chromebook
device Steelix in the field, which has a dedicated always-on regulator
for touchscreen and was covered by the workaround in the first commit.

To address both cases, this patch adds the support for the new
"goodix,no-reset-during-suspend" property in the driver:
- When set to true, the driver does not assert the reset GPIO during
  power-down.
  Instead, the GPIO will be asserted during power-up to ensure the
  touchscreen always has a clean start and consistent behavior after
  resuming.
  This is for designs with a dedicated always-on regulator.
- When set to false or unset, the driver uses the original control flow
  and asserts GPIO and disables regulators normally.
  This is for the two-regulator and shared-regulator designs.

Signed-off-by: Fei Shao <fshao@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Jeff LaBundy <jeff@labundy.com>

---

Changes in v4:
- Minor coding style improvement

Changes in v3:
- In power-down, only skip the GPIO but not the regulator calls if the
  flag is set

Changes in v2:
- Do not change the regulator_enable logic during power-up.

 drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
index 0060e3dcd775..db4639db9840 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
@@ -28,6 +28,7 @@ struct i2c_hid_of_goodix {
 	struct regulator *vdd;
 	struct regulator *vddio;
 	struct gpio_desc *reset_gpio;
+	bool no_reset_during_suspend;
 	const struct goodix_i2c_hid_timing_data *timings;
 };
 
@@ -37,6 +38,14 @@ static int goodix_i2c_hid_power_up(struct i2chid_ops *ops)
 		container_of(ops, struct i2c_hid_of_goodix, ops);
 	int ret;
 
+	/*
+	 * We assert reset GPIO here (instead of during power-down) to ensure
+	 * the device will have a clean state after powering up, just like the
+	 * normal scenarios will have.
+	 */
+	if (ihid_goodix->no_reset_during_suspend)
+		gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
+
 	ret = regulator_enable(ihid_goodix->vdd);
 	if (ret)
 		return ret;
@@ -60,7 +69,9 @@ static void goodix_i2c_hid_power_down(struct i2chid_ops *ops)
 	struct i2c_hid_of_goodix *ihid_goodix =
 		container_of(ops, struct i2c_hid_of_goodix, ops);
 
-	gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
+	if (!ihid_goodix->no_reset_during_suspend)
+		gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
+
 	regulator_disable(ihid_goodix->vddio);
 	regulator_disable(ihid_goodix->vdd);
 }
@@ -91,6 +102,9 @@ static int i2c_hid_of_goodix_probe(struct i2c_client *client)
 	if (IS_ERR(ihid_goodix->vddio))
 		return PTR_ERR(ihid_goodix->vddio);
 
+	ihid_goodix->no_reset_during_suspend =
+		of_property_read_bool(client->dev.of_node, "goodix,no-reset-during-suspend");
+
 	ihid_goodix->timings = device_get_match_data(&client->dev);
 
 	return i2c_hid_core_probe(client, &ihid_goodix->ops, 0x0001, 0);
-- 
2.40.1.495.gc816e09b53d-goog


