Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8FDC7618E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 14:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=unoMmmw4ERQhjIti7rAorCXdA4tzC1K8iFsMEZhavZ0=; b=GMjDX9Ru5yLC1u
	rT3zU54TSxiuJjaY0Ra5f+X1Ly/JLZSQII8m09MjY6XfM9yEA9m6QijHleKKs4VbSC8lHEU84nggB
	yKlv73WN8wanJBLySU3KIzdkEqqH0avPPWU+xJ/8UH34VbF2ujrq+uYEaym/9oB30nYEitx2K5SzE
	KWGLNtXuPljvhz0uY/mpe4xcgig8tkc+m2yaHOxmEACp6/fuSisycutGG0yUWhcB6/ph4Hqp14VCG
	IjHF3QdWpa+4YwM4WG6bK/dCPDwsHNtuH4xOfkWNxd40qA5HP3F6ZBx1SQbr58i46d1VToy+4Q1Aq
	EhCb6y/DuuOM4euKs5LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prgO3-004Ec3-08;
	Wed, 26 Apr 2023 14:44:51 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prgO0-004EZz-0B
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 14:44:49 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-63b620188aeso8518675b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 07:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682520285; x=1685112285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unoMmmw4ERQhjIti7rAorCXdA4tzC1K8iFsMEZhavZ0=;
        b=XaZLVrt1MAcN0Beh1WTI5sVwkDsA+97s0BzKfnIKBZXqCwILv939LL07A9EKds4tZq
         8FCdjSIFw0HB45f41bM8shTO1Ui1nC9PjiOX/W1dXmAkhtzf3ayfCNRpOsPX6bFWLOEK
         A2WO/vb+Yy50KEqx2a6Hj18+F0UfUnYqAMzas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682520285; x=1685112285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unoMmmw4ERQhjIti7rAorCXdA4tzC1K8iFsMEZhavZ0=;
        b=bRVkgqx6seVDBPj/GAv4F6dbu+mhHmqFwTPbOmy1XnpU1an5LfPNBeiu7NzaZMQYE+
         5iQGSHZI+fQbLlRmqds7C67iTNWkY/TIYU1ULdvskskvDD//XBLLKfopiKU2lv5z2wf+
         PObIwIi80cgH5iPwRVQnQdoZmec6J9TlIpg93SaLwENUZsy1O5DZecm/YMbRCMbxdqI6
         xcSFiZwVWL4P69GC0b3z9jZt1Ex8QAoSs2fXVmqBYC4Esoyy1DB2XY4/YfKbdxvkppgx
         0U+uxPnvwdPIiphKuuNCoK/kbbveHlrTGoG16UowLLN1OGvByHIb2fhBbvvmqCeoBKsF
         /kDA==
X-Gm-Message-State: AAQBX9eYkA+KoDj3gExyILr6PxcWxEv5JyUH9NBvTFs2ARZNirzdG2ia
	Z69HPeDbdIhhsqC5xB9LLUWQPw==
X-Google-Smtp-Source: AKy350anOfPnTjWBVxV9V8oS46CcuV5wDlXlWJitrGClrfTDhJe52dFeq38OdC4o4ASuG2TpDuywjQ==
X-Received: by 2002:a05:6a00:1305:b0:63d:a0d:6fa1 with SMTP id j5-20020a056a00130500b0063d0a0d6fa1mr24917705pfu.21.1682520285002;
        Wed, 26 Apr 2023 07:44:45 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:dcf6:797f:140d:6d])
        by smtp.gmail.com with ESMTPSA id f17-20020a631011000000b00502f20aa4desm8750495pgl.70.2023.04.26.07.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 07:44:44 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Jeff LaBundy <jeff@labundy.com>,
	Douglas Anderson <dianders@chromium.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 2/2] HID: i2c-hid: goodix: Add support for "goodix,no-reset-during-suspend" property
Date: Wed, 26 Apr 2023 22:44:22 +0800
Message-ID: <20230426144423.2820826-3-fshao@chromium.org>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
In-Reply-To: <20230426144423.2820826-1-fshao@chromium.org>
References: <20230426144423.2820826-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_074448_093952_F5D92C48 
X-CRM114-Status: GOOD (  23.28  )
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

---

Changes in v3:
- In power-down, only skip the GPIO but not the regulator calls if the
  flag is set

Changes in v2:
- Do not change the regulator_enable logic during power-up.

 drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
index 0060e3dcd775..3ed365b50432 100644
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
 
+	if (ihid_goodix->no_reset_during_suspend) {
+		/*
+		 * We assert reset GPIO here (instead of during power-down) to
+		 * ensure the device will have a clean state after powering up,
+		 * just like the normal scenarios will have.
+		 */
+		gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
+	}
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


