Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C591CD343F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 09:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXZt6qBmARZ13tXsBdYUa2P85z9cDemCtuWb0vwC4yk=; b=VGd79SZYqEALx9hnl7Y3eWs/gA
	quQfuE+yryoeDqqUsl9Dz29SI2OYVcn9j+/R6pWgV3CdIJk3tJSWOreFrFeywh/oksVwqUNNpxI7P
	WAHNPEIgkFb980NlIZSqqQY45WF0M+zvCdi1inZpZflkqUlL2RfkCXcZoedHATad8f8D2h99/LlP8
	rO6/fPUUZM9p0ZCOppIkpnGYi5x11YYk6yred0Qcf2CJd0DCgyDXVVOOVBhAO4tH8CoIJLTmIOf2y
	0Uh9RJ5vk5uvNYKpqwbCE7dIv5mlh0MwgTufPyYMVZfaf5Elsm6b2uauExIbJKQQlW3qSpAMkzgG6
	uQMbN3yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoQx-00000007oc5-3xFE;
	Fri, 15 May 2026 09:02:15 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoQu-00000007oYy-1Jow
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 09:02:13 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-367d88b9940so4928776a91.1
        for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 02:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835731; x=1779440531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXZt6qBmARZ13tXsBdYUa2P85z9cDemCtuWb0vwC4yk=;
        b=XdQaADwlTEC3fWdaWdxHGdsjtBPFgy6lCnsp56OrV5kpCgv52dutDAdkTtZpk1BHWL
         w+Lbb4HYOtAEd/KnfhOxJNd1VvGGTO0pyCfPtemizui1B+UrDzfVQpWU6UK0EY2Tv3t2
         T24nooxTmLFvOrR8nK8NeDpeQ4+6caN4l/t8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835731; x=1779440531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VXZt6qBmARZ13tXsBdYUa2P85z9cDemCtuWb0vwC4yk=;
        b=jA8MfVJqyru0RU5LQCKCYMUowfb7+fv836T8fbk4nE88nBh7855B2CP/+Ct4RhLsza
         2ARaYd1XEnBeuaYeIn5SUGuX8UUPDXTF0I95DOXnNUagQPUmAL1yI5aNrEZkXXxPvUQm
         W/4AHal6XUrfPM11sxoUFNMlUMe6AGMsv1YbMdu6dx3A+m4N9GA0pQSOVzoez07hWosL
         dysTlzv/t1jTVgGFNxaWzBIAp/DKvVo5uFY9lueZG6HY7xIGM+1KE7Bz7YiP8WyLONjQ
         R9BzaqBpqG49xwY/AsY7TiMetwF1iaBRFVU5aLzkp4DHHHBW09AakJi5PyuFuWccM9lX
         Hewg==
X-Forwarded-Encrypted: i=1; AFNElJ8wV2eZKotB9Lt5yJ/6bzS2bqNgEpUHbryp0JrdLsMKdUPc2dnAdgsz373PrYJHRrk+o9JL8b2FeUiKwiA1Ew==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYd0kEd13QK+znEAvQZN3T6cLzrwK+mtNt80OGQmcStrwd8o2I
	krwIWdoEM90/0HXTZngAoSqAdfJJu16dC23WKbS2LNiV+qU1SaI+nbBawQ4p6TlMlQ==
X-Gm-Gg: Acq92OFITm/4y9pB4O1qQPqX5LOaewfXlxEhQbF//I9O3xaXJK/8lOT89vjgmm+1XML
	fHJsfsQj7TJWrPQgRU/qTHaPuyY6Gc8eYK5z2HagzQQnXwzOv3lVTwMIe0ecWhhiMjZUmMaR+ou
	xDktW7VSli+kWiqDoMmv4kIzDQ8d/grKUxgS9CLNV71KFM6j9Pt90bdI1rg13ui4dlqjho/6qpD
	M3ocPRHGJCHi4JP5vIjn6NACDWGeBVP8WME3Txft581/CdJ12O6BuGAMm8yKskmbuCIFSn7yeon
	bfYTsFr2opVaDz8MdbDjVTOTBLpYOPDFEpsCRy/US8W8Igg1AGw03WNuWKtfgAx2PpKHuE5lAKU
	8/4aQ8UnEy7vvRkOsFh4XfhwZBfsNjs9DE6QSK2EEQ0Y94ZOU0t8QoervvBHLbjrT/IxF4bnJbj
	JHRvlwrV6hT86bvwC6ilhu8hTSfyc58qy1kSifAhMFW4etoZ2UAlMPXqL/g5zpqSP48bEZjRb2T
	iB75hgy
X-Received: by 2002:a17:90b:548b:b0:366:2668:b5b6 with SMTP id 98e67ed59e1d1-36951b9e004mr3400112a91.22.1778835731362;
        Fri, 15 May 2026 02:02:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:10 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 01/12] power: sequencing: Add index parameter for getting power sequencer
Date: Fri, 15 May 2026 17:01:37 +0800
Message-ID: <20260515090149.3169406-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_020212_354272_320A90C4 
X-CRM114-Status: GOOD (  20.35  )
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

In some cases more than one sequencer could be associated with a
particular device. For example, a USB hub has multiple downstream ports,
and each port could be connected to a different M.2 E-key slot. In this
case the index would be the port number. The index tells power
sequencers for different slots (connected to different hub ports) apart.

For the consumer API, add a new pwrseq_get_index() for new users. The
original pwrseq_get() now calls pwrseq_get_index() with index = -1.

For the provider API, add the index parameter to the .match function
signature, and tweak all existing providers to match. Actual use of
the new index parameter will be introduced in the next change.

Other than the API change, no functional changes are intended.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/power/sequencing/core.c             | 12 ++++++++----
 drivers/power/sequencing/pwrseq-pcie-m2.c   |  2 +-
 drivers/power/sequencing/pwrseq-qcom-wcn.c  |  6 +++---
 drivers/power/sequencing/pwrseq-thead-gpu.c |  2 +-
 include/linux/pwrseq/consumer.h             |  6 ++++--
 include/linux/pwrseq/provider.h             |  2 +-
 6 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 14335c4f813e..1a91ee6d416f 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -612,6 +612,7 @@ struct pwrseq_match_data {
 	struct pwrseq_desc *desc;
 	struct device *dev;
 	const char *target;
+	int index;
 };
 
 static int pwrseq_match_device(struct device *pwrseq_dev, void *data)
@@ -627,7 +628,7 @@ static int pwrseq_match_device(struct device *pwrseq_dev, void *data)
 	if (!device_is_registered(&pwrseq->dev))
 		return 0;
 
-	ret = pwrseq->match(pwrseq, match_data->dev);
+	ret = pwrseq->match(pwrseq, match_data->dev, match_data->index);
 	if (ret == PWRSEQ_NO_MATCH || ret < 0)
 		return ret;
 
@@ -655,16 +656,18 @@ static int pwrseq_match_device(struct device *pwrseq_dev, void *data)
 }
 
 /**
- * pwrseq_get() - Get the power sequencer associated with this device.
+ * pwrseq_get_index() - Get the power sequencer associated with this device.
  * @dev: Device for which to get the sequencer.
  * @target: Name of the target exposed by the sequencer this device wants to
  *          reach.
+ * @index: Index of the sequencer associated with the device.
  *
  * Returns:
  * New power sequencer descriptor for use by the consumer driver or ERR_PTR()
  * on failure.
  */
-struct pwrseq_desc *pwrseq_get(struct device *dev, const char *target)
+struct pwrseq_desc *pwrseq_get_index(struct device *dev, const char *target,
+				     int index)
 {
 	struct pwrseq_match_data match_data;
 	int ret;
@@ -676,6 +679,7 @@ struct pwrseq_desc *pwrseq_get(struct device *dev, const char *target)
 	match_data.desc = desc;
 	match_data.dev = dev;
 	match_data.target = target;
+	match_data.index = index;
 
 	guard(rwsem_read)(&pwrseq_sem);
 
@@ -689,7 +693,7 @@ struct pwrseq_desc *pwrseq_get(struct device *dev, const char *target)
 
 	return_ptr(desc);
 }
-EXPORT_SYMBOL_GPL(pwrseq_get);
+EXPORT_SYMBOL_GPL(pwrseq_get_index);
 
 /**
  * pwrseq_put() - Release the power sequencer descriptor.
diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index ef69ae268059..16a332f9da7d 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -158,7 +158,7 @@ static const struct pwrseq_pcie_m2_pdata pwrseq_pcie_m2_m_of_data = {
 };
 
 static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
-				 struct device *dev)
+				 struct device *dev, int index)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 	struct device_node *endpoint __free(device_node) = NULL;
diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/sequencing/pwrseq-qcom-wcn.c
index b55b4317e21b..ac6b34e01c51 100644
--- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
+++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
@@ -335,7 +335,7 @@ static const char *const pwrseq_wcn3990_vregs[] = {
 };
 
 static int pwrseq_qcom_wcn3990_match(struct pwrseq_device *pwrseq,
-				     struct device *dev);
+				     struct device *dev, int index);
 
 static const struct pwrseq_qcom_wcn_pdata pwrseq_wcn3990_of_data = {
 	.vregs = pwrseq_wcn3990_vregs,
@@ -436,13 +436,13 @@ static int pwrseq_qcom_wcn_match_regulator(struct pwrseq_device *pwrseq,
 }
 
 static int pwrseq_qcom_wcn_match(struct pwrseq_device *pwrseq,
-				 struct device *dev)
+				 struct device *dev, int index)
 {
 	return pwrseq_qcom_wcn_match_regulator(pwrseq, dev, "vddaon-supply");
 }
 
 static int pwrseq_qcom_wcn3990_match(struct pwrseq_device *pwrseq,
-				     struct device *dev)
+				     struct device *dev, int index)
 {
 	int ret;
 
diff --git a/drivers/power/sequencing/pwrseq-thead-gpu.c b/drivers/power/sequencing/pwrseq-thead-gpu.c
index a45318b4b2c1..cb7a6ea66c4b 100644
--- a/drivers/power/sequencing/pwrseq-thead-gpu.c
+++ b/drivers/power/sequencing/pwrseq-thead-gpu.c
@@ -115,7 +115,7 @@ static const struct pwrseq_target_data *pwrseq_thead_gpu_targets[] = {
 };
 
 static int pwrseq_thead_gpu_match(struct pwrseq_device *pwrseq,
-				  struct device *dev)
+				  struct device *dev, int index)
 {
 	struct pwrseq_thead_gpu_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 	static const char *const clk_names[] = { "core", "sys" };
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 7d583b4f266e..d5d57cdb0c8e 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -11,10 +11,12 @@
 struct device;
 struct pwrseq_desc;
 
+#define pwrseq_get(dev, target) pwrseq_get_index(dev, target, -1)
+
 #if IS_ENABLED(CONFIG_POWER_SEQUENCING)
 
 struct pwrseq_desc * __must_check
-pwrseq_get(struct device *dev, const char *target);
+pwrseq_get_index(struct device *dev, const char *target, int index);
 void pwrseq_put(struct pwrseq_desc *desc);
 
 struct pwrseq_desc * __must_check
@@ -26,7 +28,7 @@ int pwrseq_power_off(struct pwrseq_desc *desc);
 #else /* CONFIG_POWER_SEQUENCING */
 
 static inline struct pwrseq_desc * __must_check
-pwrseq_get(struct device *dev, const char *target)
+pwrseq_get_index(struct device *dev, const char *target, int index)
 {
 	return ERR_PTR(-ENOSYS);
 }
diff --git a/include/linux/pwrseq/provider.h b/include/linux/pwrseq/provider.h
index 33b3d2c2e39d..a2ec6c612c8b 100644
--- a/include/linux/pwrseq/provider.h
+++ b/include/linux/pwrseq/provider.h
@@ -11,7 +11,7 @@ struct module;
 struct pwrseq_device;
 
 typedef int (*pwrseq_power_state_func)(struct pwrseq_device *);
-typedef int (*pwrseq_match_func)(struct pwrseq_device *, struct device *);
+typedef int (*pwrseq_match_func)(struct pwrseq_device *, struct device *, int);
 
 #define PWRSEQ_NO_MATCH 0
 #define PWRSEQ_MATCH_OK 1
-- 
2.54.0.563.g4f69b47b94-goog


