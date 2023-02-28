Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A692EC7EE33
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoTZEtmrkUQkLMvWbseF56KVXsJKgmVJ5cikWWvBTp4=; b=Bs4ZosE13gfVP2GZ7ObgzfRXno
	PRGi+pU77Dxq4T44tkFNRznxX7taXvbZ22cd0hx28BJQzwDlEwS1//RjdJbL3Lk1bWrNhKUsDWfaE
	fCU0W76hhHYvakXXcujD5v9TwpacG3F6c5LZQjynqdMVCkL2cs3rPaXvM8xC2v2iJGhng0xeGZsAe
	jCA5eQ4DUdAHjXeifJPPwRcPHH7UvB2u50M+ceaKIqNBeOiOMf0yOYgYYpG4c9Jw6LC3Gl/cEETIX
	kdHIounl9hS5DY/yCzkYvoObQTNFNyg+T/h+HT+4d19tFdoDVpJIK0IT+S1tI7IhNdiVbavUP4Ypr
	ZsGuaD0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxCn-00CcLM-5m; Tue, 28 Feb 2023 10:27:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxCS-00Cc5O-61; Tue, 28 Feb 2023 10:27:13 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 19EDA6602FD8;
	Tue, 28 Feb 2023 10:27:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677580030;
	bh=07ttYEO0iBLHOrhXOFTPyKzhESTahMlFIiXlO4bGx5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HwanA9e8mQdP3F3nehvW+iHlvEKe5WR1w7Ik64jb67REBrVYaOGHmeCnb/cBWmP+3
	 O0eqLn0o54Vtl2zQIJvaoTCJkmxc1IJTDGM44j2cpFV0SQ80Hb7sqzgFXHNuDSvCUF
	 6A8nwA2xhX+22Q2aFA2Ckbg3gdo8bsL/CuDxdXJLaB2H0nFXGDQQ5phS42jz2Le6cq
	 UAniRBIPAO0lVda2L67lVGR2ut/B/j/oi7s1bhuBLvCOdJSpEPdmlRYXgYTTHSDlET
	 kU9+dLtg0YnJiLIKrnvEmr2nlQ9+enUFdK7QH50b1vHb5+hTU5C3fCAmOmPlczawXt
	 yS9fsVl5VaL9Q==
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
Subject: [PATCH v4 02/12] dt-bindings: gpu: mali-bifrost: Set power-domains maxItems to 5
Date: Tue, 28 Feb 2023 11:26:54 +0100
Message-Id: <20230228102704.708150-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_022712_373713_0A06E2B6 
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

In preparation for adding (and fixing) power-domain-names and MediaTek
MT8192 bindings, allow up to five items for power-domains.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 7e110751353e..5b7f1c9d2b30 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -63,7 +63,7 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
 
   resets:
     minItems: 1
@@ -157,6 +157,7 @@ allOf:
       properties:
         power-domains:
           minItems: 3
+          maxItems: 3
         power-domain-names:
           items:
             - const: core0
-- 
2.39.2


