Return-Path: <SRS0=RXgq=A4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126DFC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 02:45:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5EC420838
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 02:45:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K0VXDrtA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="edzH6w1t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5EC420838
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qSuV3Fej0nFme36adjStSH7bbfUPY3ZYXppnQd5nrek=; b=K0VXDrtAnq1+9nfmhY2fUvWh1v
	JaVGCkC9xZsCDHdy71o7MHtF255S6MxMllq8OYUJzxJDGMce5/aQTkA5cHTfIKAQYrwUA2UU41I3e
	iJhbEdC1WGV8voBGFGVo447L9cfOvZhot1vpvC588AczQi+Lurdi3J+fSMZuYDSz02vcxEx7mLmQV
	7LoD3M8XBXizx8SkHPHfs4KT/p0V8eyAB8o/KKWhOkRzskpFjU6BFLRUHKrITMYhiyEetyc+E13fN
	JtGCDWcUfvSyKmmCoFo869bfjteBifT9JTOtlpYeCwYXfoo1EX+bwM8uso+OEdxJSeHrnIOAOhrIN
	wr+34n6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwGMt-0006Pr-5i; Fri, 17 Jul 2020 02:44:59 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwGMq-0006Or-5n
 for linux-mediatek@lists.infradead.org; Fri, 17 Jul 2020 02:44:56 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id x1so9663525ybg.8
 for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2020 19:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=2BxjzP72iQdxP7BBImWs20Rvt3buz2LvW5kNpRsHJrc=;
 b=edzH6w1tmEp4FV+8F+FvzJxmwPfMcqxN+r0PndFf2NFYuR596Xt4jVy1S/lpZiFYo5
 ae7FEfCSqzYLDi7YIWgUMuCeJjkPUB+UPbluOzn0kLYVk6RjxL/cpgkXDb9qWKzFLPPC
 cRvAHzNnG6mJFDoIVlSSFsd68wZbcYFmytYJ2yBV0rZavd1olwPZZqP37WSypAmsKBQS
 Wbf4R/F3y3DxQb2LBvm+Y3KugnDSpyOIGmEwiTBG2DnOFsT4ywnYvxv0y/PE7n7WnJJK
 V6y75QybSjrtKuOqY8ds0cCJwlLHynUw1YbaNSXcvzxI8skPsfGKq43PzLdrLvL9qVe+
 QboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=2BxjzP72iQdxP7BBImWs20Rvt3buz2LvW5kNpRsHJrc=;
 b=RqJARUaiM8DNvLiQnvjE7u8nqTmtg9bJp7izn9zA8DIhxJTMrBZTxy2fFY6jflBGIE
 A39CqQAISVuq6ozJRkbfIlDn+iSN58pIRQSjgr1VWhA982bus1Y5QiIGI2c+4HrYykg9
 Ia1moz26FVEdT/2xCLXYTEEVB1+FnpQFkOf1q8nCA5G2UiihnnbFsiDWf7YCUlx+zLpo
 f2NUDyary1kRSDjtxt3w1cHVkKjN8vmSDmyWL5t9uebnX4eHfbB0vzjQfbkOnMXuL9xF
 Jh5R5nqv4JvIOHFRArAA8kXzxNrkUBkOnoDzNOZqkWEoGhf6Np9pe4p0Rqttz8BUZR2x
 Nvkg==
X-Gm-Message-State: AOAM533kR+nSLIkXRrlVrdE1fKynWJThocRJS2wVIbltu3i7+cv8ni52
 6wShqpTB3G9aCkevKov2NPFtvMyeOM8PD7g=
X-Google-Smtp-Source: ABdhPJxSbi/so9LC9Hx2K/NJBPQpWfhio3DksqcrkFYd3YFZSePPAWPP+AQatb0XaXyze7GjIuJH4VCknBdbDlE=
X-Received: by 2002:a25:73c2:: with SMTP id
 o185mr10556755ybc.169.1594953891393; 
 Thu, 16 Jul 2020 19:44:51 -0700 (PDT)
Date: Thu, 16 Jul 2020 19:44:47 -0700
Message-Id: <20200717024447.3128361-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH v2] irqchip: Add IRQCHIP_PLATFORM_DRIVER_BEGIN/END and
 IRQCHIP_MATCH helper macros
From: Saravana Kannan <saravanak@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <maz@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_224456_235572_EDB43E47 
X-CRM114-Status: GOOD (  15.72  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: CC Hwang <cc.hwang@mediatek.com>, Saravana Kannan <saravanak@google.com>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
 linux-mediatek@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Compiling an irqchip driver as a platform driver needs to bunch of
things to be done right:
- Making sure the parent domain is initialized first
- Making sure the device can't be unbound from sysfs
- Disallowing module unload if it's built as a module
- Finding the parent node
- Etc.

Instead of trying to make sure all future irqchip platform drivers get
this right, provide boilerplate macros that take care of all of this.

An example use would look something like this. Where acme_foo_init and
acme_bar_init are similar to what would be passed to IRQCHIP_DECLARE.

IRQCHIP_PLATFORM_DRIVER_BEGIN
IRQCHIP_MATCH(foo, "acme,foo", acme_foo_init)
IRQCHIP_MATCH(bar, "acme,bar", acme_bar_init)
IRQCHIP_PLATFORM_DRIVER_END(acme_irq)

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/irqchip/irqchip.c | 22 ++++++++++++++++++++++
 include/linux/irqchip.h   | 23 +++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/irqchip/irqchip.c b/drivers/irqchip/irqchip.c
index 2b35e68bea82..236ea793f01c 100644
--- a/drivers/irqchip/irqchip.c
+++ b/drivers/irqchip/irqchip.c
@@ -10,8 +10,10 @@
 
 #include <linux/acpi.h>
 #include <linux/init.h>
+#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/irqchip.h>
+#include <linux/platform_device.h>
 
 /*
  * This special of_device_id is the sentinel at the end of the
@@ -29,3 +31,23 @@ void __init irqchip_init(void)
 	of_irq_init(__irqchip_of_table);
 	acpi_probe_device_table(irqchip);
 }
+
+int platform_irqchip_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device_node *par_np = of_irq_find_parent(np);
+	of_irq_init_cb_t irq_init_cb = of_device_get_match_data(&pdev->dev);
+
+	if (!irq_init_cb)
+		return -EINVAL;
+
+	if (par_np == np)
+		par_np = NULL;
+
+	/* If there's a parent irqchip, make sure it has been initialized. */
+	if (par_np && !irq_find_matching_host(np, DOMAIN_BUS_ANY))
+		return -EPROBE_DEFER;
+
+	return irq_init_cb(np, par_np);
+}
+EXPORT_SYMBOL_GPL(platform_irqchip_probe);
diff --git a/include/linux/irqchip.h b/include/linux/irqchip.h
index 950e4b2458f0..6d5eba7cbbb7 100644
--- a/include/linux/irqchip.h
+++ b/include/linux/irqchip.h
@@ -13,6 +13,7 @@
 
 #include <linux/acpi.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
 
 /*
  * This macro must be used by the different irqchip drivers to declare
@@ -26,6 +27,28 @@
  */
 #define IRQCHIP_DECLARE(name, compat, fn) OF_DECLARE_2(irqchip, name, compat, fn)
 
+extern int platform_irqchip_probe(struct platform_device *pdev);
+
+#define IRQCHIP_PLATFORM_DRIVER_BEGIN \
+static const struct of_device_id __irqchip_match_table[] = {
+
+#define IRQCHIP_MATCH(compat, fn) { .compatible = compat, .data = fn },
+
+#define IRQCHIP_PLATFORM_DRIVER_END(drv_name)		\
+	{},						\
+};							\
+MODULE_DEVICE_TABLE(of, __irqchip_match_table);		\
+static struct platform_driver drv_name##_driver = {	\
+	.probe  = platform_irqchip_probe,		\
+	.driver = {					\
+		.name = #drv_name,			\
+		.owner = THIS_MODULE,			\
+		.of_match_table = __irqchip_match_table,\
+		.suppress_bind_attrs = true,		\
+	},						\
+};							\
+builtin_platform_driver(drv_name##_driver)
+
 /*
  * This macro must be used by the different irqchip drivers to declare
  * the association between their version and their initialization function.
-- 
2.28.0.rc0.105.gf9edc3c819-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
