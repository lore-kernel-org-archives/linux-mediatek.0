Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902BECAC5B1
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Sep 2025 16:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eyp9Gi1dreOzDe7chY8j7wPpNbM6pbeZ96TyLDdfpM=; b=VxlrAIViWVo4ZE5Efb17/41D2Z
	6FNFJ37joQWcuVwYirjMmtaMeKkOU1JV4J7049bKdSiMpMpn6oOFOv27oeDBtQgJ27+o8J41PEDIb
	KOeugECix6ji5tl0jRDi488BRIYeqxYqISJ5BQSwMNsRHIkPjL3unWQIWJ43Ocdw/E37BFLef+ytf
	44mdj1JHrdz4HK/aUz4He0/hSVTmt3d4Nnv0lukU8POl058sHzjZkXTPk01Qr0wSnLPlTft/rBrpX
	VVjmEXEOTSQLAFkDsArZBKNypFKwBqIdNXnEap063cwj4ea8yTu5IVuI9GMKRTTShkp6NM/fbZfNt
	I7eKKNhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1p1c-0000000BD0b-37ba;
	Thu, 25 Sep 2025 16:40:56 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1p1a-0000000BCwb-0e9M
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Sep 2025 16:40:55 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso704096f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Sep 2025 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758818452; x=1759423252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2eyp9Gi1dreOzDe7chY8j7wPpNbM6pbeZ96TyLDdfpM=;
        b=HMXFmCwk3xZGJBQL2tLyd19VDUbUdIJm2U4gXMcSyzdDYFhDONP7dU69m2OYT0RFJA
         eyjF73nUvlqlmiF9FIuhARifk6ufJ8AkKirlNmWkU9mOBp9sS974aPLpC9YJncM8/y6d
         uChC6AQbt8fydFbrEfX4N6nxXGWyUOWEVTcr+eyqvnaB4tIru4+gLzfMdxZTV0uCTXqO
         h77aXnFooeNXpmf6RiIubrRKEXh4PNnnaytkLO17aZojCP6uNpmrhQBojcwbBtkGNKRV
         zq5bVgZXQvoJB1Gkaem+m15wEnfG44BVE5Wj7/HgvK0aUG29bUpoe/unq8+hh/usvMiw
         5IZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758818452; x=1759423252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eyp9Gi1dreOzDe7chY8j7wPpNbM6pbeZ96TyLDdfpM=;
        b=CBFSVLzyCf536pi1aXQjIPTSop58oEaySWjeL28llJAR4NNcDe64ntdh0wAItwP3il
         SoLGkJkFIDyL7V3b+vk4oA5h3QfzlsRi+kONlwtXoVM3aOeKoIqP51Khf5xnRt+GIcYR
         oq3Axq+x7nqnviAmUyaoavqsOx0Zlsq5deTeIRrVaS17ZviLn0s7MVXFLGK2J8AJaihy
         QdOdrBSbGe7a9ywXtyAYMMUMj5n0J4Wz68F0P3WjGFCygRaNm0iu4pc5lFM3yeuj0gKM
         4OkGk9x9BTVvV/Zb/68x60ACqGwkHKFI6fLHm82dbGiukt0V8+jNWkidQOZcrbq4nKb3
         4jmA==
X-Forwarded-Encrypted: i=1; AJvYcCW0VWDI3Ap//ZO1xjjR5aDArrbwnAx21n5ZvS9WqHeYYBh6enRxmpv2xDilJXOmDJuCQz2j26rXP415rTkCtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzULlgQHdEGwcoO8fFO4H27IAtZP2dLfTQok+rS2ux5rrzw9sPA
	DkWF9E627x0ygV31U5Wqf4sToWIXl5bsQce8c9TYQC/wIyK4ayOBTc2i
X-Gm-Gg: ASbGncuieMWCQqmerJFtdCL4TysI6IcYcF5APzrzFLictbGVopQMAj+cQ101dYJIrIo
	vJGsLXm1HQhRaP354Q2tv8ZjTW3ytahQSWS3ZhQXddLejThAMivDWF9LDvcuwCZLA9THFf1UIPo
	JLiSHgShDd4LMpky2eJP4bqJwA3RZWGlcV80GEVrNJyOlt6lCcI8a5U4XveBsYWDDxUqcOs2u6Q
	A2ln/iYG6pwwYy3jGyPuBh384t3Oeo1ufmR2CjGTcIdTb6Iu4TNf0iZ7XWTwCUcGTNgwLONRJiT
	zrkZR3ptX3Q4L/A3CsE9CTISyPHHD/N2gl4m9FTt2sOT6pdALjr4W8iS849Io6SVV86G1mgeohV
	o8yeUgntrGU7VwzubDgOuqETCJ/xGMNS3N9co9NS32qo5Bz0UEhrObfcqydeG8nnngOsWGcHhN5
	u1zy55SQ==
X-Google-Smtp-Source: AGHT+IFuboP96UTpd7Lrf1lzxKViS1D5GdrbEgDmgGvbVgns+3irooGx/K0KSA4xhs66h89FOOvM5g==
X-Received: by 2002:a05:6000:3102:b0:405:3028:1bce with SMTP id ffacd0b85a97d-40e4886dea7mr4262966f8f.32.1758818452397;
        Thu, 25 Sep 2025 09:40:52 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fc6921f4esm3591904f8f.44.2025.09.25.09.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:40:52 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/4] dt-bindings: watchdog: airoha: Add support for Airoha AN7583 SoC
Date: Thu, 25 Sep 2025 18:40:35 +0200
Message-ID: <20250925164038.13987-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925164038.13987-1-ansuelsmth@gmail.com>
References: <20250925164038.13987-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_094054_208949_87AD7D02 
X-CRM114-Status: GOOD (  10.67  )
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

Add compatible for Airoha AN7583 SoC. The implementation is exactly the
same of Airoha EN7581 hence we add the compatible in addition to EN7581
ones.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/watchdog/airoha,en7581-wdt.yaml     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml b/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml
index 6bbab3cb28e5..6259478bdae5 100644
--- a/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml
@@ -14,7 +14,11 @@ allOf:
 
 properties:
   compatible:
-    const: airoha,en7581-wdt
+    oneOf:
+      - items:
+          - const: airoha,an7583-wdt
+          - const: airoha,en7581-wdt
+      - const: airoha,en7581-wdt
 
   reg:
     maxItems: 1
-- 
2.51.0


