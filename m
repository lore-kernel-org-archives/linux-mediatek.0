Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD508C88E5C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 07:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27brx5O9Ivpq2x+qbJykPxVf6DAdKCDChl3K9VtBSIY=; b=tVM+YkZqgmxugzPSpeje8dwA5k
	m0fLaeHKKg/55mn9LAm7P3qgHuvmgnFlUQFgLTQi49pHIgodszh459bXrmUOA6bf6IBaccY4ugTuj
	sRGspxWIBSdi85hjhBFlCT4W5foOYE1EYtIA6ztGbRKFUFSg67HRijfOrvKhCSB0u9oL29a+NZAGq
	IyHpP04WsYeYnNtswOday+iHmC/IevBqNlj+wDviw6CRjmyJpLQfB/klaW71zSyeDE8q6prDehOmz
	TJS7Cem0/MDADxZRuDilMIwt8CVPRvjj6vm0AoHuP+FbxSQYW7QcKSdfvqkCkFrEgvOYWHt43lH2B
	Ub+H4ZFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXL-00000008dpe-1i7N;
	Wed, 16 Sep 2026 07:58:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXK-00000008do8-1Nt7
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=27brx5O9Ivpq2x+qbJykPxVf6DAdKCDChl3K9VtBSIY=; b=imq24byM73DU/dHgVzgIL0kI2y
	lRsiZPQIgX2SXqvFXZj2J3bqrWf/AnwLbFElfkcrdpALVi+TbgRZWJbXCZnpCX1VvMhi2XIepcRYd
	TesF5IjBKktly9cQqNzjFYG4OzUvNVw4KBOEH0UKCO1oMvAdHrdAdci2x8EbFmnGqT46kx3YFymxL
	FUTodDrH36UGIjIzLIOnGlzDm6PglCFIPGdoa4tJOQuW4ZHPVM0q3waYrITf0CIyLb2lq43rg2rq0
	2mmahliO5bASXEDQtNnNQgprOOBeApP9pfAEj4sCFohinnSEP6i2nAftzazzXFkDBrglD9ClksxSm
	djWR5nQw==;
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kXF-00000007bU2-10nB
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 07:58:33 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-398a1676000so460471a91.2
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 00:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545507; x=1790150307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27brx5O9Ivpq2x+qbJykPxVf6DAdKCDChl3K9VtBSIY=;
        b=IJf4IoEFDjIF/becF3cWVVDrT6QMVIpvY7elbhaigPSnp1vgjJxA5hpo7wxB9AgOIj
         2yNUIf+Mpc7EP6hG2+lrLsB+OWqVQTnDJ0hujZDp9zbJ4R0Ig/f2DET7FMscOh95hy05
         6OjplsOjxEssOBMt2Jwqsv3x6zSXHNALcy+PI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545507; x=1790150307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=27brx5O9Ivpq2x+qbJykPxVf6DAdKCDChl3K9VtBSIY=;
        b=bIptrgiNgjfawTEyxQEHE+RYTqreXew2CvaGvv8EhUewmeCeI7IOzk9mCEnWIXsW46
         cyU4FdgkDBUJ+CtTvG/6SBZGsa7M7RK3G0WKgvdb245RClB8mE8sgUAqpDajEVgtngTO
         YezdsOEfUVphj7Ux15VWSbY6N66xHnMKG7vWA/tHyaYk5ABEiBZh6HMffEi9XZQNr0Dz
         7u+QveSNFDvv/79lx0EeUxgbGdKk3GgMVOmemOGOP89MkhOmTMZoYVHvRXzd2xgbNOMh
         pgiatRnMVHADAHjQiv5d8X37rParLLsNzI1UAflomzZ5oax9SfOscyQs8MtbxRn+FiP0
         evyw==
X-Forwarded-Encrypted: i=1; AKwUvBzE7WUFhFjKKNeFbkYgwbgQyymYK8Pby1+pEzNUpAQR7o3eUVLv9ZwhU1urbRr/pEL0ForsRdiVH9NkrnbgZw==@lists.infradead.org
X-Gm-Message-State: AFuF++kzJj/Ll/w7BomdPUa7NddLkhXMxrLxbTj17Z7OwJdg+g8HCSqc
	H1VfwaHTa7NdRgkwGE1xxKfkk4hhf4vMko2xHtG8pZXXmFAds+AxR82/am+g6Jv/mg==
X-Gm-Gg: AYBFou2Sqw5sdZL4UTrJiyESXDZMsh2J26TkUpikyIfglquYzNGrHiitk3KkeWPvcdK
	dbG5g67YO278GRN16ikCUFeWR5q/DmjWaQvjT+/g3EwH/ZwfwhdDV46npZejdcUChRlC3o6fLC+
	J67HtjeQBrQ/vvX4zAjd252XbNqHexR1XRsv2uvGE6zXWhyBIXUFTT3jRK5+zIupsw7E1gzVEI4
	qtj8krAG3iL4pARHfWuVbIiOMKgxnLReVkVsnHarYdOfTqko9BSNlzUK4K41pjPEu/m2r4cXvNU
	XQvSOIm6oDyBZ1LFP7edXC7MSaN2USmlBPTN57RtyB0wZIhPq76FhLa3yaCFfwwLHnFjUkEmtbo
	UhnKGo5WebEJoKEaGFNC6WI2OY4aK3EZARoRyq0d23DD8a3pGsRk8Bq7NCpwShU8QMy6qu0gfO6
	ckoOtpK2pb3ycPAOzKR9gLgvpmDDXbImhJ6I5Fxin/4siaEbWgO/RBerhsHmJt6LOPJqGkOS0SW
	zV35APpvPf5T8C0+fv2i1YIiXgkCWJqXCa6uiNtrBHKIMmkKAbkNg5FPA==
X-Received: by 2002:a17:90b:6cf:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39e1e329409mr4159709a91.10.1789545507055;
        Wed, 16 Sep 2026 00:58:27 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:26 -0700 (PDT)
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
Subject: [PATCH v9 01/15] device property: Add fwnode_graph_get_port_by_id()
Date: Wed, 16 Sep 2026 15:57:27 +0800
Message-ID: <20260916075745.3549953-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085829_669295_C33E795A 
X-CRM114-Status: GOOD (  15.20  )
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
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v8:
- Collected Reviewed-by from Sakari

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
index 51109794d727..c2b7a571fe03 100644
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
2.55.0.1032.g73a4cd73de-goog


