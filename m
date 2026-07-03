Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1205FC43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E742RWSqyUpjpy+ZFSeaNRHKuAVV+n7jX1SAgxgLen0=; b=UxV+zxOkwgbX4/B0NGRpvSKWUz
	9gtN+dmvN7VHR/8kWBAfRZi5uEJGaSG5y3Ouuw486scYeggM770s3oy506aaAd+GNAzxjmCp5UEDR
	qWep2fW5Jpd7CuPjdxCDfw/8ZpkNGy2a0+evJZU+7l/z4Dc1vshrbgGQkiomEof9VfxvXjb7an39m
	N+e4Q0TZY9jmGRWE6pOxB40i1gH9opQHTva22bJUV6pW7DhIfW8hlaYaI1KLc3IMQM3L6ERc6XhM/
	Uhm6n1ht51tqfIHQyZT8fKYLQFFu03Q7tCR5mGO9QKpilvqu9kIWDFQzigr1tqezlo+T17FIlaAg+
	+Uc6ll2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgQ-00000006kyl-2f5B;
	Fri, 03 Jul 2026 11:03:46 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgM-00000006kue-3c74
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:03:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2caa57a41cdso4413285ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076622; x=1783681422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E742RWSqyUpjpy+ZFSeaNRHKuAVV+n7jX1SAgxgLen0=;
        b=IdFMwnsj8Z24A+vDn6inz5woTUpu9iW8iv/rBRYUhXZu/+nBa79+GHk3LEENTmcvn5
         XL9JGMIMOkMwWTGDUx5QyzC83cesdOJ31dDQVMzbNB5RMC2jwV0+pyIrOwcilYGSd65J
         VDIDAO4g7jD0fttPdMQURdSl/vLPP5TODd0xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076622; x=1783681422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E742RWSqyUpjpy+ZFSeaNRHKuAVV+n7jX1SAgxgLen0=;
        b=Zi9XehJLELEhs5Lv3s5z7UHiCC2fDKhS4Zy/jntVpyMOrYdMUs+nsMhVcQYlzFy7i+
         iE5Cw9PkaOK1E6Rh6pFcQx36Z32stS+tJcRYFqu0piFwf27W9Wzf782/ME0cdW/8aNpu
         apAk5eoQfzlBjGFNxuHHJU/yU5MuW42i0cZKFUsaBb5+aWsPiZj9KAxBsYgMi1ZK45BL
         QT2np4Rc3yYazRLSi5kZEMmElSTbgDG9wJGU8KkPgrwRt2Q0KFO2i33SE+Q09UcrkwHu
         YdhcOXITZIqN/y8QW5Ho4Sa4MxcCvbuSGezhDLljKy/PWHwP2Rhg7cWturb5YAW1Mya5
         ck6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpSIIxBPKlD9q0wsghgw8TWRF0G1/dIcp8mHSNoMeARiW0aLHCRBixbKtCvXZaJ6udwQ/46zCFXuwJPMrPFCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1x41n6Vw42EyAcu9USpSUIG4wYVNvCTXsmAPwufp9l+jJrnpC
	OWitNami93kmCVE8hhwVipKpqzcspKbwKN9oOAnz9zR3hvJqypiapu2ajpZ0l6joyA==
X-Gm-Gg: AfdE7cl9X4hf571iLEtVwqYI6Id7Xp+5wE8AKQ7JP001ox7vA26L9tHU8REPGKlbha8
	Gemzaq4eru40o0//OzljhsCk8VKasWK3yQ3tOumz9Ea1fBFgRg/uJv2MTIp8jiL4e9SFJwAk37x
	U+J+MUkw/+f0UfDjeJ+jsiFF32JyI1QEvUopVpGF2ZhRRjqFszQRekKZ5Vhuer9YdJJswtoVPWK
	pN3nfhQzAZCTJvwdWW9aIfZtU1iV11LZjr6j6bhLCEYlnaqOmqYzPNC4kMNmlF3+1lQjszA0/mG
	izsMubmwphLN+Uc3vGvsOEVYBKTFQDz1KKPVEKoK+bOeIDNHvs/8wr8JysdClUSSqmTNHrUhefO
	fi80SZu6xlMHU/iNf4s7Oc7DYchwVEkoypICRwwrCqiCnFp/w7hE8lGgL6Md+/quZQhwcpYmKUX
	ymAU/In0lY4omV1w7x2pfhog1/ROYumAfVaZsLpyy+9I1SIYwisoxsfDfERMbCXm9E58oubw==
X-Received: by 2002:a17:902:da2d:b0:2c9:c13f:910a with SMTP id d9443c01a7336-2ca7e8d033amr108379995ad.45.1783076621819;
        Fri, 03 Jul 2026 04:03:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:41 -0700 (PDT)
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
Subject: [PATCH v3 01/13] device property: Add fwnode_graph_get_port_by_id()
Date: Fri,  3 Jul 2026 19:03:02 +0800
Message-ID: <20260703110317.1283411-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040342_910864_F74D3AF2 
X-CRM114-Status: GOOD (  14.08  )
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
2.55.0.rc0.799.gd6f94ed593-goog


