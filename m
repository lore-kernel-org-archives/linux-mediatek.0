Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB69CED274
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 07:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAxUQ/gxQDnRaq33Q6rLVbh6EKahS1Y15WlLZB1S0cs=; b=nEPpS6J/XH68D1VY/8YLznmO2b
	kTFuiz8FrRfVhrXa76sAwsW8Zpdvng5H4qRCFt8/TE0om3AcwSfDbOGqqS+sVI2OBLyr+N6Vr88qn
	/OtxsJeWA029L8NA7Q7lbbKUc22guoQrJ+8gMy/7UKD//ciIjXUXS/TbczoCIl2OfyijSuwQ0HZYY
	rqN03SO1sTs2EnfLQgLrLaAiWp2Z1ZoB9rOYZtijhEfYvpxYzRL8TY8Dm/gXymv8SU/Jl+Nbn71G5
	OLGeu9ZbPyN85LpVKA/eufWNtmpjBoJfl9FUVPQ2i683m0fKuiuKZ1PxS3IUY0MC7vnS6D5vAsYaf
	KwTC41cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4qi-00000004qLD-2xep;
	Tue, 08 Oct 2024 07:41:40 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4kJ-00000004oPJ-2Tng
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Oct 2024 07:35:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20b9b35c7c7so37943395ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Oct 2024 00:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728372902; x=1728977702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAxUQ/gxQDnRaq33Q6rLVbh6EKahS1Y15WlLZB1S0cs=;
        b=Zn2Bh7BlG2TjOU+nzAwnL0ZkVzyFnSyn7tV8zYKDi/+qIxzPZ6BcTjCuhkm9Cyzc8G
         LzMl+pFZjgahMnvczNZoDCJbDseAwKvosZtr7zTvh0+aiWadIZnwR69st/l7B/HtiImY
         uvo2Bnf/FlBAgIA+iaNqSG3ufgTsHMCYILm+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728372902; x=1728977702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAxUQ/gxQDnRaq33Q6rLVbh6EKahS1Y15WlLZB1S0cs=;
        b=NJKxZlWXvoFjOIsyFdXtItzTtYOJrNAbWPcVH13ieF2rxksXfg6JPj5Tgt9Yp93AqR
         sUZ0H6JcsycfV/ATrpo9jkrzOsn/lFGO/DZ0MU5iWdAUMwY9fj+gtonHAkiPuBjNlAlx
         eDOobOmRvJxyeIwQUV6K5YN3OMZVRwGmgxyQytVoZ2RPVot9/ZPedFY2xWpSladMJBW+
         S6w/WB2sSPj5fTKtS9IXoyPwgPY769c6udfLf/SbishYAoVY/4d7zzrvgoxD0/TYIdWs
         rweMBlzmz4Wrya67F45s1CGtJPaFlpyZflqapMQYj4KPSBT9hDHvXOSWbuHYZA0fhD8R
         GNGg==
X-Forwarded-Encrypted: i=1; AJvYcCVNDiL+CjuNodnj1QDZlm9ZcTgm4ikFDgNG8BT4P0XKb4N0d31isw/Fwh8+6AJY4vMskhltOiFXKCiAUwd9GQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkRVv6Xnb9NfIWBFkH6gz4qCLdGJV1UbxjpLIzu9fGtT+QVR+p
	SDrsdZy+wt/gT1TaDjD4/0hWwz6BOkzKchcVv+86AxGvvrK+F8CurpOII5arcQ==
X-Google-Smtp-Source: AGHT+IEkI2JuDhmy2Ntn94t3UfJbenoF4cvKN24CAZImwC2iBKZvWlacaurS6rWVfrNKcS9cT8F0Rg==
X-Received: by 2002:a17:902:db02:b0:206:d8c2:4a94 with SMTP id d9443c01a7336-20bfdfeeccbmr217436695ad.25.1728372902576;
        Tue, 08 Oct 2024 00:35:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:10df:d27e:8d4b:6740])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13939bd7sm50121175ad.120.2024.10.08.00.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 00:35:02 -0700 (PDT)
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
Subject: [PATCH v8 2/8] of: base: Add for_each_child_of_node_with_prefix()
Date: Tue,  8 Oct 2024 15:34:21 +0800
Message-ID: <20241008073430.3992087-3-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
In-Reply-To: <20241008073430.3992087-1-wenst@chromium.org>
References: <20241008073430.3992087-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_003503_687720_9108C428 
X-CRM114-Status: GOOD (  15.16  )
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
2.47.0.rc0.187.ge670bccf7e-goog


