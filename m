Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCACC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 08:39:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99E726023B
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 08:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99E726023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4/dn85/DBxE7vWgIpbMlsw6cH4clYTqgOX3N8DQch8A=; b=WAXlcXKQyVour65+dIocyy7b1
	pbz55KHcoekYpkxtZ/M1YUsl35E5IrmfTYcvGNnrbYsIca4vAgvpmtL8WaJGjfdN6/bh+QUpM+sD7
	z7eeCU5nt0pqD5KFBOLrhFtz6HoWAskbK/cy1Q/YuRhfx10IsWyF4/ZqQn+FDWpdj0+9L4ShQLIh1
	Y4E5ZcqiEPQf1r2nj8RrQGQtKyIEPAAx9ZcohGmZ1HM7Y9PUCAfG0PxHKXuPyoxOXiBmUXGfGhzD8
	dUU0hHOzjyRT6qgk+opo/Dy4sVMLXUiNojg7HERmzoCicc9NKfNKCbyWsZInUKw/VG1cDUAQzOThk
	dFipcafOg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWb32-00C0W0-FZ; Wed, 14 Apr 2021 08:38:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWb2T-00C0OR-0t
 for linux-mediatek@desiato.infradead.org; Wed, 14 Apr 2021 08:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Ezz+xwgw5OBNct98QIx3DrKz2g6nfTcGTggPHQsngzE=; b=D7bKB32Z3fA2jQFwhujhT5PVxE
 N84VnwYXU5ES+UhyXcDlgyiijDK/MqOagDjz66YsRPC4htSIZqYoaMlGHorpJlPMa42DrUeDjZLrt
 mPnH6Wz91Zh4l+nvTaEYMHx+ADDgLH07VK+G6k2VmVOYAE8Gjpcd7/RqFapMoVosqtDHzDY8b796T
 LYBr8gkLO6sBmiQaPC4NaLDFm4VkHy+wi7qqdPHdXAB49GUYMBXcGRA8RKWYeQ8kWhYuTJw+lS4m5
 fhhKFHVmmiiedx/d7bTqxmKELTF+TqkT8lU+79Y3UkTw8uH+phKK9xUPuxKeUMHiP/fDK+w8XNuRT
 m/TRHahg==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWb2Q-007cL1-83
 for linux-mediatek@lists.infradead.org; Wed, 14 Apr 2021 08:38:19 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 b8-20020a17090a5508b029014d0fbe9b64so12105766pji.5
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Apr 2021 01:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ezz+xwgw5OBNct98QIx3DrKz2g6nfTcGTggPHQsngzE=;
 b=Ito0EltF+9vj1JZ0itn4wHDduIsj82wFlkijhJ473gRwah9kPfMXJch0BSRlvIdhyn
 pj8iWHtqT48eWeFYt2pQDiAatkPrs//ZxNDkGT9dqB7nSvXAgUp0DmBIcfJCpdWZkj/B
 FGxrZQJ9CssBc6LHqXqKp3GOfy3z+54bTughc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ezz+xwgw5OBNct98QIx3DrKz2g6nfTcGTggPHQsngzE=;
 b=cx//ldbtyt2+QA418nPp0l0tIvmFbg6gp5uwTGDO36ryP4bva0woBwZ/S+XVUbyQr0
 gpUkzLU9r0uG0eU1f3XFb79gBGXDhlrwVFj7x0wt17ZGAhtB1hNKpXVcxqDmhk6n5vhV
 gikS4MAKUCi+Sb61XuJO9z/x3U9UT9S5mTDKs8s8NuTENYlrHCSzYCv3f4vmXoSviJyR
 jbvneMcU3NN4iIbrqwXUjXwW05igcJ0Nm2WB07DcyVCxYESnRt3e7uPDyv8Ag2VMem3O
 nfSFunc5svj0my9Z3KvoHA+0wXcPR8dBmsMaahQI68/QyAP16TtYfh6fky9EZoEl0xPO
 qMsw==
X-Gm-Message-State: AOAM532cFYV7oAN4EhwwNEWFi4nEqyF34VcAOz5gEqqXOCBy90CTxh+z
 qqtjTjqWvaHA5P28zYPdH9vEow==
X-Google-Smtp-Source: ABdhPJzZiW1LgUpXYMVuVSaK0KuyiPuiSCGbCq87z1kiOxJGNUaHevQBBBoUn64xP5SgewFqJULu9g==
X-Received: by 2002:a17:902:e889:b029:e6:4c9:ef02 with SMTP id
 w9-20020a170902e889b02900e604c9ef02mr36828734plg.1.1618389497105; 
 Wed, 14 Apr 2021 01:38:17 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:bae3:4af0:9792:1539])
 by smtp.gmail.com with ESMTPSA id g24sm8901582pfh.164.2021.04.14.01.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 01:38:16 -0700 (PDT)
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
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v18 1/5] i2c: core: support bus regulator controlling in
 adapter
Date: Wed, 14 Apr 2021 16:38:05 +0800
Message-Id: <20210414083809.1932133-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210414083809.1932133-1-hsinyi@chromium.org>
References: <20210414083809.1932133-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_013818_313129_451FE1F7 
X-CRM114-Status: GOOD (  19.58  )
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
