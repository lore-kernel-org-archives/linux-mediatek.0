Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0724FEE0211
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 07:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XBl4KvAxY2W5qf9J8VaXaQIQeHry8eBV5yNyqGAqXM=; b=KFoX10HknfWtmbxgyJuB3CEio9
	p33z6g/XJigkWVe4KV/nS6jnjgVGjM3O/+Rx2LjAGmZYYxcJn4y0ZsZuMjPiKCPnfr9gp3RgBxeUW
	rKXZmCo0PyI2IvVEeL0l6Cbxpg3/AsF9Cwj8OJhKKlQTwBazHFOgHtf+ROdW1vB1dN+lbjAm+aql/
	Pb86Ce/Pa08d9IKjc9tzA3B7Hz4vgDvSbI1NY7/rOIGcnNNfcLH4MP3f6VIjygrbHDjjgrYMwgOBJ
	5E3Etcf4d6PHXtjCgUqmYLReUtQd6XIXxf5rDEjyW6NZbGWzqpc5I7DzeRBsDw4cP+4v819HFOap+
	pFleiYsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHne-00000008RGf-1B57;
	Wed, 11 Sep 2024 07:30:02 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHm3-00000008Qii-0ljj
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 07:28:24 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-718da0821cbso4104877b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 00:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726039702; x=1726644502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XBl4KvAxY2W5qf9J8VaXaQIQeHry8eBV5yNyqGAqXM=;
        b=iVEQVYqOKMaDuQTrEHnP1tM3dkXmqYZAYsuiogNscTw0OKTJM68A9+PN2pkNLqRhzp
         D6hjSJAhizaTjo0khjPZxypYFzCN0A0Mdxsfo2DZVp+xe+HnpRY/u7YesfkTjPpFcD91
         jkfqBmLQcPTC9J4LnsR2tS/NAfNBjWlOARQGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039702; x=1726644502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XBl4KvAxY2W5qf9J8VaXaQIQeHry8eBV5yNyqGAqXM=;
        b=cSv3oz06qeOkU4mSID/YEEYN2OWZEPVmBEA7fo+Au0n79aH5DxAXJzCdpIh0gQu+39
         3tNPjYyykmBSSNJATVO3Dr3ge3gzaX3hiRjOHRg3NMmjb55LkMW2zQM0fx1C1g+JINus
         d1/3MrS+sGl8IZJzSS29IrDwG5XUrXhNC68ceblR0CerUUibgRMqYOi2FwhAcOAu37yN
         dJPh3mMDmW9tyg3Hxa/XQwK3L7Sl9G/bz6BTIFDVfVpPx2JbM/jupo84AR4xvr3YprhM
         A9kVzDuchRiwdVzANNhtut1AWZdqpZnd6CA6tfCh7YBV27um3lsSZfJ2QRcKXVSBvH4j
         RWyw==
X-Forwarded-Encrypted: i=1; AJvYcCXeKtIdMt/IF0Cnnmt+QTH0rGxLW6jEPps//y6GQJowp6LXxN/9ggv9VfKhidlqLmGbI2skhvNzdkGxgor9sQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfC2JDCEVQkDns1Z3tQoIS8HIzYXa5ddpsJFG9gf3XTZXsQ7TM
	Ghad8I/Dizbtlh9eYI3l8RzIrGvs4O1eiUOhr2LLMWii/DFGOTJWyveDWIcwcQ==
X-Google-Smtp-Source: AGHT+IFjUTc14exhMNLPWpC6tKqxzxp/QnxrLH5ALh3HkEgdTdW2uDtj4xbh/J245j8YHjY14LvqFA==
X-Received: by 2002:aa7:8887:0:b0:718:d96d:34d7 with SMTP id d2e1a72fcca58-718e3f9caacmr18512422b3a.3.1726039701972;
        Wed, 11 Sep 2024 00:28:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8398:fe34:eba2:f301])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e7esm2399415b3a.80.2024.09.11.00.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:28:21 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v7 01/10] of: dynamic: Add of_changeset_update_prop_string
Date: Wed, 11 Sep 2024 15:27:39 +0800
Message-ID: <20240911072751.365361-2-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911072751.365361-1-wenst@chromium.org>
References: <20240911072751.365361-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_002823_265862_50CE4A58 
X-CRM114-Status: GOOD (  16.23  )
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

Add a helper function to add string property updates to an OF changeset.
This is similar to of_changeset_add_prop_string(), but instead of adding
the property (and failing if it exists), it will update the property.

This shall be used later in the DT hardware prober.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v6:
None.

Changes since v5:
- Collected Rob's tag

Changes since v4:
- Use modern designated initializer for |prop|

Changes since v3:
- Use new __of_prop_free() helper
- Add new line before header declaration

Changes since v2:
- New patch added in v3
---
 drivers/of/dynamic.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h   |  4 ++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 110104a936d9..daa69d160a78 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -1072,3 +1072,47 @@ int of_changeset_add_prop_bool(struct of_changeset *ocs, struct device_node *np,
 	return of_changeset_add_prop_helper(ocs, np, &prop);
 }
 EXPORT_SYMBOL_GPL(of_changeset_add_prop_bool);
+
+static int of_changeset_update_prop_helper(struct of_changeset *ocs,
+					   struct device_node *np,
+					   const struct property *pp)
+{
+	struct property *new_pp;
+	int ret;
+
+	new_pp = __of_prop_dup(pp, GFP_KERNEL);
+	if (!new_pp)
+		return -ENOMEM;
+
+	ret = of_changeset_update_property(ocs, np, new_pp);
+	if (ret)
+		__of_prop_free(new_pp);
+
+	return ret;
+}
+
+/**
+ * of_changeset_update_prop_string - Add a string property update to a changeset
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @prop_name:	name of the property to be updated
+ * @str:	pointer to null terminated string
+ *
+ * Create a string property to be updated and add it to a changeset.
+ *
+ * Return: 0 on success, a negative error value in case of an error.
+ */
+int of_changeset_update_prop_string(struct of_changeset *ocs,
+				    struct device_node *np,
+				    const char *prop_name, const char *str)
+{
+	struct property prop = {
+		.name = (char *)prop_name,
+		.length = strlen(str) + 1,
+		.value = (void *)str,
+	};
+
+	return of_changeset_update_prop_helper(ocs, np, &prop);
+}
+EXPORT_SYMBOL_GPL(of_changeset_update_prop_string);
diff --git a/include/linux/of.h b/include/linux/of.h
index 85b60ac9eec5..046283be1cd3 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1651,6 +1651,10 @@ static inline int of_changeset_add_prop_u32(struct of_changeset *ocs,
 	return of_changeset_add_prop_u32_array(ocs, np, prop_name, &val, 1);
 }
 
+int of_changeset_update_prop_string(struct of_changeset *ocs,
+				    struct device_node *np,
+				    const char *prop_name, const char *str);
+
 int of_changeset_add_prop_bool(struct of_changeset *ocs, struct device_node *np,
 			       const char *prop_name);
 
-- 
2.46.0.598.g6f2099f65c-goog


