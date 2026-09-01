Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C5BC61DD6
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 07:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=377z9agroO9vgw/MPipyApHAj2rPTrxxSFp/0FEh+cY=; b=OdYam/Z44SEfnmv26IvF27Oz5n
	wiaDW8Z9JNIWoxL0kIFQLNPGeaIVdvKPoB/1JV8sExFd02Amfl3Dy0bAjdr6tgVra4W4ExRItTy6f
	+MwcFkDE8y4DNKIEyZIfbn2f1VN9HvVz4c6DwEqAWt2EgXazyF64dhwnzVNZKOfiFRG6HTprh70Xf
	sH4ckjGsUvEU9p68dLGGpnlWEiIuIfZ44yNqI/bYhuxlJSyzs/SkWfcyPcMOyDNfmKsV5uTk+iFae
	hGhzKr34yTpdN/BRL8vfvfy94UC72ZnZfEaBMnwC2XDAWBihx5StsdlQIoq848jrmp0p6zSp4sg6a
	XMrzmT+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JG0-0000000BAIc-0JLk;
	Tue, 01 Sep 2026 07:50:12 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JFw-0000000BAEs-3aig
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 07:50:11 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2d715f4a587so8227465ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 00:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249008; x=1788853808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=377z9agroO9vgw/MPipyApHAj2rPTrxxSFp/0FEh+cY=;
        b=VcuG+5cMmvqpM6rwD0dwYl/4sszuxxK19A77SPnXvpfl5voP9jEAYhqH3Uv4oweRJq
         VRSD9xbN3EeLA4RpP5efqAXhKAsUJsqO5EyvOU/zJ3UwSA06Qg5Jrr5+k7MWzEbDU9Tv
         Nkkr/NG6cBhilX431ZO7qRQc28pMkez3I/KBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249008; x=1788853808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=377z9agroO9vgw/MPipyApHAj2rPTrxxSFp/0FEh+cY=;
        b=YKgJyR1SZ0xRJsd42baMyF6onlbS6+hR5jS4lluMbN3m8p/jT0BKvaPQTP1VCFtKMX
         bFKTE8U2BbXkLZFKymdf6phasEsMjAHNMkpu1jrj9b1LRJ0kIv6UMk9iVffwrCh564/1
         n/OsbCP3ZRDbmk8Hqd8di+io0CEeIRc1u83nw1Z5fvqwcWMNiEki7UGr1t7km4GlEaND
         cHBA3xfUTxjmJuDcXv6K3anBuOQniwjRmi1cgfmsZtWCdRCoeHIoCtMIBzNBE0+v1Swl
         GPLJ1lhhVN77r2eHLbHVSkIab8BTlv4xasgTIqNy/+03mZCwjhLvS5NMwA2CRPO5V4TW
         p+Rg==
X-Forwarded-Encrypted: i=1; AKwUvBx31nwIzl+Z1gkjUHrKAZZgPop51Sg4fOHurRWoTcNwPDoRAy/7NrGFMHwT9c063iZ5jDM1q3ANTTKy9lGztg==@lists.infradead.org
X-Gm-Message-State: AFuF++l4TzKKpoGNQuz5cKDbtgRPcGLv162I9vmdQJew1pBp96P8WWmF
	nkAX7JU7IeOuRwdr1mMo2KlITT+HAhj+Dcs8Xk+Ip/Dl/FSbOkEnsa9JRqNHrPRGEg==
X-Gm-Gg: AYBFou2LQ3MnCvRj0chtJCKgWUZYKGu1iS1q2XEM0C3DAM1Lmmz71QzlklDhAtUO2Pn
	vkf5JwC53Bq9M5Lw8kEucboIpRrKrjLjLNaw85qci+8gIzoDidbDA3xBOyvGKFwPVFWTzJN1Pki
	YTtAF99CZ4kWOywiXQmmM2Yv1vFwWIWy4BOZh1h77O7gapi7rh+9Z/3GhEZfefYN7+yHT96PkEP
	ls5t/egSq2LcyBSmHxCvAMI9C6tU7cF5ERCGaRncD+YGiORXx5xqKnMYpP2MBmzBmCuKBNkT031
	rwXOTrum9pDvx6fY9EZDp+TBdmQtY8NmMLbjbMV2wO9kWZQtw56DkouoE9yQbg/Arhqvjxo+f7q
	a6hEmN7p848SEP73tRaV6rA5LvRae7bkVI4aPSozAZBhoagVSF3KdJYptq+fQG9/6+2pav3eRUk
	R4S/ANwqZdoC9z/vu8p9+80O82n6SIqAnjlZgc41PMVM2ALElj5nCjGsZNkIBuFBwd5ECrOwY4H
	UNFFCVvNe3n9g0tuJAsv6ColgCT3CAvw2/bYQaAt6krfg==
X-Received: by 2002:a17:902:ef52:b0:2d9:383a:30f1 with SMTP id d9443c01a7336-2d9383a326bmr139940935ad.4.1788249008298;
        Tue, 01 Sep 2026 00:50:08 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/8] i2c: of-prober: Let cleanup op know if a device was found
Date: Tue,  1 Sep 2026 15:49:23 +0800
Message-ID: <20260901074930.764550-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_005008_902920_25B1FAE9 
X-CRM114-Status: GOOD (  18.04  )
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

The prober's cleanup op may want to do things differently if a device
was found, such as wait for the actual device driver to pick up
resources.

Add a parameter to the cleanup op to pass this information in.

Also fix up an incorrect reference in i2c_of_probe_ops's kernel-doc.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- New patch
---
 drivers/i2c/i2c-core-of-prober.c | 8 ++++++--
 include/linux/i2c-of-prober.h    | 7 ++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index f9f3c0ef93ff..97ef58bb4c04 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -130,6 +130,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 	const struct i2c_of_probe_ops *ops;
 	const char *type;
 	struct i2c_adapter *i2c;
+	bool device_found;
 	int ret;
 
 	ops = cfg->ops ?: &i2c_of_probe_dummy_ops;
@@ -159,6 +160,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 	if (ret)
 		goto out_put_i2c_adapter;
 
+	device_found = false;
 	for_each_child_of_node_with_prefix(i2c_node, node, type) {
 		union i2c_smbus_data data;
 		u32 addr;
@@ -171,12 +173,13 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 		/* Found a device that is responding */
 		if (ops->cleanup_early)
 			ops->cleanup_early(dev, ctx);
+		device_found = true;
 		ret = i2c_of_probe_enable_node(dev, node);
 		break;
 	}
 
 	if (ops->cleanup)
-		ops->cleanup(dev, ctx);
+		ops->cleanup(dev, ctx, device_found && !ret);
 out_put_i2c_adapter:
 	i2c_put_adapter(i2c);
 
@@ -388,12 +391,13 @@ EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup_early, "I2C_OF_PROBER");
  * i2c_of_probe_simple_cleanup - Clean up and release resources for I2C OF prober simple helpers
  * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
  * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
+ * @device_enabled: True if a device was found and enabled.
  *
  * * If a GPIO line was found and not yet released, set its value to the opposite of that
  *   set in i2c_of_probe_simple_enable() and release it.
  * * If a regulator supply was found, disable that regulator and release it.
  */
-void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
+void i2c_of_probe_simple_cleanup(struct device *dev, void *data, bool device_enabled)
 {
 	struct i2c_of_probe_simple_ctx *ctx = data;
 
diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
index bb6d47f50ee5..f28a40780d1f 100644
--- a/include/linux/i2c-of-prober.h
+++ b/include/linux/i2c-of-prober.h
@@ -45,7 +45,7 @@ struct i2c_of_probe_ops {
 	 *
 	 * Only called if a matching component is actually found. If none are found,
 	 * resources that would have been released in this callback should be released in
-	 * @free_resourcs_late instead.
+	 * @cleanup instead.
 	 */
 	void (*cleanup_early)(struct device *dev, void *data);
 
@@ -53,8 +53,9 @@ struct i2c_of_probe_ops {
 	 * @cleanup: Opposite of @enable to balance refcounts and free resources after probing.
 	 *
 	 * Should check if resources were already freed by @cleanup_early.
+	 * |device_enabled| is true is a component was found and was enabled.
 	 */
-	void (*cleanup)(struct device *dev, void *data);
+	void (*cleanup)(struct device *dev, void *data, bool device_enabled);
 };
 
 /**
@@ -131,7 +132,7 @@ struct i2c_of_probe_simple_ctx {
 
 int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node, void *data);
 void i2c_of_probe_simple_cleanup_early(struct device *dev, void *data);
-void i2c_of_probe_simple_cleanup(struct device *dev, void *data);
+void i2c_of_probe_simple_cleanup(struct device *dev, void *data, bool device_enabled);
 
 extern struct i2c_of_probe_ops i2c_of_probe_simple_ops;
 
-- 
2.55.0.897.gb25b4bd76c-goog


