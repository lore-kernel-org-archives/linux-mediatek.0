Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D9CCD98F2
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jun 2026 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qm9QBhEQ0YB2AXes3jM+Kp4ITvGr2+JfvL/tfEuQ2tI=; b=PV3tlMyiWR6oU/JVe+lgWhuRT0
	isVMB9R+k5cTmRq14ix0iR6s7PRue5IxEfOoOp920EUqUta5KDFG4piUvcPyX72Kv0iDMu0OaODSG
	TRqwKxmtB8jPJgXh4oq0KycfdT5WFA3hJh5OZfcZtN8h2uhGdhoq7rMJ7DIvoWoXPUwLfV4hGISZl
	sPkI/10xK4qnmiAUnzeqHyFAQWyzNFCN/qFsqiZgMPdUCGiyjWj2sOiqBNF4/GsO1rgxc3xGDj+ws
	8I/b3HyrX/0f4kkPuZe3RshMQ+nsykhvpMWZEb+k7sSlS8204Cyqryr8Dw6pNVdx51rG1uJk1jvqm
	cyWsu8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1dk-00000006O2t-0ESu;
	Tue, 23 Jun 2026 13:58:12 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1dg-00000006O1M-3Iv6
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jun 2026 13:58:10 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490b7866869so56037005e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Jun 2026 06:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782223086; x=1782827886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qm9QBhEQ0YB2AXes3jM+Kp4ITvGr2+JfvL/tfEuQ2tI=;
        b=j3g3hqiONa7DsLffh1cx5ZFSed6f+K6r+P/ildEyyhMyP5QdV52XVYXVazfLRYnmrS
         PimThzWpKsSvOxDwKKXEb81zjcj8+qvi9do5IpY0v8/JHYSgmRboaPNoH/QQPXvfRMgK
         tSLGCnpzHsqhjwGvVdoNF7Mo25IkLy3PCJ98xrQPsiNwjJUYJ88BPIm7jOrBHC9q7Izx
         Aw/j0Kc59msvPkUCoxDq9JGOTEHx8S6dmkPfK2s3sYGWmVl8mqNikiUiJGJgT0tPrwBI
         TYl3319wEjPr+gaqI0HTBG9hxX1jDcRUN8/wg/xPJVFneAgibGfZUdEbdNmwT6y3h52A
         4Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782223086; x=1782827886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qm9QBhEQ0YB2AXes3jM+Kp4ITvGr2+JfvL/tfEuQ2tI=;
        b=rVwdmFke3bsRRewfk7j3CBsrdTD3CJR21Wv5bis1b/2E7UHU4AeZfwHtxLs4sOHnUZ
         hmkQAwp09k1ZzGnXZILGDz4t6aZN/r6OYZJpJXR6r2Bn8CrNZpaRF0ozX4JkztKqL4oD
         wDWWVZUYScf5qzpRRztghsqx9TzgNqOvas0pa9+RgrxE15ti0aAezoSGbtlOStWVqbV5
         KHqKsnAlfO8c/b2H939LuVm7ZeqRHpVqmIXmuI957PtwOMVVID8gH1KJhhuD5XZXM4vB
         JEeRSpTt7q586GKu3lmpedSr81WPbU6Eh8VpvEr4yvQ0JXOU5PFvn9wV7A7dU8xv2Sos
         1F6g==
X-Gm-Message-State: AOJu0Yy1b41AefSx7iOTl0WQP4P7s3npzxDC+J05xgACPOOzcgziaMTJ
	IGMMSgv1wiY7ceuIGeQAxATMWr7jY3gLDoZjmmz/OuJq5s2sq5kat+HN0XMgqkVB
X-Gm-Gg: AfdE7cnGxGRjuDtk9XYk0tSzm5KI8H5dZ1dzb3xs0mndfU518+ZVMyrvBik7/LtnmeY
	70oQ/Kmif60CT5/qpxVyWYRCgNAEUWCnETcs3LJ1nAXiTOL1WAfhDJgS70pDKntGSvxJSjEqOgO
	xKSS8XbPwWtQS08l/lVwKtb7Okq9yBeMFcw7i+Sc1jHU9IUlRUs6olI0wi+nicQbI+psTc2fI7D
	pOU3r45u3MRTeEWIwKY8BAvV8gCyd0JxNRFrbIF7ZBZrhNdUNEp7Cjs1QQIx6K149b0hi5PAJas
	8ldr25KcEAsP7gy1q1BVQPyucxsMvGhwnRVYr4frpu4xx/w/ur/o5RN14Mg3zOsNsmbSz4IZF2S
	ZkUDMiunQnpd1rpEwOg2IMtM+lD6+mGystXUDA7nth5S0qrsgy30hPGpykKReZojCoDkUjsIp0v
	OOSmaUZg==
X-Received: by 2002:a05:600c:3110:b0:492:463d:b2af with SMTP id 5b1f17b1804b1-4925b38ca04mr38947105e9.31.1782223086132;
        Tue, 23 Jun 2026 06:58:06 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f56aasm35145716f8f.6.2026.06.23.06.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:58:05 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: mediatek: cec: Correct the compatibles for mt7623-mt8167
Date: Tue, 23 Jun 2026 15:57:53 +0200
Message-ID: <20260623135757.5111-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_065808_837592_3519AA65 
X-CRM114-Status: UNSURE (   9.19  )
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

The HDMI CEC driver for both mt7623 and mt8167 is actually the same as
mt8173-cec and the mt7623n.dtsi board include file already uses mt8173-cec
compatible as a fallback, but the documentation lists them as separate
entries. Correct the binding by adding the correct fallback.

This change fixes a dtbs_check error.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../bindings/display/mediatek/mediatek,cec.yaml       | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
index 080cf321209e..4d741ba415e8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
@@ -15,10 +15,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt7623-cec
-      - mediatek,mt8167-cec
-      - mediatek,mt8173-cec
+    oneOf:
+      - const: mediatek,mt8173-cec
+      - items:
+        - enum:
+          - mediatek,mt7623-cec
+          - mediatek,mt8167-cec
+        - const: mediatek,mt8173-cec
 
   reg:
     maxItems: 1
-- 
2.43.0


