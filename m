Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0BFCED276
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 07:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAzJUH3GBLmDSj5mGwoVwjPdbB/GnZ3tZ1Hq/uKMSGA=; b=2c3h6h1/QEXJTXtq8KoXzVNkfz
	lo4yDPfiXAW2Ugsv+q1oIEuqyh65U8P7bqWjYf41OhqoT2QCGQe7lOlUINv29swIxd1rpijxx/T+M
	uxPx0lD5kW00v7/XqQOH7Hwa9McaxQrClJdP1lvNxFXDQonOdl7yRP4cMis357mhqnmApoUG8N1Rs
	P+4z+4g/DWZ6vbznJAI9Ql5dNTPh15TEX8r9AvwkgT/7H66qFB5LVICRi6OM9+YgmAtkn9JVtfzau
	TiZBBWOS6jqcreFmOdOv1XwE7DPqnSnzNim2PKox8Q+atup+tYg/ZrMSYAeSmGLh1POchN+QwKVRU
	Hk0tHFaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4o8-00000004pcL-1Fi4;
	Tue, 08 Oct 2024 07:39:00 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4kG-00000004oNB-1djq
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Oct 2024 07:35:02 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20b93887decso41940585ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Oct 2024 00:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728372899; x=1728977699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAzJUH3GBLmDSj5mGwoVwjPdbB/GnZ3tZ1Hq/uKMSGA=;
        b=KbHYjc1NFHsJDgVmcdujPSD68C3Y3fHAXJzekUurJrniwJ0A615UEi9rknkkl1v2Mg
         R3VnBZme5aWeXGE7s9ADTOXNRptofxeeOIt5BGrZeiVgOh+TfPA6sa8ay074GtebNcLG
         8F0rFqaH8qKFtttDWVAbcxT7bwxFRL1vEX1MY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728372899; x=1728977699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAzJUH3GBLmDSj5mGwoVwjPdbB/GnZ3tZ1Hq/uKMSGA=;
        b=LIlMHSdg791VdBaOCRda0EeyJvprt2Z/duMCIoltryQXcGp4NoGiB1cyb0nqdFu7kQ
         jfD6OaI/DcZzxhfyUTPxGONVk6G5S6OylY/wx53RO0XsSzw9bhZw/sSmwYgvt5jSOm9g
         OEapt+IBb5gJjthM9SJtYhBJps26dNfDsW31uzBcmyDJzJRn9xsqwGS7m1MGPuHcImuv
         WrtHzZD1QdU8rExVbLZfAWLfSWmViyewNfpf2Kx+TpPNLvmSBqhjgRdFLuJIM4u46WDP
         Oeu3CdSR8e3huaVW8eF83L3gE0/Fqg/TRoc7FoMYniHXIbxjYZHCUOL8RPTuNIcF7Qeg
         RLkw==
X-Forwarded-Encrypted: i=1; AJvYcCVS4T4qRp12nljnsdT1knubLEy77uo2eXqy+KHJZVrjYXU/WRqaQ0cGDBKHTqTpgz3JE1k5wYTQGd2IS1L0Ng==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYlown7mdDYUdbgopOLf91g9M/qBZL7trF2WiP1ourhTTadkjv
	j91CsIWxrd+NtQ7vJh5Gs0nGz3Yix9Zx6z+wPt7HUO1j+RchZVIgQXo5evN7Tg==
X-Google-Smtp-Source: AGHT+IHIKHmfMvFJnBjVWzQP4Z8JAEL56srV5DFJYO66fK6FEpy7LiHndoNxlP7Wsz8kCnkdjMt78g==
X-Received: by 2002:a17:903:18e:b0:20b:5aeb:9af with SMTP id d9443c01a7336-20bfe07d26fmr146811785ad.22.1728372899314;
        Tue, 08 Oct 2024 00:34:59 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:10df:d27e:8d4b:6740])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13939bd7sm50121175ad.120.2024.10.08.00.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 00:34:58 -0700 (PDT)
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
Subject: [PATCH v8 1/8] of: dynamic: Add of_changeset_update_prop_string
Date: Tue,  8 Oct 2024 15:34:20 +0800
Message-ID: <20241008073430.3992087-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
In-Reply-To: <20241008073430.3992087-1-wenst@chromium.org>
References: <20241008073430.3992087-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_003500_505792_6D82B507 
X-CRM114-Status: GOOD (  16.16  )
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
2.47.0.rc0.187.ge670bccf7e-goog


