Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94D2D21270
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 10:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HUfOP8BsCvd1B7O/Bwqytp/NnRsOmtEcRv5sfFy0Ao=; b=lLjYHrzX7jup3bYLoC7eOurEFW
	3AIlR2D4yyYBwixkLk4jW3Qq9zUArN0Sauxsz8X/uaJaMEIt4q9OUUXsM/WRxgrW/pHPtsuFVUmx9
	/WfJRg6oNZHVrVYu+KBBRmJpKvQlI2GFnaFrla/NlI2wywD3yw1NXr5s5VUDAhnE9lKGCR8M8kWDL
	7kEXHrNlhl1QkU97Z/5SiOX/lTyaJ31YXF2/xR7Z2yGntMSA04IOoVetHfDfuaDRLpckBx7o7Y1Dr
	lyw3TiCdIrnHpLHVfI+Qv8KU8ykH9dyILYQcUdxiy8VvfPfyfsfAXoPM/SuvjVY6yjBuIjz/NB+3c
	D+Q+321Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1NQo-0000000ETFj-0KUf;
	Thu, 17 Oct 2024 10:08:34 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1N1j-0000000ENew-18wW
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Oct 2024 09:42:46 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20ca7fc4484so5102485ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Oct 2024 02:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729158158; x=1729762958; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HUfOP8BsCvd1B7O/Bwqytp/NnRsOmtEcRv5sfFy0Ao=;
        b=XU/jTFz4ec9Md2l6zGSqlui+j1akOJwHPh4zc8R+J2d2gQvkGeJUA+wt6/+LklAqPD
         jRWY1fSGLJ/4x0ZcguzMnMXG+SAyVnTECyL68E2uitt6TbKsN9Ay19K5XaJUqHt4amt7
         r0Sdvc4A7UZXh2hBGDZ8ENKxMd1IblTwiUC9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729158158; x=1729762958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HUfOP8BsCvd1B7O/Bwqytp/NnRsOmtEcRv5sfFy0Ao=;
        b=EZkQv3JdLL7uOj9WuqNC6YgaX0MzUnnfvk4MKez3k71S6FbQvL3UVu4qJH/B/kmca1
         PjQWuvIZBPzfNVFJX3LhLwdeUweWF4ZV6xFCldUKeYh3HVnvmWX1ZeLKT4lhwDpZY8AC
         u2vLMbYBsgIrNupNEOm5qFd+LaIh1N/UYXCcL9xxYU3caN2E3UIwmf4HCGw44TKguzx/
         oLr4UlMMBDc4IdSJLknTQqIEul04fn17SRLjnnOl4i/wj52NY0A/j2m3d/aRhGpzxuDj
         DdD1ek0+5WMtgligek9AbrYZ6wZNZk7fJ3x4AqGIgWMOJ2qnX24zYrCJ032DN/Baod7n
         d+jw==
X-Forwarded-Encrypted: i=1; AJvYcCUFKgI+NaBqzu3kVzZNMRwkjUy8Udsnyp0jjKYBJqD3w5Ojht0jzGAbbJykd5FsotbG1aO5v9HaDLbsN2/F6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSxcKS4oZbvCSyW31ZqZksDWuZM4WyCOEnsLu2Iz2JTBkEuR/M
	O8aXx2FfDdu5JTu9emfI4P68MOGVXQ0j88YE87bKT+/okv/svM4dhbAqK0bHAg==
X-Google-Smtp-Source: AGHT+IHT4+zzl9R0Ike3MBwqQu0knSbe1bnofAe1pyh+O5dYhcMwxGAJD4ZqoWUDWmjDxZxoCRdzlw==
X-Received: by 2002:a17:902:e84b:b0:20b:6f04:486a with SMTP id d9443c01a7336-20cbb1b931fmr278393475ad.35.1729158158169;
        Thu, 17 Oct 2024 02:42:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fabb:a7ab:3d7:9aaa])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f87ccasm40638655ad.62.2024.10.17.02.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:42:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
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
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v9 2/7] of: base: Add for_each_child_of_node_with_prefix()
Date: Thu, 17 Oct 2024 17:34:37 +0800
Message-ID: <20241017094222.1014936-3-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241017094222.1014936-1-wenst@chromium.org>
References: <20241017094222.1014936-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_024239_345945_A185DAD2 
X-CRM114-Status: GOOD (  14.52  )
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
2.47.0.rc1.288.g06298d1525-goog


