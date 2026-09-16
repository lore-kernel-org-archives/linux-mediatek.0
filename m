Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C5BC88E77
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 07:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fj62mBTPExqPPPR271cOhjtoM9DP+nCqq3W3jRfMxEI=; b=EsWp3geYdmURvUfGn7mWxe8Ktl
	KvRgdtEqql9guxhXVym7jj2Jy32s+hChP5nOTyPy7g8HADlHz8Tvdw5kJ72umT747GuwZAGCHJuZH
	Uw5Kmm4PUkbAYmN2qWTVeBunuB5UU4istbdJ+lV3zuyXKqVOHLe/SxTQNglNjWaRuXMECDrXDLB7g
	BKAeu3qTBB+1fL7gw5YDP52ozNCEWiEGdROvjePTzsrB+TKHZvcvzbVfdjZFTzy4UqCFWjuYqnB/L
	wdrkKrccn9ssup+ZMnuerKfaIWLGvISPfNZXRQkHpKVyCIn8/2RwOUYTHIjs9wOG4uLR46rnCvfwb
	NXMEzGhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXL-00000008dpY-1LYV;
	Wed, 16 Sep 2026 07:58:35 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXJ-00000008dnc-0HOb
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 07:58:34 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so503593a91.2
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 00:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545512; x=1790150312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fj62mBTPExqPPPR271cOhjtoM9DP+nCqq3W3jRfMxEI=;
        b=Lz5tkaSNA4J5xI946QbUOZog8ObiV2qrQjD1XgX73sA3MOg+YaWoSUnQw1hq2h9pmO
         A7gE+Sgb1zdaVhMmwX2GY0aUewJL/NA1kF0jXy1N9DBhq/P9i0wqtbCV3xq6FAsW0Idk
         lInXB3Azk55qTc7B4JWpkX0dyuQQPD833DZm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545512; x=1790150312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fj62mBTPExqPPPR271cOhjtoM9DP+nCqq3W3jRfMxEI=;
        b=BgdlsLZnF+niqLcSf1sqzrFUYho3Muy9fr4WzSwR8zXeQNNiLuvwA7nn3rmt0aHkD6
         BIe8J980BBMOiJr9FkrvPZWcI1tIHWEpBvYM5g1jDzT5XfuTgGXeBWHjg+9rh3EmdYRi
         mblrk6V9sflS59Kcyjav1dNIEayGM1LStowSTkxhu1kdhGmvHhO7p9v5Kc8nv8xWq8qv
         18UzQ3qlobgQQA5ZtI64bGNBjHYs+q3llb5ST3HmgczMZD61E6U0vWIpvynYft2+/6RN
         JTj0zfZkIM5W7V4l6jIfGwTMkaWx9W+s5W/PQNNxaKSfBdB8YqVBltb26K41XhY8HvvS
         tcXQ==
X-Forwarded-Encrypted: i=1; AKwUvByzDOfVL1TtD83Z45iJkWOJLC2/HeJasSY67sZwTdj0IAmC4pWCBwJvUUG4e0iHCOw6uwQHbAuzn0/uav8KdA==@lists.infradead.org
X-Gm-Message-State: AFuF++ncZ3J5n+vJDQXkCp+Udo2BWfGnLvWbOuc5a4KjFtdyx9HuRgfk
	sRwXiFhYo4l6bFAuIc0yovwOSxW1iWd2OErPfzbklpeHWNL7IbLXa0wp1tYVUrCsFA==
X-Gm-Gg: AYBFou1/VetvNK1x86donJt1kWmvRKYS4wHk7aWBzgJwCupC9U5q+P1hFSNXzOXLC1V
	9ct5WG1S6VuUlLLdSxl2uLYhfvr34taddP9MTfajnf6KK1kEa18gAErFhIjMFObSMna16IIZ08x
	TfYiOJVVkfo38yHTl48ehXjhvCrjZ0W8YUkW1PNV8nERN73x573xULaEFoxbT51OcIE/4mMv/Kq
	Rs0mPazAQ926wV56XsQ/QeZMSXGDN/4AySZLnVxAX8VcRPaVJC3QqK9tVSLxAy+4LDPlbPZTAj5
	lLFOH8VFhwiIp19z3snFfRi+5I+R9DEhK3gz2FY3QdG/TEHAQRUElUXy8XWVieKzrUh/tcb66fL
	YXIhjyb6GMLvqojaHGJXgbH7MbpaL6X6sLGgO+Eu0XxQxL9cKzg5lurFQK77hAwCQ73nl4/sovZ
	pr4ArNyaumdur0dFwiqI7OimZW6J7y7ugrdpyVSRSqG+qI8l+O0cBhuqhgQkcJ4gH6ccxVXruD6
	wyj2JnbE00eTF4WJNhNaxE5kG88r7TqSCrrfkWR4ibJvqdeGGYosN9dbg==
X-Received: by 2002:a17:90b:4b83:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39e1e4c4687mr4082007a91.18.1789545512315;
        Wed, 16 Sep 2026 00:58:32 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:31 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v9 02/15] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Wed, 16 Sep 2026 15:57:28 +0800
Message-ID: <20260916075745.3549953-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_005833_121954_907A24DE 
X-CRM114-Status: GOOD (  18.23  )
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

Due to design constraints of the power sequencing API, the consumer
must first be sure that the other side is actually a provider, or it
will continually get -EPROBE_DEFER when requesting the power
sequencing descriptor.

In the upcoming USB power sequencing integration, the USB hub driver
first needs to check whether a graph connection exists, and whether
the other side of the connection is a supported connector type. The
USB port is tied to a "port" firmware node, and this new helper will
be used to get the endpoint under the known "port" firmware node.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Sashiko points out that the |prev| reference put is not done if |port|
is NULL. However it seems that the fwnode_*() and of_*() API design
implicitly makes the functions no-ops if the passed in node is NULL.
So this new addition follows the same pattern.

Changes since v8:
- Moved Sashiko related comment to footnote (Sakari)
- Collected Reviewed-by from Sakari

Changes since v2:
- Dropped unused |ep| variable
- Rewrote as do {} while()
- Dropped WARN() use
---
 drivers/base/property.c  | 25 +++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index c2b7a571fe03..924d03df4995 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1109,6 +1109,31 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
 }
 EXPORT_SYMBOL(fwnode_irq_get_byname);
 
+/**
+ * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware node in port
+ * @port: Pointer to the target port firmware node
+ * @prev: Previous endpoint node or %NULL to get the first
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer. Note that this function also puts a reference to @prev
+ * unconditionally.
+ *
+ * Return: an endpoint firmware node pointer or %NULL if no more endpoints
+ * are available.
+ */
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct fwnode_handle *port,
+							  struct fwnode_handle *prev)
+{
+	do {
+		prev = fwnode_get_next_child_node(port, prev);
+		if (fwnode_name_eq(prev, "endpoint"))
+			break;
+	} while (prev);
+
+	return prev;
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);
+
 /**
  * fwnode_graph_get_next_endpoint - Get next endpoint firmware node
  * @fwnode: Pointer to the parent firmware node
diff --git a/include/linux/property.h b/include/linux/property.h
index 3dbbd01a52d0..691e792775d5 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -509,6 +509,8 @@ void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
 struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
 						  unsigned long flags);
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
+	const struct fwnode_handle *port, struct fwnode_handle *prev);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.1032.g73a4cd73de-goog


