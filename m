Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66D01093191
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fCSFArSeRGuw+2+Xzv9uC9S50Pu154s6zyJ30lpqjc=; b=T67CKJSzXeYsFLYChgW0oyUUgy
	iJa6AqtQusuage1ULhzanPjUYOLCvHPg6IFfrD8nsZ8F8yrIwAarNIo5hbtJPC7K0RbGmIKRgBUdz
	wqMyroL6d5JK/rnKUlXgs1hH+H/aqFZj2YG+oFSqsxC1fjMRSDOEbksDboRHwQnjqb/PwLdn1CoCk
	l6b2/M9OpwJnpSjcYja5ydfZxvXlBuWVWP1mGyN2CSBYkppDSvwhTjYQS+cvL8EDXCt44mRSM1ehA
	t4CloDWPz1ZpOD510TZH1ixlGp6goOQbCuzBE3YqwjpO2+0PzTaeAaa2f44jFHdgrEfOOmBdHemQ2
	CQ1n0yLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSx-0000000CNuE-3h9L;
	Fri, 20 Mar 2026 08:44:23 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSn-0000000CNkY-3PMh
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:14 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ab46931cf1so23743285ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 01:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996253; x=1774601053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fCSFArSeRGuw+2+Xzv9uC9S50Pu154s6zyJ30lpqjc=;
        b=KfnCLuKoMEFaafWiD/vHuB0gfrVD2CqNmfZUVtCv+7z7lcEMauj0vFjQW/1fBgF/Uo
         rVv9Yjvk1m5azUI+Sh9iP3UTfGi/ppM+bx8YcotdbOs9jMk6Ze/K22brHe6otwYHPuIg
         foc5sR2SEGDHk/+c+VyENDliEuyNj+z+AK9dU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996253; x=1774601053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5fCSFArSeRGuw+2+Xzv9uC9S50Pu154s6zyJ30lpqjc=;
        b=H+ERW5Th5B+NYpBhMaR9FymVlcqAdnQ2s3jXjVyaQZa5sZHqqku6OngPyYwduLkAwq
         ZzgkkwgU09wXfjT1sa2DMty4kFS21j3rgFxGpHItHXUiS6uLGG8+zWEQpxd6RS/4PUoH
         Kn+BbftfdEn5NXmthtPiEQz3TkyvNSxnEt71OaivT9YklYM2IVocp63ZuRJeKsaKy4ZM
         vkZ/UPzn42tbmPLsROwGmWFgAzFKREkKe68pIb+YtuwvFs39izsjrBgAJovHlueEUmEs
         aMZwz443Gfv1SUBpKk0yFyj46z+/FwCHRQ9U0mg6RUA7rwvjPfWFigR1fq3RqqyCfb3p
         ARaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaZ1mZ1BKM3x8onq5dMlnKD4crBSU86s6Xyx464iHAHs0bVqf1cc2gbQWIQBQiRWoRm/OBuqj7BDDJce6FlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxJC3xbcAtUK+59Gh8M4NF72wAWfo82ncoDRLfhFm1zH+B1rwY
	jh6Eth6Kqk8WEjjF2Rm5/c0/T+NixwNTz03ildpUGLkNJGFVgjn970joLlKnu53gsA==
X-Gm-Gg: ATEYQzy+DP7uqz6Djg/MV7QOHkjTNPXML9ExT0cIYy41uZ+5ifh5GxWmT557CEd1U8u
	tz2yNuvddKHihlQhctQ08E38vZGUf59vBtYFncPczqzHfYgvGXcwdyzCqfBsc8QbQvttm6YbXb4
	vKcsnUyg2EVBe9NBob/F1SfMVihqZ9VtRIPmBLkbiBoSjRq4QO+op0/5U1+8MhMFi8NjuH6tXmZ
	4cZ8vO//fU2uHriz2TDRMjC1oSHbnkMwV+SK3bUUYtkebH1o3fyjWrtT3uBCAo+fzPxt/Clp+cQ
	ryw8/J/XXTb2yXxky466Je769IihsSXeGgDCrHMVoRzNI8eXvWtrnCihrYUBb7ZZxIf9tb0ZVaS
	dsWA+ivaQTE0QHDLlZAshIhxoeOMz9i1oAqj8ses5DsWSYJ0TItvhq0HzFchrz1uKk+viPZDHE7
	/s4pspJc8cGyauYjZW0OYKy9F34ec8M2u6sUrmMGDBwHL8TQRRU2vP8braWZuIXZTPM1Wl9c9hY
	/QHR3LW
X-Received: by 2002:a17:902:f683:b0:2b0:5722:f89 with SMTP id d9443c01a7336-2b077143206mr55106235ad.7.1773996253228;
        Fri, 20 Mar 2026 01:44:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:12 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/13] arm64: dts: mediatek: mt8192-asurada: Add CPU power supplies
Date: Fri, 20 Mar 2026 16:43:38 +0800
Message-ID: <20260320084351.2461060-7-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014413_858627_20471E60 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

The device tree for the MT8192 Asurada is missing power supplies for all
the CPU cores.

Add supplies to the CPU cores. The big and little clusters each have
their own regulator.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index f4c8c3aa7a57..143f7f4161a8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -299,6 +299,38 @@ &afe {
 	memory-region = <&afe_dma_mem>;
 };
 
+&cpu0 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu1 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu2 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu3 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu4 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu5 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu6 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu7 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
 &dpi0 {
 	pinctrl-names = "sleep", "default";
 	pinctrl-0 = <&dpi_pin_default>;
-- 
2.53.0.959.g497ff81fa9-goog


