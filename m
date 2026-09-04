Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681E9C79F83
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pQBHHD4SDVq3Y8lclcFUxJTow0FC5oCzcVfD5O1aqE=; b=egq/FFWMiBLF9iaF4eda7HP2Mk
	2S5Zsb7KUvVjYpQEssVMXFPOMaC3bOjqOLjc551qLyoXuw848WdM9QUj5nhoEjJWKtJL/3O/kuEtG
	nRJi6eomSHe1QdmhSwKqjKbT6+MhMENJY5QoIk/NCRT2r6wJEN/NJkBappHkE2BnAhZeIzrpcFcTy
	SKAw1qZYUhLnE0W+lkBP3yDt/nWmY5GcVJ7rN8Q/rGWi6u1fVYXXDRO2toM9NW6Hj56Ogbl8/KUSl
	24onAdclQ5UBFDboVOcdkxnUl7DT0qJRQU2MkpZUT+jbtDFwm1pOASowlrHkQ1VZHw+EdXYkYtcp7
	4feObpFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PVA-00000001PVj-1Roz;
	Fri, 04 Sep 2026 08:42:24 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PV8-00000001PTV-0pSJ
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 08:42:23 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso970246a91.1
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 01:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511341; x=1789116141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pQBHHD4SDVq3Y8lclcFUxJTow0FC5oCzcVfD5O1aqE=;
        b=mZhs38QokB2QdakyBpWbjvjHVqGnQSILOLP7KrzOqbZxFFNh9RcsDHQS3p3rm66EOC
         abqE2SjzHMS4/gZtLTbcDK2lTu/5ZHR4pxYMhrqKB5pShPfO1mNXdBDueMa1BwVb1Xvs
         s25dkalMjxwCZVL2fxWgHKWRnvJr/Y+rGN/aM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511341; x=1789116141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3pQBHHD4SDVq3Y8lclcFUxJTow0FC5oCzcVfD5O1aqE=;
        b=U8D+o2jluctfwe69vd5iL/y74fh866bzQ6CwwxNV3SW2q1dwfHMLjoXap+7FRkwEh4
         +neopS8H8OT0yZcU/jq1dLcgL9Q0LvyjWmGkOO7Wl5neKNSoIksVXavUzaD5MUFTU8B8
         dRn+DuYHgTtqzwpR6FFv5+uPuzhQ+5Gfi2/Bl2muiqh4odGa18tk/2NhMHTAZ24U66U/
         V1UF1GrBoOuMLIr81rd6NajNrn/moDJB4wFIgNKp4Ke0gFp7aEzqAdOTBkOwb5wStzSL
         Z90+5b6TGJIAg23K6IkYzb1Hupb2i6VsYam8oFmMj9Z1016qRzyQNcBJvUveruMaarO/
         gSqg==
X-Forwarded-Encrypted: i=1; AKwUvBz1AP52Vbcr2aOTHsdmA0Zn5k8pRjciBkWvR7g0WdtYJ1P8OsGpG6drn1ctltuNIBH4Co6L7l5xO8NQXbjM9Q==@lists.infradead.org
X-Gm-Message-State: AFuF++mZ6c/HoE1php6Wg2bhwdoY5JImNUnDSZELvKty5pco0qZaQYDJ
	ij4YjdUGpTui3CuQPfGTVDE+Q04Le/t806GqN/NB8PsdhRph2dBkUCx14EaRFmOVPA==
X-Gm-Gg: AYBFou31vxy0jNaDQFf4UhasDVux2Yacnlfm38+b6aFKBltoyVka37CA9r92/j+GwI5
	Q0GQNK/fHn4sV4UdfrivvzU1W2q8PhqGKObhcJn9gdxWESPgpF/YfpPzUblfMF+QUwInxPnCxAj
	NcEnYTiB9uWfd16kkm21PGtcHyevEut+zDHhMKa7azdA4IFtXEfCmfZeLIhdyIqp+BmZkSIX7eP
	fTUaDSbOf8cZTsnRc8Z3P0RtGIbvgeNHJm7JH5FI21j5QpFrFWRSfdlDCtIinitB/DNvxOygK9l
	traoqiHpd/qWdliQ29QtfXP+DoKsZB4M/vPN7fozWUsc4NtxdbYI0R1x2M7vyl/8a1Z9TwG05bV
	4wtbJVsLfL33gm0oXC9clUY4CuDrFbBiSvLDWbS8y8O2h8PmYlQA1FeoVfNs06pKOwmz2xHKakI
	PprD8nCeufZ4tCXQkYaW7z545Ocb5z+dBlEZDxgsfYjmNcISGCnJkC7cUTc24RtYr4QwHmXn2Dm
	aSz48nXLx72hieb64FRKLvU8zXmuJBCtaXv7HroiWhP
X-Received: by 2002:a17:90b:5343:b0:398:e46e:ade3 with SMTP id 98e67ed59e1d1-39b2628fc1amr8001002a91.23.1788511341225;
        Fri, 04 Sep 2026 01:42:21 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:20 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Subject: [PATCH v8 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Fri,  4 Sep 2026 16:41:41 +0800
Message-ID: <20260904084158.1341550-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014222_299506_0CA99E05 
X-CRM114-Status: GOOD (  18.12  )
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
index 68108805482d..fe7c403e3fa9 100644
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
2.55.0.979.g7e5102b832-goog


