Return-Path: <SRS0=kKdk=A5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A83FC433EA
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2020 00:07:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCD1320691
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2020 00:06:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bsBKcD8Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="f7sz0tga"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCD1320691
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LI3AArnKELFAHC1QeB3BrkFaCH6obTODfsCb1xCv+Rg=; b=bsBKcD8Y+OMWhrlXB3mvHGdb4
	0i0LUhicagSoMh8dQDEex3hMgq+YepfTkbMCLtdoUDXMA7VOTjwK8bNR2R+G6vxfFf1sLCL7YaupC
	HBNcbds3AcyWgC+8ruxUSpUlwOthIc3vEBaema3rFsDw2uQtAmzRArbz0SePQolhhXFwWO9pXBIcU
	66PAdkpTtfbdXhKstWQ9iEs51GZm90EnT1yLnlx03FCuV0KdAptfuDT4WAtqN64nlHFud0N8tF5ia
	UB40FaCDf6ZYTMgsR7Tx4GAPpNtMFhJgTu5/o/UNDZ2I/RV/VmVDyAQ/JsA2UJLKQTRInR9GPtajy
	FfiVaTgFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwaNN-0001tv-3m; Sat, 18 Jul 2020 00:06:49 +0000
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwaNK-0001rX-19
 for linux-mediatek@lists.infradead.org; Sat, 18 Jul 2020 00:06:46 +0000
Received: by mail-qk1-x74a.google.com with SMTP id z1so7142878qkz.3
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2020 17:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=lZV5LJ2D+3d5c6Q1RBEHt+umrHrDQPYow79ie/sqGoo=;
 b=f7sz0tgaClL14NdE7pJITVXQTObuFddTT6emyjS08ZgPsh5vLij6r8Zr0bdr8nmJRz
 HLP+EdNTkpLXbcL5dYajxBaRik3Dw2bErrgNidiApzncVpOsTCt+bfjEJ1gVY0MTCIK3
 0Zj3UzcABE83gfPsE1DrmmHS203F++mP+Ysu29KDC3/FnR95F8F0v9dVnsnN06FinAji
 R+vJDBGn3CsQ/h9XHm9VCIoUqnaEcHwJCaJu1fQd1sLUv6WgSaZZBj2zHrk05K23z0/T
 ByzcbObDgfus2zOMoNbaOXd15ySmQzPlMHtexdlMoydVKP8BFo62ExGirBtJUN7Nx3Ji
 FLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=lZV5LJ2D+3d5c6Q1RBEHt+umrHrDQPYow79ie/sqGoo=;
 b=IozxpR4poegczOG9DtmUYeWKLgTnfPs78q7YmFJNQU0gyNV1myE/aZ+f9eGernphft
 fYISDB+W0y8sQPdHunXi6Bqj1XhYICVW0CR8VW5DMgp49GF9KAtqmQUznVLscTUEOAnL
 44yPgnx569aE4gUNkNuz9EHepV9wrjL9+u+vjwcdyIgLCNjUjNpznFveZeb1i4aPKBRe
 URoPtFPGHGl7xcOMVW/nM8Vqaz9He/EjWWdnrYeSmyT1osVHY7vENwViSICT9P41F96H
 +5CuMmz1EulHsxm2+EWB2ZjMnpTLq6omQeivmEGdiMafiBejlnsG652LdTYp9KZp5rqB
 MZFw==
X-Gm-Message-State: AOAM532lZfzzDrDs/g+MtbP3O9NUwPqUEKReqG0+Onpbo2s14jyOP1Ik
 GYq+2L/qcAsTD2RLUVbBMvsibg1FzCoyl+w=
X-Google-Smtp-Source: ABdhPJxJ7FCreyEpq5UXSDryBArlKlpzEz07QUPpT9WWRT3kKQejA5X0pbgSsPqzz1OI15cxmhDDFZUj4PyeZpY=
X-Received: by 2002:a05:6214:8f4:: with SMTP id
 dr20mr10977278qvb.228.1595030802697; 
 Fri, 17 Jul 2020 17:06:42 -0700 (PDT)
Date: Fri, 17 Jul 2020 17:06:34 -0700
In-Reply-To: <20200718000637.3632841-1-saravanak@google.com>
Message-Id: <20200718000637.3632841-2-saravanak@google.com>
Mime-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH v3 1/4] irqchip: Add IRQCHIP_PLATFORM_DRIVER_BEGIN/END and
 IRQCHIP_MATCH helper macros
From: Saravana Kannan <saravanak@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <maz@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_200646_126468_65943562 
X-CRM114-Status: GOOD (  16.81  )
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
 linux-arm-msm@vger.kernel.org, Hanks Chen <hanks.chen@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, John Stultz <john.stultz@linaro.org>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
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

IRQCHIP_PLATFORM_DRIVER_BEGIN(acme_irq)
IRQCHIP_MATCH("acme,foo", acme_foo_init)
IRQCHIP_MATCH("acme,bar", acme_bar_init)
IRQCHIP_PLATFORM_DRIVER_END(acme_irq)

Cc: John Stultz <john.stultz@linaro.org>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/irqchip/irqchip.c | 29 +++++++++++++++++++++++++++++
 include/linux/irqchip.h   | 23 +++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/irqchip/irqchip.c b/drivers/irqchip/irqchip.c
index 2b35e68bea82..1bb0e36c2bf3 100644
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
@@ -29,3 +31,30 @@ void __init irqchip_init(void)
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
+	/*
+	 * If there's a parent interrupt controller and  none of the parent irq
+	 * domains have been registered, that means the parent interrupt
+	 * controller has not been initialized yet.  it's not time for this
+	 * interrupt controller to initialize. So, defer probe of this
+	 * interrupt controller. The actual initialization callback of this
+	 * interrupt controller can check for specific domains as necessary.
+	 */
+	if (par_np && !irq_find_matching_host(np, DOMAIN_BUS_ANY))
+		return -EPROBE_DEFER;
+
+	return irq_init_cb(np, par_np);
+}
+EXPORT_SYMBOL_GPL(platform_irqchip_probe);
diff --git a/include/linux/irqchip.h b/include/linux/irqchip.h
index 447f22880a69..8e754d8b8155 100644
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
+#define IRQCHIP_PLATFORM_DRIVER_BEGIN(drv_name) \
+static const struct of_device_id drv_name##_irqchip_match_table[] = {
+
+#define IRQCHIP_MATCH(compat, fn) { .compatible = compat, .data = fn },
+
+#define IRQCHIP_PLATFORM_DRIVER_END(drv_name)				\
+	{},								\
+};									\
+MODULE_DEVICE_TABLE(of, drv_name##_irqchip_match_table);		\
+static struct platform_driver drv_name##_driver = {		\
+	.probe  = platform_irqchip_probe,				\
+	.driver = {							\
+		.name = #drv_name,					\
+		.owner = THIS_MODULE,					\
+		.of_match_table = drv_name##_irqchip_match_table,	\
+		.suppress_bind_attrs = true,				\
+	},								\
+};									\
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
