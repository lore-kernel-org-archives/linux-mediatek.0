Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44329C6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 08:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Km72Ozc/Vyrr+VItW0cIHsd+mEJlhUZtzVcHQEBHbFs=; b=PEUoJ3jPJpj/JHNsXeGw4u/cQG
	asEFwxLa+uzVSohtS3q3Tp8ddiS2/jUBIFduvRFl6BhhYgV4Wnl7WiH++qyR7EhBwX1iMy2/cY2d/
	t8c9ORRDYbKtl0oZiwtkmiCzTjiSjdZ+Q0/7B7NbWv/W6UfO3ivatohGaMnU3/L//Wi1RuJmFvvs5
	lKg9GFKPFyHx1uXJRa8piTp3bpkXTFobXAJ9UnkmIDUDYarSSTsA5qfHLQeLQWJTBgo/rZLm88EOp
	Hw6WdbVEvW8PWGpUNO/hxnfCpWKfs//2JvHJ+5moFOO+vDdI3ZE2QHSYUhLaJ8tVhn4ygQnmx1Y1p
	ZNKjPE1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhfO-00DNqC-97; Tue, 17 Jan 2023 08:50:02 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhfI-00DNkH-EC
	for linux-mediatek@lists.infradead.org; Tue, 17 Jan 2023 08:49:59 +0000
Received: by mail-wm1-x333.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso1797760wmq.5
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Jan 2023 00:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Km72Ozc/Vyrr+VItW0cIHsd+mEJlhUZtzVcHQEBHbFs=;
        b=n4vNbGfK5yIRIrJ7BDPqX63H6uYWeoZyYRGtVklWvA9PhGfM3w7Ee+JhxK/Sl4zc6H
         HPN04G4R0M0gvg8RWqPkTL+gXCRONRFd/JnKiZDKyTSuE8ZK8d5ezCL+0Ls4OEtmrw3t
         EtJsvGVvlfYftDXeQAZWOpNFdEjMQgFdOPaiT1BQrm38mQaaRbWutoC0M5vxmFEAkaqB
         o8r8OhRTqZ3q0YLTeJVAiWaOQQif5AOLtyPFJ5Nzqtj3/QkfWGmCshaLmZZ7yx/eoFoa
         raojrixCerAWcnK6YqR8KQA+liKnjfrzDE9dkqjQHSHfaYseHsjeh45hDUJh1/RZa3pK
         rqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Km72Ozc/Vyrr+VItW0cIHsd+mEJlhUZtzVcHQEBHbFs=;
        b=h2vTqMGcHwaOrOp4U2Jh9Q5lzpgOD2BtgSjh9YWRN6D2Qke6vkgExb353smFgvBual
         Nlo874uECP5dET9vQzQFZFfsEvP0wbIE2Z/jl6N2f/Qq5djG7vSUlhz0+n5Dt3Z/sYE/
         FVExeGdSFz3dsmgqaB8DX961vGWdvld1Ld86GmKNi8NmhXV7etwFyTbHwQaDNfUorF9r
         97UoiO6BHW66AubOdHKVurDcP5Y6LOj+21qflDe51tMK3EL7dTmu1Iwyi6zMO6nRMWdo
         9J3nCnVCW0LDpyx6EaTbvKkdCSaVzSuLHG/G/WbVCgou6Ih55IV9W8mNrGoREnNcXGU+
         14KQ==
X-Gm-Message-State: AFqh2kqdOOyPbMWBU0/yNtJ7LeQ667MFOYFoSiYSpQgMnxoYsuFmc5I0
	uGUvJE+fyc+wkxu4zNPep3FKLA==
X-Google-Smtp-Source: AMrXdXu9bt+xPzypGl/F+mIIgonOm1sPTgpGAOgsT1pbkfhhzXESU+etGoaF9tltTxf7OMxdMv8YSA==
X-Received: by 2002:a05:600c:4b9a:b0:3da:fcdc:cafd with SMTP id e26-20020a05600c4b9a00b003dafcdccafdmr2228805wmp.13.1673945393232;
        Tue, 17 Jan 2023 00:49:53 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id i14-20020a05600c354e00b003d1d5a83b2esm45040928wmq.35.2023.01.17.00.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 00:49:52 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Jan 2023 09:49:39 +0100
Subject: [PATCH 1/4] dt-bindings: i2c: i2c-mt65xx: add binding for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-mt8365-i2c-support-v1-1-4aeb7c54c67b@baylibre.com>
References: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Qii Wang <qii.wang@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=964; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=0qPQE4yGfoxCGQFTIge9uLlrCOrdE3u8zE/R7eutZWA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjxmEuhQT6QRyWEmit8/G/GCW6H47F2HxOTGT1ZSuo
 cCY6uaaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8ZhLgAKCRArRkmdfjHURfVYD/
 wPXcEZODLRlSW4k/1YFHhTcK/f/a+xBbyKmw7B+fxBkQshi6gAAca4Vx1oQP8hItEnTBMh1H0MjQrk
 cuom0S7kl6s2OSi99RSu0Jm6lNzfEYsuqy0goln16eaBQWfHegUSut6ijRDixWoR0dI2qspXDlTGwE
 D4+A2ziNmP6ZWD1b8Io0wn7Zj+jOobK0ua+K4QJamBy607Ud5yIDdujnxd49aByRs2M6vq3+VFNGK2
 w2hR7m/kcjOFKJBaTKPRH2qqy8q4g6XnBlywN3UddrYZd3AX78aili1D2Nz5iRQfxbS4QUyuIhOi/h
 STjL9hoD7IFDAVHme3rCR1pivB3P6yJ4MeTD8Qq1abKY9EVn8IqGClDKkUt5kwdepHbNKT5HZeEXVM
 AJsd0f58rNZ9a9Z7Ch5oLrfEHfAl+w4huIGNe7gOxG+C+hubVq5wC5ITKA3DzYM/WC5s9d54L9TN9i
 JQvddXyndMunjjA5QHEH/MP3m2tqQ8/Yaawx2MjJzHLdRnUZ6nqPrSHOYsNdI/5+doCYK15T2Hn+JZ
 Vwlw4tj2pzfCBfOveUX2c3cGCQ0UJnZ4yaS6d8X8kiEw4hQlrtoZIQn0DFNsliEde1L8nkk0pcHvPU
 jDsePkJb43AtoIavas5keLUwk9oe26laD4onZtjTszzuuJZyntve4KFxoeMQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_004956_595358_A3174F65 
X-CRM114-Status: UNSURE (   8.65  )
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

From: Fabien Parent <fparent@baylibre.com>

Add binding documentation for the MT8365 I2C controllers.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 421563bf576c..72ae2e01cf22 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -41,6 +41,10 @@ properties:
               - mediatek,mt6797-i2c
               - mediatek,mt7623-i2c
           - const: mediatek,mt6577-i2c
+      - items:
+          - enum:
+              - mediatek,mt8365-i2c
+          - const: mediatek,mt8168-i2c
       - items:
           - enum:
               - mediatek,mt8195-i2c

-- 
b4 0.10.1

