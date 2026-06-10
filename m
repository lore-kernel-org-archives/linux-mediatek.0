Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C53CD98CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 08:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRsKkRuXXrcRjbvRngvMO9bdz13WA7D5wKB/6fXyEG0=; b=IHQfB/OLJYUPknnxYXmeqQdQEN
	SFZr+31UTVGCu2w16JUiafjdjIMsOUqhobe/apz9oxu/2IftNvMESXoxcvzgbHRGt1ua25U1gHaEt
	IWeYmiG8L5nLcVlv4hbW23AU3oNLaUAD9frOf7RRYoYKI/NRJHuDlrKO2nvrRuFbeguJCsbHMO5bU
	bvbohuxdnaVMNYAKAmPSSOVuwpq9ZdDMbkCKVJFjyp6JW4S+vorWkDDaRa1w/j4k2Od6syft90BhN
	KuiVvuQqVh77D2BmBwsW+7SBDVS5bXhczm2gIW1EOYuGuOCr/dPT+EyJFGRCX8QusCH0Tu5IW7/6b
	0RZldOMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEV5-000000075QX-1Mde;
	Wed, 10 Jun 2026 08:41:27 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEV2-000000075OK-0mif
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 08:41:25 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso58420365ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 01:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080883; x=1781685683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRsKkRuXXrcRjbvRngvMO9bdz13WA7D5wKB/6fXyEG0=;
        b=KYkI7wddP4W7WZJtOWxZhqIWll6+QeZvz4CagO3rZ3bEka8h7VTEfkCo+Br50h0zMl
         NsLe6ZJkn7BRsdab9LqC0STaybu06ckREytldqbk7kl1Kls66oJv1ytXeXSgfsRoAAyP
         ehtKTKpu4aZrTNu23tHkBvDmbPMdS0ThZOZG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080883; x=1781685683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FRsKkRuXXrcRjbvRngvMO9bdz13WA7D5wKB/6fXyEG0=;
        b=EVl7dSSjhnWpHqoEeAT1mNgxKF4r+3tzbhYMfvdauk9VLHzqZZAf4r2hTgkhpfOdyl
         YG6s28G14Kclb5hP4sKDuRDk9xe8R9sG5UvHtaAZWm9hcTU1z0ZDd+dzWfIr27beG5bP
         TKS7Dn2FDx5zGF5mirQd1SWLQFeOQmdxHa9ATlMOBTVIcuNbNoqkmt+HaLcW2ZN06KAJ
         Zq+CDZLohSgrQR0XrxQ3x8bYepB62B5sLoYmMZrecGx2vHPIj6fWq8fGt4iblcVDX7hD
         Grf8pBfdqE70zwSGod8gBnCz+WF85f4w7XPIQHvDBcONaknFqH2s8WgzbwI+zELceoSs
         14Uw==
X-Forwarded-Encrypted: i=1; AFNElJ+YMjGuY8HDLY3vD21fbylvd5fHhN9GaSeKaNfH0xP2DtVXPdztFD3cK5py8w6Nu1XTD0AR0Ydva5uAsmRPxg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywia37BgfZbO+s+7qcSerC/0r29H7uskTFRGBrDfgiumRVhBpha
	HPfkCdrNyG+Hf4oByhwlXfmiU0dxhhQs8vghMucqNxAf4SxUwOJ8+t81t4xaScCwDQ==
X-Gm-Gg: Acq92OFYvYrcyW1yW5Iv/Ew/SueUystM0mrqxCMJ1jyVHqv0A525cGEUSHmC5qWofup
	R1uYw7qjthJ7JJzeqNN3G0pzdwO2ikXGwK3kj6hCDKVR+JX28yrAEWirqFXVOxAvd6KWoolafpU
	iGV7nRA4U4noep7qwY0q4NiKgLxej5ZmFW/E104SMsAsfc5F++LIuZ2Lpt/wR7HEkwlKnw39uT3
	cvI84nw+FndB+JPGUPac7IAXwscKALm2FSFGQzggK5NiIEob+p8zMhyn6glAFd2q9Gw9o97JYbA
	XOE4RfdK6kubWKcmQmHEjtn69u6ijgTnHhdAs9/RJhALuJkTk8BHVrgCDvWJPnvognvfsziV0UQ
	VFhQBTGmeKy3jZrYmO4D3ekqhFSiHNgslTBEiGnoageGcWbvsNPoNYyW1AmcJeOsapeuABiB7cw
	CbkmVNuGL0SNLJOl3nFGrvo1ELa5izmoB/DfrkgOUpm1/+Ly1jRvVgV6T669jY1hI75XdSuWL3U
	iL1XY//Za05Ik2pVg==
X-Received: by 2002:a17:903:3b8b:b0:2bf:114b:924 with SMTP id d9443c01a7336-2c1e85ca6b6mr285765545ad.34.1781080883374;
        Wed, 10 Jun 2026 01:41:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:23 -0700 (PDT)
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
Subject: [PATCH v2 01/16] device property: Add fwnode_graph_get_port_by_id()
Date: Wed, 10 Jun 2026 16:40:35 +0800
Message-ID: <20260610084053.2059858-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014124_230654_7B5DFF3F 
X-CRM114-Status: GOOD (  13.92  )
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/base/property.c  | 22 ++++++++++++++++++++++
 include/linux/property.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 9387bb83eb54..a2afd854a604 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1346,6 +1346,28 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL(fwnode_graph_parse_endpoint);
 
+/**
+ * fwnode_graph_get_port_by_id - get the port matching a given id
+ * @fwnode: parent fwnode_handle containing the graph
+ * @id: id of the port
+ *
+ * Return: A 'port' firmware node pointer with refcount incremented.
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer.
+ */
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id)
+{
+	struct fwnode_handle *ep;
+
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, id, 0, FWNODE_GRAPH_ENDPOINT_NEXT);
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
index e30ef23a9af3..11f3b54c7de0 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -499,6 +499,7 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.54.0.1099.g489fc7bff1-goog


