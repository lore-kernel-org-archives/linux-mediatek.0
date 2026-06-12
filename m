Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C15CD98CF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 20:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQbFs2CKnSzJgOy+gjpokoR/HX0Y2GFtRKZFX0F9ALQ=; b=pT8T+Vimsd0PmsPRBNhgqKpwHA
	vyqK8PXPVTcdzLGoqXgiaSJbO3Kc41JkYHDHsLvocIdlswRfmvWGGcUtEYgf8rRSbVOS2B136Y4M9
	DaR43meE2DA2tgszUSIZFNngOtsAMQnpcF0ea788MCtx1tjRWy4Fq8Yo2D5RS+srxiAIxo/tn/aNX
	A5y9usC/k4QH4fNQ/WWJIOGeenqNp0q8EcQFVB9Osbz4J12FoKHzaHIF8mdQNA5wDpZdNAfAwdslr
	8q3ZIYpOY27lT7R2Wy7ALlN1Yky8AnXQVnL1MpoNrZrqIhAkNdZG7zJyaHhVgHBcsOaYEKilHhosI
	BaWWk7og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8SJ-0000000BXgh-2E9V;
	Fri, 12 Jun 2026 20:26:19 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8SH-0000000BXfc-0XrL
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 20:26:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490b7866869so13522325e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2026 13:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781295975; x=1781900775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQbFs2CKnSzJgOy+gjpokoR/HX0Y2GFtRKZFX0F9ALQ=;
        b=X5LpsPRvVNGtGYdocyOowNSNdQCEyYvPLwc6dyATM3SCELw454XeJ5sMukiO/AQvfJ
         4UDdRoDxDthBx/4MdkN9vJhR/2BxtQxC2kozkJMVVFsobZjoQHW0A8sPTv4T/ygD6LRi
         4/u/TB1lLv7gwBjWKsgAq86jDwqmasc7sMRWOd8D5FTgOl74vvoEGGzIT7WP+nTdGLdS
         6p12dBm5h9MCaYNc+Wa0guptP7ui646+18ACfRzbnJolkh1i+CviGJXWcRHrWvCzuS6Z
         ozMPzJIXXB/Jc7nWBgJl4lUw3yT0wPmmPlBk8lS3Ln4hcxKBk6ZFSNBwA0LQ3VbbkI9L
         DIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781295975; x=1781900775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GQbFs2CKnSzJgOy+gjpokoR/HX0Y2GFtRKZFX0F9ALQ=;
        b=VziNnY3G+deqYqs4t3MKlsJA2pbEJN9cXOWPj40GPyZ58MeTxYhoLgZhe4tsUKVY1u
         ht4FNh6W+xI4RUU54FggX1IRhAso6FvzIdfVDMt2iKLpVPIlSFj+XisQDX7cS7KJcdo9
         bU3K6fxT81GHb+tbaIqUTontY4XKMGqaDLz+mT/p7n3eGFcx1pT3sML9LG05RpzKm/qW
         hzIZdGeok8YRDa/SWGqGGKk2U2oS2sq9PBNw8oqz1Kwerr18O6iDJoN5O9Ey/yscfn93
         WGW/DBtW1GY05Y5RoYD9I3pvvLMH39wpwY/OWgBWLVQvM2sNr/gHdzAIge3UrfCMJBxo
         s7ig==
X-Gm-Message-State: AOJu0Yxbvv7EKmWbNa0c3ijhvZnlRDpGESwTSoEIjKDEWxH4c3IYIOSI
	XuDNT1f27zmVR4imuvBYImgW+bM4frZlPb01Xbq1bC08vOExu12hZSoFMIbR7Uec
X-Gm-Gg: Acq92OGbe2fg9L603EkBSQ0MyV6YU8rPwBAHCox4vbhlGpLWgaBbHMpSxr3wHqKbwnO
	5eqz3dpMEehkDrwZ5nR7p3e2qn5W/3HKrJmi6gScH/27R5Obxl+zIArsKYj4pujBXQv6OukznA4
	nhazvn1XUcOQZNj3oswXPnPNJ2+7m4YiFbCCtwWVEfyPPMQsvf5Z2sQVS5V2v6VddB0l7xUF9J+
	oJAi6Nfbej+RwpT5anKFFZy+hqiUxE9xUeLLaBl0lbACYSaeDvu7b8FCAPW0Wp80J62n7QOXoi+
	Kh89qZn4mIPinV/rrAGBQMKoZNTg8scg94xF4m36yP5hjpIwU8ktypifXOMiq/rX9ZbBMKbwHfT
	KUh99tZda5okDn5Dx7rcGV4oNMbr2DZTpZ6x8F+dV0wxFK5ZBRqxcvY9l9nAiqxarp/o3Gzwhtc
	ypNRW0i+Msb8Knv91G
X-Received: by 2002:a7b:c7d2:0:b0:490:c2a2:e91c with SMTP id 5b1f17b1804b1-490ec521e1cmr40772195e9.34.1781295974844;
        Fri, 12 Jun 2026 13:26:14 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm9173261f8f.1.2026.06.12.13.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:26:14 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v6 1/7] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Fri, 12 Jun 2026 22:04:06 +0200
Message-ID: <20260612200717.361018-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612200717.361018-1-l.scorcia@gmail.com>
References: <20260612200717.361018-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_132617_186192_9B89CB69 
X-CRM114-Status: UNSURE (   8.35  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the initial bindings for the MT6392 PMIC and its RTC device.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..e39e81aa9924 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -40,6 +40,10 @@ properties:
           - mediatek,mt6358
           - mediatek,mt6359
           - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6392
+          - const: mediatek,mt6323
       - items:
           - enum:
               - mediatek,mt6366
@@ -72,6 +76,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
-- 
2.43.0


