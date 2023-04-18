Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E91C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 12:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Papc1sXd+qDh/1CZbyPf6tKXYxl99aL3JhfvjUH30aw=; b=2VVadnkWH9OVTy
	/YPlZ/wq+idp3dExxLlmFtPOXcBiliW6RmuSRNijMTNlZxwu6a7mutNndpUG6Hp6qwiiwA2oSPkob
	gveKWIIoJgFeXW459hXnG8PwWBpNulOvxqDZKLBTrhTVInI5yALPNsOzJZ7WIzCShZMob++tdEswx
	7qkOK9e858Zw+yRMCTlPdmA+oXQUlhrL2WuCEPTwfysdr27DzlOogoxgEtk3/rGU9TUy+7f+R9jpm
	7kK1JcGZH4YTWvKuIp86gWv0fG2lTrHAulhsJl2qp6d+pTcM70dAioSZV8yaN7qi7rG8VI7UhsvvK
	ei6HhUNwC32eFbiRvC6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poknV-002BOR-1w;
	Tue, 18 Apr 2023 12:51:01 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poknS-002BMj-2p
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Apr 2023 12:51:00 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-63b4a64c72bso1735979b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Apr 2023 05:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681822255; x=1684414255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Papc1sXd+qDh/1CZbyPf6tKXYxl99aL3JhfvjUH30aw=;
        b=W02vLdWJ3jV+eysJyBXOZkWpyU4OWVzVbN+pnYkJKHPtCh7O/8OzBlIMsLxX7PW6nI
         KCygHot6i9LcL4jrs0P04ul3KuPW4e9NzqPVzfenoRhX1c7dk2vGAvizQThTCS+fw7iT
         D9ZueUY62fFwpHtiVBQDwWXcMGdo7jK3LrapI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681822255; x=1684414255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Papc1sXd+qDh/1CZbyPf6tKXYxl99aL3JhfvjUH30aw=;
        b=bkB/JCBqG/QTI6PFvJzySvMuQkjTINCj7Fmq6jDPh7+RV8dSLix+IdgDHVE77sLC7B
         l+FUx8LH80gc74INfOxUs2bDeWt7tTIPug8sJsFJlcUmXyZayIKtW3XI3tGbAoHNHnXW
         n4w8P1KTfN5CCfEH+u2O7zRasjyrKM9Ge90AC6H8lMBKnXbax4ON6UzrqYlyMSTxAA+J
         1LVKgc/6IVJjTZ+/CIXftTA7RsF7HLFXSGq0sDh85O0b+MFALofOAao3MIlSCgG6Asx2
         IFbKJIam5+vqGFNnViyR1WUxTmGP6NMZvN4a/XzrtRR6x7+r0c9IF/fIHF4rbrjEtoSd
         QSrw==
X-Gm-Message-State: AAQBX9feoW1fGJD3g/JAeBwH3SXpuAkFceukc3QUKM4E6w/oiroIMhoC
	goJ+ThWkx7BkQlttKfGPFImMQg==
X-Google-Smtp-Source: AKy350YSKwMcKwM7NQ08Mn+FjbYkwflE/RoqWCwGyKQZXouI16JZM1yOzG8VWacpqa+y30fpbCbEWg==
X-Received: by 2002:a05:6a00:99e:b0:63b:3e:cbee with SMTP id u30-20020a056a00099e00b0063b003ecbeemr27392282pfg.32.1681822254999;
        Tue, 18 Apr 2023 05:50:54 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:2fb7:301d:6083:752b])
        by smtp.gmail.com with ESMTPSA id v11-20020a62a50b000000b0063afb08afeesm9323733pfm.67.2023.04.18.05.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 05:50:54 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Douglas Anderson <dianders@chromium.org>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/2] HID: i2c-hid: goodix: Add support for powered-in-suspend property
Date: Tue, 18 Apr 2023 20:49:52 +0800
Message-ID: <20230418124953.3170028-3-fshao@chromium.org>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230418124953.3170028-1-fshao@chromium.org>
References: <20230418124953.3170028-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_055058_916836_CB7285E5 
X-CRM114-Status: GOOD (  25.05  )
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

To address both cases, this patch adds the support for the
`powered-in-suspend` property in the driver that allows the driver to
determine whether the touchscreen is still powered in suspend, and
handle the reset GPIO accordingly as below:
- When set to true, the driver does not assert the reset GPIO in power
  down. To ensure a clean start and the consistent behavior, it does the
  assertion in power up instead.
  This is for designs with a dedicated always-on regulator.
- When set to false, the driver uses the original control flow and
  asserts GPIO and disable regulators normally.
  This is for the two-regulator and shared-regulator designs.

Signed-off-by: Fei Shao <fshao@chromium.org>

---

 drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 46 +++++++++++++++++++++----
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
index 0060e3dcd775..b438db8ca6f4 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
@@ -28,6 +28,7 @@ struct i2c_hid_of_goodix {
 	struct regulator *vdd;
 	struct regulator *vddio;
 	struct gpio_desc *reset_gpio;
+	bool powered_in_suspend;
 	const struct goodix_i2c_hid_timing_data *timings;
 };
 
@@ -37,13 +38,34 @@ static int goodix_i2c_hid_power_up(struct i2chid_ops *ops)
 		container_of(ops, struct i2c_hid_of_goodix, ops);
 	int ret;
 
-	ret = regulator_enable(ihid_goodix->vdd);
-	if (ret)
-		return ret;
-
-	ret = regulator_enable(ihid_goodix->vddio);
-	if (ret)
-		return ret;
+	/*
+	 * This is to ensure that the reset GPIO will be asserted and the
+	 * regulators will be enabled for all cases.
+	 */
+	if (ihid_goodix->powered_in_suspend) {
+		/*
+		 * This is not mandatory, but we assert reset here (instead of
+		 * in power-down) to ensure that the device will have a clean
+		 * state later on just like the normal scenarios would have.
+		 *
+		 * Also, since the regulators were not disabled in power-down,
+		 * we don't need to enable them here.
+		 */
+		gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
+	} else {
+		/*
+		 * In this case, the reset is already asserted (either in
+		 * probe or power-down).
+		 * All we need is to enable the regulators.
+		 */
+		ret = regulator_enable(ihid_goodix->vdd);
+		if (ret)
+			return ret;
+
+		ret = regulator_enable(ihid_goodix->vddio);
+		if (ret)
+			return ret;
+	}
 
 	if (ihid_goodix->timings->post_power_delay_ms)
 		msleep(ihid_goodix->timings->post_power_delay_ms);
@@ -60,6 +82,13 @@ static void goodix_i2c_hid_power_down(struct i2chid_ops *ops)
 	struct i2c_hid_of_goodix *ihid_goodix =
 		container_of(ops, struct i2c_hid_of_goodix, ops);
 
+	/*
+	 * Don't assert reset GPIO or disable regulators if we're keeping the
+	 * device powered in suspend.
+	 */
+	if (ihid_goodix->powered_in_suspend)
+		return;
+
 	gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
 	regulator_disable(ihid_goodix->vddio);
 	regulator_disable(ihid_goodix->vdd);
@@ -91,6 +120,9 @@ static int i2c_hid_of_goodix_probe(struct i2c_client *client)
 	if (IS_ERR(ihid_goodix->vddio))
 		return PTR_ERR(ihid_goodix->vddio);
 
+	ihid_goodix->powered_in_suspend =
+		of_property_read_bool(client->dev.of_node, "powered-in-suspend");
+
 	ihid_goodix->timings = device_get_match_data(&client->dev);
 
 	return i2c_hid_core_probe(client, &ihid_goodix->ops, 0x0001, 0);
-- 
2.40.0.634.g4ca3ef3211-goog


