Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C07C44506
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 09:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHa+N6e2rl6wq1SgVHpliLB/r9n0zCkbXlX81Kt00W0=; b=ZY4eiiQtioSH6QZ9ln+L1PydYO
	m/3YBHHiqnUTOufRpR5CCYVEiq78XqSdD8m9wI+dS0h1E6R3GhBMUiJyQiCkr69VTUXhnXabBbQ7r
	yLjtxwvreuZrGxCMM6PKBXKL5ccezeQroQRiWchXUL5XRCDoJf7LVn600k1kk9xs93kgNG8l35R3e
	STK2L2IIPzfFJv8rD38tEwBxJBUpeupLRNqaB7BvhORFVM1IJqhC24Iv1tudf5HHBdBe7bD4WnWqU
	9XWtHzkyRbX4Ph3us1cFyFmE6PvIAdwqezu4IO/QDCAG9lWbAu1tbzu6xHEO8RremE64bMuebTKCO
	OyaoOaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlVv-00000001oru-35cb;
	Thu, 09 Jul 2026 09:57:51 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlVt-00000001ont-0fY2
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 09:57:50 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2caed617615so16275045ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 02:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591068; x=1784195868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHa+N6e2rl6wq1SgVHpliLB/r9n0zCkbXlX81Kt00W0=;
        b=G+qMTF9M9bk7Chc16x7g5mOLlfD6aOS15iOCY7cfB1E4RJgAUrT/xTwjE/Tjl0Q1NN
         2whaM+3l1PGoUhzB2YKRCfZL/tyP4YcJPRMIjoXjUNX+kTA12lfURf6y9kHhj8m7t1fN
         SEnchdjtDoVFlFv3JdyQmL3Vj5Jg3IvH9AHL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591068; x=1784195868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tHa+N6e2rl6wq1SgVHpliLB/r9n0zCkbXlX81Kt00W0=;
        b=iUl11ZPnAIOuWivVycZ3ToV/DcLA5p+2mfP+595J119elGGRrEtWj0OTXXMjeQjzIw
         0liPFUwgoTdaKSyddf17xqxylw5mH08/EAq9+DvYJWWQeNIPpt8J58yhLCMLq2P/VPp+
         Zr/Erhaf+Dyay+CJlkEZS/l6YX4X56omlDMvgvTc3l+zxfxiJUbWaHEd+TN2y+b8SAOC
         XWqg6xGfHarAbExgdUPABwSWJ6DMFQ0ZzYyWo49j/1cjrIQpkQEe8wCOi9k/i7AwQKbo
         jqcgfx3/TOJ+i6fK9WnbLeeLcoELrczou4ioeoeDRs/D57M9oF9DyQNMX2RwfcrexUhb
         Cwhg==
X-Forwarded-Encrypted: i=1; AHgh+RoVQycGnFA/fx2yTdoKPnsaMJah/y9+IL72IOJ1quQav/wRhEDoFNDqruYd5Ro9LuQqgWn9hCIxI86ky05msg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvEenU9PxU1fCIvrz6pRTM3LfsBpNOXBGwofDfk0hTxZAGypFm
	bC66AO6RyJ8uM3jk6XXwsFIJgqEMkOZXT0ug974lJ35b5QSO6lDCOh87bLId0a95zw==
X-Gm-Gg: AfdE7ckPqJxqxtafR8mAUFUt+Q4gshgARGS18mR0Cn5oMGheM4t4x/eI/yLZpH04ZsO
	IRu7KCdjIRW3ceWgiHgs5p0ZmnfCti2lb5yLcEs85ejAJjz3kT1JxWVe7o4bvV2tVbl8+uixmgN
	WXtkTvp/Iek9k23WPR19CQ8uD0I/KPbOuwd+wM/q6PUqil/2lBRKqeaOhFSVFbPVCPogTUDZqXC
	A9qAsRCl6fhtbpKj6yzdhcuii6MUulFEM3PJw8gVm/WamJK7mSdvr/lpNs+2FcFznAJQjP12lyW
	90vUuc7bmdQiedmI6HC689m7baHzEYblnufyZ4h9z59eoPlFgYZawbyoLmoVwtOt6WSQXaRBV1y
	/darnD4cZgkJT3Cnt8GE0aQlYdZPYq2EgltIZju5foETbAFnQ+rMvaILBbb8xzSx2C7nIzg8jWn
	Cdcjzo58W2+LgyIzIuYy98Hz5SF/ebB8XQGiUPXWcy1ARDiRVo4as1ZrLJ2P97CIGItJV2oUwsC
	16i+j/Z
X-Received: by 2002:a17:903:46cc:b0:2c9:e261:95c4 with SMTP id d9443c01a7336-2ccea464f02mr67670245ad.30.1783591068202;
        Thu, 09 Jul 2026 02:57:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:57:47 -0700 (PDT)
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
Subject: [PATCH v4 02/14] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Thu,  9 Jul 2026 17:57:07 +0800
Message-ID: <20260709095726.704448-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025749_214860_01B27645 
X-CRM114-Status: GOOD (  16.61  )
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
2.55.0.795.g602f6c329a-goog


