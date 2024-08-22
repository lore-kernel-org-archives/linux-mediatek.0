Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9998BC5320E
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 09:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJpiCpdFfWAtf8uPPEuTBRfORRdyXl0KF9nHABZqeeQ=; b=3MqK+APaAE9TsCSkOqm4TtxbsE
	zEguwBZMgIyCazKwb9XQwVWzKkPeaVOAMPt7p6UUNlGE3jne+dWRfju6tnjZsS24mR4OqfJi9J7eC
	JFGAmpsAelPxDaBb/FpcCPfzldlteyxJCB6JMSYfwtKnXrpyPGZjLgPD0XCa8VOIEDAMjVaAgS6R5
	WHVwP/41Pp6F4OqKjUkmdlFImFEPIxN8LcJBjdALbI0IHn+gum2N39RkpV4mS+++zkbPh56tVSHx/
	0ywbDr6OUro8m2TZlyjxnMmgYyQk84r92eMULgOuFC+fLBKJJYpDmNPl2LSgbcC3L5hIs5RP17uNI
	I+c/6JpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh410-0000000CCd6-0Gs6;
	Thu, 22 Aug 2024 09:21:58 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh3zV-0000000CC7Q-2xxu
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Aug 2024 09:20:28 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7140ff4b1e9so459898b3a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Aug 2024 02:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318425; x=1724923225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJpiCpdFfWAtf8uPPEuTBRfORRdyXl0KF9nHABZqeeQ=;
        b=NBVZqQAUQFeADrS8oQZv/6kVdy63Norf/niOHs3xNr7tCcztdyhJpQQXCBj91fb9wK
         JEWuHBvYuSGSohc9HIRdEC8maPdZMq8cGZtvNLTggtg1y2HPZd2XTJZbgCt7YJDjmRAh
         Fr+u/krqzKqnHUMmD0XCsjzl2E9PxpG1I2wVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318425; x=1724923225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJpiCpdFfWAtf8uPPEuTBRfORRdyXl0KF9nHABZqeeQ=;
        b=jdjMf0JK3jo9bO1YORNoR/6mr5hATRCH5WEXAWx7K1BFl80xvWPGgiXqRbJUzn0lzQ
         G2fhD1nQXp4Nv2jHATFK8fLzItbt9w5IUs6e1tZcQsALvafmpKERbsmWx59iepSUqBvM
         749b+0BWWDuYC5AEQhU3T8WTW+7QAINBEzxonk6FI+7TZUe/N4bbSmlhoIx2d9UBl600
         kQIzbvrKXXPxFXL0sfo31fR9G8GRdkHX9XSjIJcfecBvIIfbgyhgAk6ZI1Gq0FKR0VcD
         sGYnRrfGhxgefUYTEnnnr4VpBqGZOGoYKbhX/EqEfS/YSXRc0CCU7uSITl7hoIwV0B9n
         w/6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXt6o+cTFZhwdvdoEWnXzA6XiXuIBsUsM7U1BhoT7iQnwWXhdyzE4yfHy3+2XZbZKJStnEXOfK586Kk7clm9g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yys1cqMX/tt49g4DpYcBfWUfyKXz75vjqg9v32BSIMVjjAXl2Qg
	ukRgFme3nrlBnKiUGM+1F8f4dJc/hE3zliud/zVtkfnMm5/L62PnuCYNsGIzkQ==
X-Google-Smtp-Source: AGHT+IF3q7kEnTwTdOeElAbMIG4ut51tj+GRpPErjT+Nd/r+ne8//cdW649YGpsOCjtM4GbM7nHD1A==
X-Received: by 2002:a05:6a00:2288:b0:70d:2a4d:2edc with SMTP id d2e1a72fcca58-7142353f2bdmr5844551b3a.20.1724318424602;
        Thu, 22 Aug 2024 02:20:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:24 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v5 01/10] of: dynamic: Add of_changeset_update_prop_string
Date: Thu, 22 Aug 2024 17:19:54 +0800
Message-ID: <20240822092006.3134096-2-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240822092006.3134096-1-wenst@chromium.org>
References: <20240822092006.3134096-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_022025_853179_9564D6B5 
X-CRM114-Status: GOOD (  16.68  )
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
Changes since v4:
- Use modern designated initializer for |prop|

Changes since v3:
- Use new __of_prop_free() helper
- Add new line before header declaration

Changes since v2:
- New patch added in v3
---
 drivers/of/dynamic.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h   |  4 ++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 110104a936d9..daa69d160a78 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -1072,3 +1072,47 @@ int of_changeset_add_prop_bool(struct of_changeset *ocs, struct device_node *np,
 	return of_changeset_add_prop_helper(ocs, np, &prop);
 }
 EXPORT_SYMBOL_GPL(of_changeset_add_prop_bool);
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
+	if (ret)
+		__of_prop_free(new_pp);
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
+	struct property prop = {
+		.name = (char *)prop_name,
+		.length = strlen(str) + 1,
+		.value = (void *)str,
+	};
+
+	return of_changeset_update_prop_helper(ocs, np, &prop);
+}
+EXPORT_SYMBOL_GPL(of_changeset_update_prop_string);
diff --git a/include/linux/of.h b/include/linux/of.h
index 85b60ac9eec5..046283be1cd3 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1651,6 +1651,10 @@ static inline int of_changeset_add_prop_u32(struct of_changeset *ocs,
 	return of_changeset_add_prop_u32_array(ocs, np, prop_name, &val, 1);
 }
 
+int of_changeset_update_prop_string(struct of_changeset *ocs,
+				    struct device_node *np,
+				    const char *prop_name, const char *str);
+
 int of_changeset_add_prop_bool(struct of_changeset *ocs, struct device_node *np,
 			       const char *prop_name);
 
-- 
2.46.0.184.g6999bdac58-goog


