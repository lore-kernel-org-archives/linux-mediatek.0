Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A094CD8CB9
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 08:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6pTgkTdjphaP4G6StNKBNkGmsxmuRCJqaledSqIiFY=; b=cUL2DAeWSP8svL3tCQ23vIiAUc
	nTHkLf4tg7VNKkBaFJYIUj8sayvonDSNhdB45S/Mh41nEwmOr6+Z/wi41zjKvly6pH8qKCB335v41
	+emndGeytF5S79MmXIV+BVbH/rdTY4yOIS0IYZAlynx3zFt5hvn5AtiRsrlatDAK1Zcg0gCJp4WKR
	2YkMq9uinOsLPk/Gxmwt/BVA0PyKcZCC1URURE5DSeNfD6tO8887KK1+ACX8DTG8iYODZWDCDWXdl
	6T3b1M9e9Qj99F0VvsHOMqGyCjwhan2n+nGoly5w4lUSvxbgu7TMwYdBTKXEl0ZslO+3U5JJl3xHL
	yIEoGUig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEV9-000000075TO-1ZHx;
	Wed, 10 Jun 2026 08:41:31 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEV6-000000075RO-29tl
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 08:41:29 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c0c3546924so43235765ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 01:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080888; x=1781685688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6pTgkTdjphaP4G6StNKBNkGmsxmuRCJqaledSqIiFY=;
        b=Fs9YuUFqx+8zDXpJ0wC6awhnXyd17s7SHxadDTKBeIGxdssglR0TAvmOIejSYaje3F
         TO7h28yrIRtQfPYIehqUAo/x6KV3hHVi85LA5Xc15u0KBndX8/rUzEPAgHd4V7xQSd08
         ea/mhjQF89tYK/A9UTZEpWTLGbmJX1ozrNgwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080888; x=1781685688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6pTgkTdjphaP4G6StNKBNkGmsxmuRCJqaledSqIiFY=;
        b=dPisubCl5QkWaKmby9TFM/ayb/eW/6RVLB0CxeHIKF8KIcdcuTinrRNnyAaeoCT/30
         p0+M6g8rC+BZUr+QCBWj0/XXPp/iGDi2E/LQVc+ZmQMyv6kGLkQPkPG/ZRuOljhDblla
         pcT+kSnEZnqU5ZpfwQMz2B427JlwygoEYN1CQ4AP+TfOjCS8b5Vc87k3QGq8Znfa3ziC
         dg5qt8tsUn7m8FkMuacEPFD0JHR/UzHF5QfpmZdGMdp2+f68Pj2H/XhfoG0VU2VNj/gv
         5gBqRsktal+Q/aS4APY2CHtu2mln/Ls4uITILtlZD+EcBkGeIQPOlsWsb5iQ2ljLUDHB
         rF+w==
X-Forwarded-Encrypted: i=1; AFNElJ/QcpuTvxM+ikLFqxgyjYG3jb3VrGha9ot5m9/GyaRCN4a82E/DK4SpMWCfh0Fg8veAajuBBGLT26Tfqwn96g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAdhu9pPMm9fxH6eAuaHhwp8HARTXtvB3NdS9t5ykXAOYv+5gQ
	gtxjFdAf9xq5QpqNVLGIOzREtz7ZST5hk33LbrInuKUJBmYlmXYtT2F+Az1Fqp8e6g==
X-Gm-Gg: Acq92OElRMNvX4B7joyNxmsYJIfq27t2fQJQUhO94D1gp77prG+qBb2c51qvGFUa/dE
	b+IArUDaeomx69Nynn/XrHV6O5QlkdR1K/iMCDtBHc9qWSllJLFRt9+0yyNdpO+s8y6GHLWyivE
	3jjEWDx8TngREC5ITpJIlhkqhJ+j75xH9qA9YfoSCva6esv4g6M7V1qC0ptLci2YfEUbWxWTuLv
	aS7YKT/q1OpKzkqgGT3jBH2Zvl0qiMgQ1DfzAXGgQGBiLoSTXUQwV/zhmupX6BMGn7A7kV99MTi
	12/J/n0MrV6F9XELjzKpOXDN6mqbSWElF/sJaYaDj0n1rbiVJ+JDHB+OP1HhQQvUOVo0La9w9DA
	p/MxkM+o/3RAsFeg4/bTRyaE0Q+Gc5RtvgmAKyg99GoX9R8sVWoRQW9SiCF5GbAAlftxSPedENi
	j/HbeBzWOf6s1FkO6TML0LRch1xZdqw2lz+UH/YKau9G79zDQNTMRBYjX7829rJacb7raKU7qEh
	ic6lGkPSrX1JdwKXQ==
X-Received: by 2002:a17:902:ce8f:b0:2c0:cb0e:ac42 with SMTP id d9443c01a7336-2c1e80f9d2bmr271193835ad.3.1781080887890;
        Wed, 10 Jun 2026 01:41:27 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:27 -0700 (PDT)
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
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Wed, 10 Jun 2026 16:40:36 +0800
Message-ID: <20260610084053.2059858-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014128_566394_0C98EE30 
X-CRM114-Status: GOOD (  17.22  )
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/base/property.c  | 33 +++++++++++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index a2afd854a604..cf14f9b0a3e0 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1099,6 +1099,39 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
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
+	struct fwnode_handle *ep;
+
+	while (1) {
+		prev = fwnode_get_next_child_node(port, prev);
+		if (!prev)
+			break;
+
+		if (WARN(!fwnode_name_eq(prev, "endpoint"),
+			 "non endpoint node is used (%pfw)", prev))
+			continue;
+
+		break;
+	}
+
+	return prev;
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);
+
 /**
  * fwnode_graph_get_next_endpoint - Get next endpoint firmware node
  * @fwnode: Pointer to the parent firmware node
diff --git a/include/linux/property.h b/include/linux/property.h
index 11f3b54c7de0..2e744c6f251d 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -500,6 +500,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
 struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
+	const struct fwnode_handle *port, struct fwnode_handle *prev);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.54.0.1099.g489fc7bff1-goog


