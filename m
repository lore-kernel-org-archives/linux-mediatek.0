Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99494F532D6
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 05:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WE9EB/AJhGsAQ2IQOKEBwLjZmu9qCQYkTkw3Ul7ABII=; b=gUSCOD+BZR0XUo0C4Th1SaMv3F
	Uh+QGP+y46fagDgB7qSVaBNt+qD7xcA4T/yBtWIYz6JHtsE/fmXAYQLm267VpvGq7yHKzHpHgnQtk
	L1fzBS6Q03xWdCV9I8nbXVyJaBlk2TFqKHZcij0lTapnZ34vSiNJe3yMnSWzU5/ONxuaJDxbQtZdr
	ot5ifPEUeqVjpKAYDAYTkeegBsdiGM4ELGOqjKriO1W9xUfX1CvdU1rgCCzadc6Bc00G4MdcimiI8
	frtCKRGai0sL7KFEZXQKXlxJyT8DRCiis7FZFYqQolc+qIerHv3mHUdlrQSXnJmBtxQjxY/HGRvJW
	aAofZ4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uLv-00000000aUn-3HQc;
	Tue, 24 Mar 2026 05:30:55 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uLo-00000000aOh-2tCS
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 05:30:49 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so4013130a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 22:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774330248; x=1774935048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WE9EB/AJhGsAQ2IQOKEBwLjZmu9qCQYkTkw3Ul7ABII=;
        b=ZQxKS4oriNBYMJ8shKZ5osQPXJeEAHonlZ+09hGLUtEDQKim6iwAxKx/I1Rw/f7d42
         fIbPHcqWzsUkM8tQp84mas6F2wzzTuSVe/JcKXPX27Q84z+EvHSg51qurZ7ZzlUisYU/
         3yqvjmt04gbftetV9e+iFFJUhAlKdYZz1w4Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774330248; x=1774935048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WE9EB/AJhGsAQ2IQOKEBwLjZmu9qCQYkTkw3Ul7ABII=;
        b=cKrIcusZwFol3JasgWawRXDz3Jh4+TmZhi7aOG5lAIGyg2iwnUfyVuroi2wJJTQrmJ
         ttfcrX8fcrYvFpM+HUaIa3fsB7swcQile6shGq/XRK5RN340KZfQE42/cpoEDTxUirQL
         Ax4/Q6wIX0qIj5sBPyRk0LtZge3qvrEoJmfeSRw9RROSym3EkLeBv9TfY+166fgbHwRl
         Rl4BbYsTXge/ts7ULlkZ24nIALpu6QSNLie6y+5yWotqGXZO6HAflVXUt9+GgMo37/sS
         XPMkr2G2tdzFViM6Y+70K74Iff+O0ly67acPhxxPUZBpCmmtvV9gNCaUAw7ZVwQUbLVQ
         944Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWTsMstRYjqjPDUotqsAkS80WHU8sKC1QSuEaQpdS25706AUeSCBG01QvOeYiro9znrvRDEhpUZXwb6aju5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYosWkkEEeh/+VpoU7KZTxQYc8wgBMvpwy0VNnTpmR3O8jBRQD
	1izNFOiQsU8IRGu/0b8hIWKZNSccZ77kL3Nz7QrZW3Mqqc9J9f0DgqtETuG0zEKYSA==
X-Gm-Gg: ATEYQzyngOu5alG6SHclCT6ppoYKwJY2DzS12CBnghx8+tx7/U/CUXeuKdCApNtEz06
	tsEA7y4rPPzIhYTZEIKUhYcOhGboJL/vY2Xdya0wE3EfP6aBLydHrlKNk8lT8Z3AuJwMUfaVj5D
	K9CrNhrukeys4q+fVm+imMpOAmvHSe7YASXTKMIEB79WPO2D/yFi/EJfMXHEGcgDrx+YCrP7fhF
	eRA0fGJCKWpgSEnPc3jAJvXOkvJU9+aPNLpBhlgitB/I8I6FrVNcd6kvxCbvrUb75XRVV+/FM8z
	rZrpbMDPswe5mW2xNNqjYgBE9cXObDe7Fv4dOd9IHJsHjrVWWl3CtuWpzLX+Zn8WBJW/b11X77H
	au6hVb/IMEMoG6QFFIgvQb79b/Me334kg29sHR2EK3Q3RxXbGPCTy4Jt2TTl4WeV1BPhTy+b6oa
	yMja4kSIqKbVHz3rDpXFRAfTsUX4Dumcp/7KuqiZD1knCzhvWybsA+k73PJw2/DXkP16xc3feTP
	AuVsVs2
X-Received: by 2002:a17:90b:2886:b0:35b:ea35:c3ce with SMTP id 98e67ed59e1d1-35bea35c476mr6485875a91.27.1774330247814;
        Mon, 23 Mar 2026 22:30:47 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:19a5:8f2f:d584:8078])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03211351sm953507a91.15.2026.03.23.22.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:30:47 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH RESEND 1/2] regulator: dt-bindings: mt6315: Add regulator supplies
Date: Tue, 24 Mar 2026 13:30:28 +0800
Message-ID: <20260324053030.4077453-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
In-Reply-To: <20260324053030.4077453-1-wenst@chromium.org>
References: <20260324053030.4077453-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_223048_722316_E1E41EB5 
X-CRM114-Status: GOOD (  10.11  )
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
 .../bindings/regulator/mt6315-regulator.yaml        | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
index fa6743bb269d..ba99a0d02bc7 100644
--- a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
@@ -29,6 +29,16 @@ properties:
     type: object
     description: List of regulators and its properties
 
+    properties:
+      pvdd1-supply:
+        description: Supply for vbuck1
+      pvdd2-supply:
+        description: Supply for vbuck2
+      pvdd3-supply:
+        description: Supply for vbuck3
+      pvdd4-supply:
+        description: Supply for vbuck4
+
     patternProperties:
       "^vbuck[1-4]$":
         type: object
@@ -51,6 +61,9 @@ examples:
       reg = <0x6 0>;
 
       regulators {
+        pvdd1-supply = <&pp4200_z2>;
+        pvdd3-supply = <&pp4200_z2>;
+
         vbuck1 {
           regulator-min-microvolt = <300000>;
           regulator-max-microvolt = <1193750>;
-- 
2.53.0.983.g0bb29b3bc5-goog


