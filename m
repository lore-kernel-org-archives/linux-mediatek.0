Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9184C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 09:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZ53TpctVBGf+9janmV3YEfLWaus5++lNyVuWbfltaU=; b=Krh0p+tfAqaV08W60X/4qh5Qkm
	BvNF+LjbmKUo1PbzFY0VTQ4FxxADkRiDsqqEPYLPbMDW3Q8pj2OCPM7blUmiwN5SOE9Caogf7v6SU
	/Y/f+CvKCVlT8k0feXtOJFTQHVy/3JEN3wvdc6EkAq157Vn6tMdN9qNDwpkocvz+hVmxRviirluEH
	ykM01rQX1VWPUAaM8lVA6YaxkzvOSrxG3DjDQ5ow41csemrVWkJp7dAM1wZGpU2crMB9+kYwxsvFo
	IKLpIZVZVSGK1O4LTetcXmSwsc1+Nq6Us48OrLVNQOu22JWx8x+b8em40oQ4xpXg2+M24vRpN0g3Y
	XL8rIcQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlVu-00000001opq-1X3h;
	Thu, 09 Jul 2026 09:57:50 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlVo-00000001ojy-1PcS
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 09:57:47 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso10055865ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 02:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591063; x=1784195863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZ53TpctVBGf+9janmV3YEfLWaus5++lNyVuWbfltaU=;
        b=gpJW4fJ/7NSsWOJcP1b0yBOeIiF3TFT50fsHALTXn10WKNPRkgG5u2vdANBnDAo4nt
         F+9LwhGGRoMQcV5FqDdf+SFJpmwvfozBtkRrdSIuLQKRmfxDwh5G013s2SYlubiRYmIw
         BbQ8MVYRWEcbTbgVrIZl0iOquTnQe9Rtzx/KU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591063; x=1784195863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZ53TpctVBGf+9janmV3YEfLWaus5++lNyVuWbfltaU=;
        b=jSc+wK/wYwXJNwBgRfk/lq65sjb5s2ijT+3caOfWhFTJJFwBnSgv4sWG+CuQo2gzG/
         zEZzoZgxv7meOveZSx8/ppc28tMGjKoM0f2flYoQBP3dleKQGM/5lgnDoewgfiTDdwqM
         KhRNVk8VnbiMZ+UteRrMAlV2wsnAWbCXLe0P5FVlU1SR6OFyU7hgU+JpewV1/42NVG9j
         UO+qmGUAgZM3L0Jm20NjUvUHPFXYqumyeoLe0YAj3Vch3js33LEdkfP+/vfGanMQMu1q
         MKxs0gtn+Z53BPiPVkNOseVtWaDShuDCsNF8xcndYiDNcSnsnULv/Oz/yLmhx3jamd80
         /g8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrgytzCXIQKbqIZhHag8OtRpxG0pCsUgumMVy/9y5WE2GndtCx9w015mUw8Ogw8bCUxEtZ4b6rOAl1skbxlAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFB5CWJCUATCTkRa1ffYNewEfuQuuq0EabzX5l4xb50BRUQLES
	+kUJhX46j5fSXJxfQ/aLGImivlrNQYlay73alCDMr4LI9IkZAVWZeS11qyPPVJpr+g==
X-Gm-Gg: AfdE7cm+3BR7+wb4cS9sU3xgs7UvM2fw8CH2mZ2m2G6Tb0g3QJnnRmvkTh+UuFmKrD7
	dAPNa4wr07qJ4lAcKv4YSlr1BV4Zc2IwtxKTs5uFtcacXsg7Ac8OAZaiP+I7SeHfD3Xmo1wU6Qf
	sVN07O06GBsKowZUzOcelAwibwBDW4U3V0dQAOWTHgOf1+hD25dzwbIQ9jYpp9Xqnl65Kzj/Tzv
	RN3HaUtdPto36zSs9zHOi7zXdoi3TQ6RhW2RZL8o3WSe5bVDRbJgVivtbm0MyGp/nxzpEIHlkYn
	il6BTLEwlZDNzCPqh7PACPD2UusqMkEh+Quug2szfaU+871S4Kn5LoZkIqv+v+cD2qNBH22RLU4
	0gFuMUOR6McQ9Flh5Y3bjlku3o33S8Njxqh1lhy2u8DkRdFNM1u1mM4gB6v215J/c23IUCvIfJC
	jT1jkXaAYEEG1p/8Zb10SQDBXb48ilOU/AkokSczhfl3nYKqHKUNTJeTT2ZPykVQPixiGj9Q==
X-Received: by 2002:a17:902:f68f:b0:2ca:c411:78a with SMTP id d9443c01a7336-2ccea371ddamr71754425ad.3.1783591063427;
        Thu, 09 Jul 2026 02:57:43 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:57:42 -0700 (PDT)
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
Subject: [PATCH v4 01/14] device property: Add fwnode_graph_get_port_by_id()
Date: Thu,  9 Jul 2026 17:57:06 +0800
Message-ID: <20260709095726.704448-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025744_412338_E9DCD084 
X-CRM114-Status: GOOD (  14.14  )
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
Changes since v2:
- Moved "Return:" kernel-doc section to the end. (Andy)

Changes since v1:
- New patch
---
 drivers/base/property.c  | 22 ++++++++++++++++++++++
 include/linux/property.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 9387bb83eb54..3e3e19ef66a9 100644
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
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer.
+ *
+ * Return: A 'port' firmware node pointer with refcount incremented.
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
index 14c304db4664..e04901c0bd8f 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -505,6 +505,7 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.795.g602f6c329a-goog


