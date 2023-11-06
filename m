Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE102C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 07:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TcDuWNUOIOuer0lFNntQz5JyHyJ7HSMb+ZtixsDlkh8=; b=NRZPphH4zqwPWgmq3AT1umGGIQ
	05NrfIy+Xoxek3+TC2CE8H+B03z3R1XQjvO4jhOIUSNOS1PScnvp43TsnnmHeaFDftAjvgeO+/3/d
	laqCjRKDZyDLrhoVKTe11C7cHKfjeZdkG4mT/d4/EL7f12RGwgBaVmqvL26F2suJoimuayAWsI2cW
	cpQHzjfmJG1SpWReSzZRyGTb85cf3pb8aUXQgZwBHycAg7kAEftSfBrqmGV0oIOOhdDw21Yc6KsfX
	n32iD3etbQFWwvlS+d7Ehp29dtWaw+C/NO+6WsfAm1B1+zKYeCL7EjEo8IUHGgoIlm9ccvSUr1a6S
	josGWNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzuEB-00G1Tm-19;
	Mon, 06 Nov 2023 07:40:55 +0000
Received: from mgamail.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzuE8-00G1Rp-0r
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Nov 2023 07:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699256452; x=1730792452;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pCrnP5rHZmj4ISuVRVw65rZpqm5s3mY61ftuGZidaTY=;
  b=bKhrh2kp3qLkwIUwt2I7TUOvQclm+zJjA0uMKe9/UeXVxTpYWTS+MCpz
   u765SBBxIZgY5geShumSY0CLWvr0k4bYDWYtRzM7jCNLw95f/V7A2g+3I
   3f3UNaP7VeJD3gl/mU2vH+IVBL2fk+9jQ4nr95CnJqTAzybU7FqHfxh3S
   MM60TNQqTOI37Bl2Ct43CrLOMqUAAtVIkeHNFa5a+Gkekdbnx4u1DSy6u
   zTHWwa9gxpmrYbtX+SfW5ZpO/M6mi1pF50h0kQ0Q7gYLltwq1TcWSWRWx
   K9tpZsZxP4AM7rDJq1KaLdwIYwmtj7JWdFCHLZVtuD1LS9318yPlkEUMw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="386398688"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="386398688"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 23:40:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="797229586"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="797229586"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 23:40:34 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 429AA11F724;
	Mon,  6 Nov 2023 09:31:45 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-acpi@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
	linux-mediatek@lists.infradead.org,
	rafael@kernel.org
Subject: [RESEND PATCH v4 1/1] device property: Add fwnode_name_eq()
Date: Mon,  6 Nov 2023 09:31:41 +0200
Message-Id: <20231106073141.1250344-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231105_234052_319673_EF444C14 
X-CRM114-Status: GOOD (  13.17  )
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
'@' (besides NUL) is applied on also both ACPI and swnode. The function
is intended for comparing unit address-less node names on DT and firmware
or swnodes compliant with DT bindings.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
---
Hi Greg,

Could we merge this via the media tree?

Another patch (or rather a future version of it) there would need it:
<URL:https://lore.kernel.org/linux-media/20231030133247.11243-1-laurent.pinchart@ideasonboard.com/T/#m489b7e83cbc755815c5002f85454a76bfb41adb2>.

since v3:

- Use ptrdiff_t type for len.

 drivers/base/property.c  | 28 ++++++++++++++++++++++++++++
 include/linux/property.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 8667b13639d2..f20379c9a5c9 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -595,6 +595,34 @@ const char *fwnode_get_name_prefix(const struct fwnode_handle *fwnode)
 	return fwnode_call_ptr_op(fwnode, get_name_prefix);
 }
 
+/**
+ * fwnode_name_eq - Return true if node name is equal
+ * @fwnode: The firmware node
+ * @name: The name to which to compare the node name
+ *
+ * Compare the name provided as an argument to the name of the node, stopping
+ * the comparison at either NUL or '@' character, whichever comes first. This
+ * function is generally used for comparing node names while ignoring the
+ * possible unit address of the node.
+ *
+ * Return: true if the node name matches with the name provided in the @name
+ * argument, false otherwise.
+ */
+bool fwnode_name_eq(const struct fwnode_handle *fwnode, const char *name)
+{
+	const char *node_name;
+	ptrdiff_t len;
+
+	node_name = fwnode_get_name(fwnode);
+	if (!node_name)
+		return false;
+
+	len = strchrnul(node_name, '@') - node_name;
+
+	return str_has_prefix(node_name, name) == len;
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


