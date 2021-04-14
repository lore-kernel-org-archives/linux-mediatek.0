Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEFFC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 17:30:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE0B161179
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 17:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE0B161179
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4/dn85/DBxE7vWgIpbMlsw6cH4clYTqgOX3N8DQch8A=; b=Isw4BktC0aNg0ClxcfwvKZ9hK
	5Y+5Kvj0TGgV7KHAV1ElpBlAeUcD6j3Jy/ZIvXhgzb9le251s4qHepMjw4woP6z1cB4LT27R4M4Iv
	4RSgXjOa8lDG6DtZsm8pBXNrulI1uE5MY5cYT6rljQvPMs6LKlnMBkb/bzoh0Hj/z67m/v68wsF3y
	gPu/oB7J1UkJHubLn1rHxXaW8IRzoB92zcatMjFCkRPU55dpafSvMhhQmlu0ALlvPuAj1rkyRL1Ph
	5rcWp8SWC1hn/fIh/G24bPI7a06BhDAPpf8nYAufnVroWLe18aC8xqLddDeGow3aaxWAyqu5bZSG5
	X2Pw4ZDeA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWjL5-00DGVR-E7; Wed, 14 Apr 2021 17:30:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWjKT-00DGQI-BU
 for linux-mediatek@desiato.infradead.org; Wed, 14 Apr 2021 17:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Ezz+xwgw5OBNct98QIx3DrKz2g6nfTcGTggPHQsngzE=; b=yA8VE3a8JPK4cpBNHQkuJz6hTF
 BD8BRQUON2zapt7DdBNq0b2HfC80A41xtgifd0s0iCR0APMFMnoiUPXjYpEb7vjwaFD993ldTzKdy
 cLNVe1Ieli3R0waoXX3ZJ1NYiIkcDjvaH5mqC+RKwK/pzY2Bf/f9oc2iHV7OwQ2G9WPOwQuIY/a4W
 ZJNa5gI/v5O+9tNR6WL1dgsC+aQ2y5zwkncld0IJCfrULGdxH5tF/voGRRelzjvVR4vJObK28MCpR
 dUtJRBLbeDGmuAoDEWqYbZBVwOenSZyMKmpK6TzoAdFCb5kPwkkQyyIMlm0aJM5N3Mo5auUexefwN
 8Q4D2HoQ==;
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWjKP-007yZd-T9
 for linux-mediatek@lists.infradead.org; Wed, 14 Apr 2021 17:29:28 +0000
Received: by mail-pg1-x529.google.com with SMTP id p12so14912857pgj.10
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Apr 2021 10:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ezz+xwgw5OBNct98QIx3DrKz2g6nfTcGTggPHQsngzE=;
 b=C63pm7W76A7SIp9UYZ+J8BtLdlaH/RX2PaCySXAJoR/LKzJ2bOWM5zvyfMundtO5Jk
 cLEXickkIAcACf4uwt1m+KL17nG0kXSFQdnsmAScPPrqpCDnuCpWThFhKF2qDQ5WX6tC
 eX1iuq5/dmaeh+2ZZLN1piYmWW89BwHyMa/r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ezz+xwgw5OBNct98QIx3DrKz2g6nfTcGTggPHQsngzE=;
 b=eHXD9zcEOuGrF2D+jlaQAag+1mmaEH4Fq3iKQgjSOr8pi00Weovis9y11FtNMdFZ0z
 Dzqg/yGqFqKzmMU29FNhAKxE0SeJitAg5o0g80BlqbhxYNLlqwt38zBUmKcqi10YqC95
 Urp0JgBektmPQLe8t9287Y2c8EKZX4Qn5FimEDxytrYI4aDV6AeYsvejxmxXhXepzZIy
 LKkN0COObiZ2FOjjGuagEj8orkYFcF1mPyW5qq99jX5BVuFB4iWudSE9PlqSWiv8ATU3
 nHkoW6U3sLjsRS8hy3xFONzkUs4KRK03PVRDS38G/aFWCbAyizl+LpWqfhny6ZP86e1n
 5yyw==
X-Gm-Message-State: AOAM531SnpulNqN5Os94/56tKfsIqotzJMaUpIdrDdZbnimq6M0wSveI
 n99O8PmRCgrwkI7Vb2OZh92J+A==
X-Google-Smtp-Source: ABdhPJysgkKW/4EtFf6y57mg3LS1NKoTRa4gq/KpnlkO4xtU2BgzYr96EezjQNXpi9pXPRC8z+P1sA==
X-Received: by 2002:a63:4a44:: with SMTP id j4mr394617pgl.283.1618421364951;
 Wed, 14 Apr 2021 10:29:24 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:bae3:4af0:9792:1539])
 by smtp.gmail.com with ESMTPSA id e31sm63460pjk.4.2021.04.14.10.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 10:29:24 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v19 1/6] i2c: core: support bus regulator controlling in
 adapter
Date: Thu, 15 Apr 2021 01:29:11 +0800
Message-Id: <20210414172916.2689361-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210414172916.2689361-1-hsinyi@chromium.org>
References: <20210414172916.2689361-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_102925_955391_B176CE9B 
X-CRM114-Status: GOOD (  19.60  )
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

We can control bulk regulator if it is provided in i2c
adapter device.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/i2c/i2c-core-base.c | 88 +++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h         |  2 +
 2 files changed, 90 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 24c8f11bac73..c34920f30c5a 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -461,12 +461,14 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
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
@@ -532,6 +534,14 @@ static int i2c_device_probe(struct device *dev)
 
 	dev_dbg(dev, "probe\n");
 
+	if (adap->bus_regulator) {
+		status = regulator_enable(adap->bus_regulator);
+		if (status < 0) {
+			dev_err(&adap->dev, "Failed to enable bus regulator\n");
+			goto err_clear_wakeup_irq;
+		}
+	}
+
 	status = of_clk_set_defaults(dev->of_node, false);
 	if (status < 0)
 		goto err_clear_wakeup_irq;
@@ -589,8 +599,10 @@ static int i2c_device_probe(struct device *dev)
 static int i2c_device_remove(struct device *dev)
 {
 	struct i2c_client	*client = to_i2c_client(dev);
+	struct i2c_adapter      *adap;
 	struct i2c_driver	*driver;
 
+	adap = client->adapter;
 	driver = to_i2c_driver(dev->driver);
 	if (driver->remove) {
 		int status;
@@ -605,6 +617,8 @@ static int i2c_device_remove(struct device *dev)
 	devres_release_group(&client->dev, client->devres_group_id);
 
 	dev_pm_domain_detach(&client->dev, true);
+	if (!pm_runtime_status_suspended(&client->dev) && adap->bus_regulator)
+		regulator_disable(adap->bus_regulator);
 
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
@@ -617,6 +631,79 @@ static int i2c_device_remove(struct device *dev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int i2c_resume_early(struct device *dev)
+{
+	struct i2c_client *client = i2c_verify_client(dev);
+	int err;
+
+	if (!client || !client->adapter->bus_regulator)
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
+	if (!client || !client->adapter->bus_regulator)
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
+	if (!client || !client->adapter->bus_regulator)
+		return 0;
+
+	err = regulator_enable(client->adapter->bus_regulator);
+	if (err)
+		return err;
+	return pm_generic_runtime_resume(&client->dev);
+}
+
+static int i2c_runtime_suspend(struct device *dev)
+{
+	struct i2c_client *client = i2c_verify_client(dev);
+	int err;
+
+	if (!client || !client->adapter->bus_regulator)
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
@@ -674,6 +761,7 @@ struct bus_type i2c_bus_type = {
 	.probe		= i2c_device_probe,
 	.remove		= i2c_device_remove,
 	.shutdown	= i2c_device_shutdown,
+	.pm		= &i2c_device_pm,
 };
 EXPORT_SYMBOL_GPL(i2c_bus_type);
 
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index e8f2ac8c9c3d..953a4eecb88f 100644
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
@@ -729,6 +730,7 @@ struct i2c_adapter {
 	const struct i2c_adapter_quirks *quirks;
 
 	struct irq_domain *host_notify_domain;
+	struct regulator *bus_regulator;
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
-- 
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
