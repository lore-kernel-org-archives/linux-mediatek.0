Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45101C7113B
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Aug 2023 10:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEJf1Ko1BMCyWS/D/rsWBp+WuGpyKGTRzMpr52lamRc=; b=m19VTwU7XpfOWE
	enxNGG9BDkU4OXPf8hmr1FHJGXg/au8Ca/tzU+lJunnk6gvnCmFid/6sFkNRrkvQ15k0c3F3us9AG
	SaACkAQfN/KVkEGCJDz4YbiNUR3VLRuW0pyGBxOWxjKLZ1mEjVzsBZp223CizuUp2rMPGSRCECp1t
	98lQhqSAX1lCMqt6iy1SNPJw+k/EK8TGL+0vcb+tvAg9iksJPFYFXMisEzueqF3olbhRW8ucYadKk
	pdLCMKlVhvWPVYtfwNEZ6ObBFEgC4FqbeAK6O96OK45Z3rpgxyok6S31ji3XPSd+EJMWzuPQ44Rpw
	4yF8cVTUbFrTeaF9SU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ7mq-002tlM-3A;
	Thu, 24 Aug 2023 10:42:00 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ7mo-002ti5-0F
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Aug 2023 10:41:59 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bdca7cc28dso52417295ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Aug 2023 03:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692873714; x=1693478514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEJf1Ko1BMCyWS/D/rsWBp+WuGpyKGTRzMpr52lamRc=;
        b=oaZO0U9EnOZE/Os+8hmlmogE4YwN515J72FCRMHS0mo31BHgkDUfNVslhtRyvz2atI
         shXHfduCWhdeyg1WmMDN3GzTmCG3gc52LI5GIU/tRzvvRW9AdZ2FI87Phb2icityItBZ
         LyCOsvzyLqM0ivkRo4XPSXJCLzdyOURzpKDls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692873714; x=1693478514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEJf1Ko1BMCyWS/D/rsWBp+WuGpyKGTRzMpr52lamRc=;
        b=fn+T96NgsiOgywoM1VzpL8fFc8Nil1rLzUqggBKSEE8UKu+zRPm3biU6UKPA8596+2
         P3JBnckV4rkhGDPt5WLmS9CGnzI2DyoCPOSZBtof5hlC5tJ5tOuCvhsyK/nIL8H3dVHv
         9EfJ5qpB9jpBCefUSARlFyEJFI4SBw+o4VWCJUUS1D1FxnqVibpj40DAsy+uVPFct0+5
         BF09mtLPo4meEglesL6riX8kYweCxemXGZMfdO/VLUmxwZkwM62GVMMKI9oZAHLssPxO
         tItUYIPd8sLEujSj6zXi3qNwPXt7D4Ge1obclqpD0bX9Vygud3Kr/NGjSKypVL0+c6+L
         SLjQ==
X-Gm-Message-State: AOJu0YwtHtG8d50spSyMPdBfM7bRWnCN3P0v9NMATHAzGd4BvkHRVQpK
	lvtRNhXsUVWHihZ1IpE87fH1mA==
X-Google-Smtp-Source: AGHT+IF+kf7WstGJzoE6CoHxmnzcwn+x6Is3sSPEaLcz4wnfFtA6FShvnq99VJEDPmziWkv/tJ0woQ==
X-Received: by 2002:a17:902:da88:b0:1bc:203f:3b3c with SMTP id j8-20020a170902da8800b001bc203f3b3cmr17586042plx.24.1692873714369;
        Thu, 24 Aug 2023 03:41:54 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ed6d:42e3:a23:8316])
        by smtp.gmail.com with ESMTPSA id q2-20020a170902dac200b001b5247cac3dsm12524645plx.110.2023.08.24.03.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 03:41:54 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH 1/5] spmi: Introduce device-managed functions
Date: Thu, 24 Aug 2023 18:40:08 +0800
Message-ID: <20230824104101.4083400-2-fshao@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824104101.4083400-1-fshao@chromium.org>
References: <20230824104101.4083400-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_034158_116451_291D3339 
X-CRM114-Status: GOOD (  15.68  )
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Utilize the managed resource (devres) framework and add the following
devm_* helpers for the SPMI driver:

- devm_spmi_controller_alloc()
- devm_spmi_controller_add()

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/spmi/Makefile |  2 +-
 drivers/spmi/devres.c | 61 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/spmi.h  |  3 +++
 3 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 drivers/spmi/devres.c

diff --git a/drivers/spmi/Makefile b/drivers/spmi/Makefile
index 9d974424c8c1..02d917f4df34 100644
--- a/drivers/spmi/Makefile
+++ b/drivers/spmi/Makefile
@@ -2,7 +2,7 @@
 #
 # Makefile for kernel SPMI framework.
 #
-obj-$(CONFIG_SPMI)	+= spmi.o
+obj-$(CONFIG_SPMI)	+= spmi.o devres.o
 
 obj-$(CONFIG_SPMI_HISI3670)	+= hisi-spmi-controller.o
 obj-$(CONFIG_SPMI_MSM_PMIC_ARB)	+= spmi-pmic-arb.o
diff --git a/drivers/spmi/devres.c b/drivers/spmi/devres.c
new file mode 100644
index 000000000000..f18cbbe28812
--- /dev/null
+++ b/drivers/spmi/devres.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2023 Google LLC.
+ */
+
+#include <linux/device.h>
+#include <linux/spmi.h>
+
+static void devm_spmi_controller_release(struct device *parent, void *res)
+{
+	spmi_controller_put(*(struct spmi_controller **)res);
+}
+
+struct spmi_controller *devm_spmi_controller_alloc(struct device *parent, size_t size)
+{
+	struct spmi_controller **ptr, *ctrl;
+
+	ptr = devres_alloc(devm_spmi_controller_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	ctrl = spmi_controller_alloc(parent, size);
+	if (!ctrl) {
+		devres_free(ptr);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	*ptr = ctrl;
+	devres_add(parent, ptr);
+
+	return ctrl;
+}
+EXPORT_SYMBOL_GPL(devm_spmi_controller_alloc);
+
+static void devm_spmi_controller_remove(struct device *parent, void *res)
+{
+	spmi_controller_remove(*(struct spmi_controller **)res);
+}
+
+int devm_spmi_controller_add(struct device *parent, struct spmi_controller *ctrl)
+{
+	struct spmi_controller **ptr;
+	int ret;
+
+	ptr = devres_alloc(devm_spmi_controller_remove, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = spmi_controller_add(ctrl);
+	if (ret) {
+		devres_free(ptr);
+		return ret;
+	}
+
+	*ptr = ctrl;
+	devres_add(parent, ptr);
+
+	return 0;
+
+}
+EXPORT_SYMBOL_GPL(devm_spmi_controller_add);
diff --git a/include/linux/spmi.h b/include/linux/spmi.h
index eac1956a8727..14597708fdbc 100644
--- a/include/linux/spmi.h
+++ b/include/linux/spmi.h
@@ -120,6 +120,9 @@ static inline void spmi_controller_put(struct spmi_controller *ctrl)
 int spmi_controller_add(struct spmi_controller *ctrl);
 void spmi_controller_remove(struct spmi_controller *ctrl);
 
+struct spmi_controller *devm_spmi_controller_alloc(struct device *parent, size_t size);
+int devm_spmi_controller_add(struct device *parent, struct spmi_controller *ctrl);
+
 /**
  * struct spmi_driver - SPMI slave device driver
  * @driver:	SPMI device drivers should initialize name and owner field of
-- 
2.42.0.rc1.204.g551eb34607-goog


