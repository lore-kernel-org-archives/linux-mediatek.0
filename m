Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634F6C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 04:37:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0472B65159
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 04:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0472B65159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LgKwGMYb9KEN9eF+UCtmjUazxix0abK7iLjNo/idEm0=; b=G1lQZ9+/UUru9Gt/8dggWf3R3
	ZUp5etXCfBP0xS/Hs+RyEF5fEYQKXWogal3mdPcWIO4+b/WIAPxeNeCwt47oYkZVngHtVWk3pMiG+
	u+l/BrmiZYUz+m09ziK8oGWJcUkEcpgwJo+5j1+olGdiuPKd/FCpJ0iQPx/vHILf+LAZKFH1S0gJ/
	mzXsoHjAKCfnaUWpE8FTRNueJEgwIandehp3H7RFGge+rhr0FPbCT6z6Smt4QTiFG/Sw7wJttrMBP
	q0D2PEa775pZ6/4fUI7huYwBQJ+5OzOqfe6Y7FaU1oUDfEmVKUjvjyTqBDuOrQgHMGUPwBQk355AV
	cWLNP0Ldg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ7dd-00F7Sr-V3; Mon, 08 Mar 2021 04:37:02 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ7cy-00F7Ev-Ga
 for linux-mediatek@lists.infradead.org; Mon, 08 Mar 2021 04:36:24 +0000
Received: by mail-pf1-x42f.google.com with SMTP id y67so6407793pfb.2
 for <linux-mediatek@lists.infradead.org>; Sun, 07 Mar 2021 20:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zCUYo1BkJJoqTymCi6hMvf2QLrcDwpw0+n4l7ZEpGN4=;
 b=T4nNWfeEEpfK2XSkki4jbWraVBbxktuRTS2HhXQoYGtkzL34pFQHtqzEHkw+0KMCvW
 IC6Es0tS2VVoolWQLYrOCRxyEd8JnsTdt/8jJd6LWWobrBPilU6YjAZTwAkWNF9VjRS7
 Vc3mhkTOhGGB4yIYCv7eDSY+hCy8bpNX/joSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zCUYo1BkJJoqTymCi6hMvf2QLrcDwpw0+n4l7ZEpGN4=;
 b=SYkIuJ8RTZA3y5P+W8RpWLwGB2viYXBGhSN0zQ3+mQJ+CYaA46mwzRWSrdn1pW1P4Y
 wq6OMckIph/i7tWNGxmz175TrbdHKhJkVnMy/4D6Pnqca/wjmV1yTrKOS47/r4I7TuXD
 I7WYGeFnQKI2TVJaomVGxe8GIOid5xgNoZ3Eu+4srT9befFizgjxDj0hJG2gZ8t1Ze7n
 P9lfa+yYabdBCNPWBwxHuhdGX0W70ZvpnnmHbcEV9zjuzPRAaCBLbNKXSYL+RRAOqbLw
 44F1OY9jY6AgdKzb3eiGvoKwWP+NpKJJtvQgzT9GfLscOH6CQgJZKdQdZNmKgXVG1xqh
 D2Zg==
X-Gm-Message-State: AOAM530h+OTgPbQxsJ8OLPiC52iG3YRMSKRkCilY5TNIAqsuK9FB8ZhW
 upbXWKaMPg7yovu6yIk+1qX/GA==
X-Google-Smtp-Source: ABdhPJz6orCjYR3o+ZywlBEuIT4SmHbby45FSbzAS27Gny6Lq5/Vvs7jh8ldq2xhkJ4Ot5U/vCCqXQ==
X-Received: by 2002:aa7:92c7:0:b029:1ee:75b2:2dab with SMTP id
 k7-20020aa792c70000b02901ee75b22dabmr20048195pfa.61.1615178178182; 
 Sun, 07 Mar 2021 20:36:18 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5da1:da1b:5bcf:2d46])
 by smtp.gmail.com with ESMTPSA id q2sm8191562pfu.215.2021.03.07.20.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 20:36:17 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-i2c@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v16 2/2] i2c: core: support bus regulator controlling in
 adapter
Date: Mon,  8 Mar 2021 12:36:07 +0800
Message-Id: <20210308043607.957156-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210308043607.957156-1-hsinyi@chromium.org>
References: <20210308043607.957156-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_043620_754992_F2326350 
X-CRM114-Status: GOOD (  18.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bibby Hsieh <bibby.hsieh@mediatek.com>

Although in the most platforms, the bus power of i2c
are alway on, some platforms disable the i2c bus power
in order to meet low power request.

We get and enable bulk regulator in i2c adapter device.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/i2c/i2c-core-base.c | 93 +++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h         |  2 +
 2 files changed, 95 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 63ebf722a424..667f4a4de7cc 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -439,12 +439,14 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
 static int i2c_device_probe(struct device *dev)
 {
 	struct i2c_client	*client = i2c_verify_client(dev);
+	struct i2c_adapter	*adap;
 	struct i2c_driver	*driver;
 	int status;
 
 	if (!client)
 		return 0;
 
+	adap = client->adapter;
 	client->irq = client->init_irq;
 
 	if (!client->irq) {
@@ -510,6 +512,12 @@ static int i2c_device_probe(struct device *dev)
 
 	dev_dbg(dev, "probe\n");
 
+	status = regulator_enable(adap->bus_regulator);
+	if (status < 0) {
+		dev_err(&adap->dev, "Failed to enable power regulator\n");
+		goto err_clear_wakeup_irq;
+	}
+
 	status = of_clk_set_defaults(dev->of_node, false);
 	if (status < 0)
 		goto err_clear_wakeup_irq;
@@ -550,8 +558,10 @@ static int i2c_device_probe(struct device *dev)
 static int i2c_device_remove(struct device *dev)
 {
 	struct i2c_client	*client = to_i2c_client(dev);
+	struct i2c_adapter      *adap;
 	struct i2c_driver	*driver;
 
+	adap = client->adapter;
 	driver = to_i2c_driver(dev->driver);
 	if (driver->remove) {
 		int status;
@@ -564,6 +574,8 @@ static int i2c_device_remove(struct device *dev)
 	}
 
 	dev_pm_domain_detach(&client->dev, true);
+	if (!pm_runtime_status_suspended(&client->dev))
+		regulator_disable(adap->bus_regulator);
 
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
@@ -576,6 +588,80 @@ static int i2c_device_remove(struct device *dev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int i2c_resume_early(struct device *dev)
+{
+	struct i2c_client *client = i2c_verify_client(dev);
+	int err;
+
+	if (!client)
+		return 0;
+
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		err = regulator_enable(client->adapter->bus_regulator);
+		if (err)
+			return err;
+	}
+
+	return pm_generic_resume_early(&client->dev);
+}
+
+static int i2c_suspend_late(struct device *dev)
+{
+	struct i2c_client *client = i2c_verify_client(dev);
+	int err;
+
+	if (!client)
+		return 0;
+
+	err = pm_generic_suspend_late(&client->dev);
+	if (err)
+		return err;
+
+	if (!pm_runtime_status_suspended(&client->dev))
+		return regulator_disable(client->adapter->bus_regulator);
+
+	return 0;
+}
+#endif
+
+#ifdef CONFIG_PM
+static int i2c_runtime_resume(struct device *dev)
+{
+	struct i2c_client *client = i2c_verify_client(dev);
+	int err;
+
+	if (!client)
+		return 0;
+
+	err = regulator_enable(client->adapter->bus_regulator);
+	if (err)
+		return err;
+
+	return pm_generic_runtime_resume(&client->dev);
+}
+
+static int i2c_runtime_suspend(struct device *dev)
+{
+	struct i2c_client *client = i2c_verify_client(dev);
+	int err;
+
+	if (!client)
+		return 0;
+
+	err = pm_generic_runtime_suspend(&client->dev);
+	if (err)
+		return err;
+
+	return regulator_disable(client->adapter->bus_regulator);
+}
+#endif
+
+static const struct dev_pm_ops i2c_device_pm = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(i2c_suspend_late, i2c_resume_early)
+	SET_RUNTIME_PM_OPS(i2c_runtime_suspend, i2c_runtime_resume, NULL)
+};
+
 static void i2c_device_shutdown(struct device *dev)
 {
 	struct i2c_client *client = i2c_verify_client(dev);
@@ -633,6 +719,7 @@ struct bus_type i2c_bus_type = {
 	.probe		= i2c_device_probe,
 	.remove		= i2c_device_remove,
 	.shutdown	= i2c_device_shutdown,
+	.pm		= &i2c_device_pm,
 };
 EXPORT_SYMBOL_GPL(i2c_bus_type);
 
@@ -1446,6 +1533,12 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	if (res)
 		goto out_reg;
 
+	adap->bus_regulator = devm_regulator_get(&adap->dev, "bus");
+	if (IS_ERR(adap->bus_regulator)) {
+		res = PTR_ERR(adap->bus_regulator);
+		goto out_reg;
+	}
+
 	pm_runtime_no_callbacks(&adap->dev);
 	pm_suspend_ignore_children(&adap->dev, true);
 	pm_runtime_enable(&adap->dev);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 56622658b215..ec87758d9f40 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -15,6 +15,7 @@
 #include <linux/device.h>	/* for struct device */
 #include <linux/sched.h>	/* for completion */
 #include <linux/mutex.h>
+#include <linux/regulator/consumer.h>
 #include <linux/rtmutex.h>
 #include <linux/irqdomain.h>		/* for Host Notify IRQ */
 #include <linux/of.h>		/* for struct device_node */
@@ -721,6 +722,7 @@ struct i2c_adapter {
 	const struct i2c_adapter_quirks *quirks;
 
 	struct irq_domain *host_notify_domain;
+	struct regulator *bus_regulator;
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
-- 
2.30.1.766.gb4fecdf3b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
