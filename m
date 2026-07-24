Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF52C531F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 08:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8J9f0ysj5iLgXAfZrr4tNewoNqni8L/Xnuw2lNVMgtk=; b=UdVik0p1QtjxM5KyXYzZWQVnKV
	XKuZMn1Q3E2RG/xUNpB8v63e1kSr5sa8ttwowgqbTOPo0LQd9XW+oiIbiughRZrts+nBMmqtarnSq
	0MOHba/kJbbIs+sYOyZh9tqymD1flWh29SnUVaI4VJkH1OyEiDzGKTHHwLrGsdRxpZ7zVx/DlGtoB
	s5t5Q1snqOgc5QE+nZbsJXWE9JMHTAMopJEAxsT8Eppdm7eVhk1s8/wIND3nZzqiQatEVeXxY6kmX
	Mz/GEwKVmKRD7ZlQSg3Jz1Xn1wevvcVZCx7llnyntSP5L+WJGEZAwTpW8bMxuidxsC9VOlXwJzAA5
	MA2lYhFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBW2-0000000FqYt-1h9U;
	Fri, 24 Jul 2026 08:44:22 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBVz-0000000FqWZ-2Ax2
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 08:44:20 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso139421a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 01:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882659; x=1785487459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8J9f0ysj5iLgXAfZrr4tNewoNqni8L/Xnuw2lNVMgtk=;
        b=XFIGhdUijl7ICdZnM8V+lo8PQ8aS+0EoRbPwxjvFoBh0VU5EBHYWC0FQzzWd9a1Gjf
         NJoOggj+Y2Owa07LpKgEQO532J+hN20qJi0k3YMWevFk3ilGv4lxM3boYDxF00tIME0s
         kGernw7S0lVUJ7FYDWhPOv9qJX/06BnNRwmPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882659; x=1785487459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8J9f0ysj5iLgXAfZrr4tNewoNqni8L/Xnuw2lNVMgtk=;
        b=EEl4hw2e8YnNIf9ohR/92v5rk+gSAOXBxvGXitXUL5TPNxVhHQpXK+2ZBpl6GrLcJm
         CEyaJyOWze1T0moenRjoQLCYjWejEG8faRXfq9+x9zTIluz8rL7dENd6Ev7OTba3Ar6u
         yMu2b2OIR+8O6FdhCPMsa1dO8DhLRPtuOcLNJIfpwkWDH1tvLPLx62RVtslNGC3eqawa
         VCb4NKKMVNi0RmBA9b/Ace9jdLj2t8s62Noq+ff1lHoKjrjeBJLgjpEOSdQx48BmedfN
         wh6/dQd93AsHW2vb8AlFgdek8m9p+mINgXdrxDFGrKavx87+p9TcsWyxaLod3lLyIW1e
         k+zg==
X-Forwarded-Encrypted: i=1; AHgh+RoEFX0FIt2dl+N+GQjTVBed08n2HuVm+4nU6pSPchAGD9tculpPNKKHz22nN5OuSVIRKH5aRPi8UfdV5CjDAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPQq8hzLGouXXMYJJT9thJ6NpEuqo9UUr066Wmvw7g3VshwOKe
	LKaPPWBxw/zQuE6kbLUoH4p4aEQQZID29eIx31aUR9tsPnr01po7Nfv046r7S/ywoQ==
X-Gm-Gg: AR+sD12WXlPyRZaTPFn1lWzewACZgHq1aBQFfplVatcIiAjbvy5a4rdx6qap8/TFPiR
	e5mIw9Rop1MjZjpHFw7CrFjyTkJW+zS8KSWJ00f+lP7NSF7BRi8SrNcioAEXnQ+NMuJYNqnT/uk
	9fQkOWkIDeQfCzDyCwBT2IUp/IAv+eTm3kLeK1pNu0U6596F+e42tAtG0Klc9+bjoQZNiV/Zrjm
	11qWj3RqsIH0pOaiGabwBSyZoafP9ONhvyb/v8+wXCqYaEym7E9JWYyMsIe9W1zJYvmWcMnbNIK
	XpOs5dSEdaTVAR/LX5ajitg6S5aj9DrKxfWnM6IWqoFS2J9htefDQKU0hGP81TBtmBDq0i2WePz
	nS80yHCq7BkSI1aj3Xujyxw4koQBzDBn3f0ceI+mgQe+9dHKzka7vy5ha6T8pfsfuJ0pZqpVGa+
	EzBsMP8njsHuJY2OExH6ZBTEhRC3qS6wMROP+qsG3K2DpI7X08kxVvCtZLjMI=
X-Received: by 2002:a17:90b:1d48:b0:387:e0db:3d8e with SMTP id 98e67ed59e1d1-38ec665050cmr7371473a91.41.1784882658880;
        Fri, 24 Jul 2026 01:44:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:18 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v7 03/16] power: sequencing: Add pwrseq_get_state()
Date: Fri, 24 Jul 2026 16:43:12 +0800
Message-ID: <20260724084328.3943997-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014419_565213_60E4ECF4 
X-CRM114-Status: GOOD (  13.87  )
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

The power sequencing consumer API already does power on state tracking
internally. Expose the state to consumers through pwrseq_get_state()
so that they don't have to reimplement it locally.

Instead of just on/off and error codes, the function can also return
"unknown" state. This is in anticipation for "uncontrollable" power
sequencers (such as GPIOs left unconnected).

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v6:
- Changed to pwrseq_get_state() with enum return value

Changes since v5:
- Reverted back to returning -EINVAL if descriptor is NULL

Changes since v4:
- Make pwrseq_power_is_on() return 1 if descriptor is NULL, i.e. if
  the descriptor is optional, matching the other pwrseq consumer APIs

Changes since v3:
- Added missing stub function for !POWER_SEQUENCING

Changes since v2:
- New patch

Needs to go in with "usb: hub: Power on connected M.2 E-key connectors"
as it is a build time dependency. Bartosz wants the change on an
immutable branch to pull into the pwrseq tree.
---
 drivers/power/sequencing/core.c | 19 +++++++++++++++++++
 include/linux/pwrseq/consumer.h | 12 ++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 02f42da91598..701728e60a26 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -968,6 +968,25 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_power_off);
 
+/**
+ * pwrseq_get_state() - Queries the last requested state of the power sequencer.
+ * @desc: Descriptor referencing the power sequencer.
+ *
+ * This returns the last requested state of the power sequencer.
+ *
+ * Returns:
+ * On success, PWRSEQ_STATE_ON for on and PWRSEQ_STATE_OFF for off;
+ * negative error number on failure.
+ */
+int pwrseq_get_state(struct pwrseq_desc *desc)
+{
+	if (!desc)
+		return -EINVAL;
+
+	return desc->powered_on ? PWRSEQ_STATE_ON : PWRSEQ_STATE_OFF;
+}
+EXPORT_SYMBOL_GPL(pwrseq_get_state);
+
 /**
  * pwrseq_to_device() - Get the pwrseq device pointer from a descriptor.
  * @desc: Descriptor referencing the power sequencer.
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 3c907c9e1885..af949e756bbd 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -11,6 +11,12 @@
 struct device;
 struct pwrseq_desc;
 
+enum {
+	PWRSEQ_STATE_UNKNOWN,
+	PWRSEQ_STATE_ON,
+	PWRSEQ_STATE_OFF,
+};
+
 #if IS_ENABLED(CONFIG_POWER_SEQUENCING)
 
 struct pwrseq_desc * __must_check
@@ -22,6 +28,7 @@ devm_pwrseq_get(struct device *dev, const char *target);
 
 int pwrseq_power_on(struct pwrseq_desc *desc);
 int pwrseq_power_off(struct pwrseq_desc *desc);
+int pwrseq_get_state(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
@@ -53,6 +60,11 @@ static inline int pwrseq_power_off(struct pwrseq_desc *desc)
 	return -ENOSYS;
 }
 
+static inline int pwrseq_get_state(struct pwrseq_desc *desc)
+{
+	return -ENOSYS;
+}
+
 static inline struct device *pwrseq_to_device(struct pwrseq_desc *desc)
 {
 	return NULL;
-- 
2.55.0.229.g6434b31f56-goog


