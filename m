Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E238CC44507
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 09:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGS4xa617bTzeR6KQL6sDpcq2So7IhszuqJtV9dz6uY=; b=3vyoBDqx9hcQHZczFqCPPra5/A
	roN3cBxRJsh+2U9HK76jp/NP6SWZ0A7YXBt6BPGu9wksQS1aXu7I4A+NVXeXHoShcjNoLmIEkcLtM
	pxtWenWLuYQQWRgI1ZnZEfbkmShqJJcS8/rCBIwu34qLiDJ9r5obhIMeWnaW84tclkEA2NcGRghdE
	SqzeNxRT3oMX0UGeEU1aXajZztkoYfXqD0joV2muuZAMiIz5b1h54vTHJeZ35xTggUoUlye1e1IEr
	fPwb+X7z0PlhlIsEvBiIcIitfHc8reWIm5bAGCKw6u2Qs4kmq/mQjnTK7Z0J8Q6X3uQ9z8r9qtazN
	JZvn6IYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlW0-00000001oxR-3PZO;
	Thu, 09 Jul 2026 09:57:56 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlVx-00000001ou2-3oRE
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 09:57:55 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2caf4496889so5279995ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 02:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591073; x=1784195873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGS4xa617bTzeR6KQL6sDpcq2So7IhszuqJtV9dz6uY=;
        b=RNUzF0Ue6uma6hy7UA2Mrkt/ZFxmfBUdvI5FRpFQ9FBW0ifI+wjJ/Q6jooxPeGrtQc
         aFVXe7QJ0NLkRanSQVEWzAqGieyhOq8nS5bqNX8zM7+G0/SzM/XO0AdlLX+xGJLGDEP1
         Pcs5YEswIDPnjjZ9LIZ0lUegq5Zx88ktXpBAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591073; x=1784195873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGS4xa617bTzeR6KQL6sDpcq2So7IhszuqJtV9dz6uY=;
        b=S1QNMmAv+lCf2n3MNIivkhdFG1S1y98MUa+rvS7AaeoStgXANKE2026qri6Xbu4cm1
         lgMd36TipZT7Bgkio9w+VRii7seCPcgE7lh4wZ9ZEaX9w7T0IXRfGKUaf7GBQcbPt4D3
         pcGtOGp+XgA6CTzvj01/priLAzqSZgCBbsP/D1wmNXkqF8zJ8/okQvL7MiHUJuRVYy+E
         Rh+9BMSKPk1EyLBsJeui6TcLaTT6meAjTBPCC1PtQ1FdDZaR7Zb4OdpVf+jBcUJx57kJ
         cW8MzYB0BBKzwTdjuKmDWVZ9lQiQnkjE+vumcMHcTzgR+H9c6uMYP/p82I1RXy0B0n/5
         i7GQ==
X-Forwarded-Encrypted: i=1; AHgh+Rousk6p5SvD2zOCZ4hRINm2g7JSUAIh3KwZYu21xwaUhNV1tYs8AInvTR7lLXCxpM1WH1iZ1UY5zVb0RywhNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIe5uLyYbsBqmv6PYYYp+bwUffMbdK/a1tnwaWiH1OsGj/2LUI
	0w4gCCgL8CbJT2PUDR2mPCyOHfhCmlg3APv7Xoh+/UdfOzrcIXZL1oyQPxx1+ak+zw==
X-Gm-Gg: AfdE7cl8A+A7R4BjIZWGSlmpypE8qppsgt5VJHAS3mT3cwrrEimv0dlCuARUpxuAfMO
	M0TgodFuAH2xrfeyuLyjsa6u8UnwGs8YW2ijVXCE+Sgltf6l0bWr2VtSfszQPW3mBNeWUEo5C/N
	M3ngVpSkXbeqoSIpiyB9v991VI4Rl9e+AGfXIOzBzVF431mBMbPq7WSjBiMm7VcBqhWZR7IOyQu
	LIXL1G0FnR6X0L6iC4XmefJK40JxLqyG4rt2dUUGkvMjcusDTTNzi5CPQsmw+RGCSE/17XToQLX
	1YhLJ6qg0t+s5LoyG6lCxYVKU64Px+dWLqE68Qj3paDV7SyHCwlEDrgU0QgUTSPbvzzZqUdS4OJ
	/2L7N2OXLYhoxJUObY2ra6kOoJzPu8UtTsezmmmGnmS3o5Avk8sQMEhYpz9uDUdG/ZKA2jR8bRW
	0X+qwsOZHjwPznHhRSyoAqycmcMv7cWTDaMiCwAbYrTZwzyK43ok6nC6FXoODVXV+vw89Fag==
X-Received: by 2002:a17:902:d2ce:b0:2cc:841d:cd7e with SMTP id d9443c01a7336-2cdd8b2ebdamr22781535ad.21.1783591073109;
        Thu, 09 Jul 2026 02:57:53 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:57:52 -0700 (PDT)
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
Subject: [PATCH v4 03/14] power: sequencing: Add pwrseq_power_is_on()
Date: Thu,  9 Jul 2026 17:57:08 +0800
Message-ID: <20260709095726.704448-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025753_956320_0D01AABB 
X-CRM114-Status: GOOD (  12.46  )
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
Changes since v3:
- Added missing stub function for !POWER_SEQUENCING

Changes since v2:
- New patch

Needs to go in with "usb: hub: Power on connected M.2 E-key connectors"
as it is a build time dependency.

Side question: I wonder if making the !POWER_SEQUENCING return success
would make developers' lives better? At least that is what the clk and
regulator consumer APIs do.
---
 drivers/power/sequencing/core.c | 18 ++++++++++++++++++
 include/linux/pwrseq/consumer.h |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 02f42da91598..72b96d36920e 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -968,6 +968,24 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_power_off);
 
+/**
+ * pwrseq_power_is_on() - Queries the last requested state of the power sequencer.
+ * @desc: Descriptor referencing the power sequencer.
+ *
+ * This returns the last requested state of the power sequencer.
+ *
+ * Returns:
+ * On success, 1 for on and 0 for off; negative error number on failure.
+ */
+int pwrseq_power_is_on(struct pwrseq_desc *desc)
+{
+	if (!desc)
+		return -EINVAL;
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


