Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AF9C64EC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFSNjgvQCbRLKguJlWgZtXeN1OyCNt0GGC7S26hO71c=; b=b+rk8VtDaBlL+KYhcXLWWE//Lx
	MIrQn8WdrYZcFGDu39Znf2Abl7F8QekDzc6gSVWileCjEmyMW1yuCJznNyWbDYVq3AHNVQez++FOl
	OmVy8vEx6CCLZidtgt0C+TPh0AarTTNthtidRrg/U9R0ttgAy/zWYAi5eek80RllqO6psFEgLPIHQ
	KLVtSNnASH+T9JxJ7lrY0Ux9gx9tWTAQTlcMn2kOu7wzco0KsnZ/sxvDZ0HsJ3Y2GzZqdol3LF7PF
	MWTm84l2dJ/0khyR0VDxutHWoJwIPezaJua/c/3mIpbF8sqBoaytCCrCN/ULJqhNTzIvG1Ho5FsZx
	1oGLYz3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxFN-00CdoH-FQ; Tue, 28 Feb 2023 10:30:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxCX-00Cc5k-3j; Tue, 28 Feb 2023 10:27:20 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 01DB46602FDA;
	Tue, 28 Feb 2023 10:27:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677580031;
	bh=IUwSDoZ0KzMAk6G35a7rYGldsO2EXTi5ixj8lVj11EM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S8Eds0pn6StacRidqZGXiX9a612WEx1EH26yZRBqyAP74bbjvEgbKJTpWdOVcnk3k
	 4r21SW3n48f0VBiyTwGIMgLDxASk32LY0CqLzSnmqnjm42qDhDoeqk8iAPNmrduvsq
	 8oMChUnwHmO324BfRJ76hwV4dyh06bEzl2scsCSGpXxcvulEoUuJsaIQ9mdrF4iBz/
	 Nwd3CqURq4E5cOg2w8vAp0ltFLi5qLNJ8ORVj12bTXXbitwOKIMHxp4OWFGjRZoSfe
	 C+FfmzyBZ0qR6J+qwkGC6Xd7VFmGt0lNygeNbG/qRRvaiG5dVPP0pu2Z/BzKog21T7
	 1V5sIotQniwjQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 03/12] dt-bindings: gpu: mali-bifrost: Fix power-domain-names validation
Date: Tue, 28 Feb 2023 11:26:55 +0100
Message-Id: <20230228102704.708150-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_022717_384935_D9B4DD7B 
X-CRM114-Status: UNSURE (   7.43  )
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

Commit ("dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183")
incorrectly introduced power domain names for MT8183, causing
validation issues.

Add power-domain-names to the base schema, allowing a maximum of
five elements; since platforms having a single power domain don't
need any actual domain name, disallow that for each sub-schema.

Fixes: a7a596cd3115 ("dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml          | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 5b7f1c9d2b30..bf0f7f1f71e0 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -65,6 +65,10 @@ properties:
     minItems: 1
     maxItems: 5
 
+  power-domain-names:
+    minItems: 1
+    maxItems: 5
+
   resets:
     minItems: 1
     maxItems: 3
@@ -112,6 +116,7 @@ allOf:
       properties:
         power-domains:
           maxItems: 1
+        power-domain-names: false
       required:
         - resets
   - if:
@@ -136,6 +141,7 @@ allOf:
             - const: bus_ace
         power-domains:
           maxItems: 1
+        power-domain-names: false
         resets:
           minItems: 3
         reset-names:
@@ -186,6 +192,7 @@ allOf:
             - const: bus
         power-domains:
           maxItems: 1
+        power-domain-names: false
       required:
         - clock-names
 
-- 
2.39.2


