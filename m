Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B81C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 13:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m5gOn02Lc/i0LVITmAI4YmXe3cxuXnMyY/JiI4oqtd8=; b=dN4plxxye0QScWgi8ayJnRMV8K
	fwKgCAtvhnu8m8ty0I6PsPZ445kE8AVN4sxCYStbeFjjgL2b+4c68zfT6hi1rRtQWrAoD617DCfH3
	ADfaT32VMVAciG7bsUotc55gZIq2xpKxE7Ri99wVumiTmBHnst1aABjNYNXn9mOLy7Y/UT6FtKS/h
	eWM0eAaqpKrxsUg+KamYY5U+xk4fnIU/XxQaOm4oYtCoc7f8jejGhaxquClFiPPjoWr3GyGVjg5CO
	fWmlg9YlNCQZrjPbBV05fbzZQ90A9Wa05kCUJSDbeUJBBe6Axlvhxtwb5rtx/uS7B40qIcAHoUEYl
	XjWJ2xmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpBL-005Mto-2K;
	Tue, 31 Oct 2023 13:53:23 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpBJ-005Msj-2A
	for linux-mediatek@lists.infradead.org;
	Tue, 31 Oct 2023 13:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698760401; x=1730296401;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=X/i4S/9orkQqiJyi2sqfUdDq01hHe9T+DtVbyK1ctSI=;
  b=KtooyJjwwST9Uk5XjJNHTWgv56gNB0ixm8M+cSNTYmtOPBzOpVMQlBOX
   SzC1PGwPRcQpHlQpi7XQJzGxiJWxJ5Vd4pptZzZwW+tI/DxkggIeJQksb
   TE2cYX14Ghml2oP1g/7NEJ93IBJJa4Ip3gVnXYO4dvHGoUCxK0k2rUj4o
   6pGHS0jT/29/bkFfEiFK/W8xBsms7gEq90W0+5cYEHCe7+Hj+vGml+Ytd
   Yg5kO9byFXeHmcrmVKe67IjReifgcuOLlg/g7ziPmPVR98wc375RM+UHd
   aQrL+squq+08/2GR10U/CMueD3URIDYbZIwmcFjz4w1f7oo0YfB5TEH24
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="391159544"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="391159544"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 06:53:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="754144904"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="754144904"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 06:53:12 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2D9CF12033A;
	Tue, 31 Oct 2023 15:53:06 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-acpi@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/1] device property: Add fwnode_name_eq()
Date: Tue, 31 Oct 2023 15:53:06 +0200
Message-Id: <20231031135306.1106640-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_065321_775413_0F22A8FA 
X-CRM114-Status: GOOD (  13.81  )
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

Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
on fwnode property API. The same convention of ending the comparison at
'@' (besides '\0') is applied on also both ACPI and swnode. The function
is intended for comparing unit address-less node names on DT and firmware
or swnodes compliant with DT bindings.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi Laurent,

Would you be able to use this to replace of_node_name_eq()?

It's fully untested.

I didn't add an op for it as it rather looks like all the implentations
would be the same (but with different container struct).

 drivers/base/property.c  | 28 ++++++++++++++++++++++++++++
 include/linux/property.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 8c40abed7852..766ac3fc8cc5 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -594,6 +594,34 @@ const char *fwnode_get_name_prefix(const struct fwnode_handle *fwnode)
 	return fwnode_call_ptr_op(fwnode, get_name_prefix);
 }
 
+/**
+ * fwnode_name_eq - Return true if node name is equal
+ * @fwnode The firmware node
+ * @name: The name to which to compare the node name
+ *
+ * Compare the name provided as an argument to the name of the node, stopping
+ * the comparison to either '\0' or '@' character, whichever comes first. This
+ * function is generally used for comparing node names while ignoring the
+ * possible unit address of the node.
+ *
+ * Return: true if the node name matches with the name provided in the @name
+ * argument, false otherwise.
+ */
+bool fwnode_name_eq(const struct fwnode_handle *fwnode, const char *name)
+{
+	const char *node_name;
+	unsigned int len;
+
+	node_name = fwnode_get_name(fwnode);
+	if (!node_name)
+		return false;
+
+	len = strchrnul(node_name, '@') - node_name;
+
+	return strlen(name) == len && !strncmp(node_name, name, len);
+}
+EXPORT_SYMBOL_GPL(fwnode_name_eq);
+
 /**
  * fwnode_get_parent - Return parent firwmare node
  * @fwnode: Firmware whose parent is retrieved
diff --git a/include/linux/property.h b/include/linux/property.h
index 083a1f41364b..096ade186601 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -108,6 +108,7 @@ struct fwnode_handle *fwnode_find_reference(const struct fwnode_handle *fwnode,
 
 const char *fwnode_get_name(const struct fwnode_handle *fwnode);
 const char *fwnode_get_name_prefix(const struct fwnode_handle *fwnode);
+bool fwnode_name_eq(const struct fwnode_handle *fwnode, const char *name);
 
 struct fwnode_handle *fwnode_get_parent(const struct fwnode_handle *fwnode);
 struct fwnode_handle *fwnode_get_next_parent(struct fwnode_handle *fwnode);
-- 
2.39.2


