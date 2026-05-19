Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60586CD4F54
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2026 22:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKUS30hEKkJqsuTkVMrr7mwScb2qlJAj6ESCesmLApg=; b=qjeDIN7eQ4iGC6E/OYVWAao9h0
	K5sL4uxlNKbxM8M/ehyzsNehYhz8zpeeB/Fnb0V6Va1OeGlrS/HcaSlWfG/cxxsKYOm1Tzr+wV+L8
	wV+VyfLlgFOIuu8ch0Y/AEfwSQAXC3cT0LqtImFd7oiabQDrSHwWRS8fft23NXYgOxezzFfrmcMYZ
	CB/Ok9rBVspDY4xLODh7MakbGTs21CL7f3dZjmQGUCdZLkcfpi4adDOYUGraIlxm5cIzrFhrjxXtb
	H5gwZ+uxHCSPD3/z7CpvCjUnE9YZPatGHQJ0SF6sS2fsSDhQ7rOwW4Hef0mTRrEvZSFmW/J4h9mRl
	qDkYPBHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPT04-00000002y7V-2eMY;
	Tue, 19 May 2026 22:33:20 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSzx-00000002xyu-1cTp
	for linux-mediatek@lists.infradead.org;
	Tue, 19 May 2026 22:33:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso55340935e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 19 May 2026 15:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229992; x=1779834792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKUS30hEKkJqsuTkVMrr7mwScb2qlJAj6ESCesmLApg=;
        b=CiDtKv3OsgmcncGjVyQRrmi3BUQleez8GFEkS/jcmFVloUAvX54tnDHMQLegEqXY5W
         neNjuO4V/0+ROo8rFF5QIfvezeJ0m/qQnBeylzwBzQT+6UgUcdaaRrEbdDkEZ4UcS2tW
         5NP2cyZsjfo6Yl4oohVqzIxnhvb5zUgFAqdALbvS8VV9NWEgMiISf6WWEIyqZ95AhsVo
         +a+dsQbp+CuB4UrGctVK946HUgZsW6eeOXkOD4wwihWhkq2/mKhDL3+4P6XV4bBCM+Vx
         0B/ro0vYE9qOwP+KLRtqaxpAZ5fuP1CyZro2e5ZSpkaFeBx+PHkqid1tq5Fvw6R1+kJb
         s3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229992; x=1779834792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MKUS30hEKkJqsuTkVMrr7mwScb2qlJAj6ESCesmLApg=;
        b=PLLjDhWBe1NoEFNiAmdnCWkFQ73bMhfpAxm3rs7uxAM5eVJ4NzEW5UbnZMTBy9paOp
         5jMKJwUHgc1xxN7hRG3KwOcvnUzisPzFdF+FBLIueQ2pk5Eh8EnnMXbsWaaxUGQpB9gP
         Bkjg4a4lMGaha+tPsD/95GztnoyYm7t3K44NnUonIbfKEeh9PRAuWvhzQfliCRXmR8Vb
         U8Py+ynfIFZV81LYqVcbw7eT62fNOxT32l7f4tWgquy2CSSWCgtwGsmsSD+plcQXPklJ
         kpUeLOz9CeRjmCjyrhbg3Qwi31neH41R9lLS93IYpXp1hMu9Qo3cOmmhFjtPoGUE014Z
         9ZGw==
X-Forwarded-Encrypted: i=1; AFNElJ84/aMfWUaiNXC+5n4jKIeXz81TaUgxtrGYhEGY9CpchlczdfEuPv6BwAfnRwDgWbp0VXr5eBmEXd/CE1YwKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuNffCDyHdD+u9Orj0N52OtCWREiA7d31pyXOIBAUyL92OZ71X
	kYKLsf9i2qDtA14LtfPfTedFpkqjWvrrLE3MibHO6h2AukBMfG7uUYkU
X-Gm-Gg: Acq92OFGLYPgV5Hp9Xn0WiuSIWDKnWV2BQx8XDVonvT/HYuZ4BCDO0kU1C9dj4rYH27
	b69YPlKdm2W/5XXp3zfNAkufl2T9yic2ycLXnBBO+OOV/3mHUpeg9jYc7a8z6Dt8vq2BVgPG7QA
	fEVDNvi7Pe9D26+mPrDNgsRpNRbI9TLCIF/XWJ2lF3CuhWwqGn92cfn/ivQyIw2TifA2xs5Cf8Y
	6Z7zsCg/7h2MDvVYtX+kow491sOoARJk2/MMK5RL06GIErC6/6AtLuSd2Q+K2X2nCx3bJqGn5/a
	5/TMHrR2GYLyf1j55rBftZvkFeQmUre/4GuCD7mVrXpcB88Art52fsCVfC4WowmHoM7h35mhOy7
	udBDf8L2fgEmcBJMRrnL/5Ele141+hh9X9Zml+2QfTbH5c1ki6WRQOtJCIXAtYLdg6LbDnX2jL2
	bmynbOWNbEWB71J1KqdXp76i/Cl1StDqqx14VdwT57QtZydccHj0UcUCD/ZZGB75pg04mhORLJ4
	ppEvGleQQ==
X-Received: by 2002:a05:600c:2d86:b0:48f:d5b2:7c42 with SMTP id 5b1f17b1804b1-48fe63259camr228600395e9.17.1779229991759;
        Tue, 19 May 2026 15:33:11 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm346659955e9.4.2026.05.19.15.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:33:11 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 3/5] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Wed, 20 May 2026 00:32:45 +0200
Message-ID: <20260519223253.1093-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519223253.1093-1-ansuelsmth@gmail.com>
References: <20260519223253.1093-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_153313_446030_E380BC81 
X-CRM114-Status: GOOD (  10.09  )
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

Airoha SoC implement the same Mediatek logic for I2C bus with the only
difference of not having a dedicated reset line to reset it.

Add a dedicated compatible for the Airoha AN7581 SoC and reject the
unsupported property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/i2c/mediatek,mt7621-i2c.yaml          | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
index 118ec00fc190..8223fbc74f14 100644
--- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: mediatek,mt7621-i2c
+    enum:
+      - airoha,an7581-i2c
+      - mediatek,mt7621-i2c
 
   reg:
     maxItems: 1
@@ -38,6 +40,16 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: airoha,an7581-i2c
+then:
+  properties:
+    resets: false
+    reset-names: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0


