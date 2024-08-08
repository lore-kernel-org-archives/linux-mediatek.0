Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0729C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Aug 2024 10:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnHNs8RGUpugUdHA2OImjbnnj6+rNsZeKGSTnE9NGbI=; b=qnI6KSkOG6MkQXb/KUs/m4DxHJ
	Zen9oF1C/kHnXJXeroDZ0PkMjgaA7uKWe5R1mjDAI98F4gcUK/bbyFQBI7a6evzqR1L5CjLIdbj3l
	qEkG8hcoRgDKWWlpJKOUQHXvygTtg2R65qApIzCLDtrgcWxw9FhWwtOUru88OfyEH+2+b+les7KEm
	+XXrDhhFt4rfLJUjYlM0av87ftsnmpkboVGscejeMSLnRuB3/GEBP+zmeoQvlebW6P6B3EpKFCkAE
	hLweqHyjaQJvrEYXML59s2qulmJWMslHTwcUR/ZNNIeLmoKKyFosjl0mHrStmU8Ah8e3LWCIEZ083
	GTkwRkaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbzwV-00000007oBJ-2bht;
	Thu, 08 Aug 2024 10:00:23 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbzvw-00000007o0G-31dE
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Aug 2024 09:59:50 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1fc6ee64512so7410175ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Aug 2024 02:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723111187; x=1723715987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnHNs8RGUpugUdHA2OImjbnnj6+rNsZeKGSTnE9NGbI=;
        b=QAQ/dGFcZJU1Xzz8NQlG5U+wVEG526Zu41a5m6zgRV3JEp1DEHS27La36P3nALy6hK
         NBhTHF4c9o3dNQfEMjnABPXy0mPin9pLnRZs/KuyCOdsndYKG+NeyzGV7GzzsjLADjKS
         /u5O/237QXHA30gI6mfhhBl90SHvYDCILf+kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723111187; x=1723715987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnHNs8RGUpugUdHA2OImjbnnj6+rNsZeKGSTnE9NGbI=;
        b=Jjyc5kamQOe6fv0YdETQ0GkV60VA4VdlYxS22DxicbBql+20bjf462Iuiar3y60XGA
         NWM+zsOyI67P/KxNZD+6Dwx1vqOpWABlwtruArjlNbntkZUSCmN1dFb9QPDZmmemX45p
         IdnHSiG6pn74OKq+qqkWjW1LvWKRwzDnNliVLpS7Wpd55g0tey05w3Hxj4JvRPryIS4i
         MfHOdB2SRl1YWFGf4pxeolzNfE3DIf7PzVsLyb+3RmKfKAoBFpRSXpCjlN7LB12vpbUb
         OmbBRmR9Q8COkmHDW3bZuZrfjM1mHWScw4N8EvKPx+TAsEYzpE4iHE5uZk0I9QTYcx+t
         7ipw==
X-Forwarded-Encrypted: i=1; AJvYcCULYHgpsFYVuVPFo5T3lUwb99ehaUoPMuULPfBiIzJtRXrV//x9xqIH41nKFq7KVCdlgDKCXgrle7JUeOa5+DMXOwCGiAc3I7dJeow+tRuQE2H7
X-Gm-Message-State: AOJu0Yxmp/1pXGd2bg5l5KQol4810xzj1c64E1k3qolN71vNvO7fwg5R
	zUw4twFuuYav47v0GlOc7G1k1ZKTMUgK6VoCe8Y/8RR1+C/hIyO9bNePCX+fvA==
X-Google-Smtp-Source: AGHT+IFIftWwmlbWRkGBzfDMk0j7k5O8rm8KVgSziXqkMdFzRmZhlp6LCbkz+1PDSOvY9LkVZKP1dQ==
X-Received: by 2002:a17:902:ec8c:b0:1fd:9c2d:2f27 with SMTP id d9443c01a7336-2009524a0edmr15321085ad.24.1723111187412;
        Thu, 08 Aug 2024 02:59:47 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8b53:87e6:914:a00d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59297707sm120784985ad.254.2024.08.08.02.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 02:59:47 -0700 (PDT)
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
Subject: [PATCH v4 1/6] of: dynamic: Add of_changeset_update_prop_string
Date: Thu,  8 Aug 2024 17:59:24 +0800
Message-ID: <20240808095931.2649657-2-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
In-Reply-To: <20240808095931.2649657-1-wenst@chromium.org>
References: <20240808095931.2649657-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_025948_791865_88064690 
X-CRM114-Status: GOOD (  16.08  )
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
---

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
index 110104a936d9..dfd1358d59d5 100644
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
+	struct property prop;
+
+	prop.name = (char *)prop_name;
+	prop.length = strlen(str) + 1;
+	prop.value = (void *)str;
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
2.46.0.rc2.264.g509ed76dc8-goog


