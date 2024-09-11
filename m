Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39ABEEDE998
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 07:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHYuF087WkDWw6t01rd+JoBLqqCohsT20qRvxciVpzs=; b=QuzL7yPV0ixFITY7aLrpUMG/z1
	6KoMq5dnwWM7s123qxZylk3VYb9kBuaQxKh7LQ8UTyrLVKE0lHGZlrikhy/tscXyhE5ySVQP0D1pS
	bqk8y5G9BFlL5hOJVW8jVIYOsoXgvfQK7PjEtz0PtHIm42Yh9xSmo5gh664H8h9t5bBe0rNkb98FH
	lAwVNOoYIWyh4uLAOt/AzW19Tx1k+e5ENSNoJawneE8WeIvM1GvlDzD5uh6xsF0NvmRFfKSgcl+qi
	BxYsKM+YwbE6s+YbyhiCE2b0tBKLaI5NWVdWr2O5jjTZdBLYk9IkvQIHTvNWwhEqmxNes/oY3gkwx
	nvqG495A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHpf-00000008RoB-3inQ;
	Wed, 11 Sep 2024 07:32:07 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHm6-00000008Qjf-2eCD
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 07:28:28 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-6c5bcb8e8edso4966492a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 00:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726039705; x=1726644505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHYuF087WkDWw6t01rd+JoBLqqCohsT20qRvxciVpzs=;
        b=QXpDww/L8ffSgM7dwDf/3sMG6AXZ6hiZjukATZcfbUZ/UhuNh1xSvK2geJoJyG9l04
         EwARuQ2LdRcPXPygMHvndxMBMajjddWXa7O0ba1kRFlMZMv6Vy4Q54AL7CBM8youOsZU
         p6FaXGa2wczqMJkfyv01grsORdfXKgwcnESZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039705; x=1726644505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHYuF087WkDWw6t01rd+JoBLqqCohsT20qRvxciVpzs=;
        b=hZRw3uwbcSu234gGY7znWmEFAteWEEL3Tq4j+RFjkql1XVLDebkyA5FCVJHZUTcMn9
         dNlxXnfSGzphAh2JDz7W6i8pu8Xw1eF25lV8WUDbVU+RpQ03e+YoN0RICycFecGU2Wut
         6S2csbYx03zOxP/OdUKm2IYRqqswGIG+tThcPGB63yUOiNYuYO+nMMixMOzBF6YbHu+v
         w8++zvTg5RxksVCd0U2mqFu4zJgWgdgUThf0FcPmu+ts915z5nUkxQYw+RXWnXpfHEBC
         wR7xbl1IDuq158fDqqx8c8OHl8amTsZym3dXorIlDnRuyb30Mi+yJI+RfLVGTE1f+cjn
         7qsw==
X-Forwarded-Encrypted: i=1; AJvYcCVgsbccNV3NxEnGXfc4fgf1cCN8ghVIqDu2LaydXb2Yl640Gm8jA1ZsvDigY97a4TE5JUY/AUkxgSu6MUGaWg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw97TVkqz+eQ53fOarvM8eDhqqupq3G86Wkq/T74lpYlFfe2V77
	SEHAo3pv243HwXOFvXqYgQlfi3FtLbM7KrB8jmgNZRYveRIngMiP/yU9JJ0YJA==
X-Google-Smtp-Source: AGHT+IF7NCaFQn5NI21IL8mvEhnYcnrMWrYJBC5MrY8umX2zBuXqZDWtQyZtz6v7uD5SvjxSxtithQ==
X-Received: by 2002:a05:6a20:2d0b:b0:1cf:6dd7:fa50 with SMTP id adf61e73a8af0-1cf6dd7fa7cmr114263637.11.1726039705459;
        Wed, 11 Sep 2024 00:28:25 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8398:fe34:eba2:f301])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e7esm2399415b3a.80.2024.09.11.00.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:28:25 -0700 (PDT)
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
Subject: [PATCH v7 02/10] of: base: Add for_each_child_of_node_with_prefix()
Date: Wed, 11 Sep 2024 15:27:40 +0800
Message-ID: <20240911072751.365361-3-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911072751.365361-1-wenst@chromium.org>
References: <20240911072751.365361-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_002826_682680_C3F0353A 
X-CRM114-Status: GOOD (  15.34  )
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

There are cases where drivers would go through child device nodes and
operate on only the ones whose node name starts with a given prefix.

Provide a helper for these users. This will mainly be used in a
subsequent patch that implements a hardware component prober for I2C
busses.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v6:
- Changed helper name to "for_each_child_of_node_with_prefix()"
Changes since v5:
- New patch
---
 drivers/of/base.c  | 35 +++++++++++++++++++++++++++++++++++
 include/linux/of.h |  9 +++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 20603d3c9931..d3c123b3261a 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -628,6 +628,41 @@ struct device_node *of_get_next_child(const struct device_node *node,
 }
 EXPORT_SYMBOL(of_get_next_child);
 
+/**
+ * of_get_next_child_with_prefix - Find the next child node with prefix
+ * @node:	parent node
+ * @prev:	previous child of the parent node, or NULL to get first
+ *
+ * This function is like of_get_next_child(), except that it automatically
+ * skips any nodes whose name doesn't have the given prefix.
+ *
+ * Return: A node pointer with refcount incremented, use
+ * of_node_put() on it when done.
+ */
+struct device_node *of_get_next_child_with_prefix(const struct device_node *node,
+						  struct device_node *prev,
+						  const char *prefix)
+{
+	struct device_node *next;
+	unsigned long flags;
+
+	if (!node)
+		return NULL;
+
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	next = prev ? prev->sibling : node->child;
+	for (; next; next = next->sibling) {
+		if (!of_node_name_prefix(next, prefix))
+			continue;
+		if (of_node_get(next))
+			break;
+	}
+	of_node_put(prev);
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+	return next;
+}
+EXPORT_SYMBOL(of_get_next_child_with_prefix);
+
 static struct device_node *of_get_next_status_child(const struct device_node *node,
 						    struct device_node *prev,
 						    bool (*checker)(const struct device_node *))
diff --git a/include/linux/of.h b/include/linux/of.h
index 046283be1cd3..48cfb39197d6 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -289,6 +289,9 @@ extern struct device_node *of_get_parent(const struct device_node *node);
 extern struct device_node *of_get_next_parent(struct device_node *node);
 extern struct device_node *of_get_next_child(const struct device_node *node,
 					     struct device_node *prev);
+extern struct device_node *of_get_next_child_with_prefix(const struct device_node *node,
+							 struct device_node *prev,
+							 const char *prefix);
 extern struct device_node *of_get_next_available_child(
 	const struct device_node *node, struct device_node *prev);
 extern struct device_node *of_get_next_reserved_child(
@@ -1468,6 +1471,12 @@ static inline int of_property_read_s32(const struct device_node *np,
 	     child != NULL;						\
 	     child = of_get_next_child(parent, child))
 
+#define for_each_child_of_node_with_prefix(parent, child, prefix)	\
+	for (struct device_node *child __free(device_node) =		\
+	     of_get_next_child_with_prefix(parent, NULL, prefix);	\
+	     child != NULL;						\
+	     child = of_get_next_child_with_prefix(parent, child, prefix))
+
 #define for_each_available_child_of_node(parent, child) \
 	for (child = of_get_next_available_child(parent, NULL); child != NULL; \
 	     child = of_get_next_available_child(parent, child))
-- 
2.46.0.598.g6f2099f65c-goog


