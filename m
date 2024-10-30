Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC50D7497D
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Oct 2024 07:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02I89/A9qYtjldvjbyC2sOJfVnDSFABqZCnk6WuuKr0=; b=Y1d9jGVpEBohgxzv2ZhH8nwomK
	PdTjWgNRaGgyhJzjlC9Q/G62y4RqV8R5DSw3+LBZsN6HdWvRU4sdI+QY+eaeeSZBCrsy2gC//4Upt
	NEN5kNDoC8QM+jKmqcFjwpp5jsBg7f/ENw2tmoXzZmoMFDYUfKxZ7b9tWyoLus6PAgtxAe6eQja5/
	iQSfgmZCkzi7ZQ6Tl4uWqG3X+SyhE10moMn3ssS137O/CsiBx8/fUgOlJdwpwPImvyAh9Au9Xdvey
	3QtAw+tBoQsDBb2qd5pGN8wdDUnLlvfkeC7gK6OXDRHZoXpoUqwRsBVxBGczwJFVuWzdImE0VL2YC
	fW4UGEnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t635g-0000000H8X5-2ihq;
	Wed, 30 Oct 2024 07:26:04 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t632R-0000000H7kv-0mqw
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Oct 2024 07:22:44 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20c77459558so53652755ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Oct 2024 00:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730272963; x=1730877763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02I89/A9qYtjldvjbyC2sOJfVnDSFABqZCnk6WuuKr0=;
        b=ZW98pLYDYAXf6rKDPbZyenTWD0PnCQaHN8x20XNq3nuEkHsWKGPrNvZ/XicSqb6cg8
         RS/bklBugfqgFWqVgTG6CCLym2opOVlvCEV0Zh38OTqU4jGEVW77/k/ZWzc+o4rjPqnA
         eVaAA9GDiDDVNUx0fxbZQcY5jhHUya7n+nSs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730272963; x=1730877763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02I89/A9qYtjldvjbyC2sOJfVnDSFABqZCnk6WuuKr0=;
        b=v85KJOBBstKyRKLjWBqlo/ZniGXrtz9iQwwAej5982yHY+Dxf0g1UgWJ03D1c7R+65
         hEBAWu4vDAi0IocB6MrAfV52ZbpePprANYMUtMwCE4lQLs9KFkkNmf14JB0SnHPXaPs7
         sg8Tyw/zd96/DIn4xwrof6ZgXLPEQVF7NLr9eongxuuTNZ68181RsVGxNysZRea8CByd
         3OekFHU/t+Dv0HCYbh88uv9rOrIxnu4zaLh2UZ2fH9N+16/6f02Hse4Rp5Uk44RWn/vp
         4It0BFG717/4TUTWOkfIO5IkyteRiBk7wdRPd5iJN+T3MsvILVxUsXyF2woOSVPJjiTH
         3CIA==
X-Forwarded-Encrypted: i=1; AJvYcCUR9x5GkHBK0XfzvJDf7d8Qhxg+QnjnudqEjz99lufTs2eVXobBd+pNzXFgfQvyPU4yNzUsJDll5R3dLBVsIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEgxVS/7L6R/y8mqNWKA+oms/j7WIvj7zz/8TRyL+RkUeCxfjy
	f17AwAlFuUMTsR0qdKtmgxoOA6348v80sN8yODMfeU24Oe1oTvsc/ksJTzYqxA==
X-Google-Smtp-Source: AGHT+IGRv+883MbPDyi2+STjJPcbXoBWTOIxB4iDvZKH1B5wRpkiQ+ZAYsXKMtOIPXpNfDDwdLlFAg==
X-Received: by 2002:a17:903:41c4:b0:20f:ab2e:14f9 with SMTP id d9443c01a7336-210f76ff17amr26213175ad.55.1730272962610;
        Wed, 30 Oct 2024 00:22:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1f3:aa64:657f:d8a8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02e67esm76641445ad.186.2024.10.30.00.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:22:42 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
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
Subject: [PATCH v10 2/7] of: base: Add for_each_child_of_node_with_prefix()
Date: Wed, 30 Oct 2024 15:22:23 +0800
Message-ID: <20241030072229.1013235-3-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241030072229.1013235-1-wenst@chromium.org>
References: <20241030072229.1013235-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_002243_257751_A9AE2B01 
X-CRM114-Status: GOOD (  14.95  )
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v7:
- Collected Rob's Reviewed-by
Changes since v6:
- Changed helper name to "for_each_child_of_node_with_prefix()"
Changes since v5:
- New patch
---
 drivers/of/base.c  | 35 +++++++++++++++++++++++++++++++++++
 include/linux/of.h |  9 +++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d94efee4a7fc..a01e5534c2fd 100644
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
index d0307e3b093d..f921786cb8ac 100644
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
2.47.0.163.g1226f6d8fa-goog


