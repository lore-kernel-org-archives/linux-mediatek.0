Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E76109318C
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 08:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nh7FB2+tAnbHPiN9V6sKTsvc+IqdTYaE8U3Ar9OxWRk=; b=AUTJTjMtQ/xKjk/zjB1kWWuREa
	9t7EsRU2lGWF03Q7wCV/fCNAcsKbDdRyUk2QphrmWcmyFqb+QizREpy0fCn0+vxgR5JA1WJR9EIk1
	tTLx9Ayz3UYNdyxpGHzcP+7VRNOpR+bcj0Wu+tQPCRbQ0TKZyG7+DY+EmlkFy8tCAJJVSuildWLlM
	aEfIZ5HpmzoMaUMBj6c+rvAu+ZtB1yoy5eW6Owo0VIu+vM7TKV+PXeqUY9BMr13+f5rdo0m2inoP6
	yq91OynXK1I/N97kdDxEyYFayYaMaOz10rg9hBRAhraVpFMAM62duXtt1MPfQAdqx0qX+1UEtQ44r
	KEgE/csA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VHN-0000000CMJR-0JNL;
	Fri, 20 Mar 2026 08:32:25 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VHJ-0000000CMFz-17Nv
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 08:32:22 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8299f1ca894so1125200b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 01:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773995540; x=1774600340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nh7FB2+tAnbHPiN9V6sKTsvc+IqdTYaE8U3Ar9OxWRk=;
        b=F/Vn5vp4qTnFYj3HVEAdcxgLOk2TYuWvT39oGhYf2nf7YBhy0sDWFoYjcnmrFJakYZ
         8EWNlJPwDzNW+NjrbVmPSU2kGc/wuKKoDjy8UsKhmG5spemXDyQYVlZLvOmztT7lnEUs
         Y3hmTE/vUB4MPMRAi/3QHkwrVXTAV/piCr6Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773995540; x=1774600340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nh7FB2+tAnbHPiN9V6sKTsvc+IqdTYaE8U3Ar9OxWRk=;
        b=hP5goN1hy/SN+l4kyQwz5U/tv14BJ25SSWyEvWRK+Ro1G/TiGE8rdSxUqc6Q1PbVxd
         VY/QV9XveUPBy/189lu9vZjolLGCUMdVP3sCG7CZLvD8Jyeir0EH2VE6nAhnf2MZ4kTz
         M58Bmc0NIn+rqZNFClcZkw1uXWhtfgCL1IkOkKKgP7sWUlHDCpL0DjAeQB0vtzVjxMFF
         1oOREKPV8Udf4QqIxWni1eHHFBgbfDZsgbkYE+LFmcdYQR7RQIL4HE5ZRbAMzOjZGakU
         ftstutjKw7jOU7A3zCfYOKQx1uFqlOXCzY1nKO7Y70s41N4XznJ3T+i8QZ6TRK3Czxuh
         YwGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUInht1tGBI7LylVwwtX3uU2wjlivt1FE206/f0NWEo4AvXLwF5zPWpecwB83O7FEWsocIvforn7/Q4YZoB8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyA3H0Enyo+k3QUECsNq3RFQbkNB8BU4nA3FkiW8J+Oq/fYk7S5
	f7AHnIQD9Cl3GEyNDZWVnYMp48v833gZ2YocUFbo2Z5LFVNvin1Kf7qQpgtrYaIxKw==
X-Gm-Gg: ATEYQzyg8WvelhR/OXQI2m8WYMrJQbWxcNHHjDBcZl00sT3pkPvvHgDLcx4zWPTHCv+
	F/z2F0+jtF5EqtJIFxXLfxBjzZGMIA9sy7VFZc/rZVz9Mjez2wQWuzyLYbVslOvGoAgSI3whJKp
	j3H3XMuPkezP5qGugjA9lZg2jhe4miwmu1PkEaEJH/zK2h9ZXOfvMCnicBh4BgYsBJYH8OYM8Rd
	UCjxLSQvJ3Ay+ELFU5xRjzfPq7pYllNxcrrBREHbbBvV6XocHZCe4mUaKU7vt5TNf9S8vOCk+c8
	KWqiPNUewWkUSZ8gTC8HD9Pv2QUIQsk8oqEy2pSauGY1Pmh8Sp8xeJAUHGFiOCDrYhbqhfK4RZ9
	zKMIJNb85fizIZ0t4HuXf1YatmlwYcQzBwG6uszDbhchI1KoLSj7A5ry1IibJYLAQv3xPNI0I0k
	MTOgD2dX0oGd2atAXJmnAB28HdKFYkir2PpVSeP4zWM4kE3tlNs8umd6bfEPoN0r/1bzcE0XBQZ
	GKR0oV2
X-Received: by 2002:a05:6a00:299b:b0:82a:f02:7355 with SMTP id d2e1a72fcca58-82a8c35c866mr1756086b3a.32.1773995540176;
        Fri, 20 Mar 2026 01:32:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040debf9sm1408816b3a.47.2026.03.20.01.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:32:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 1/2] regulator: dt-bindings: cros-ec: Add regulator supply
Date: Fri, 20 Mar 2026 16:31:32 +0800
Message-ID: <20260320083135.2455444-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320083135.2455444-1-wenst@chromium.org>
References: <20260320083135.2455444-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_013221_300080_DF9C1287 
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

Even a regulator remotely controlled by the EC will have a power supply
input.

Add a property to describe the power supply input.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/regulator/google,cros-ec-regulator.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml b/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml
index 5a6491a81fda..c2bafbc1e9e1 100644
--- a/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml
@@ -24,6 +24,9 @@ properties:
     maxItems: 1
     description: Identifier for the voltage regulator to ChromeOS EC.
 
+  vin-supply:
+    description: Input supply phandle
+
 required:
   - compatible
   - reg
@@ -48,6 +51,7 @@ examples:
                 regulator-min-microvolt = <1800000>;
                 regulator-max-microvolt = <3300000>;
                 reg = <0>;
+                vin-supply = <&pp4200_s5>;
             };
         };
     };
-- 
2.53.0.959.g497ff81fa9-goog


