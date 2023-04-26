Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAF3C77B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 09:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GbkTP3zHcJFJuVybS9KupjRL2tPIXD5dw4xi+AbtQaw=; b=PLnT5XOlP5ldrZ
	68BZT0E2leTeTKAweUtOj3Z0pdhKk334TIGUpqNZ8LGHN9q6KKkVtHAoHiF+6G7PoIgZJPKZ7aAMZ
	Y3IWO1fk/goh0n+Yrga54sWe3kMAqaWcbezL/YSPjw8Emr4O3fBsvLvjFgo/aWX3IhcKkUDerajwl
	LabqxlDm7YbHd9R4vWOCdrlBMEMrEIZw8Y/gdxey+etSKPGC7amZ2Kw9gNW+phOwaqQh+LRL6rsd2
	RE+zQvtodd6WYYU0z+MEx9iztWmyETOaiV4UOymDLZj3RSBolwjZEFByd2lOoYytHBsNdeYzKl8nY
	m/5bSxDaj36dFw3t55gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prbX0-003K8p-0l;
	Wed, 26 Apr 2023 09:33:46 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prbWw-003K5U-09
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 09:33:43 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-63b7588005fso5737724b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 02:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682501620; x=1685093620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbkTP3zHcJFJuVybS9KupjRL2tPIXD5dw4xi+AbtQaw=;
        b=C8LAqlu6DToCZB9Khh7AJe4KKQMWtFvMtBzAAACPvEmA1+DBreI552kDfQTb3Q2Ut2
         9m+esTfiRzAeUqVB12gteiAuVqPePd+h2FTlmetMy85ujIIAEcG/uplvGHmGt/4Ql1oO
         IVX72xlund0sCV7s9Co3GT2hmPe6NI97Y1VZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682501620; x=1685093620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbkTP3zHcJFJuVybS9KupjRL2tPIXD5dw4xi+AbtQaw=;
        b=P4II/UkCbHWcJ+O+lltHT0eCSs/dWB3o4PPyIxeTY9lBGqhWNsAOJlFHC41xSW9jTs
         c3mmRDyfBqCFjq2ooAgsPlQ4DJovCEKP2p+/y1rXTspjRneXCrefAzFG0tLAKtX0CbnI
         W2ZrTNMmtgfnnvoStc5o5tf/Kj4H+MCDN/daQI29qW3K9vty0Jot+M7aY1HJ+LM/wG+1
         GGKhTp0mgYcepkkvXN+xkkBhbfEFr0K0cMZTNur7GHsK9XFwI/MTeKEyddP4kfD0v37e
         JpCHFZpZ6EWu5uptPKKaDd0Rk+SUJkSyXClvqnLxVJ8v01Ept8hlYBCiy06N1QhZ1DKa
         xfVA==
X-Gm-Message-State: AAQBX9dwOccGLAeK+kimIStjvv3JG7JKWfsilfr2jRtryniLmLBFkQTu
	D9XgS6rMoACQwdz72z7ubrINCg==
X-Google-Smtp-Source: AKy350YrCareTvj+eDZ+fbTN6x5p6afQ7jO7RDXDEbJX15Wm3ZZLFh0VsSVNstRbc8sSNOzhz1r+9Q==
X-Received: by 2002:a05:6a00:2da7:b0:625:ea57:389b with SMTP id fb39-20020a056a002da700b00625ea57389bmr27528444pfb.5.1682501620593;
        Wed, 26 Apr 2023 02:33:40 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:dcf6:797f:140d:6d])
        by smtp.gmail.com with ESMTPSA id g1-20020a056a00078100b005810c4286d6sm10730075pfu.0.2023.04.26.02.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:33:40 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Jeff LaBundy <jeff@labundy.com>,
	Douglas Anderson <dianders@chromium.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 2/2] HID: i2c-hid: goodix: Add support for "goodix,no-reset-during-suspend" property
Date: Wed, 26 Apr 2023 17:32:30 +0800
Message-ID: <20230426093231.1466984-3-fshao@chromium.org>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
In-Reply-To: <20230426093231.1466984-1-fshao@chromium.org>
References: <20230426093231.1466984-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_023342_084037_8235F1F2 
X-CRM114-Status: GOOD (  23.54  )
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
  and asserts GPIO and disable regulators normally.
  This is for the two-regulator and shared-regulator designs.

Signed-off-by: Fei Shao <fshao@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

---

Changes in v2:
- Do not change the regulator_enable logic during power-up.

 drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 26 +++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
index 0060e3dcd775..fc4532fcadcc 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
@@ -28,6 +28,7 @@ struct i2c_hid_of_goodix {
 	struct regulator *vdd;
 	struct regulator *vddio;
 	struct gpio_desc *reset_gpio;
+	bool no_reset_during_suspend;
 	const struct goodix_i2c_hid_timing_data *timings;
 };
 
@@ -37,6 +38,20 @@ static int goodix_i2c_hid_power_up(struct i2chid_ops *ops)
 		container_of(ops, struct i2c_hid_of_goodix, ops);
 	int ret;
 
+	if (ihid_goodix->no_reset_during_suspend) {
+		/*
+		 * This is not mandatory, but we assert reset here (instead of
+		 * during power-down) to ensure the device will have a clean
+		 * state after powering up, just like the normal scenarios will
+		 * have.
+		 *
+		 * Note that in this case we assume the regulators should be
+		 * (marked as) always-on, so the regulator core knows what to
+		 * do with them in the following regulator_enable() calls
+		 * despite regulator_disable() was not called previously.
+		 */
+		gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
+	}
 	ret = regulator_enable(ihid_goodix->vdd);
 	if (ret)
 		return ret;
@@ -60,6 +75,14 @@ static void goodix_i2c_hid_power_down(struct i2chid_ops *ops)
 	struct i2c_hid_of_goodix *ihid_goodix =
 		container_of(ops, struct i2c_hid_of_goodix, ops);
 
+	/*
+	 * Don't assert reset GPIO if it's set.
+	 * Also, it's okay to skip the following regulator_disable() calls
+	 * because the regulators should be always-on in this case.
+	 */
+	if (ihid_goodix->no_reset_during_suspend)
+		return;
+
 	gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
 	regulator_disable(ihid_goodix->vddio);
 	regulator_disable(ihid_goodix->vdd);
@@ -91,6 +114,9 @@ static int i2c_hid_of_goodix_probe(struct i2c_client *client)
 	if (IS_ERR(ihid_goodix->vddio))
 		return PTR_ERR(ihid_goodix->vddio);
 
+	ihid_goodix->no_reset_during_suspend =
+		of_property_read_bool(client->dev.of_node, "goodix,no-reset-during-suspend");
+
 	ihid_goodix->timings = device_get_match_data(&client->dev);
 
 	return i2c_hid_core_probe(client, &ihid_goodix->ops, 0x0001, 0);
-- 
2.40.1.495.gc816e09b53d-goog


