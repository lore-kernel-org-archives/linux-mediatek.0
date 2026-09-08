Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875E0C79F99
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2026 18:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cr8h1Yq/NnZMM4WE8/4qnlK3saUP4YTKFSQMTgTF9Wk=; b=IKb6Feq/rOGp9titiP6cSfGHET
	Ex8wu+VSj+PmCN0Nwg6IShzbmVwXLn01sLkLQY9p6mPsaeqQ2ZB85uBSjNMflU7LGkaWeuTjTF4p9
	SDvtuyc4bWl5d2AWs2FLkGV3DfPPgBmg6hOueVnCRJCf2Gk64jk5BbMmo+g8XUYbH99zPJ6ZkoGsc
	f0WNGNGqiJK5ihnHng/B8DH7Pj2qxB+wqQw0HQ6jrSl/4ooinA6QUrlccZSy8s/8zM5garlES4MNf
	JukIyQFUiyZ42C+O13I2BYjBeWO2MwZx4bkAlgmKtyLhDuDAjctAQz2pl/Tit0/zJ11JTqwylbLpO
	rSJiOXWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x40lK-00000009zlJ-4Bdk;
	Tue, 08 Sep 2026 18:41:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x40lH-00000009zkV-2Y8E
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Sep 2026 18:41:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so60109185e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2026 11:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892898; x=1789497698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cr8h1Yq/NnZMM4WE8/4qnlK3saUP4YTKFSQMTgTF9Wk=;
        b=m4CMcTwSmSsrADGP9Hogxse6VTy6Ugg3Q/WWq9+kVOCr/TUF3MGuPho40mFnoxM+am
         c1UH3tk8do9d4ZoD3nAoyc6YZeP6ZUYJhW4h87W06dw0Bzu3BrsFcJmoY7AFmmmOv6eE
         KsZDDa+eoplctR4ydXnkWcKhlg/bdLmhpoN7h6xOrnJISTJ1J90lSIlHTuKd+h5tJ5bB
         ggVTbP4pKQMXhr/+V/ivclN9Ff4OnJJexBIxgBolKpOW1ieZ9QmrbuNao0DZW/zq1VH3
         5QgEfh7cQRQ5EYQ5uLiALGsNARJNaRgvsjM0doVfOkTkbiIWwkr/xgz4Orao2aBgvr7m
         +wSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892898; x=1789497698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cr8h1Yq/NnZMM4WE8/4qnlK3saUP4YTKFSQMTgTF9Wk=;
        b=n4fi2W+Hxy0Wk+TWYbl5wDbLSdEOUmICeUXltbza49L+Mk1T+f913aD88/Po7k8Txo
         +MoJSuAltjlsVCLcs2lm+iYQlnIUExQ0jxldrFA7fPiHYHtl1vb4aePnU3e4O9aR+OJ9
         BcIwOvt113Ebh8krYDmwcc7NtKL83MOhKT2FnxKS2CPWvjkj9UcCmMQ+Z8nM/S7XZ4f5
         nJYEvsz6seq+RufJHWbKQlxpgbctd6XccdFpkTY9ldPspS91h68f6KtbpcnXG3CASxnx
         AGyo9ztRSJnQEnld5aZhRIvWWny4motyeook4Ni8qam/+V/HfV/xL6Z2dq2fJPABddTI
         9hAQ==
X-Gm-Message-State: AFuF++m/AImfgmHo6nlpbQyVjTSA23/ZfQPr1C/RFAwddgAkFT6221L7
	uS8fQk7LBYBmHh/H8a/IYsMeiqca5JcUOPOxFTuk/ylNywugC+7F+QAn8zzxTcMC
X-Gm-Gg: AYBFou3FS156ckIPl+IjPWsNd44IcgHi2BEmoB7jyznq1FTsAkqR1ncnqQnOn50Fs6z
	4aV+AuBFMIEUc4MfFlTXeWNqioAFpRKovzHeVY6RnULwuHzhkp6tPgwtbrSzbTQQ8rK9Kl1UK6X
	YWS3N1Hh6k5iEvbRZVKg3x6ybtPxpDaN37oZHYHQXr/05rQat5+L9RZEDHwk+OjpVc95epemF6i
	GEhI5Hool+PTGp7WK7sE6o2DUBAg97ImoR3OPSuymqAtTRv9DoRsMvdUn1p3sEkDsfMDVAqJfwY
	ExMszvQrY305hpCL0QIEo8eLj+4uaPnWoemUtbVh4SOiaz6bdr10uwlUDdgM/Si95/w+Q3a/v5b
	CpUS+Kc9PDikYHWsOClLFsj9xqCNTWYSWdL4aC2m40LUkeMx3Zh6L5czCYJM3r5OwNo2L3PScP9
	ouzKSij6bAHz+kfTivcqeFKabGW7gKpO73efrDQSw2ZQR79S9JJDEIw/rr
X-Received: by 2002:a05:600c:1da8:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49cf825a530mr371178485e9.12.1788892897552;
        Tue, 08 Sep 2026 11:41:37 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c81c3sm38558775f8f.26.2026.09.08.11.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:41:37 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: [PATCH RESEND v2] dt-bindings: mediatek: hdmi-ddc: Correct the compatibles for mt7623-mt8167
Date: Tue,  8 Sep 2026 20:41:05 +0200
Message-ID: <20260908184125.10916-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_114139_665512_EA035FF6 
X-CRM114-Status: UNSURE (   8.81  )
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

The HDMI DDC driver for both mt7623 and mt8167 is actually the same as
mt8173-hdmi-ddc and the mt7623n.dtsi board include file already uses
mt8173-hdmi-ddc compatible as a fallback, but the documentation lists
them as separate entries. Correct the binding by adding the correct
fallback.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Fixes the following dtbs_check error in mt7623n-rfb-emmc.dts and
mt7623n-bananapi-bpi-r2.dts:

i2c@11013000 (mediatek,mt7623-hdmi-ddc): compatible:
  ['mediatek,mt7623-hdmi-ddc', 'mediatek,mt8173-hdmi-ddc'] is too long

 .../bindings/display/mediatek/mediatek,hdmi-ddc.yaml  | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
index bd8f7b8ae0ff..966127e1ee63 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
@@ -15,10 +15,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt7623-hdmi-ddc
-      - mediatek,mt8167-hdmi-ddc
-      - mediatek,mt8173-hdmi-ddc
+    oneOf:
+      - const: mediatek,mt8173-hdmi-ddc
+      - items:
+          - enum:
+              - mediatek,mt7623-hdmi-ddc
+              - mediatek,mt8167-hdmi-ddc
+          - const: mediatek,mt8173-hdmi-ddc
 
   reg:
     maxItems: 1
-- 
2.43.0


