Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F664106F2F3
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 08:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEBDbGWMGSNIllBw+P70xdFs4cNvWJCEJNsNL7NIicU=; b=kreChxB95t15g8ePsEpcyg0Mcw
	mDH7Tmux3Ne/lgPid3W9r2NBwhrN0dbOghtAYLjujrnEAIM5vapWBoNSosuTi5UAhWVAP6q2DhbEM
	BDYJjyxuuSC+Sc3RUe1k371jqxGw7+8PZEF8sk5EAIYGLgTUqe8VikBIwvBq9PKTMYx9PhWay37ej
	t2RQkQHuOWE4B/kXFTNcFaTpJHgbaptn4pFplry/jQk8JUOCvRnZHwXFcKc8Yx4ROfYKSCILlJjQF
	+JhBn47TLN+qXg0k5oBeYb0WRvQY6CIoOJI4FCU6yKRHu0CJ2ziuTBz87ok1Ohoabux+YTAWe2NyH
	OpW534kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5foK-00000004zZJ-2D4x;
	Thu, 26 Mar 2026 08:11:24 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5foB-00000004zVS-2bq6
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 08:11:16 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-35c1107d4b7so596291a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 01:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774512675; x=1775117475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEBDbGWMGSNIllBw+P70xdFs4cNvWJCEJNsNL7NIicU=;
        b=HdE4hNT57yIbcct4s70MG2otVymTejDoXu7IRQXb/8DdEhPZUecSR1xsmAehJhQ3c5
         fs/nEoCRhSYxpxn7nAiOngLF4aGRDMuuiN+ICLUtle6En3okaAEtsNdD/2pnrbwl9Gvl
         pAV6OFz3rycSxDMn+pmePRjQ+pHzkUHNh0f8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774512675; x=1775117475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YEBDbGWMGSNIllBw+P70xdFs4cNvWJCEJNsNL7NIicU=;
        b=r5EzL27M3vBS4DVC/y4PxQFSd90a9Ej8SjkWqMy+G51avSW3HyTC6N99wBtDjFJLZ1
         Chg+JJX1c2O9A99LO0+kYYl0niLJDU+61mbG7RAOPM3WSUfi7APILGHLQaFjlAgoC0oR
         vnp8UBFul/B5wPybPU3A4EVI08VX4JelVa0O900CFlsBDDgx2P3389pIouWPelPxdZ2+
         AqorjbcDYxZhojObZ8gO3gPIcvED2l3frw7NHzt+dY/8GJ4mq0IPBqYXrV7R4vQzxiW6
         6IK7xLm+brXLHLbZiSF88i6boRgBNn+lzCmjLQ8dk/wOC6XDbyayhFl4cRFGpICHUU+z
         GFMA==
X-Forwarded-Encrypted: i=1; AJvYcCV2qh8pK0vaSrkwc2swHgC9Xrinlqz0cPBwGYM74y7L6rE5T0hh4A8z2VONb4HSBJcNLkl9hF/79ZW0olLIbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuwypuYwUnA6/1kFB364aEDYThPKPnE7cVHTMPQjU/7Y1fyu9N
	cVslfDbWx5Hb1RRK8h/td3vOylESstC9VZBy9ZizFlRX1oAURNpcHem3Wd41zZHQJw==
X-Gm-Gg: ATEYQzyrX4U4V2h5qwzxH19QVbyL1z9Kkbdsj6XFg1+mSXEy6VRJHnGquHzDQyZ4RG5
	SkhT6dg5JH/U6++goh5ZIwMgz26DWI8BVbwpfvl9OUlAlsxizJ4vRr80EY28B2+WEZW4otHLYP6
	vz7zPD6esVii31fn8LXh9l20gO3UW5X36IKaDkMrfxtLQncUG2WNJBre+38oJvbwyiueuD769va
	SN030SfJzX3nMcwyrFthgCNzSkTfZkzivkTm9yDAPIGw74ZK7OWxigYy/+YN3Lz29K0uIj9quuj
	C7abEU3enKAGqPcomWdD5PHeqURV+slu/nizcc02BqctaY8V0L42n84XnsS9+Hm1h2RTbsbMAFr
	Xwtb0t3rFQRgezXux9x8b0z3uF2EEeIGG3EsjDkU1/LBNbqrmaVBREdtXUmYutOxQM519SBWGeP
	2GftCwRli3uJfXXtxqVAr2j3Rs8M2/9vkgRbpgF5vHvMsq0fH/FjO40jSIWcmVJxB1xr99CnO9h
	+0iUrx+
X-Received: by 2002:a17:90b:3a88:b0:35c:9fe:a58d with SMTP id 98e67ed59e1d1-35c0dd0949amr6018363a91.11.1774512674744;
        Thu, 26 Mar 2026 01:11:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d09573sm823452a91.16.2026.03.26.01.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:11:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] regulator: dt-bindings: mt6315: Add regulator supplies
Date: Thu, 26 Mar 2026 16:10:48 +0800
Message-ID: <20260326081050.1115201-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260326081050.1115201-1-wenst@chromium.org>
References: <20260326081050.1115201-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_011115_655521_79ED2483 
X-CRM114-Status: UNSURE (   9.85  )
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

The MT6315 family of PMICs has 4 buck regulators. Each regulator has a
separate supply.

Add these supplies to the device tree binding.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved *-supply to top level, same level as compatible
---
 .../bindings/regulator/mt6315-regulator.yaml         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
index fa6743bb269d..1c63265907f1 100644
--- a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
@@ -25,6 +25,15 @@ properties:
   reg:
     maxItems: 1
 
+  pvdd1-supply:
+    description: Supply for regulator vbuck1
+  pvdd2-supply:
+    description: Supply for regulator vbuck2
+  pvdd3-supply:
+    description: Supply for regulator vbuck3
+  pvdd4-supply:
+    description: Supply for regulator vbuck4
+
   regulators:
     type: object
     description: List of regulators and its properties
@@ -49,8 +58,11 @@ examples:
     pmic@6 {
       compatible = "mediatek,mt6315-regulator";
       reg = <0x6 0>;
+      pvdd1-supply = <&pp4200_z2>;
+      pvdd3-supply = <&pp4200_z2>;
 
       regulators {
+
         vbuck1 {
           regulator-min-microvolt = <300000>;
           regulator-max-microvolt = <1193750>;
-- 
2.53.0.1018.g2bb0e51243-goog


