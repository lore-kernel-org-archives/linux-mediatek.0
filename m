Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9297C47072
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 04:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JKE2Z3rIdCP16EvnaCbTQcF6cETDsiXZjgYQFVaGzsY=; b=w1tDW/y3qHt8oBkImuo+eAoAM8
	pZdfHH7UrRT8NQ/5XEm3m1JJb70THLc60NEbKlt4UgJ7X3BZ712DafwFGyLclprEiRMlICw2bZMH4
	IqNNKmmdaF5UeaMUmoepGnMrX8YpFwScNhv0BjX/+DRkfAwUzfGB2R/1XRcQ0hiUSbuPC/xmuLpKc
	3igBCW1EL5ErIpToPQMtRWIH1ZGqWIno7nMOwwsENdverK26ekKk2OiqQov8f0c1Lgo9In9OX6ut2
	d7zTdqPxfCz2ZeBPjO2pR2LEKeLy4vhHcarzjIWMsxM8KZRIOECeVkrHCm6o0uk8eGOXI2frGHDrQ
	MwmnxRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r37cZ-00HS86-0f;
	Wed, 15 Nov 2023 04:35:23 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r37cV-00HS7Q-2k
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 04:35:21 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-28003daaaa6so133387a91.0
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Nov 2023 20:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700022919; x=1700627719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JKE2Z3rIdCP16EvnaCbTQcF6cETDsiXZjgYQFVaGzsY=;
        b=bVZRwW/on0qyDANL/q3nrjOfzOScExwRxh2clEwjNiFnl+mOW1MHz8JfU93N6VnGEV
         GZcGhNCGu9RIZRHLvN1DJsXSUB+Dl7sAhjA7ZFZwrRIyvI897FcitYSQMhISUCNcap7H
         zxUpOHp1/OtHIOBQTCbx2cAD9ug85DJg7iGMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700022919; x=1700627719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKE2Z3rIdCP16EvnaCbTQcF6cETDsiXZjgYQFVaGzsY=;
        b=EyzxC1Yl2UjdadgH14PBBmmuVbSXax/tz3+89O+9c94t/Jxsxl+k7HSBU6zQcNCIsW
         4BYCWEpa/+p/JILli3rn6dmRTbBKtTlLNYCzH2FJ9cE1YVz4LlNOBOcBTsI3uNlhwbu4
         NmSEOHld32Fc7Ly8Cazajx2abZ4euM5X+InQSR33yxBUY698x7dUtU3P0cJPUWkiIkAW
         T8XBRTb4cL7WLwFx6p6Ga3QvQdYx8AQkqr4HyoiQNk/b3wjaeDaBFaCOBLEthV4i9IB0
         llugKc5CtoegMmjEZ4+dbYml0nooar3O/d7/F7ouA3/+PXExIkvDk0AM7NDxbkOW3Ba2
         xHrg==
X-Gm-Message-State: AOJu0Yzp/2AyQv0cqeOrIMZgZiNwWiRNHQh6hVqTvU6bWDiowbpdXCaX
	iDkVMjHz2bz1arSHs0waHn44iA==
X-Google-Smtp-Source: AGHT+IHPWARszrcyKURojq7sjdFRg5WZJqBWm7TVHsyJF6yVoEHDN9wnAQBKnHHZ3jWQAFQoYBIT5Q==
X-Received: by 2002:a17:90b:1c0c:b0:27f:fce3:2266 with SMTP id oc12-20020a17090b1c0c00b0027ffce32266mr11651424pjb.24.1700022918786;
        Tue, 14 Nov 2023 20:35:18 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:b51f:fb1c:5e29:cfc8])
        by smtp.gmail.com with ESMTPSA id gp16-20020a17090adf1000b00280cd4fbd83sm7879425pjb.55.2023.11.14.20.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 20:35:18 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v2] arm64: dts: mt8173: Add G2Touch touchscreen node
Date: Wed, 15 Nov 2023 12:35:01 +0800
Message-ID: <20231115043511.2670477-1-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_203519_961658_A87E7398 
X-CRM114-Status: UNSURE (   9.63  )
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

Lenovo Ideapad C330 Chromebook (MTK) uses G2Touch touchscreen as a
second source component.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---

Changes in v2:
- Remove the label for the node

 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index bdcd35cecad9..8836ac3c4233 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -29,6 +29,14 @@ touchscreen3: touchscreen@20 {
 		interrupt-parent = <&pio>;
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	touchscreen@40 {
+		compatible = "hid-over-i2c";
+		reg = <0x40>;
+		hid-descr-addr = <0x0001>;
+		interrupt-parent = <&pio>;
+		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+	};
 };
 
 &i2c4 {
-- 
2.43.0.rc0.421.g78406f8d94-goog


