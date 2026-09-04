Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B91CC79F83
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRetEA2OXFI4SKJH2CBFzorRJvZCDQyI99zumpuCSb8=; b=eR+bdBiTG83i7P81UUFzSmZ45d
	hRibUozsmdse8+BHpvtrp/R8BCyJxraEgTA0meGceCe6yE8MgpsVONzfktEeralZ06ytPoTIW0vZC
	cSB6tKn0lEEPddmz3FP8D7Bcn73t21WbbZPOjKAp2XhfS2PhTP3rSBBPVi6qH67f6UpEohoXHP5CI
	Ubru//iDbdlcOUuI1P3PqRw+9fKQp0UZKBSmn8Jr3ng/r0GSv+bnzC8IpQEtiNscgNr07qa8JEvy4
	UgwKwGr9/iDQPBlJnqSnY+ELnMaI5dcAa+Ih/zn8dlQwLevdQRoN+bfqOKFeZBHMlfKNBluba+5ac
	LH6YBBFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PV7-00000001PSz-14qt;
	Fri, 04 Sep 2026 08:42:21 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PV4-00000001PQm-0jEA
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 08:42:19 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso6557085ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 01:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511337; x=1789116137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WRetEA2OXFI4SKJH2CBFzorRJvZCDQyI99zumpuCSb8=;
        b=MGLKkfqRpNMmqWhEcLcqL2DrrjQCU0mYjpgozUCOiLAV/eoPS18hevzJq0/xU9nZpS
         L9DZgIbqklJ7CUsYGB/taO/vTMchma1qFMOWX6Y5WYnS7FDCcsfwpRj6GRL8eVVPZaz7
         nq2CbUxHXSjJvLJROrScuKAigZBOkfPPr16c0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511337; x=1789116137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WRetEA2OXFI4SKJH2CBFzorRJvZCDQyI99zumpuCSb8=;
        b=Hu4vaUWgiVSbfPXvjSLUELjffQoLOVRCZBjb05HitUco3SHcWkJqhPQzFTuBK3kSKM
         L4LECONAQVpyXNTRJL6Ykv/gmdsfTGHvTnVGb9yNo4Y5cVxXGXc+QagIRWqIZVAHuBp8
         YkaAQh9XRTyXMr8qiDzb4mouoJQmCxp3od+xG4CEuus/r832u6yGHaZvVOOYCipdFSiF
         UJqCGpW6Y302PNvZ8PHxixm+H5GyHP/O5E6EnJk8vRwf7AM2FX7EDT4avd1EGtXZ3wwk
         xtyCnvV2ekcm8/Cqle2nTY+Ap4OCYXGKJLbIu+Ctkx7NtcetRqgblP+8mt5EKARHfrw+
         tcpw==
X-Forwarded-Encrypted: i=1; AKwUvBz9uEKtM0yuothRB9ExrqG2ETuh8BrMcbFU7uzbo6ftttyZ8cSHxqgSMUaZ/r4lwxf11WzTM60pqCyxPZu7UQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lopsDiLqx1czluKnGLfRPQItXV7Bkj2mrpFtmog/vZnMdVt9BC
	eF9nWo+dSqfqrtuca32Twu3zBuvx5xpLeB7cyhmXmzI0oB1KR0Qm3HfF/g4CBuHm4w==
X-Gm-Gg: AYBFou0eehPA9cq17oDXGrv3HkdDUwDMUdUrmgp14Ou+0WBZMBX3k2Qo80Z1/lmhCXI
	B0D/YjJAfU2qALKUxoFrUuWcA9RMJo60xqXhWGZ9m5vI9XnrJpZKBWbm1VxUtfZRPEVKYOrT+7w
	NZERN5afMiPA88X4ya+15xRLDRM+6fMeOaG82rEGvBi5b4N1Kpw2a+iZrArSR49NdSUFmaprw8I
	89CgBdjSKdWlkgwZb+Qkbsjy8vTCIliRHIcNR7LLSY5nPCUYHDmlbyqlrwkm1hszvfRVc1ZmXjS
	SIFJ9625Jm8w4L1+7Vyxs/OmWuaDL8PNVyoWnFTQBksrtU2d2jo60Joi3sLyGX14B/RklPGisxS
	baLABJtWhDzUozWiBONhxOMal4P/iFi55IEQxsePP+cnHHv5TdkL5C0gqDIrgrSOs2xuhlTbedz
	p9l6Zif2takNHmRXIaMJQNDsBOJ6LoIgKoXQNOetKGxZE5ZpQWSz1BTy2SuwNDbZwuCixHbj/R6
	Bam6N2B/HEQG64y1mSqYHwj7FoEsNANti8xOU2p+6yT
X-Received: by 2002:a17:90b:314e:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-39b261500fdmr6024537a91.4.1788511335746;
        Fri, 04 Sep 2026 01:42:15 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:15 -0700 (PDT)
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
Subject: [PATCH v8 01/16] device property: Add fwnode_graph_get_port_by_id()
Date: Fri,  4 Sep 2026 16:41:40 +0800
Message-ID: <20260904084158.1341550-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014218_218345_37ED3F99 
X-CRM114-Status: GOOD (  15.00  )
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
Changes since v7:
- Mention in kernel-doc that the function does not return ports that
  have no endpoints (Sakari)

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
 drivers/base/property.c  | 31 +++++++++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index b136c339ddae..68108805482d 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1353,6 +1353,37 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
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
+ * Does not return ports that have no endpoints.
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
index 907c790a3f01..3dbbd01a52d0 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -507,6 +507,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
+						  unsigned long flags);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.979.g7e5102b832-goog


