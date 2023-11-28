Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CD9C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 08:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHxxwveZDRAPnfOWumxXktb5k7NbUjKgtDpJO55ZaA8=; b=sVRjjlqD1r6WQQGr7X5vngS20K
	cdqyoDOj5kRsI/23zVWDeZibKLAG34a+3P65h/L2iwSiRyX3isPSO2d3KFpXC39RD84u/xT5ZpYVK
	Ez01EFzOkDryBGIUpeHcspfvYKxOmKU7GAhAItq0eTRwpAxK/5pEm1ZA9nR1IhbHnOZzt2iPDhxEc
	nufiIfips/A2S7B79e5IK8qFrVDyuM5regWFpM5Vv2cG8Y8MUIG8mkO75bOGovMSu/A6YlIL/QJ71
	MXkvH8+AgflDd/rGv7rrMQU+xelabQcGPGuge/tgTPr2Rr5IBzUyCesg9x7jAAGl3d8t3WH9U2dDO
	8zdDjv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7tiW-004ZZX-1f;
	Tue, 28 Nov 2023 08:45:16 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7tiP-004ZUt-0Q
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Nov 2023 08:45:11 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d00689f5c8so324665ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Nov 2023 00:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701161106; x=1701765906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHxxwveZDRAPnfOWumxXktb5k7NbUjKgtDpJO55ZaA8=;
        b=PXKFi2QOzJsz2CgHi/LoqnR8Ie/p6DdEqgVmloYUxG9zOtoz/nyn1dQu9az0kfCNWq
         ttQoc9TvlBpTuUBa4v+UtfouISdBKhEeytgk9aOXj27XPLXgNhRmkC+idAd78j9316Zx
         StNhR8Nac7UpQhrRutd3vPeCkDMfvNplS0dh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701161106; x=1701765906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHxxwveZDRAPnfOWumxXktb5k7NbUjKgtDpJO55ZaA8=;
        b=Npypn7bprBP9wowMgv9DvI/8WF+GyTM//171aOQhYWYz+T0RVtSa82rANOoKsA0KG9
         gLb+0z07k3TQNn6tijaaIrbmxavos0VpCOnYgvQgB73pPcKO3rxMFRGaTDiIlwFwrfQH
         pmoSjmEZFa6g4IMDrXgmYUmi1elf5SUNgfOS3F1CvAjKt4r4O66+r1KizSCFf3h0sOBs
         brVVwojV61iMpKmSb+ZvyjkkbNvBw0QRzm6M3P9LiHU8cRe2HF/UD0ax3aLzgaXrzATO
         B6LIAxaddFkMY1DXMuHJVi9Jp5tksf/KS4zBmsxuPSu852uZfA1nbxnT1Hcnqljt8dgP
         NbZQ==
X-Gm-Message-State: AOJu0YyKPmggfG+yGNZCzSkcr0uGfrcla+cW1vcykzWuPs7viHnQ4aET
	Yg/zPR+Y44V06+a4CJ2fBigOAg==
X-Google-Smtp-Source: AGHT+IFwNRanqg6iNjPiAn8C7xAInJUbYOtL1AJjn6XOh76hm70XQlF/qqZTYAqMlV2R/DvAZERpiQ==
X-Received: by 2002:a17:902:d2c1:b0:1cf:ccc3:c9d7 with SMTP id n1-20020a170902d2c100b001cfccc3c9d7mr7924520plc.3.1701161106024;
        Tue, 28 Nov 2023 00:45:06 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:a990:1e95:a915:9c70])
        by smtp.gmail.com with ESMTPSA id j1-20020a170902c08100b001ab39cd875csm8358074pld.133.2023.11.28.00.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 00:45:05 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	andriy.shevchenko@linux.intel.com,
	Jiri Kosina <jikos@kernel.org>,
	linus.walleij@linaro.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	james.clark@arm.com,
	james@equiv.tech,
	keescook@chromium.org,
	rafael@kernel.org,
	tglx@linutronix.de,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [RFC PATCH v3 1/5] of: dynamic: Add of_changeset_update_prop_string
Date: Tue, 28 Nov 2023 16:42:30 +0800
Message-ID: <20231128084236.157152-2-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231128084236.157152-1-wenst@chromium.org>
References: <20231128084236.157152-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_004509_173720_0E28C34E 
X-CRM114-Status: GOOD (  16.88  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a helper function to add string property updates to an OF changeset.
This is similar to of_changeset_add_prop_string(), but instead of adding
the property (and failing if it exists), it will update the property.

This shall be used later in the DT hardware prober.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
New patch added in v3.
---
 drivers/of/dynamic.c | 47 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h   |  3 +++
 2 files changed, 50 insertions(+)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index f63250c650ca..d22aad938667 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -1039,3 +1039,50 @@ int of_changeset_add_prop_u32_array(struct of_changeset *ocs,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(of_changeset_add_prop_u32_array);
+
+static int of_changeset_update_prop_helper(struct of_changeset *ocs,
+					   struct device_node *np,
+					   const struct property *pp)
+{
+	struct property *new_pp;
+	int ret;
+
+	new_pp = __of_prop_dup(pp, GFP_KERNEL);
+	if (!new_pp)
+		return -ENOMEM;
+
+	ret = of_changeset_update_property(ocs, np, new_pp);
+	if (ret) {
+		kfree(new_pp->name);
+		kfree(new_pp->value);
+		kfree(new_pp);
+	}
+
+	return ret;
+}
+
+/**
+ * of_changeset_update_prop_string - Add a string property update to a changeset
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @prop_name:	name of the property to be updated
+ * @str:	pointer to null terminated string
+ *
+ * Create a string property to be updated and add it to a changeset.
+ *
+ * Return: 0 on success, a negative error value in case of an error.
+ */
+int of_changeset_update_prop_string(struct of_changeset *ocs,
+				    struct device_node *np,
+				    const char *prop_name, const char *str)
+{
+	struct property prop;
+
+	prop.name = (char *)prop_name;
+	prop.length = strlen(str) + 1;
+	prop.value = (void *)str;
+
+	return of_changeset_update_prop_helper(ocs, np, &prop);
+}
+EXPORT_SYMBOL_GPL(of_changeset_update_prop_string);
diff --git a/include/linux/of.h b/include/linux/of.h
index 6a9ddf20e79a..c69bc7da380e 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1601,6 +1601,9 @@ static inline int of_changeset_add_prop_u32(struct of_changeset *ocs,
 {
 	return of_changeset_add_prop_u32_array(ocs, np, prop_name, &val, 1);
 }
+int of_changeset_update_prop_string(struct of_changeset *ocs,
+				    struct device_node *np,
+				    const char *prop_name, const char *str);
 
 #else /* CONFIG_OF_DYNAMIC */
 static inline int of_reconfig_notifier_register(struct notifier_block *nb)
-- 
2.43.0.rc1.413.gea7ed67945-goog


