Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D798D21270
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 10:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6FZbts9QCxoLKhhcQZxuM7DUHh34aD5doQpW7slZ5I=; b=HbyabJpOXZ9e6gXY+eRGfSK3H9
	WdZ2KT47q2tR3j/GjgT54nOYb6o733UBROJd3awqD3ISRlBlHZZIT0Tih5O5Tp3DqQaOmLyMuJZ0h
	wkkn5cG7WZqnmQNEhHH+TQOVWPJcQmCYFo2st5HIf8agmuTc23OqufzKkhu+CsHPLZBBedsSPIj/v
	qcfEY1+0of1Z6NJ7oXxb7guGVKKbvfGbEh4o6obbrrw/LLEVpaf5yPnwE8HSmGriUAxuDalU2F9x+
	0Qr8xwt6eHBrPGXNY7Xhdc09M0HUjk98MTpDAYbV/r0s4TdcJNboN+wuKf98BKjdVXnLyiwPaZqfh
	JAWmG4zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1NNy-0000000ESqp-0fJn;
	Thu, 17 Oct 2024 10:05:38 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1N1f-0000000ENcR-3GSN
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Oct 2024 09:42:41 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20cb47387ceso5905355ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Oct 2024 02:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729158155; x=1729762955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6FZbts9QCxoLKhhcQZxuM7DUHh34aD5doQpW7slZ5I=;
        b=aEUxvGymdarG1B1TcJHtC9UmZlSGXVb2Md4H970vHokpjhwoVyFsiw0exWBOyZQ7FA
         y1ApAAhcm9ttW5Re8bx5Qgfnhc4lYj3tv5bXzFPMJXPSwCFvzDnVi/WplpmdXwp2nFOD
         IRYcYaZr6CipH3r7vDtVjoJmQuACxt494PxS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729158155; x=1729762955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6FZbts9QCxoLKhhcQZxuM7DUHh34aD5doQpW7slZ5I=;
        b=Sdr0miDJNezRpC6+4JgS0xbhWnSG5/c2pVb2UOcnJ86vaIhOKcbhp1dYNh06F8wtb9
         eOBZ1yK+HysoD18ZjmJRP20zixS/+F9KhbH9dLBhxZ/JJGgOrU+5qY1c+JLXC54xzYRv
         vZ7RBnf1wCN5vbGJIQSMTwM2dAj9BHgkLrCe1dym66IrSVWdtDnbhZ7BvsYYkm41a1uj
         TAZidTGKLimWQelewAH4TxLyOScrJ9RAZm/fC+vLCh62d7Qy+3I+Q17RgyTOApiMLep8
         PHcIUWXqOHCto61O7A++zJgjRiDw3/hOJEa3vDpvV1+1LmpS5NnuYYp2rGtfpZzhhdW3
         Yoeg==
X-Forwarded-Encrypted: i=1; AJvYcCWcs1NUqpcB6I78hRHulis9wGVD1mdhYuzNUfoRusIDwRr4FOYkdCO8JEdVYucb421zTHXs+RC/SBDOVP3PiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLGbxGoqYSaqi4RwVh3W6+YEqW+IyxhzAh2Nq2YACH3MDO583l
	/l95k0wYqB20kzHnQvctrpoITIZeN8ZQyi4JQme7sjTwOzaQ8ZFDRvsxxhrQnw==
X-Google-Smtp-Source: AGHT+IG0EPLVHHmR9wrOAnasXV/P1d6JWPLrEg/AThFAO/2GTIkhM3VA+1j1tPEZBxObpDzVuNjxrg==
X-Received: by 2002:a17:902:d4c6:b0:20c:bb35:dae2 with SMTP id d9443c01a7336-20d27ed00e8mr83383385ad.28.1729158154872;
        Thu, 17 Oct 2024 02:42:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fabb:a7ab:3d7:9aaa])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f87ccasm40638655ad.62.2024.10.17.02.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:42:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
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
Subject: [PATCH v9 1/7] of: dynamic: Add of_changeset_update_prop_string
Date: Thu, 17 Oct 2024 17:34:36 +0800
Message-ID: <20241017094222.1014936-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241017094222.1014936-1-wenst@chromium.org>
References: <20241017094222.1014936-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_024235_822742_31F06E1D 
X-CRM114-Status: GOOD (  15.52  )
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
Changes since v7:
none

Changes since v6:
none

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
index d45a8df61380..0aba760f7577 100644
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
index 086a60f3b8a6..d0307e3b093d 100644
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
2.47.0.rc1.288.g06298d1525-goog


