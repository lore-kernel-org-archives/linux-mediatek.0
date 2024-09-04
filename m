Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3793ACA0ED3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2M921d4gJ85snm6ehV18l9ZU1Po4pieq34BYMUnhsNU=; b=vzSmSBd+fTw49RkgIINWvaeiGl
	5OVtRPxBRyYDkjtVeCrayPcjfKvRGkfWLmCDNBXJI1yyim/Nx7s7z0QOYPkhynKvNeGv8Nd2XbAdU
	A0D3+BK32nvjiOXKyaFBTzm0tFgh3oUMT6SR7uHQanUIf8AHvG6dC/8pd1izGrD9fK/6NvCsWX2Dy
	lx8CVR1OBxjdgZw2DcYwPIOUBUwFCDkwc7u5I2ZuQbza7Sfcx6+TcbkW69MWCpp7Ac+LhQcY1Z3zb
	gvUtztCwnlXh4UqjTDo3IepgO++GlkKx1J67Kbyr7h1Sn75qAFN5hnHaVyOuJbM3tRV5ACLNj2HWC
	r37qaDpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slmQB-00000003hpH-3lTp;
	Wed, 04 Sep 2024 09:35:27 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllsP-00000003Yn5-1pkD
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Sep 2024 09:00:35 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-715e64ea7d1so5352793b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Sep 2024 02:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725440432; x=1726045232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2M921d4gJ85snm6ehV18l9ZU1Po4pieq34BYMUnhsNU=;
        b=OsfIL8BXKldKg5tH0b0xTjjjuAlw1z9T7JKqJsFRnakOfo05Z1B75dZk48ffomOeAy
         g+ctfI8vU3NFknzzUn68VMVyx/bS//pcr6XJKFBzfmO0jgmsKTS+/OWd7D56EC/IFnay
         eKkvx67/wFamC3x7hvSFUIGcDxz7hG9ap+RHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725440432; x=1726045232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2M921d4gJ85snm6ehV18l9ZU1Po4pieq34BYMUnhsNU=;
        b=gOkCd1LLuxcJ+HKL3kcp3YmQ5A/RdOtCyUm8xOVOU+2ZPWJptckGjiSLA5vZz125Qs
         SEUL678tYLYwv6aBCz1b1FYNkdPGNKAMaI1BdeYhZs1h4KhwpLBs4L0B41xUte+kkhN1
         3tUhjZpTD5tLzV8rGuC5PeUWZiEPdbzwEm882EQRia2ytUpiT1ZgAMjtCjaJDTnQXg5R
         PTjdNj/e20QWcsn7O9Yw8AbeR5uq8QncGnPGbux7L5F5C2YRdwq743C7iL7XE7k37yDd
         Gpwl/sZzBfvbhmu2NvZVsCRoHuDK7WnABxvsofxGnLqHc5e1/djugOUPEH+YlXxRsVpC
         Bitw==
X-Forwarded-Encrypted: i=1; AJvYcCVffkvCVpSa5CxCSugg9gstbqhZBYMTvYRx2T7pAW+TCu0XADC40QOE2AEISehRBxLrppkQdDBE9l/0K6LGag==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBKhR2+ysB56R8us/t3pIYCA/4Aif8oLAPnCF9Ypav3xY7GDLO
	cZo7EXmBrWMcYkMevVskgr830VrhKGaacDqh/OrE+0z3e3kkLUXiftysqdRTIQ==
X-Google-Smtp-Source: AGHT+IF/MVW4wrOQrl8cYkGW2jFbuYY69p3WFoLB5FjxApHmcb1+fCtPnl3w/uoQeTGzo0ajB2S9PQ==
X-Received: by 2002:a05:6a00:66d9:b0:710:e4db:a6fc with SMTP id d2e1a72fcca58-7173b6b63demr14365184b3a.27.1725440430497;
        Wed, 04 Sep 2024 02:00:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:83fc:5c8e:13bd:d165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785b5183sm1153279b3a.197.2024.09.04.02.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:00:30 -0700 (PDT)
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
Subject: [PATCH v6 02/12] of: base: Add for_each_child_of_node_with_prefix_scoped()
Date: Wed,  4 Sep 2024 17:00:04 +0800
Message-ID: <20240904090016.2841572-3-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904090016.2841572-1-wenst@chromium.org>
References: <20240904090016.2841572-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_020033_508841_26B7EFA1 
X-CRM114-Status: GOOD (  15.69  )
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
index 046283be1cd3..acc0d5b98417 100644
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
 
+#define for_each_child_of_node_with_prefix_scoped(parent, child, prefix) \
+	for (struct device_node *child __free(device_node) =		\
+	     of_get_next_child_with_prefix(parent, NULL, prefix);	\
+	     child != NULL;						\
+	     child = of_get_next_child_with_prefix(parent, child, prefix))
+
 #define for_each_available_child_of_node(parent, child) \
 	for (child = of_get_next_available_child(parent, NULL); child != NULL; \
 	     child = of_get_next_available_child(parent, child))
-- 
2.46.0.469.g59c65b2a67-goog


