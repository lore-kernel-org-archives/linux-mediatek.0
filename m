Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9405AE77188
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jan 2025 13:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DoP8JyX0Rn+t869X/69C5AdIYY282FJMkh2+vYUqvg=; b=C3EbJ6Rd3BWL0pFB7dU4ULzFN/
	3KoAPd+f2KksIr5WvkCud1djhitd6dQ3aqAExw1CELqAVnZsqYqJ/QOq78cnZpPBtGoxLJkbmSFcn
	mONXCCsUXGqU29Yg67KgTVdc00WLjO7jDmcvbAWgnoe7lOSlG2WAymRTDuLsasPFAFSWSkwboOCZY
	a0mFMTpfN9r4wto63p0IqnXA8t+HXp835C2LDc23l6ec+HfNhxNrORkxzpWxPzqYKjq0zJpTc1ctp
	kMNayjxTiR2j2jvhMGtaKqOkmENLsUq44a88wX7dhDQjISeQaDAw0Aug3eBZoxCaBTpodPgdn3DxO
	P737U17w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyKO-00000002oLM-3D5p;
	Sun, 12 Jan 2025 13:48:32 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyJ8-00000002o5f-3w2i
	for linux-mediatek@lists.infradead.org;
	Sun, 12 Jan 2025 13:47:16 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d8753e9e1fso632797a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Jan 2025 05:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736689633; x=1737294433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DoP8JyX0Rn+t869X/69C5AdIYY282FJMkh2+vYUqvg=;
        b=HDCABn4muM7+ljhDkdj82gjdePV2ZLfxnUoLaBqMRZmMTv9cGY0u/ZScd61qTTgVZ4
         GSrro7H+l+QKyQrCAhLZAeXrUf2GawUNuGFm7zn5PGoigoxbLzJd/zZ9inwGy2uTmD9e
         VGWpHm5/GHLFBEHdpGuSlRI0bE73hX2YD6l9SaaUaKYJ901hbEFoDj+OkhmS0m5pctVz
         Glm2gbpY0qBUZzL7IzC3vqcRKIcYPU7JwlZIFn/vme/wsZsAwTq3IAJOvMLgEP7FMgE4
         iWpMeLkIGGYHK5jA0G80h8IZvkZtKogUGbs6Ol3PxXRP8sdFl0OoNjShj94cZJJs5o2k
         jbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689633; x=1737294433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DoP8JyX0Rn+t869X/69C5AdIYY282FJMkh2+vYUqvg=;
        b=ESRqMIwvy2hE/EDk/wvkMzrkIjKjFUfar5W2aY+MneNZQV+Qfs9cQMXT8L49DXXsZX
         fjPFjastkCenOYUT0XyX98fhZv9bWxn3rDLVTpEcu3BaH3QxQdPS/pdw+NQggoZOhU3j
         NrERKmR5KhgyTHCivJv4/EZb2YXGQ0BUsWxTgac+ZosD7S/Q/lsZMI32M1RK0/hI3fTd
         Eo/xhzGzXK/ZrXbXy0YPsxSXByVSUBcQngcxd54luGYV1LK2Ce799XOh1cvz4EOf6wLj
         DCtBOgla05D6/LoGK25bZHH7vcB4uR7ewJgPOesC7GvOgcM3v5p8WCRKHIXFhnkgCbJj
         i73g==
X-Forwarded-Encrypted: i=1; AJvYcCUXeLrgM5PkcRxhcyMEM7UdHeUxIqLRz3EiE72XxUByfNu9kBrazQ3fsMbzf297NUFB0F2mqxw/lpAnZW/61A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9KRYvRa4AGyIBibfd/vMc8aSRzUss52zQoQ92HAW4qNXMnGE2
	ep/xAHNB3cslKmqcvCNa04nzoxfsSP9uRiVP2kV0sGf8/fRlK3xi8HNHD7uEjAQ=
X-Gm-Gg: ASbGncv2RCJ6Z5YnHS+xks1UpBy7ZbRa6Ccb/Nn1CwGJRH7WuEH7U51GRAYSDgJECLO
	GVx8cOcHlqa9BKJrIc4hO2TwHeRgKZYiUcOj9nmPjus9jCn6mMpj490UTHlp2Hu6uRaPG8+NOvS
	y8JIc4TZqY7wU1RyymJsR4ZH5XFKRDx2QlAtoCR4bjxbPLvU4YGxJQHJLmwdngGRyoGLeuqLFvu
	tWJ8g+Ddyr4JMXNropB9gPKoRN8Govj7VJYvyi44ojqj+jmdFnXWwaT9ZFbL+SP09zsOO4=
X-Google-Smtp-Source: AGHT+IEHAXrRzzhrt3gFm4JeAOOOtrjD1qbFZyqfcMZ+AbnWgJcTH3bD4AwNeCzDVpq7CMRHO0fkfA==
X-Received: by 2002:a17:907:8689:b0:a9a:2afc:e4ef with SMTP id a640c23a62f3a-ab2ab60355cmr584894566b.7.1736689633230;
        Sun, 12 Jan 2025 05:47:13 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9060c00sm374899866b.41.2025.01.12.05.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:47:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] drm/mediatek/hdmi: Simplify with dev_err_probe
Date: Sun, 12 Jan 2025 14:47:08 +0100
Message-ID: <20250112134708.46100-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_054714_993926_9FEBB1C1 
X-CRM114-Status: GOOD (  10.68  )
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

Use dev_err_probe() to make error code and deferred probe handling
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 4b0eb7dc25d8..22935fdc5afe 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1429,19 +1429,13 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	int ret;
 
 	ret = mtk_hdmi_get_all_clk(hdmi, np);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get clocks: %d\n", ret);
-
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
 	/* The CEC module handles HDMI hotplug detection */
 	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
-	if (!cec_np) {
-		dev_err(dev, "Failed to find CEC node\n");
-		return -EINVAL;
-	}
+	if (!cec_np)
+		return dev_err_probe(dev, -EINVAL, "Failed to find CEC node\n");
 
 	cec_pdev = of_find_device_by_node(cec_np);
 	if (!cec_pdev) {
@@ -1492,10 +1486,9 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 
 	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
 	if (!i2c_np) {
-		dev_err(dev, "Failed to find ddc-i2c-bus node in %pOF\n",
-			remote);
+		ret = dev_err_probe(dev, -EINVAL, "Failed to find ddc-i2c-bus node in %pOF\n",
+				    remote);
 		of_node_put(remote);
-		ret = -EINVAL;
 		goto put_device;
 	}
 	of_node_put(remote);
@@ -1503,8 +1496,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
 	of_node_put(i2c_np);
 	if (!hdmi->ddc_adpt) {
-		dev_err(dev, "Failed to get ddc i2c adapter by node\n");
-		ret = -EINVAL;
+		ret = dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
 		goto put_device;
 	}
 
-- 
2.43.0


