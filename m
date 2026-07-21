Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01F7C4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 06:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KO0/oP+3FvgdEaMV/KNxdvXtHKwHJHpy3UF14nh5ieM=; b=losRuFLf3ZkNYK6TzBApK/Chuk
	rP7v2PMYpbw9rjYNpIW1RKOF/Sf5gtfjO7cObPbZwgWTB++8/M8S2Q+VEQF5x5gRUn/mM1PTaGhxt
	TQo83OG71n+R6ry7gK6E+Xl74T70/X78ISIprwy+ctyTF8y/LOvCFxYt3CvevNx2+QKTtQbLp+A0W
	EVvEAJcokxFYSulZRPN+eZr0S8+JOoAIepQ7TOdtb3MdCrIOqFOUgZRhuimnYiUVas8Z3d0gC4oc5
	nz/KcGnk9+7OWTe/fCgWkZ7py5GVs7XAHed0kc/tubnrnQBDPmYHzK0dcPvIO8QwNfxLHkSXd7zZL
	D6s1ZgVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4NX-00000008a8u-30mx;
	Tue, 21 Jul 2026 06:54:59 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4NP-00000008a1h-3f0E
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 06:54:56 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so118409645ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 23:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616891; x=1785221691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KO0/oP+3FvgdEaMV/KNxdvXtHKwHJHpy3UF14nh5ieM=;
        b=OMMB5oNPFINIzLr13OO6Q8wEsOaZRyXBeDvQbxNtAt/uFS1YWk02PvxwoXGWSRmy42
         3dgBMVn4ehnzpwNQtEyyxozdIfEJJlejCKqpeG/ddCpRs66nkEv4a7GCrW8MftTZHi6M
         wqqc8NJcL0S9J5LfEb9+2xfOfMxklXxaOL4kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616891; x=1785221691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO0/oP+3FvgdEaMV/KNxdvXtHKwHJHpy3UF14nh5ieM=;
        b=ZcmzwDBV9hjMI7MMdEHy/SIlzp/mu5vUBLo2ICib8PMQ0JxoIqyYe2PjegKlEGd0/w
         rNMOn4mote0bJvvF9ypkBGCfTCDLgYWrS6/DaqX9erEN+PP3OwvtYL8zv+c/OZFNgjz3
         qxqsGD1RCVoq+k8x1ephhfhHlVHT6E/WeBOq19s5fPSsLlMkNhwUx4d+qrYTBYhk/CIq
         V7/fMMNnv/loS9XWvC74L7Rx6SWab3jPY19qqv7+loDBjcPSHpEQV5fJo65FHSKk4k7y
         g5W2TQX7BED1/6/5Cg+cBnZEPXHqXYGlDGRaQRuROLS0jdx/WD+zXFPawYa7fuGFrGGb
         0dLg==
X-Forwarded-Encrypted: i=1; AHgh+Rpdm8Bzh91+YYKbm0gSjlzs+XyR3FNmLe+TkdUOLFtMCAKu4XyqvldumuGsmGKuWgmrIs2fehNuWYby1a1MFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPbr6sQfW+TYd5eOU7ucAueAAryu4bsRqunU1C7s2YAp5DoMaE
	ZotVil3VMs/280/FbG31lJOCK8Tnxb8DAFE90kYmAFctjOcK2WVDgkRLfugVAqTU+w==
X-Gm-Gg: AR+sD10+dpGJSH9jOrjZFa/zYULyNA14HcUd50hZ2Qn7l9xKJcgdRgFNev4YwtYVJk2
	NgDeo/g7FYGv2YeOapjpDJg7keQ24rTISjlZ92ygLceB4vZqSUrjJihxEX7+2rs7YHymoS9ZqBi
	cvv1+T1eTvdg2YAegYmjDVW9GxNvRwcZICfkOpoPXfUM1aoqAeQ8mLQy6IRR5I9uwMIF6XG2rFc
	2eSadFJXidoIAahId9iY9WMwTbm1BZfyy3w/kDrxEedbffFk0u+v8vRjiBUVzaumTnJAzrAGbU6
	vEKIFxNIiHMAmXuifINwf8Bt8ZGRDWpUR77kX4oH/AVu/8b0bBLfD6R+TMqfc0BvnL/WZzSYz0V
	LqGmdvDQ/w8MrPlXdWDiUWOnlo1ySW0pzXX8betJtkKVvhOSt21/cfTrIwb8n1gsXVDf41UvHrW
	1odahCM3RFgDcMn+sG402P0U5k85engY3XOyOD0caPs4vAEU/zvzaVDJb0k9Y=
X-Received: by 2002:a17:902:d4c3:b0:2cf:30a9:93fb with SMTP id d9443c01a7336-2cf349cf7a8mr187361575ad.34.1784616890927;
        Mon, 20 Jul 2026 23:54:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:54:50 -0700 (PDT)
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
Subject: [PATCH v6 03/16] power: sequencing: Add pwrseq_power_is_on()
Date: Tue, 21 Jul 2026 14:53:58 +0800
Message-ID: <20260721065413.2306137-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235451_918135_EA842D45 
X-CRM114-Status: GOOD (  13.33  )
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
2.55.0.229.g6434b31f56-goog


