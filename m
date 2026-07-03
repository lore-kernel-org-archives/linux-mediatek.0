Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38519C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3mY17pOHR7Cz6c2b8dxl7oG2Wt8NUoj3LgplMYXljY=; b=1EVDQDU4gSKHDSiIYK6Dw7kqye
	ftEJXk1+1DQzSMFlm+utwKuE3ue8TIUYT+B2i+qe5wgX2O6I6hCL4IPEHXeNGI8owfwplfrT5PXS8
	O+m8MuTn02aLottKaYCetv2QsNKgyAyfqq7k8dZpr5EiZ6BIDc9H/hRKrEeev5gJ3puaI8pFnTklI
	4PgVVktW/71HOzNtoclh6etd2lFZkn1imJuPr/1+o9gcGoP3IG8uxmj86ZWbwefVtWBIa7S1iy29K
	ReUBJ/JQFc+4ZPtr3g/ubNVnKnvwDIoGerY4VKPxbcvtPFsaq12xn0cGAtJPYS5Ggs1tu5pRlQipE
	oLc9EgLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgT-00000006l1j-2tvh;
	Fri, 03 Jul 2026 11:03:49 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgR-00000006kyk-0PN4
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:03:48 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2caced6038eso5205225ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076626; x=1783681426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3mY17pOHR7Cz6c2b8dxl7oG2Wt8NUoj3LgplMYXljY=;
        b=Lyf+8x+gJPizIABtbGorCvy7DObFZLwEZtL2TyqiR/4o2JrZZ6ncn4rYFuAiVmzHhj
         YGtDZ4W6GKV1uYuf/vK+KQKi4xYtfsnX3Hleiok257siqq52NGpBKX0ojKQdATh3+Kqh
         5mAvv5/kQUzfBGnt2d4It0zTC2EHAfWsWtuac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076626; x=1783681426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b3mY17pOHR7Cz6c2b8dxl7oG2Wt8NUoj3LgplMYXljY=;
        b=Gv1hJq3GKesgDrw0ef8hxnSIwyy5pI9kBByA4lweXrTzIYkFzRu+0KrX2o0QRKn7nz
         mSZANCXwTN3bXRnv3hwgVel7i/ZywFFoEgiCccvSUpVjjdr8yfKh3swT+vJCSXj8nbSp
         r3WJTpw/T8h8vEhVgCDBkzUyHyyhV5UyZS7nvEXJQh/qyPD22gnGDv0ow5GwxSo2XzUP
         HFTt8BE+GH7IShnGo6TRQIsSVzGLs/RYRIyP0iYqT4xYImN8oqNVzRB6fTxMd4x7VPhq
         5mPId6RYTk6RanjkyJcLqDp2bZmc8fEJUMTSgBBPbV2zujDZzXPQDD6VLncozKBQoo95
         D2Ww==
X-Forwarded-Encrypted: i=1; AHgh+RrkEoEVz2s6cWNqy31xkYYMSZCtCE1uCYWvyfKg+NmMkxpnJE1KQptYiQohOPVeHh64t3AgReolbeVkc/IyHA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzli5vVIvrZ1pt+NApgO4oSgYmSEBq/ihc9y4/SUcneId8XDn2p
	x3uZV9fD+c+YHfjuVHBc76wWNJh22bp3vsNm+u0Vfc+hJy4L2KObEsVvZ5UFgr/d9g==
X-Gm-Gg: AfdE7clSkg063w/XRsIgreRBlljf8+PvdJ42FL4993O0Mo3FPjojYXEcHj0UQEIA5a6
	j5qDp2bf8c4EJK3KM/Ne0BaKm1i7SUgERHuMxNmUJfh5lj8/Efer5vJNbV/w05wOwjQhETH8q8D
	0qu70gCSBjGS/1l1K9sChjcq1t48xZdMWYoPQEwxcUhUDwKGlbghEI4eC44YUbkDm0zQvQpHk81
	b1JEPBEuSAy3wnq90zuwfFBjvvpRuWuEv1WFnMYE4xRicwmpbegndewL0QZQ4TGV33pgU4hoFJ/
	z8yUC96H4V6CWvWBbkjmO+yBOI4jM1zqiHDzCpA8Xbo/NIjKYpFyS9j6cGAOvus+/lSOyyu85SB
	7MoZiFz78Eh0KAB0P/v6jw/O1L4rJABEEnAzK1n+YQX/+6EnD5eKUD2gScRKIhnuUzrMnMdWRQ3
	dEUJrT69Vr8WMe/2JIxxCeKd/VE+6VThAYlKhw6DX0esATh9NHHK5ylvOguLq7oiC6aDZE7Q==
X-Received: by 2002:a17:902:c947:b0:2c9:fc4c:8142 with SMTP id d9443c01a7336-2cacabb1b50mr37971215ad.2.1783076626047;
        Fri, 03 Jul 2026 04:03:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:45 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 02/13] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Fri,  3 Jul 2026 19:03:03 +0800
Message-ID: <20260703110317.1283411-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040347_429209_1C4715B1 
X-CRM114-Status: GOOD (  16.45  )
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
Changes since v2:
- Dropped unused |ep| variable
- Rewrote as do {} while()
- Dropped WARN() use
---
 drivers/base/property.c  | 25 +++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 3e3e19ef66a9..7e7ad3635806 100644
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
index e04901c0bd8f..931e703393cb 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -506,6 +506,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
 struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
+	const struct fwnode_handle *port, struct fwnode_handle *prev);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.rc0.799.gd6f94ed593-goog


