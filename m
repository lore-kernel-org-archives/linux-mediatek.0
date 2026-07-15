Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E94AC44501
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 08:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XAlo36/cvqlWCfJP/st8V9NvEK1f/LvSK5OHVxavmM=; b=x2oZcmYLDmXrFWV7ATUHikC294
	Mrfu/g8TLuX9xg6jslTR0GYp9pOJNKPti89sXhzqnHtUen4uUesBM4onOqMt0la2boByEIZjW9MIn
	o19qT7XNpWYuCXbFu+3+uz7TbVu0+EC1ePk7kAVs7nyooltzNExzpwRvghPzZU6zwDG4OGCmYBrX/
	k/hrCkCZGUyzjQUk8PDSinJsNIcWwJZb7K+8pGLMbWZCvMS4LxERIAN1P0F5FuFvvH+4RvSSiJN3G
	djowwvuXe4lfhC3l1JN+2rY3NsjcTcPg6Z+hetw0OkwW9nuq0z1M0+JE7bOAfBbf6PztcHiumwE6j
	ahO/intw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvNo-0000000EDNJ-3uYC;
	Wed, 15 Jul 2026 08:54:24 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvNm-0000000EDLH-1SuO
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 08:54:23 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-845c92bc464so1817321b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 01:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105662; x=1784710462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XAlo36/cvqlWCfJP/st8V9NvEK1f/LvSK5OHVxavmM=;
        b=Z3CkqtAO6dC5ndePqMXXPxFDlZGdyqWOh+g70cSgGJHiO7NWgdvYQ+spYK7Mmh6cxN
         vll6JxhWEih+vcDK612O6B3He80H/gkKZitFSEYBEsFy1QnbSTUAfwhpw+O50QHsaB9l
         gKc1+haFCSfegtbI3ewWI/QzpeACR8sgwiTAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105662; x=1784710462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1XAlo36/cvqlWCfJP/st8V9NvEK1f/LvSK5OHVxavmM=;
        b=DzTl/jHx36TTuBhXNl3vV7vCxOX6eW8fH4wRr5iGocy/ubNEmgPxkalwhYWNPxBtuh
         lHZ3qzS7XIgUyNSJCEzpy0jr9eKD9jjXumolVQkbARCspQSPPkOuSN9C70qRSr+OlT5x
         RL6pxwa6Y+hpG+NzP2F8qcIi+6wMEHz+Tq8q4JqFu26G+/EELOpHBORsRv5ofYKYZndF
         1Gg+BhFG3/gpLN2TBO7nYMztO5nesPsNovuNc23zEFZs+6APdAWGVCA+XjiLk4NM7Yck
         xacUa1aATCawZXTguklsxh4COjoOBqF9m8SDug5Pqo32dHLl479zewxanja+zzlQgMCf
         k9Sw==
X-Forwarded-Encrypted: i=1; AHgh+RphUNATTS2GjOx0XgXfDR3rt/QYu5JrK9kIPRhpnCP1W8QfZrzQCCfi8DWnVQFzBemgipvPQ5LDQdIRi/d0Eg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOPRvfDTmQ+HXYzbEKxyMob3TgDvrGlTOCIc7jFNB4MtcK3zLj
	Xp1Hle4SU9CU1Wci1pTTOJyMK20fawmCtKJvTsrhafJO0jUd0/Ut4Q1+vHnQN+noEg==
X-Gm-Gg: AfdE7cm4tcE9yxWnjaTnbL/eo8FobHRz5ALB/nITqi8UMhFMQO8P5+JV7+uJCqw4AMr
	LBXbTp4ibUR+kEZHfdT69d+u7TlUcopHFqnyzUPltWCjSnjNj7YybLsFiljOj/urcLfKQbvAuuq
	qfRv8zNPKl7FPjTaUYHLTeHx3eE6gIajBWLWY65VZIfhHssi3ctw1myor975TDCel4p3lRHfpNz
	DbhARWAwxlmHDoCETwwMPJsO0/FXYCB8DRVd/7DXrtcWd/bDNOyT27R2jazBap4+nbTaMyn/Zf2
	iTgLMmHsAQebtOQPUnUEG5eNJ2BdZ/s2yf2IciPmXG++uo0JR67xZJxyumNn98Y5eVlCpA/+Kyn
	0HITnyqKK1yb3Lr+e8nBzQESV56lqbyRiq2L7qUmkT7S+DZmxuuSIeAx+3vIq52WFkxYq4fBzs/
	63aAmi75mQXv4SmwTnpEJwl6V9Z/cu26Ph6VWYVd4BNf/A4flIoWzO4Wb7vKLCbHXJuaGklA==
X-Received: by 2002:a05:6a00:21d2:b0:845:c6fc:2821 with SMTP id d2e1a72fcca58-84889604f51mr14884898b3a.22.1784105661732;
        Wed, 15 Jul 2026 01:54:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:54:21 -0700 (PDT)
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
Subject: [PATCH v5 01/16] device property: Add fwnode_graph_get_port_by_id()
Date: Wed, 15 Jul 2026 16:53:31 +0800
Message-ID: <20260715085348.3457359-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015422_414810_E183C1F5 
X-CRM114-Status: GOOD (  14.83  )
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
Changes since v4:
- Added flags parameter so users can specify whether incomplete ports
  are returned or not (Sashiko)

Changes since v2:
- Moved "Return:" kernel-doc section to the end. (Andy)

Changes since v1:
- New patch
---
 drivers/base/property.c  | 29 +++++++++++++++++++++++++++++
 include/linux/property.h |  3 +++
 2 files changed, 32 insertions(+)

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
index 14c304db4664..480ba8646bcc 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -505,6 +505,9 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
+						  unsigned long flags);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.795.g602f6c329a-goog


