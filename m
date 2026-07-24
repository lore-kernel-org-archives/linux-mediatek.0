Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585F3C531FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 08:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15QCCMJqDJvxC4OlYXPloXq3cJq1LSRVcuMMIDjVYjA=; b=g0FwF4e6ydC4LQIUYvFAdXysCT
	Xc9t+VuofH3+/yMTDlWS938xNRNejT3ahWNYhsqKdivTh7RBqA2S+c8nFNA8fZZ7lnZJ1Q/BGUTju
	7tR+eVTE0FL5GXuCbpJSgsb2ymwpvbPG5SKsTQBr0u595hpDY3vdV+YGEKMFXHwiKaEbJRW92uyUd
	VAEQ36tDyrReG0oBCSVwXuT2hPuzaKf9OlFMDKxZhc/7/REXx5YnCnlURH/402lBqqyqyEzz5E5G4
	t3LQSgzOXT3IwDRHSsMnbc1Vi/iJLLMGBfd7flbLr8vactva6/4Qci3lTc5x5NGB+aYuOl+79Ovh1
	QyoITS3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBW1-0000000FqY2-1So0;
	Fri, 24 Jul 2026 08:44:21 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBVu-0000000FqT9-1xXP
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 08:44:15 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso152665a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 01:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882653; x=1785487453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15QCCMJqDJvxC4OlYXPloXq3cJq1LSRVcuMMIDjVYjA=;
        b=Zid+CLGVIIkqA4NWHWSi3W5oXMYdTNL8PQO2q1Y5yiihScNeAoLS8Qr/0mpa8D2hxW
         z2ygp/TnCu5EPnUmEqdv2uo20eP+0tTHgg2KxTR/afqchGOQlCMk1oToQZ7J1Xb8mmvC
         D2wgiqeaPf4vvrVlK63JD6lQ0R3EZTRbDdFGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882653; x=1785487453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=15QCCMJqDJvxC4OlYXPloXq3cJq1LSRVcuMMIDjVYjA=;
        b=JSW0vo2+6zHGAzE0eY9WWH5IH3EPahS6suRpfefxMaKUgM/Ra8MGZbInQVn/JATGBp
         SQOcoIlddkk5mw1vvzLSDnLDNZHbsnhGXxu/wDILx9kavkztIVP1g64qB6JA26gsnaTy
         T0Sp2ll9jcm4cts6P6Huy7XMItvNHt84bPQbVzLxB1sZNJRIIGyrxm7KpvI+mthkYZgz
         Vps6mLqMn34NEvWUgnXO6RvPOkYZgZMB9F0A7gEJ7yHN5O/YkF5ULMtoR8w3xZprw6cr
         5HneLJmGXGKz3hEgPtJq8mX3d/nFh+n0jzlbgC8TmnpQPik1mNdRLPQc1FKPDO+l+QMW
         hrCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rohtu8aM1d0xkzSzU1Jt1z5FM+R9/tp4rcorvSJl4gncWQyUdE+Oe66/P4E1HJcLZ7jFQBarDBRv0RwJYWlBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbGg1mSBSuO7wAvD3zyAO5sxqvXyCOcdZ0DMkr+8MFakttLWc2
	/30zjkV/i7tqJZmNzlEdhyk9T1y3Y7KxiSqh1tM4pvOYVoMLnSpqXOO1g+5gOOby0g==
X-Gm-Gg: AR+sD11+iQlJv1Zk2NDefFXKcTwSPlP1Em7uSScH25izMgTK+lUQx9M0VV+TD99FMUH
	7BItqEe87WWlPqTMp26roZ9wkQTrXGpchhAq0sZb99iwdOSWXWuJoGPbwb4Gmvj9q/HHd0GUvp9
	RC/nRvbL8Mlep0iWbt59HyJ/bmqNhLsYUp64/VVU5hzNBC24qUy/cSxStuCYeVd5bu5gOkRdOkG
	GlNubsv1fsGPKxIFXXjI1z0FsmlAb24kV70y/yEEjFfUeTh/OXnpChvUJJpdA2WDstyhFdMwakk
	2RcUOeSrnVVf1f7MeMO2YfXMQKu5WiWLIbXJBpaFcqxF3+UYuDZxAMmUxtRN1SJZP9DuyReJKut
	+bN1MeeOi/qAGPorzUOxccFTfgRP4hjX98i4HfRlQuSJTl9hXPpVOP+oOTGmmYmU3GRFhIhrVUy
	B3qe7t5wggDCUEx+31rUn0UQoRrMbZDqRj45hX5tDAEAlJBhL+0ZsQ0UZSMfU=
X-Received: by 2002:a17:90b:56cf:b0:369:a359:b181 with SMTP id 98e67ed59e1d1-38ec6610d34mr6642066a91.23.1784882653597;
        Fri, 24 Jul 2026 01:44:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:12 -0700 (PDT)
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
Subject: [PATCH v7 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Fri, 24 Jul 2026 16:43:11 +0800
Message-ID: <20260724084328.3943997-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014414_521333_E90AF4EC 
X-CRM114-Status: GOOD (  17.67  )
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

Sashiko points out that the |prev| reference put is not done if |port|
is NULL. However it seems that the fwnode_*() and of_*() API design
implicitly makes the functions no-ops if the passed in node is NULL.
So this new addition follows the same pattern.

Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Dropped unused |ep| variable
- Rewrote as do {} while()
- Dropped WARN() use
---
 drivers/base/property.c  | 25 +++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 950defc0c55a..5d3993bd8fc4 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1099,6 +1099,31 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
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
index 01ea010cb2f9..9a784a856773 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -507,6 +507,8 @@ void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
 struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
 						  unsigned long flags);
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
+	const struct fwnode_handle *port, struct fwnode_handle *prev);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.229.g6434b31f56-goog


