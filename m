Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B12C531FA
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 08:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZPli2S6cZzTtPxNu5kCcB+M+KQUeHMnkMABY4ADLcw=; b=LR8SMxG453PaYtQSh2HbC1bMlY
	3P1rRfpBuCF+MeD9b9UAtLGisBS9BUZxXhQ1AtgoOXyI7N5xnpU/YcF/KPg9oAq808yIKQxd0zKgK
	fHFW5oV3R+l0uiW+FuuV+NKrOPfYXAPmrLenRyCggXvWfiA1SE/wwcRH3xGiDHtF6JxC3Qjud7x7t
	HxDm+iOfTwSYwBxswvf/OTQNxGKZ8ri9rfH1QBx6KqGkszjg3d3Z5hyTtBtkll/6DOLImhXE3sFKD
	neRJJVAjis8E2Zth0sHJHsyReMsvD6ee+BaQID2IbhvSSlZIsqDNrCTdX8qSLSXV4HNVx+NaeCxim
	QdTHJG4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBVq-0000000FqRJ-3tKg;
	Fri, 24 Jul 2026 08:44:10 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBVo-0000000FqPa-42b4
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 08:44:10 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so151215a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 01:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882648; x=1785487448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZPli2S6cZzTtPxNu5kCcB+M+KQUeHMnkMABY4ADLcw=;
        b=MKjdsEFTdnGzEzMRa7yLqPIDel5BOLCmsg6ok6VLN3GClvBVa774HCK2W4U3rVQbSx
         KR39/jwIQZkUMLiofZKjWzC2ERyZP7/D9xTsC3PndQl0N5vD37U8vE/5xNwC39PupIrn
         rI7ZQUP/G9pvWi927yEM3fNzjMS6sJlJEbNfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882648; x=1785487448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZPli2S6cZzTtPxNu5kCcB+M+KQUeHMnkMABY4ADLcw=;
        b=o9TbgV78hULVjrpxCJ/90A6fpCE0KeIshkG3Y9Gjdl1+NIumCYVYlkB6p2CxDqxlUW
         SD3+nzXxhwzuu7nwB+hWIDcHKNtHHMp0XiJmNEF9oW6w/j+2xUoDwSJu9T3iBPPo+Ms8
         bTArfJGgNBOgITjy2hQ0gL8EacFh95PnmmQwyPkFhB6iT8Pxqn58FvbE0NLl/qWcuhdZ
         yvat+EE/KfdWSQHVy8cUNe2eLkR/6ZqAu2o6vniDGHL/eKghAh0r/9nO4TFaCCswRVy6
         6b6iOARLksBJQ97+WZqRDtbuql8FZCbtpoTA7F6WtD6Hil8CbxmH+w+XCL8PoIyrGVjj
         ki/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrufQFFiwcWnoz3RnIUI9aTDBBEV79ieh34pJA+Sqaya4z8MahzHzP/H2BwvIhmDpSJrCwtiJ4bqz+HrnWnCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YygYt2NM2PjTLyim9MkiS0PKPUlKFnVMmbY80KwTE69deyjFnHV
	qbMzkN7gc2VAEoJOoJjT0HmjpdiM7FHlF0Za7gWwjmB1YlcUd72TaewxjFtNt+oaNg==
X-Gm-Gg: AR+sD116iaatQ6w5zkMv0wf9yJvu65J2aZX25Dh8dlKmhp8RELnSrV8ys83UKcQmLbq
	GTOtfnpjiMcMJJY9iTUVmZL5ANTFg0yqvVQsWMIlaWHymrkhwhRwB0tk9RU5Vr4mC37Tr2WCRlq
	mRmQEH27zJsVuRsj1GQD2szQbAGZWqDddunpyLrSRnnDDZdsZM1lsxbtzjUJJwMdWxkD4t2FO+0
	fV6y8CQAXC8RxxaV/46vKn4r4NV2Cnw3W/KRThRD4kDG8DsaZzJisGTWpFwdOPqVNQbpChOzAXQ
	oLUkUDh7HY8fex9aWALTScUncTZ7AM497PtJy2XkoxmngC0PjLHs2jEbkLqPV0ybIaA5A9EyB7n
	hOzeuGIynYOnuPFjnwwUiCD4YCZvZBKjVDsgDz1xeDbh3Fn6ZPhuGXTjkYdZInuqOS6dcGSNNp8
	8CKM+uIDhZbhxqQHHJG9GeLgsOjAqcIeQs7oXz80QOZJy5w65qQ0sfvm75sMo=
X-Received: by 2002:a17:90b:2750:b0:381:5ab5:b667 with SMTP id 98e67ed59e1d1-38ec6637d1amr6238598a91.31.1784882648264;
        Fri, 24 Jul 2026 01:44:08 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v7 01/16] device property: Add fwnode_graph_get_port_by_id()
Date: Fri, 24 Jul 2026 16:43:10 +0800
Message-ID: <20260724084328.3943997-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014409_009672_5DDF11F9 
X-CRM114-Status: GOOD (  14.21  )
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

In some cases the driver needs a reference to the port firmware node.
Once such case is the upcoming USB power sequencing integration. The
USB hub port is tied to the corresponding port firmware node if it
exists.

Provide a helper for this.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Dropped left-over declaration in header (Sashiko)

Changes since v4:
- Added flags parameter so users can specify whether incomplete ports
  are returned or not (Sashiko)

Changes since v2:
- Moved "Return:" kernel-doc section to the end. (Andy)

Changes since v1:
- New patch
---
 drivers/base/property.c  | 29 +++++++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 9387bb83eb54..950defc0c55a 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1346,6 +1346,35 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL(fwnode_graph_parse_endpoint);
 
+/**
+ * fwnode_graph_get_port_by_id - get the port matching a given id
+ * @fwnode: parent fwnode_handle containing the graph
+ * @id: id of the port
+ * @flags: fwnode lookup flags
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer.
+ *
+ * Does not return ports that belong to disabled devices or endpoints that
+ * are unconnected, unless FWNODE_GRAPH_DEVICE_DISABLED is passed in @flags.
+ *
+ * Return: A 'port' firmware node pointer with refcount incremented.
+ */
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode,
+						  u32 id,
+						  unsigned long flags)
+{
+	struct fwnode_handle *ep;
+
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, id, 0,
+					     flags | FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return NULL;
+
+	return fwnode_get_next_parent(ep);
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_port_by_id);
+
 const void *device_get_match_data(const struct device *dev)
 {
 	return fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev);
diff --git a/include/linux/property.h b/include/linux/property.h
index 14c304db4664..01ea010cb2f9 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -505,6 +505,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
+						  unsigned long flags);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.229.g6434b31f56-goog


