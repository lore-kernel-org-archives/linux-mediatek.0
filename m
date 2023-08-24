Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D63C7113B
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Aug 2023 10:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5Mj2qxwRu6ImbCbgKZB2mTmZc1sJ7FaGws4X/FyAcE=; b=h8mZCYd72qQ+J3
	5loFWhht6Q6bTvhOZ9Dgok0twZiPJgaQD6JZgVcxGCFzzGDV8IUePXdK+OlEdg/X6mxVya2RhjKa0
	dZMYYaMwbTrulJiBJk8ZFgOOTHOY9pov+eTC835ptb7ps42wXKSmAIMQBAcuBPowjY3LFiWyauZa/
	AgPQBxbPvES6ABA7lYnNNvvEi/LlTgcMa6GTW6I7sjbsGDkUnXwG0xwW1VRxk6itdbT4ZNkqjPNta
	QAcjTkp/fz0zdlu0R2onQ9Qn5CaWUdRWIDlcG8yEfUTVhprCQZE8KReQJra0uHLjD0OsW8CC6p1HV
	4dcgEEOFBr53O2B/euSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ7n1-002tqC-1W;
	Thu, 24 Aug 2023 10:42:11 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ7mv-002tmf-2k
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Aug 2023 10:42:07 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1bdca7cc28dso52418215ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Aug 2023 03:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692873723; x=1693478523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5Mj2qxwRu6ImbCbgKZB2mTmZc1sJ7FaGws4X/FyAcE=;
        b=hZcQz83MuTgtVUHEdO3LOPIFB0JNUEtBmCMJCDx9VL+8o4UxqsI1LRU5qOk/EXIyhZ
         96mdg+nhN+nkSlIDrvQ9tWxN32QvRpmMl2z70EA4VSyUSViZZ1Zz/K9JfTVjQ3fkYxaF
         gw+rR/aaoD2Q5MAoxZQg20nwNEbqER36/p6cE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692873723; x=1693478523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5Mj2qxwRu6ImbCbgKZB2mTmZc1sJ7FaGws4X/FyAcE=;
        b=NeOqomUrTmkm8iaP7e9G6rP3BYqJDS6I9Kpn9vBdiaq972Lp5dzEC/9XIjwv25HZ8u
         8wy4BfKBb19jtbL1n8IYBzW4+DE/5GNKxO/pywj2jhxOrl2JEFe3CRSr1x6ln6uFoYcJ
         hTqMfet+3jWpG//z6vqqHhUpMw48pEnOp5tcGqPxQh8w7UtxmHl4h7RUyI0SdRXJyGJy
         DywVMrKG+tqkJ6d70LiR81zFxpMneM/CVP3t9SFfh3b4yPTDQGfoac/iM1p0NxbpWTtm
         kKU+HzhcPpU0YPk59KcmM1n5VzbA07FxkCtpTcHgiT5mx+aIxLtlLmv4JBEftdjUazI+
         hviw==
X-Gm-Message-State: AOJu0YzF1gdPKhVn81/uVZRRyAvDLQb7rt1qwryblh4OsBxgj920G54v
	ToDLEkk7Xi+1FRJqyWzFxV3oiw==
X-Google-Smtp-Source: AGHT+IGao9Th9qVXpav06rwJB33LMdKfO90d0/0YX0Nw2S957J/ZS1b/jA6DEO74HGdi3p7m7JgSFw==
X-Received: by 2002:a17:903:264d:b0:1bf:364:f013 with SMTP id je13-20020a170903264d00b001bf0364f013mr13653715plb.45.1692873722931;
        Thu, 24 Aug 2023 03:42:02 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ed6d:42e3:a23:8316])
        by smtp.gmail.com with ESMTPSA id q2-20020a170902dac200b001b5247cac3dsm12524645plx.110.2023.08.24.03.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 03:42:02 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH 5/5] spmi: Return meaningful errors in spmi_controller_alloc()
Date: Thu, 24 Aug 2023 18:40:12 +0800
Message-ID: <20230824104101.4083400-6-fshao@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824104101.4083400-1-fshao@chromium.org>
References: <20230824104101.4083400-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_034205_889742_A05E93D5 
X-CRM114-Status: GOOD (  11.89  )
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

spmi_controller_alloc() currently returns NULL to all types of errors,
which can be improved.

Use appropriate error code in returns and pass the errors from used
functions where possible.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/spmi/devres.c | 4 ++--
 drivers/spmi/spmi.c   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/spmi/devres.c b/drivers/spmi/devres.c
index f18cbbe28812..c19f09243bc3 100644
--- a/drivers/spmi/devres.c
+++ b/drivers/spmi/devres.c
@@ -20,9 +20,9 @@ struct spmi_controller *devm_spmi_controller_alloc(struct device *parent, size_t
 		return ERR_PTR(-ENOMEM);
 
 	ctrl = spmi_controller_alloc(parent, size);
-	if (!ctrl) {
+	if (IS_ERR(ctrl)) {
 		devres_free(ptr);
-		return ERR_PTR(-ENOMEM);
+		return ctrl;
 	}
 
 	*ptr = ctrl;
diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index 7313d4c18a04..5f11ced3f8b9 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi.c
@@ -445,11 +445,11 @@ struct spmi_controller *spmi_controller_alloc(struct device *parent,
 	int id;
 
 	if (WARN_ON(!parent))
-		return NULL;
+		return ERR_PTR(-EINVAL);
 
 	ctrl = kzalloc(sizeof(*ctrl) + size, GFP_KERNEL);
 	if (!ctrl)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	device_initialize(&ctrl->dev);
 	ctrl->dev.type = &spmi_ctrl_type;
@@ -463,7 +463,7 @@ struct spmi_controller *spmi_controller_alloc(struct device *parent,
 		dev_err(parent,
 			"unable to allocate SPMI controller identifier.\n");
 		spmi_controller_put(ctrl);
-		return NULL;
+		return ERR_PTR(id);
 	}
 
 	ctrl->nr = id;
-- 
2.42.0.rc1.204.g551eb34607-goog


