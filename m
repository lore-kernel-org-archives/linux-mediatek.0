Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC86C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 10:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGm2vHynu/hBFToljMIoyOJ5nVIf243JSwQjqrxxy/0=; b=QM8L+TD2SXJ7vWE4HfPrwW/JhZ
	MavHEzaN8HX50PLbr2z+F/EnqbuV0Xeq6TAMzJCeGi3Puwckz+8f2fUUDvNfa1KA44M8ysAYzgG8o
	XCD2TBU2ElZdzsQo34oKU22IgoVK2UMfXAXKT2D8c1oCd+fixwAKI8tYOf+WrKfLGpvixXPSxnNeh
	wnJPHrbz4qDfmaXo4hYrcMMuuXpmChwyvQ2CnZBpmalvAMVtkklgzIelocCYUauizT2NNav0eQab6
	urkLGNkVZrhMBfEU8AdmXECdNUAH2ODdIpSUJ4dxBQWq/j2NCXdrj8CAH3u6nQUaKj2OUbDlOKH7O
	vjXeTWNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11w0-005rhf-2x;
	Thu, 09 Nov 2023 10:06:48 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11vy-005rel-0M
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Nov 2023 10:06:47 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1cc3388621cso14306495ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Nov 2023 02:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699524405; x=1700129205; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGm2vHynu/hBFToljMIoyOJ5nVIf243JSwQjqrxxy/0=;
        b=dBe6G9szctzL1OtjSNKJMKbE+ud/M5ClXmwaf5OPygTxbRkhbA0tJ4HOcXKhPURXsv
         jPUfFG0L43V5Fzs54zAtvaLWoKGG2tr2JA5rTRt25i9wTvY2Zz5J0zHhEs8btbA7qrQc
         +79xvGyNJWQJIS3iFTgOR3kRK7xDsz3rebBik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699524405; x=1700129205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGm2vHynu/hBFToljMIoyOJ5nVIf243JSwQjqrxxy/0=;
        b=GcVfjD+SrU7C93u42D5ubbWawaJwlUFt3vppMGXr153X8ZAj4qHrMaaWCY28rlyWV6
         PoVIOLLAVEohYyGOB/lnWNxLKF3+cqBv8RxrRS+iWcmYAgkljhjaWo7/WL5XrifE6uHP
         +x+KnU/illrbs39jopsaXu2aiXxYaeN0q13hJo7WASQrFFbc6v3dOEFGjoxLXICbqsxu
         A6hdcwAcg4CbMLi400RPhuHQNlQgVR9OgXefMeJlRlamkfSWVLKlNc3b3nunv+kzCzIE
         rPpNSDyQJrjgj0zhcDZHxdZqoDh3Ybjm+CFY++RxEUAXAzjikmItU+KpnW42fL6m3Ix/
         R3Sw==
X-Gm-Message-State: AOJu0Yyq1ZSHVJWu7LL+HF2nzk/HjmZxt3PhUf4ItgvoqIv1GAxfgU0K
	PMBpj0WGl0Gob18xSQt66sbOKQ==
X-Google-Smtp-Source: AGHT+IFiKBNutMsj7ANOubArOU/tBBm0unUxGA8equMZgzL/JO0wpYcbiQ5Wq/R+556TKcVcpFKnlQ==
X-Received: by 2002:a17:902:ec89:b0:1cc:436f:70c2 with SMTP id x9-20020a170902ec8900b001cc436f70c2mr7534166plg.9.1699524404876;
        Thu, 09 Nov 2023 02:06:44 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6f57:d4c:468c:5daf])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902d48d00b001c60ba709b7sm3127511plg.125.2023.11.09.02.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 02:06:44 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	andriy.shevchenko@linux.intel.com,
	Jiri Kosina <jikos@kernel.org>,
	linus.walleij@linaro.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	james.clark@arm.com,
	james@equiv.tech,
	keescook@chromium.org,
	petr.tesarik.ext@huawei.com,
	rafael@kernel.org,
	tglx@linutronix.de,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH v2 1/7] of: base: Add of_device_is_fail
Date: Thu,  9 Nov 2023 18:05:58 +0800
Message-ID: <20231109100606.1245545-2-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231109100606.1245545-1-wenst@chromium.org>
References: <20231109100606.1245545-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_020646_151467_A4FB67B9 
X-CRM114-Status: GOOD (  14.96  )
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

In some cases we want to check that a device is not only unavailable,
but specifically marked as "fail".

This will be used in a following change in the hardware prober driver.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/of/base.c  | 20 ++++++++++++++++++++
 include/linux/of.h |  6 ++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 8d93cb6ea9cd..2726e5dce1bf 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -486,6 +486,26 @@ static bool __of_device_is_fail(const struct device_node *device)
 	return !strcmp(status, "fail") || !strncmp(status, "fail-", 5);
 }
 
+/**
+ *  of_device_is_fail - check if a device has status "fail" or "fail-..."
+ *
+ *  @device: Node to check status for
+ *
+ *  Return: True if the status property is set to "fail" or "fail-..." (for any
+ *  error code suffix), false otherwise
+ */
+bool of_device_is_fail(const struct device_node *device)
+{
+	unsigned long flags;
+	bool res;
+
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	res = __of_device_is_fail(device);
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+	return res;
+}
+EXPORT_SYMBOL(of_device_is_fail);
+
 /**
  *  of_device_is_big_endian - check if a device has BE registers
  *
diff --git a/include/linux/of.h b/include/linux/of.h
index 6a9ddf20e79a..463fbf0072bd 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -350,6 +350,7 @@ extern int of_device_is_compatible(const struct device_node *device,
 extern int of_device_compatible_match(const struct device_node *device,
 				      const char *const *compat);
 extern bool of_device_is_available(const struct device_node *device);
+extern bool of_device_is_fail(const struct device_node *device);
 extern bool of_device_is_big_endian(const struct device_node *device);
 extern const void *of_get_property(const struct device_node *node,
 				const char *name,
@@ -584,6 +585,11 @@ static inline bool of_device_is_available(const struct device_node *device)
 	return false;
 }
 
+static inline bool of_device_is_fail(const struct device_node *device)
+{
+	return false;
+}
+
 static inline bool of_device_is_big_endian(const struct device_node *device)
 {
 	return false;
-- 
2.42.0.869.gea05f2083d-goog


