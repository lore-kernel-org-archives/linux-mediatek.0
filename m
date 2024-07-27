Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49367C3DA61
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jul 2024 11:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9fUm8LNjWnpXgKPOWByxyCK8Ra7TdsmOZpgB41hWfh8=; b=EmoraLSfnKf+wIbZgW1K+M1jnr
	gL0Uk7oBkI+8i6KnPTNmGGZyaxCBbtFMHEgsNXf8/i9GVQmEw55YJH40aYwviLb3ykw3xJqEgjefT
	LneiPP7BWSFv2c407Jwmb6DpBM4JXgLyHK7WhMlOPLfYyDVgVsyWxs8dqnm1U3GhU+aP/PeO94fNT
	fk0apDb4hfwcQIGBlfdu9s25AakzS0xX9Khqs3ffneoOTuq9AJdUcjntDmLFwAtcFrNRMlSv/WVfq
	6UaV/G90nA7ed6GVFQ+kUPpC2T4df+M/pmGtsouLBaNizVGghgRrAa+Np9tSQfy7FFoVGI+jxvRUd
	ZI6EpGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXfvB-00000006dR2-2ttN;
	Sat, 27 Jul 2024 11:49:09 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXful-00000006dNv-3QcV;
	Sat, 27 Jul 2024 11:48:45 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a7a8caef11fso266360766b.0;
        Sat, 27 Jul 2024 04:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722080921; x=1722685721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9fUm8LNjWnpXgKPOWByxyCK8Ra7TdsmOZpgB41hWfh8=;
        b=LC/mKvGxS63OciWydKWmdd+yhouESqOW9qO/H3E5oRDA8IFo3M2UnK9l1n2Ow147yd
         a1pPlkFoQLEv1/oJjvDcQReDM/6dTm686H/EmiYArf4UcgvD8Ir6xRI/XLuk9kguTVqf
         s5KYiarHsHgFsnSCBKpW2C4sT/7uHS8IqhjniEQ6rETMK91QZ9wyRZ+wpin1EjJRNtOZ
         mf3jDK4vXZ6y1JAcdZMAoAyYuSyCntq1uhBCTeyEINAYFu10Z+mG4VEYqQWbRfGesXpp
         VQb7HWBVtvI1TrN+eQnWUIIIJqnigMqO3Nz38Chstxwj8SwrLx2xR8yNPQOGQ36HfU53
         p/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722080921; x=1722685721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fUm8LNjWnpXgKPOWByxyCK8Ra7TdsmOZpgB41hWfh8=;
        b=qVEcGiR+Myenvep7aIAo1X4f+1cmk9EY1qw6QCwZPk6ZZ+G7d4vfd5Z9IHHAPqx3JS
         zH7Ju/csHsicoEl9LMq7bxjcUhSvlNVRpN6H6vP3I3F06TeUA0qtFJLEdgNe1p97lYxe
         OpvQX2ZsA0Pfbr1lb4oAcOYrRXyapjBuok/fTXUG9yORj20Hz6ol1OqdIkSJZJCobuoS
         n1mFHqC97C6BtQav/ADhX2vrvvrDkSU6vVnxnIxMmuRD2MzP1Tqf5TmlIg04L6NN1GYh
         lpuy9/dfSszrqBobSjo3pu35lhN+A2BkBnuhNsDAGsK0+UOqRKRvsTgQ9aW8R6yrYyUW
         3W+g==
X-Forwarded-Encrypted: i=1; AJvYcCW3++7AMhzbZpJhekS58Ll2U5BzVEctP9+ywgSuv+y0Bqth8g/7fDhjteMnMLSAdT7V2aUdkAunuZYYHJ2O4WguVQ8ysqr8aVT5lbYOQh+v6QvOGWx/RdB2lFSzs6AJkZ/dtyjQk4beKLjAnl9QWetUWklVBxVYym0=
X-Gm-Message-State: AOJu0Yye+hi6VKB40ILU4Qs+myYcd6NnAAnDqiYXJbagX7RI8h6HyrkX
	IKjTbwkK0/jwXHhnVDJhjclyYcSEXPP+BQsb0lDzsvFYYMyorBCz
X-Google-Smtp-Source: AGHT+IE6w/99V21WjiNJgVmoVHMsNySZTuoAqu+JuOyTK0gkElTw6sWm4sv5b3PuRrjeKR45opBNlA==
X-Received: by 2002:a17:907:944c:b0:a7a:1cfe:a262 with SMTP id a640c23a62f3a-a7d40166f94mr112916866b.55.1722080921212;
        Sat, 27 Jul 2024 04:48:41 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad9316csm272646166b.186.2024.07.27.04.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 04:48:40 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	John Crispin <john@phrozen.org>,
	Daniel Golle <daniel@makrotopia.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: spi: mediatek,spi-mt65xx: add compatible for MT7981
Date: Sat, 27 Jul 2024 13:48:27 +0200
Message-Id: <20240727114828.29558-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240727_044843_900991_B7A8295E 
X-CRM114-Status: UNSURE (   9.46  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7981 has SPI controllers based on IPM design

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
index b6249880c3f9..e1f5bfa4433c 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -33,6 +33,7 @@ properties:
           - const: mediatek,mt6765-spi
       - items:
           - enum:
+              - mediatek,mt7981-spi-ipm
               - mediatek,mt7986-spi-ipm
               - mediatek,mt8188-spi-ipm
           - const: mediatek,spi-ipm
-- 
2.35.3


