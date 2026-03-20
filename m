Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E76D1093181
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 07:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99wvnBqkOMOuTm7m/8LXi4xBzDlTYHcDi1Go4VKhvmw=; b=E9O0F4l2as/1rsg7TSpAbZEvEf
	U+rRk/DXjfaDXioDh9GEcjScRewKd2qjmHA/w7/HAkfWUs+J7K6hnyNWYKg5hRe/B9ynvnSz4kgkG
	RmoItDPuoysusCcEIdYQxv2Ztz7EHEc0wjYnlxABDt/WNu2nyCpUT9EYHaZel9aoRA4ndtwrBNu+f
	fXNtWDAPgJUrvXke/RqUqxl8JtFnYJT9C3TCl3r7OFFrl/2X/Jx0qC/djStBcvx8xaOBFCj51FXvZ
	Fv5dSzRx5spEt3bHWWkPwTCPAdx2maRb3qf7DTkfBr6Wf6srrYKK099/rM9rPPZb/bFxUfoVvlko0
	qTUBfbDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UE8-0000000CFUL-216Y;
	Fri, 20 Mar 2026 07:25:00 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UE6-0000000CFSa-1fvF
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 07:24:59 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-82c20b9f989so16407b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 00:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773991497; x=1774596297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99wvnBqkOMOuTm7m/8LXi4xBzDlTYHcDi1Go4VKhvmw=;
        b=eGmuozuThsdfiXxIGzAnIbAMRxxwfw69q4mfxf4J+RCgO4FPogHqY0gEFnZFxv8oBv
         T8SyzlsWz2/g7kic1Mh25Y+lNHBI2Tb/hM+tw0CYrrub9iHHBtqWJ3WGqbF8p/rZfy2p
         cD1fy1scSiiwJiNRJMIl7A0ioB2Xhs0Uzs0vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991497; x=1774596297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=99wvnBqkOMOuTm7m/8LXi4xBzDlTYHcDi1Go4VKhvmw=;
        b=THcfTzIptFjZVnRn+eallXkbGDzM+SnaiFCPH6RjMvr62OHqhofmyYPx0st5JfhTfS
         WJK/PG+NdzdSIt6EehEO4s5DvZuplImzF2qPIvYfu2JU4siDKPmdEWvuF0EouLMEXwXT
         xDTm/+n5EuZ+FMUganqDpReF7Hfjyhjg0zxndcs22Zfx5VbO4ULOxSBCehdUzCLHcOyT
         kHHJu/Sa8N16TdOz7u6e+UM4ZRNPVRd06pJVM6HUBlIxh+gxumQS3pouYLdXJqGgwUC1
         xItJxQoF/rFprOKkSlqRjqJTWAWza71daNJ0Od5Cm+g5DmbHMecz4AlpZuJN0rWMce+7
         Vc0g==
X-Forwarded-Encrypted: i=1; AJvYcCWIkRwHs9oKBp2hPHhZwgbxoNMwt8I9frmGqwf2V3GV++Ia3aP4A2nHfDzQtjwXKF3pSAzd2TlgJPg9xE5xiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4oQc096Sesbfx6KHSFcGNZ9NpSMchoe8wpChyILqZuazI9BdR
	mZEmEUDGOFO8HJajDDTVresWNLpWrHGvgVm4lDlSnyhZZHIWEqcJ4xZij3/w5HWyxg==
X-Gm-Gg: ATEYQzy90Bks6NeUv+rh82qrFF32WjN8Nh0zP+zpNLePnb6bPb5RkR1vhHI7TUUgW7Q
	mlaHwgx5TLz+FJjgqaNGVX3FcjAgiREZKzLJ1850XaEQLHu9aYux9cXE2FNz5QwKoqPFj0O4DWE
	nOtE8iXihSAw4ySCexPDmpbZUeO1DafgqrVRAaOLEssOd8jkfNkXRT7a69Xu9I6SviURWc124j1
	bfWNPfCyoB617NHoIEnOsJA/YY3oSy8heec5SNo27l+KsqOlSFnLEw8ITGp9EQa4QOL57qFMmQf
	wJOWywIDoiOwuJ5M3VYdlEiriHLuGvNRcnaPsXfXsNtOvZ6QihFi/3vAPTvX5TIHeqlUHpgMpWL
	U/0TzsHgkiTC8s3L2X3pSN0Dtuz2/oVr+g6bMmvFpQlohwDTibprVoUnnPiYPba462aYFphMqNq
	yFt5zT9oK4zu499BwkeXqZBRTRiRPHZUOpgCjNchS192o9oJPCw/VqGLXjfILyJp0Ibsn5EoeI/
	F6R8ja+
X-Received: by 2002:a05:6a00:13a9:b0:829:8cfb:df45 with SMTP id d2e1a72fcca58-82a8c2804cfmr1615737b3a.15.1773991497498;
        Fri, 20 Mar 2026 00:24:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04222f42sm1452447b3a.61.2026.03.20.00.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:24:57 -0700 (PDT)
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
Subject: [PATCH 1/5] regulator: dt-bindings: mt6359: Drop regulator-name pattern restrictions
Date: Fri, 20 Mar 2026 15:24:34 +0800
Message-ID: <20260320072440.2403318-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320072440.2403318-1-wenst@chromium.org>
References: <20260320072440.2403318-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_002458_443845_634A28C1 
X-CRM114-Status: UNSURE (   7.88  )
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

The name of the regulator should match what the board design specifies
for the power rail. There should be no limitations on what the name can
be, and they definitely don't always the PMIC's own names.

Drop the restrictions on regulator-name.

Fixes: 8771456635d5 ("dt-bindings: regulator: Add document for MT6359 regulator")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/regulator/mt6359-regulator.yaml  | 43 -------------------
 1 file changed, 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index fe4ac9350ba0..ac925334ae83 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -18,84 +18,41 @@ patternProperties:
   "^buck_v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(ibr|rf12|usb|camio|efuse|xo22)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(ibr|rf12|usb|camio|efuse|xo22)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(rfck|emc|a12|a09|ufs|bbck)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(rfck|emc|a12|a09|ufs|bbck)$"
-
     unevaluatedProperties: false
 
   "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$"
-
     unevaluatedProperties: false
 
   "^ldo_vsram_(proc2|others|md|proc1|others_sshub)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vsram_(proc2|others|md|proc1|others_sshub)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(fe|bif|io)28$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(fe|bif|io)28$"
-
     unevaluatedProperties: false
 
   "^ldo_v(aud|io|aux|rf|m)18$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(aud|io|aux|rf|m)18$"
-
     unevaluatedProperties: false
 
   "^ldo_vsim[12]$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vsim[12]$"
-
-    required:
-      - regulator-name
-
     unevaluatedProperties: false
 
 additionalProperties: false
-- 
2.53.0.959.g497ff81fa9-goog


