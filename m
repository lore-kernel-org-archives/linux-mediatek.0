Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD00CA5FFC
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 20:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7d8+d8Jg6e4zgR7b55B5I4HUSkrjz23uBlGgAf5rGA=; b=aw82F7jZThjvL9RrrOYOG4/oNN
	TguZJ0O7wi1JAE3DtdFq6IkR/RCdJ4KrtYDOKUZE6B/AojAovQwRFePA1w/UxAu5hRtfnwF+bTfn7
	3SaAWb9YgpKXnJ1FudMrEXkzDJp34pZ5Eeoi08dF8LVAu+3wHDfN0/dpVheCf1NQUgsSNRs/2YHIk
	3VgTg43VvV73yv2DlhrVI0iEom6UA+GvgahNtcV4wTs7qBP+95gR2dryzOuP4rCQt5TVP/KIMz6Em
	yUmETf1Mfjis07O3s8WyNtjuDw2iZ/lGpQii+N8W95XF5bSbiE9bDRERNALF0X/xmwuvqLfi46uv4
	sX3sEFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBjR-00000001MNQ-0DJm;
	Tue, 06 Oct 2026 20:25:51 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBjM-00000001MLA-39QD
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 20:25:46 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6b1afdf5196so424685eaf.2
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Oct 2026 13:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791318344; x=1791923144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7d8+d8Jg6e4zgR7b55B5I4HUSkrjz23uBlGgAf5rGA=;
        b=ahWTMuqDOYu/NAOs+1m8dBwTk+gBJIJhRQaNOkGTTJEb1Uojqz/VKRRO6Wt5+FV4P4
         k9dU5rlJqkcWCsJP4CBvyk58Uhct0Ev0MYP1yza6vv+8QwV30RXTeANF+nXk6TDKsMvx
         ymyCl+bZAOGxwkYLFkmciGeIyGLRH7JbewHAyakSX9SxdrRe9kGuhp+++Xuf6ZYLYhiO
         8HlroZ+5ENgDjg79lboUzA1HE+tlsLqS5/6umB5d7VOKF3rEOpyNn6aEfKc01G+1rdYr
         v/5RTHhTPtm5mPezMVR7PGO0I/MVlGHCmiad1V0gJo1hRb4qCiuT7bhQrhAOouNBK4q8
         eHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318344; x=1791923144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7d8+d8Jg6e4zgR7b55B5I4HUSkrjz23uBlGgAf5rGA=;
        b=B5ANvUhWsUSiuLI1s4G5X/JbOYf01ympPgvrBroSCvqCkzIjFAzpKOuGKdoRpfgIp7
         KLSYbQtUYs2i/nNk2CaQpepQwlmFHXJFhZ6R8LDXwMS/Av59FZuxVK5IEQoyFZvuudJ2
         HQQqacecReYDCdWLsQ1uiYNcQ2NXYwPmj+P4ZBPBOuXCiSy0x6191X8JhGqA3m0bsAh5
         0r3MnqPvdMhQ9YuCflM6bu8zjkSPJa7xNpxUx1kn5E32zNUWbQOtz+ubez3E+FOZL/Vf
         XKJhB8Mfp0V/cGz/TzJqFxj5jvISmi3V06Eepf7JZwcIf3G79udepTU6AH1ZodF+sigN
         Y00w==
X-Forwarded-Encrypted: i=1; AKwUvBwBqyKtnMpi68dKWJoQUdQU2XnVRs26qecGh1FOmOWt01y7NxFr9LcQDshbMN8QFYYwnERiS1qgUyRaQ2G7gg==@lists.infradead.org
X-Gm-Message-State: AFuF++lu+AjYSshamOHVYEWZz1QRkJB4uqnV1bqilAwMRJMKAjhNe9Ck
	SP/m4O1xDqo7ImcNm45nyPQcrAp+Y0QDNNoQ1UiD6/8mJbIWZlIYdx8zz5EG1Ups5Mw=
X-Gm-Gg: AYBFou3HgaS8ThfTjMgJJeTNpxao8d5jUREVtVbeTqLBkk/JJegeLDfZ6AcMbtfqFCv
	eMsIn3XCCRWrFYNOIyXqdXHtkmG0whAe4mJYWePD4QYJTEnDpDlmxNKTPz57Dz3QSyh2/PRVvRL
	HHXIfQ336o1TZzlsEce6+bJUI8oZ03he3Ip3/in11PNT7FBIC7FDXekSgXVg2Ksf3GPl8Mk3qZr
	wLF3axDj8RhWzmUsCvv5bDRHwpIZQQA9UyYkNoke3OnFb9hct6hjftf8KNoOg3zOtb8iz79NMHR
	Kg0s80UQznhvfCs5qTd8MiLHyvknDVh0+L1g2luuI8Pjw33yVVt4jDXhcsf1g2vIewOi1oIgU2x
	y+BUoix1j6h4o00NE+p7BkLkbcY3K7ngHWZYLXpujw9datN9bf8JhYnBVSflyYtMMrIRw4f+f7m
	PpnsAPZ5+t7YNZ6Y01L9up5tAgaP1NCCixi0W5aCLGIQP5yRw/FDZ+z/52T5QGbp5nzoHBwDxm9
	6Q=
X-Received: by 2002:a05:6820:c89:b0:6e0:8fc2:84a3 with SMTP id 006d021491bc7-6e7a9125036mr295388eaf.39.1791318343680;
        Tue, 06 Oct 2026 13:25:43 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:372:3180:ce34:1fe7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm463442eaf.8.2026.10.06.13.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:25:43 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 06 Oct 2026 15:25:01 -0500
Subject: [PATCH 1/4] dt-bindings: display: panel: himax,hx8279: add
 vddp-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-panel-himax-hx8279-vddp-v1-1-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2205; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=+6mowQPvO5/qbWu07+JM4tpqCNNR0Oy6FVUyr6NCfh4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqxVklqqKz9ZZ5EYTPs3b/ghtQnZoefwxQSM+W0
 GisMCHkGeSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasVZJQAKCRDCzCAB/wGP
 wOHSCACcvVmVgg5xUxBOP/pHIgPMZ2Lhcfg4VZwwLRNcQLQE+uS/SQ4GV4kNd5pon4GVAyGLWMA
 hluJJJ+r7f4HXO+LMEXHe4siAm4FrOxhHWzzfvdZbpAes5TzM2ZzBI35cytFG01QQjODNLk31Ju
 ok2s6QEW3pyKLzVkkCJX1n4NCk4D0Tpcxu+wDjeWatZ49EPobpXz/MDhRyCL5eucimvRxWQkN+c
 q+XA6vMhr3/TSrVZwvozFK8v9/O75FHHxwIqe3DrzkJYxxRzxfNfE1s3Vh2BidaQN4hdgc0/qc3
 88m33Uam4PLXxnMeUHzrcdShGxwdILR/UCB3o87IYotFEd3M
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_132544_801660_48A7F18D 
X-CRM114-Status: GOOD (  12.46  )
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

Add a vddp-supply property and make it required for the Startek
KD070FHFID078 panel.

The Startek KD070FHFID078 panel has a separate VDDP power input, which
feeds its DC-DC converter, in addition to VDD and IOVCC. On the MediaTek
Genio 520 and 720 EVKs, VDDP is switched by its own GPIO-controlled
regulator, and on the Genio 1200 EVK it comes from its own PMIC LDO.
In both cases it is separate from the other two supplies, so it needs to
be described to power the panel.

Making it required means existing device trees with this panel without
it no longer validate. This is ok since the Linux driver will still work
with them because the regulator core uses a dummy regulator for any
missing supply. And anyone who sees the warning about the missing
supply should add it to their device tree.

It stays optional for the Aoly SL101PM1794FOG-V15 panel, as it is not
known whether that panel has a VDDP input.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 .../devicetree/bindings/display/panel/himax,hx8279.yaml     | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
index f619aea82bdf..c79056c39037 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
@@ -37,6 +37,9 @@ properties:
   vdd-supply:
     description: Panel power supply
 
+  vddp-supply:
+    description: Panel DC-DC converter power supply (VDDP)
+
 required:
   - compatible
   - reg
@@ -45,6 +48,15 @@ required:
   - iovcc-supply
   - vdd-supply
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: startek,kd070fhfid078
+then:
+  required:
+    - vddp-supply
+
 unevaluatedProperties: false
 
 examples:
@@ -63,6 +75,7 @@ examples:
             reset-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
             iovcc-supply = <&vreg_lcm_vio>;
             vdd-supply = <&vreg_lcm_vdd>;
+            vddp-supply = <&vreg_lcm_vddp>;
 
             port {
                 panel_in: endpoint {

-- 
2.53.0


