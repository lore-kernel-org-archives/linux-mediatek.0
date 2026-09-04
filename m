Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15308C79F80
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 08:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUco8k8loeDw75nokYqtCIPRhQuEjxppf2mE5m0ZQ1k=; b=I8HP3Lhz8QwVSWJglWIxmS6sbf
	jUMG1A8VvCh79bDcQ2owZHPYpuGs18heL0W69NF1CzN8fcfb7ROhZDhd2qUSVJIjef+vBOHs2W4aQ
	MprdGV//Dyv1fcXGgkEgL3wg6i88RGQVbSVXSXD0POyhxKI96BX1a/Ces9fvunueTA2WZnimveeXQ
	3kKgZBifQ0Ayugx7u0jxsej/cfpyJhkkgEWjzX/TN4nUeZxETb7rwucoCOfsojZqu6Q6HyOHi3hOw
	M7zYL2TL1ICpVDE3cPhnyFL26z2KqLLvSxV7JgSQ7DRyP4XaTPb9qfJmBx0GSsmMBhx7rXNLlh8Jj
	OpIXuOpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PVG-00000001PaT-0muR;
	Fri, 04 Sep 2026 08:42:30 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PVD-00000001PXr-2UDE
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 08:42:29 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2d5335cf904so7067675ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 01:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511347; x=1789116147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUco8k8loeDw75nokYqtCIPRhQuEjxppf2mE5m0ZQ1k=;
        b=RTygDaQqLuRVA6rSx5+V6+3A7ybRSJu7q1vfrufrRTML+4C2Q0nq9Jb3B5T+fN8pvP
         uLIsYnoFLlAzvZC3G0fvZr3/S0jleIKPe+xHbk2Gd41EZSfUYem5R+8Q+v4yaLLgwFsM
         zyrgSOgo9akncfX14+II2jSnuR0ajrtwA1QV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511347; x=1789116147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUco8k8loeDw75nokYqtCIPRhQuEjxppf2mE5m0ZQ1k=;
        b=KLtfvlcraycwz5DxbQezDIbdSNwsvDaCBM01dcw8CM2XrDv+g8fXIWXmiegwcUo80+
         b4yD351y9bHWGroojCXhuSCD6gluPAMfjI+jgmW7hi7jcv+sl3q4gBRXqv88auwXNoDR
         ugyAYJ6akmS8lBCwy0CahZwd1CGHQFcPfQSp0bwZKAPW3nBYcFSbrjnQe5+kNTPBxtBN
         FjAQgOgZJphC+ybk2GRjSxyEcfTtT/Tcm69LtRoVBilNsteNnSBi6cQjaBmM7XxpNmKV
         VpIKYH/gAGNvl//w2x65CRmlCTD42T9ppxzelAUxydXxbgmGXBE7dGDJwmrO6qFDNx2P
         U/Gw==
X-Forwarded-Encrypted: i=1; AKwUvBzhKY1cVAk71oeow+Vw24o8Qio3qhzYonhRSXhRUlXG3idOkCZ/DkzxwhGhZsw5N1yvvIzshBAFD1NPMNX5JA==@lists.infradead.org
X-Gm-Message-State: AFuF++kqcUUioaE5sXyOINvg1LcKkEIBZW0aOVfoS4KneuXNCWOHmi7r
	Xw1FvC1yXQ76qLYBDVbl46aW2gHquzYVoTUtudX1GdHHPzBB7eaLliHDx0YVdZpqmA==
X-Gm-Gg: AYBFou1/cPWlGgSV36l8VuvSo3xNkD8u8pJM1dpZ2j/FFL54kYCvqZ+8/raBIV6gZe+
	XTQ0IvHRS00j/hEWmLf+JhHrDm3N5Gr/G9KGeaRteKginzo1ILMAvu4l2WGfDXSKVUDbLXSVdgj
	6IzNDiIM4ACkxJdgnrjFpD3hddaOUBxLcg5GDfJzC10p1PUi7bAbWjy0/hFxXtosIxyeOrNIxMs
	RKjjL7p86il83aEkcG60gYNP5oU2rB3xog8CDY5H/jxwqasPiQ/VHQU+313bglDitdnuR1E9GSk
	7QgWVBloL9q8I/K5uWBYpjaCsP8m1btFIVEuSdhbtu/pkgPNG4M+vsigS0t9cotOltzEXkxyE6N
	GUZyXTBF/Z6+dN3JQI8Jmk1tYgvumhTiXqd4CSnZkEXXPLjt3qc6WYIjw7QC01oQZiEgCxnwNbU
	Ys/q88FJfFddwQMOR8mMXIyv+35YdulYPENe5FxiaexcElgMPifj6tbU9r5zr93k1+GUzZX7DRL
	8Vw1vNZrG2XrCG9drd5dG2XeaCUC0TC64xb/3mwi1xX
X-Received: by 2002:a17:90b:3a8e:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-39b260d2eb3mr6786889a91.7.1788511346596;
        Fri, 04 Sep 2026 01:42:26 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:26 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v8 03/16] power: sequencing: Add pwrseq_get_state()
Date: Fri,  4 Sep 2026 16:41:42 +0800
Message-ID: <20260904084158.1341550-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014227_648579_60FEE981 
X-CRM114-Status: GOOD (  14.36  )
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v7:
- Adapted to pwrseq_enable/disable() rename

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
index 721e888b658d..dbb2bd2f8864 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -968,6 +968,25 @@ int pwrseq_disable(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_disable);
 
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
index 16fad5f3e3ab..e2a2991b20c2 100644
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
 
 int pwrseq_enable(struct pwrseq_desc *desc);
 int pwrseq_disable(struct pwrseq_desc *desc);
+int pwrseq_get_state(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
@@ -53,6 +60,11 @@ static inline int pwrseq_disable(struct pwrseq_desc *desc)
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
2.55.0.979.g7e5102b832-goog


