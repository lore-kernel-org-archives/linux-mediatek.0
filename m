Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94B5C54E41
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 14:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnHZw5ifKCP/mPnI9SQ3FYZZamkSdSQAcxOif/txQYc=; b=Obr7xwLyTPGkrU+ZV3TVqYfd3B
	teKLs8+fxpogwVVqH6DiO4AVwpCQloK8PGK9bm1bkQFGfM7ntyFoajbcIzYABXm5HzOlvCgHVcg7U
	S1800HE1bM94fi7lBpaK+IIejM7OEXw7FWvgQoOBNe+Wy7IjFakVZTFTXLJUT5DjxG3BnpoKoEa1R
	uL8iLFGwO5Zdrh5/ImQ1vsWtWWjVUryHMDOQH90TJ2fi5+TQ7mQQI5ZiJsscJsn8o8i7ox3Vm2E1U
	J7HQ+OVxLq7eChGWE43vuMMGLsDAGFh5hq5i4b2nc9kBILcOEJtHiv+IiI0IH18HfmzqT+XMjRBoz
	ghcpjXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebah-00000000zX4-2nis;
	Mon, 26 Feb 2024 14:04:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebYc-00000000ySc-21Bs
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 14:02:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-412a51754c9so5299905e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 06:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956131; x=1709560931; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnHZw5ifKCP/mPnI9SQ3FYZZamkSdSQAcxOif/txQYc=;
        b=PvvXptT4pl6I4ytXjjQV+xnk1JcQdmQKrHqMDVhXzWHTdSPr+zvgeCHqDVPRIKtjns
         xcvHOuc6AcVe5P6aCv5ewmWq/jfe3kFZXFdRuS5//fVx8uUnWwqRPiX7hyVyzhemsx5f
         lN/bwO9DsbZFPtzeIzVoa3BMeugliL+Ugwc0BCgjkxcD4ihp5tbb24rRuy62szcEPFtM
         7THk8xqujuA9qRRuJA0yYcormvPcA9RXqePd+IRw+qZNWdXu9Cf1iB3JkcsrSqw9+7An
         9xIDim38psJIy5O1Gal0MljDdwv8laWp0LPjZ8MybMSSUFTOl1CLQtV1RwP7RLDNwiep
         pvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956131; x=1709560931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnHZw5ifKCP/mPnI9SQ3FYZZamkSdSQAcxOif/txQYc=;
        b=HyCO2JachWtgGu7zI7dBo7OReawatN7EkabyJLCUsHPWA/yWb6Y7GRVLRFXlHDCMlS
         NSY8Hul/CtdS6kTH2BxAYIlZCB2Cpg9TyF9ZTrLDqDlmnwTTyAzKp+gB4BBhczN05Oru
         g5AB90OGhgb5p6qM5rKinwfDn45EKE9/ukYDUCqgQg3pZmKTFLkdiakCMYcYqZCB/4VG
         i+ovD9+UmnHYrr2f1kl+nGVXtkhwQ5Q2tQ0bjuD1gJ5UmeDKWbcf58b+SbDwnG2OnxdC
         B8W38XWD10f3ZFVlzB8sNNImZEn574Od0gFq5cBSzx6G/W7lwfHet2eJYPjej3TfT/gK
         qP8A==
X-Forwarded-Encrypted: i=1; AJvYcCU3B7yFv8OhVEEPdZBKWpD7cUQZhbOaMF0IyfhbSKy9iM05q+99K4eXchM7vlSZ8q/gQPP32R5GvMMwRgtC/Cng8qAAv3Pg90TcAJJpHq7F11ft
X-Gm-Message-State: AOJu0YyRXfGaSL+YIC/mdWlF/mw7JngWDVBZGJfi9XvAU4PmwU7zZuQ7
	sBRIojri4B3OJgs4+/CTlyIf3bSIN7z5Kq4EwTIS2NhCO84AGKfnUEvzJ0ermfs=
X-Google-Smtp-Source: AGHT+IGdWj7muzrLmYabNE+rgWx3rZZThzpeILTHoY5SoipoWCOa9p5u5DJq70C9u7xNKXoHsKM3OA==
X-Received: by 2002:a05:600c:5109:b0:412:610f:c2e7 with SMTP id o9-20020a05600c510900b00412610fc2e7mr5950589wms.41.1708956130954;
        Mon, 26 Feb 2024 06:02:10 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:02:10 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:41 +0100
Subject: [PATCH 03/18] dt-bindings: mfd: mediatek: Add codec property for
 MT6357 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-3-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=yRuLIf2m0xnCfvzLq9R/BcOzRbUE5cS2RXvKgyHfYpM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JncgGSS0C1k8gOGoK5RbBNCnTfpg0bIV9KdQMrF
 bRwkPGGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3AAKCRArRkmdfjHURWryEA
 Cf9/b3stfOP6wQreJbNQ0rCPhRLBn+WoIe4w4DPE2zxO6lUqXMXUmJUd3l+heg+JAn0jmFRNiYLI9N
 F2TvTYvt7QNPnw9UXKo4OWGWEy9EO7zpZB8Q0PVOWmZ2ieZ27JnJUHlhsF/7T62mg6HkPedQdgiwVD
 sef+ZSBq7Y+Z3G+NHkYGOi9/2AsPI1Vp1xnghEP7CbOI+f5aa1NCafxiHSUh9c2Rr0kdHOyl8xI5Ta
 HX3bSltTsRR8Y70YCeAcQ8xya1d2AVqqjVUaNzCAygjkzV+staYy/hF9o/vMZLTP/EKEWzFFIdVTff
 YD+WnyAQONOe4yw6oQZPsXkl2IjgoVYcBDYU0dpckhhSZGFYbOFBMzrSBoCHNAkUl7latYHzKLG5Jp
 RZtpxshoYS05Fs4nJX2DaAL432pspBJelJfXahY6ZvH5n0P3qlepcF7qgRWJ/pNnqPr5EPbdWJ/9+/
 IIgyGi7BgJFu0l8JZcGNJtzPVQLXL6SD4mI+TKV/tRiDQGbEyFf+AxsdJRqvmLQF9/O9EYvdwPbVoX
 8ZL9CpzfyC5sj0By9DImYNw4j06R28Wb165soxMql11bk63bnj9m5G00bNNX+uvnUosowi470da3Gq
 /6SnaR1y8SJLrpdirZTURqAhwvNWjRouipiTsD53dDH3XnDvA0rFaM4LRNeA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_060215_083235_900F68DE 
X-CRM114-Status: UNSURE (   9.65  )
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

Add the codec property along with the mt6357.c codec driver support.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index 37423c2e0fdf..d25a78070744 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,6 +37,17 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  codec:
+    type: object
+    unevaluatedProperties: false
+    description:
+      MT6357 sound codec.
+    properties:
+      compatible:
+        const: mediatek,mt6357-sound
+    required:
+      - compatible
+
   regulators:
     type: object
     $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml

-- 
2.25.1


