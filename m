Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338F6C88E5C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 07:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fm2NU1dVk2SpuJ0fFyLgsSQpwqAtZZWxE/JzixP9q9s=; b=elLvGr/eppS3fnisO+FuGqvC4B
	tX1+oaN3PG2OGjqsY6gYPoJUDVcI16NTgqT2Bo2vA0IPuXgRDJwAKLshD8mi9KMsq/OxdVu6Rkf9U
	ok7tgN61LgCYQidLopqxI+UiC/HiG/W+yVll9stpJEvAjSYSctfvwwkVzK9McIDGuaA9IiNPPaCPt
	pzcVikY57/XWCufY2gnrzcQscMP7NU0GfSAFiXvwB0PXwE0Hu+Q+3gTAT6LI4YQzDTKpmCGLlaS+T
	K4RoS9TS73ZBrSDDWaiYIjmlNMZLo/4wcbxcnd0kAAmrqoufHr/h9Fl9Yp28thvaZ8r3h7AAfrc40
	G+IxS0rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXq-00000008e1p-2Xx0;
	Wed, 16 Sep 2026 07:59:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXT-00000008drg-0J6A
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Fm2NU1dVk2SpuJ0fFyLgsSQpwqAtZZWxE/JzixP9q9s=; b=jCKw0/gQVRqbxpwiLEobdhX2Vz
	qgzZ+ogusuE5s8LROKF3uDrp2hRoLUtnchX2hmRW75j5nw4I/8EjFQ9aCcQerBDYCcXbyGfO4NFuK
	PuWtpRln5yYDl6A7xdyL6/sv6xVMVsy5iXSfDHOc+g87NFk/7m50YOoyIz3ydKLHFz1zubtaUpSa3
	38R0zP6+d20YYKW7Bi0RJkZ3s6O9wteFa+UwAjJDfbrDYAV+Yf70QlxLAArAQxDq+UmDeRFCucQIX
	vPAmf/+2gEoMfVB6ANFgo273aSB9VfU6PUoryoLuRJ5CrngPfLveIZTae8xe3F1hFUon1xxzffVXE
	RbkoDXIg==;
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kXQ-00000007bW8-0nyd
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 07:58:41 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso486957a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 00:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545518; x=1790150318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fm2NU1dVk2SpuJ0fFyLgsSQpwqAtZZWxE/JzixP9q9s=;
        b=U67FzxEsG5pkpTPSr/WrDNYJ2RAyT5MMaH16VM5w7psap+YXfe4VWl4f7iO4q/FVWe
         X+VqJJvUO4wCd0ebKDO0+/h/rQZv2qIwxZrTzGugNG97DBZkS+tgR5OrH2ORYjbHx7J0
         bR1+KNn9cWAE2W98bovAx86tXgGmJ75VrelSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545518; x=1790150318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fm2NU1dVk2SpuJ0fFyLgsSQpwqAtZZWxE/JzixP9q9s=;
        b=FoLPnj0HQzJmbFKIlZk/HQtGtKsV3UeEOC+gKuekXD2QHqUYc7Am+Mm5boWGnpwuFP
         LXdrAylVv3QBI+uMiDBPg3cCz2iUX1DL1LvT7S3sq86khXireSrnbP7Pzk/Ik1H4TaWL
         z8CyZCWEh8Ay1ul/sQ5zYmSIoAAYQue1OF7ztXM+CNj/uYg5wryuiiZl91zQvWR6WccW
         olJm2Tvc9k/V2krPROc/EhEJEUTnuOfQOujW1CP3QrBAgZlF2Qm+VedgnD+2Niut5t1K
         vNz+AEfQw0Mu8ykc3etQ1f3wjaIwZHnKpOegWJsRoyKVduWBX/TcQu6IG39T4tqCbChf
         oPpg==
X-Forwarded-Encrypted: i=1; AKwUvBxP/q3veC3tCkmLgeiTFhhErDLKxnmQuZYU8Hde1UtFUc3ekJTQQi6f9mpnTG0bipe2h7Ic6haaLFBuZXxHDw==@lists.infradead.org
X-Gm-Message-State: AFuF++nyxWMG2ktLokMRR6SYH/q99I83DBe4KpoO8QUc6ho8XkZw757c
	z7u2UN09vVLdQ+yNSSU51X0g8K5x6CSd58lyPP9aDwrM9sxRC7UbkKPx2VPUn2onLg==
X-Gm-Gg: AYBFou224AM1HmQRr/AKR7/REjCFQDfFN+MFEQXy0E32dYkpnAY32/O/K+YI1hutDah
	nuzXE2RJkXQuhpDeW3mkZZCOANUWBw49+dcoGeUtkxAvyxCkAFXzopvZY8WMj3PF5qdf7OvIW4/
	TPcpj5nkAffgbPVLEMIDrSkMUE3MoIo8ZtL8lbHHzvwH6UPsLJt8v1raWyFZWTY25LVvt1aOaci
	ZapaZsdq4+SCIMSDzdfmz81GXoBlSgeTx2C1z4XfWVcpe2ewMqe+LgRM9eVc1McnPecDwARDL+P
	VTlX8p6i057nNmk5Kj2Aqz5E9wc/lmh8yUlwF80DOy23lf5CNdvqvqtzGq3FVxeZsGi+ey+5bQ4
	sk6YHo/zI5BcGKl2+iTsyL/G2L3fyVq/HBhlgt84Y2UXGsvnJoXPfdFrBIbWzcQsNZJmFHRV0PJ
	3ZO0Zayrf63sn+GAWYvb7hySlr0vS/Ct4knpAFFW8WIPdhif053SKaVuha0G+D6DAFLci14L8aY
	BfUpqz9BS/5armv7puu0S0u3YanXUHfR4OcBZ965b+AhKd8qWirbEe1rw==
X-Received: by 2002:a17:90b:2885:b0:39d:f130:8f13 with SMTP id 98e67ed59e1d1-39e1e4d3357mr4064349a91.21.1789545517871;
        Wed, 16 Sep 2026 00:58:37 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:37 -0700 (PDT)
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v9 03/15] power: sequencing: Add pwrseq_get_state()
Date: Wed, 16 Sep 2026 15:57:29 +0800
Message-ID: <20260916075745.3549953-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085840_358955_7D3D6B72 
X-CRM114-Status: GOOD (  14.35  )
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
index 3076b3879af9..8e06fe77fd6a 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -971,6 +971,25 @@ int pwrseq_disable(struct pwrseq_desc *desc)
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
2.55.0.1032.g73a4cd73de-goog


