Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583B5C00A8F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 14:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SkwhU2F4TXr5U8/eIVmqKK74gpv3rz72+n1Z9i4NLQY=; b=0nN3id6SfyMRHmtry4DKOWsR5g
	SfmtHsDnV1GNGEOh5pkEirinMD24+wnGDYysO+aXq7hjEnx2yXytZ46v+gu0Hb2lqOheCbPef9Lmq
	ecqS2D0olesteEcAYye58yJKWMu9Og/TXnFJV1UXmcCuCmIprxxji8yNPd4GIKefcqu6AWhoONs7A
	vI1/XPBdlLJBAtbFrWUjeYN8gxl6w/4sChB5gnhnVq+b4HEOQzhFaa8Xpwl5sxTrwvs35Yi7XO02Q
	XSePNmIUXc77V6G9ZRQzqE/HYCEcb3QXfeh+/Eb31hyR1MSq6cVSY9s9f2kC1MQdeFDa/ZipRXfeT
	fVGPbc9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw6n-007Zab-10;
	Mon, 23 Oct 2023 14:40:45 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw6b-007ZRm-0v
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 14:40:35 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-778940531dbso209174685a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 07:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072032; x=1698676832; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkwhU2F4TXr5U8/eIVmqKK74gpv3rz72+n1Z9i4NLQY=;
        b=dMsSjB8Wqp/Go52ISPCkHAGyM5Un0ZUvJNSSpOdhFg/g1FtP0vn7l7BjqefG32BGc7
         pYD38mEqIFKlAsWLYB79en3v+GltqGBoWNTG8m6tqI0Jc86hSES+RApUMsBFFvEUtGRX
         PhVca1aoP/w4NXI7UO2ea2n5Th3zAb8qWt+IapxuNHaaVJ6SNkvm4Xx10gCIZPlGsE6c
         EPg8vH6H+Og4SD/y8/6DkfhVluC/LojMN+qZSjel1Gm9+Nj8BdVHoZ5vOo3FEXYPg7ww
         1Jwkub2QbgrJ/j+2RLHgcsuf3+tD2tn5YFMo15j3Z3f05hBp7NUjNQMmBSzJ7NagNtO0
         ljmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072032; x=1698676832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkwhU2F4TXr5U8/eIVmqKK74gpv3rz72+n1Z9i4NLQY=;
        b=FaLVX0AarMkeIJNd0uwdxmE6IEA3cbtv0OtG1P0Wz+uYFjN8aTu7RQkNvTi9qdikzo
         hOEIPdAi+WAweUaO5qIPYaCOXYjYXbcxpC5lkzjGk7jeyetDLYBtGSNba0qmGiBb9H7f
         kQ4IC2NCg/8vSO/vbgtZGUnI+MGgwJ4Qhrg+mQyGOXi5ujlRhRGapRi7n5M7vyewnHmM
         cPwScTlbCf1k5s40m/ZwyfH3RN+/TYHR/H2ixTB4bODKO/RtZynI1ZQNu0AwbH/kdGDK
         c7Wdl/hueIYudgNaSqOdgMgpzVJ3m4oCamQynNl+YFzySd6ycgCtilQwJ+DA6gPJkIrf
         GUdg==
X-Gm-Message-State: AOJu0YyDemq9J2zmQTsHwSDiBYkVRlDfRodwEGlLLuJYTE3qrwHXbsJ9
	r2Xk1vvW4uDFn3xpkD0wNIY14A==
X-Google-Smtp-Source: AGHT+IFoXaN6pVThre1z/S0bbgU8FS54cZC6t6c+5RXc70MLFec5xoE9QM4x8jGHB1G542vMIjK6xQ==
X-Received: by 2002:a05:620a:1a09:b0:777:74dd:621d with SMTP id bk9-20020a05620a1a0900b0077774dd621dmr9306621qkb.15.1698072032470;
        Mon, 23 Oct 2023 07:40:32 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:40:32 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:04 +0200
Subject: [PATCH 04/18] dt-bindings: display: mediatek: dither: add binding
 for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-4-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=938; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=tYxquOkpHCbnFi05aHcxCGsRKb8h7qDvHcF/fXuV370=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXOkwi2U4WCrequXuzYCvok2QkmF3+0zqAfxGGm
 J896eL6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzgAKCRArRkmdfjHURViaD/
 oCnO3B16x6z8742sQoq3Qz35HJC9XGKiHeYoOY2xIdc2g7wjcBOLaA02OVr7AbLQPFMJ4zskMA4uaz
 IjSpJd6ha3Gdh4fql86jC1THgW8paGXUOfdna0fEdRXWf/TpfPschReTyn1q6a1YHdByWrYAXbyhkV
 JOOZp7q5szn7Cr+4KUdiAUsdynt83BQMUiWxOf0fwa4+vO/EVy9Ufs9m6xtufJJFGgoEH+UjxHzyrf
 58I40s5RZyWwQo7GAu3VWsqrcMUF/txYb5il27M5gdXSfPH6HbTubmMMBNXMAhm4i9TC172GOCUsXX
 XqCMkDF9xwCbjqPQJgdRR+4Ld+2PpWrTjNEEhf3YGGMV1i2kVJWY4Rk4j5EaNJ3nZvhFng8fnpzwZh
 YcU9lkXwpHD3nfO/9Ll7J7tvDexb3pD5v+M3EsS4ViFAmKogqOXS5Ev99oBj6D5lbzcgB/wryuRK6q
 XGoVJ75TlSy6Yg3XFIMggMWra+1FonABuOdIZx1Zm89vE5/w/MIJ3h4pYuQUSJ6KXdTc7V+nCgGo6N
 BSGnJVYub2dD0vJxKOSqnG2fESwz2kTkO9lcuCYpmW3LkfpxIdfwU0TxKYAmRtGuwsJ6deFOp0NsCM
 SujXn5rcipp1UgI6zjCqhbxOV3FyFENNZ6M3tN9RKHtk0ZN9xiIRoicfSzOA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_074033_323790_3B98C752 
X-CRM114-Status: UNSURE (   9.18  )
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

Display Dither for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 1588b3f7cec7..6fceb1f95d2a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt8188-disp-dither
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
+              - mediatek,mt8365-disp-dither
           - const: mediatek,mt8183-disp-dither
 
   reg:

-- 
2.25.1


