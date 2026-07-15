Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBEAC44507
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 08:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tiAJexuP13y6uWXyvfEXpTcy6egDm283JzaUjb9zN+o=; b=J3dFwI5FLP38IVobgxmPGLBbqQ
	SN3E/GWqsnCk1ZYOJQmyP+PVyJJ2PTLuFGvv1rkCJLW/JNNe/o6S3FV5GgaK1sZCCmDHfUpJTNlPr
	rR3tjIpB5+Xq1lCuOpSr1QOi4Uwdugsw9oPT8wypamvVOwDqsgbDY6AWzQcyGnbjprkW3NfVCO6ib
	tR1mYHXjBoFSAnlRIGIVH1VbJqqjs2XFcOyBkLM7vc86lVnAJdqyZLJU/NVSzbvFp7xmiyviQjN/2
	+/uPtAh1uH29m1MPMVMPhxNm9kRIFyXC4BNpUcClde/rf0f6mBELuisv2AjFoEOu95+0jxe+UfN45
	or/OsJpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvNz-0000000EDV4-3LBh;
	Wed, 15 Jul 2026 08:54:35 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvNw-0000000EDS4-0gWr
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 08:54:33 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8485ef63b68so4701082b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105671; x=1784710471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tiAJexuP13y6uWXyvfEXpTcy6egDm283JzaUjb9zN+o=;
        b=GsvRFtQ/Yo86NLVsAVykZHcIKUE9YVOOvza5DHs/9W4jluUp2nMRGuRi9ErT1krxu8
         h8dvgEjPmiPdoltL+tP769yZEzSg9aLQrtxxL/ViBSivzTL3vgaz4Pux7jglGXHqGKEO
         xU18KtztXkXPfoIwCK8OAq9s7nebN87x2c/7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105671; x=1784710471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tiAJexuP13y6uWXyvfEXpTcy6egDm283JzaUjb9zN+o=;
        b=MhuWoZA/5SDrW1HIV175C8DnfVPFA+e6gp8bzvwxTEQoFDPOVl0ATFe0fmM4bM7Njx
         IB4khmLKFFOZI+Ah2xsl1zZFEBoK1Gt3M9ZCjvnUzEBtCdniZOjhmTFoXuLGj7hc115M
         NaM7lBOUbx6maQYzA2ObbhLlCt1FE7rYbGDhZP77HMlkdy6nAxpqm8VawwRBkEbBzlNy
         c4btqPWVoo89geY6sNs3rv33+6yVh7sWKYyK33xtwI5yMSYuocaiO3l/RxbqjVB2rzyA
         sT8tI+wZAKlbH5eEDahSOPj+2amj1sZZ9QZZrVTip0K4tH69uLzdWZN7lHQyfVYqNAq/
         V4Rw==
X-Forwarded-Encrypted: i=1; AHgh+Rrf8cH9wC24kzigMM4l+5CRncTs4ee4SCD+TiaJoLMtdYuXlNbHlB7fw5Y4+hhsUqj7IIfeq8PGJcfGE1+3nw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt1TSPuVC23KUZ0NmFXlpp0WLEX2TVGt0H0yV2AHMVU0B3j8PT
	LmC7nO1iy2aIDgfUgPvaePisuXshUDpOBn1Xq/h/9yXoZvKF9V8pICatoWKhDiPlrg==
X-Gm-Gg: AfdE7cmbD0wJQj237FcMRNdS/71zsoP8quLIXqHheJmy/6SWt4BGf66NqWic7if28y2
	S9O3xo7qscip7ds6KdeJgpGlvVGldat9snvrs/iDn7RI4zGBVwavifM3/8EPKgQvdJezd+nfpLH
	4DK1lYFEx88DHC2MCuv1kM3B4kFhnLO+4ZrYSLGYYczU7F4jMEOdvivVwCHcScd36OZvZFCKNkE
	AcGLCrtvP5MHw00zXZMMIHQyx3HiD9en6nyLsj0IvdB/G8J0oyxYa4vkaQola4n5qr+TDISUAuf
	yPN8g9NX8tr+ujkZ+PuFk1bmqAv+NHby5EptPzYtlyD9YhU2SS6F2lincGoP+CBH5X6xwp89/yq
	wzYkb0+QvZzuzWmd6QWRwKJV/oAkA9C/BToVlx1MQUu67ROJWg6bo/Xz4JonMDiGVsnTAD3WIVI
	aKIL3pLVFdiF1VJRuaTgBmZafRPcbEEipk5wjr3UFANWfF8WeQp63cagprKGfgG707kTGHKg==
X-Received: by 2002:a05:6a00:2d19:b0:848:44ae:47c1 with SMTP id d2e1a72fcca58-84a559964ccmr5439963b3a.78.1784105671342;
        Wed, 15 Jul 2026 01:54:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:54:31 -0700 (PDT)
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
Subject: [PATCH v5 03/16] power: sequencing: Add pwrseq_power_is_on()
Date: Wed, 15 Jul 2026 16:53:33 +0800
Message-ID: <20260715085348.3457359-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015432_215018_D02A2628 
X-CRM114-Status: GOOD (  12.89  )
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
internally. Expose the state to consumers through pwrseq_power_is_on()
so that they don't have to reimplement it locally.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
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
 include/linux/pwrseq/consumer.h |  6 ++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 02f42da91598..db8c91be10c9 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -968,6 +968,25 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_power_off);
 
+/**
+ * pwrseq_power_is_on() - Queries the last requested state of the power sequencer.
+ * @desc: Descriptor referencing the power sequencer.
+ *
+ * This returns the last requested state of the power sequencer.
+ *
+ * Returns:
+ * On success, 1 for on or desc is NULL (optional) and 0 for off;
+ * negative error number on failure.
+ */
+int pwrseq_power_is_on(struct pwrseq_desc *desc)
+{
+	if (!desc)
+		return 1;
+
+	return desc->powered_on;
+}
+EXPORT_SYMBOL_GPL(pwrseq_power_is_on);
+
 /**
  * pwrseq_to_device() - Get the pwrseq device pointer from a descriptor.
  * @desc: Descriptor referencing the power sequencer.
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 3c907c9e1885..3c6122bd0205 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -22,6 +22,7 @@ devm_pwrseq_get(struct device *dev, const char *target);
 
 int pwrseq_power_on(struct pwrseq_desc *desc);
 int pwrseq_power_off(struct pwrseq_desc *desc);
+int pwrseq_power_is_on(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
@@ -53,6 +54,11 @@ static inline int pwrseq_power_off(struct pwrseq_desc *desc)
 	return -ENOSYS;
 }
 
+static inline int pwrseq_power_is_on(struct pwrseq_desc *desc)
+{
+	return -ENOSYS;
+}
+
 static inline struct device *pwrseq_to_device(struct pwrseq_desc *desc)
 {
 	return NULL;
-- 
2.55.0.795.g602f6c329a-goog


