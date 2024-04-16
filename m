Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D175C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 15:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qh9PxU4hB2rhg7F6m0ON5sprlF2NLZLAaf9QKMnEl8=; b=xRZbrlapfdQsHD2sLWX7TUcczi
	R5Doygqnw8crXy8MVm1mnCUV/wMbisBQGJgGhRJkkFJurg2FeSRDOTXRYSt5txptfa+DqV2ijxwPx
	YINrPUwvfMLds7YK5s78XwDzIB84p8Bptby7G2ZrsiJOJSVunKgA9cYSBOll9WyW/8IaA3z+pUaTX
	NrHoGLsaAkA2WsykamuG7uvJ/HmCT9AuYc+u0f8dPB5EX1t2+p7hDy+2R+gUzGCNf1bEwlYJzZTPb
	cVXC8mdeH9wZ1iPolYoKHc8x+l2JCXALF4x7huTHUViXo8VVwlheOn1U01dXPY6ji+7rcKTbcmSl1
	mVvMo5Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl8W-0000000CrDv-3uUI;
	Tue, 16 Apr 2024 15:54:20 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7i-0000000CqdN-0YNE
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 15:53:32 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a44f2d894b7so514382066b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 08:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282807; x=1713887607; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qh9PxU4hB2rhg7F6m0ON5sprlF2NLZLAaf9QKMnEl8=;
        b=JiZESfKu1DKilpHn6nPzOKuXHumRKWUObCH4FvT8LJpT0OxWxmHxOwcL6U8Il3YOmi
         7rNyFSvuHs3W7iz87ZVkOHpKag747j14vkcHYj3zKkn4dplILYz/5sgPZYRBF496xRkv
         ENURFhP6fHsxCrHWKE9mFRWHYEvDF0PBKE2c9dXu8QM+eakUQmNyjOVDtFxIZuMIg9YK
         D0r44uJXDgYwZ4j+vmRrn7MWoXNhvcCJxNPvxj2EtR5y51/WqDh4ClVAZ0VqOYj8U+cg
         s5McW1VVjN/I9v2iSNHy8gtkrlDhEXg3jwljnGlDUFFHwrv2sceUQl5IzpLV6iE5Dns8
         y/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282807; x=1713887607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qh9PxU4hB2rhg7F6m0ON5sprlF2NLZLAaf9QKMnEl8=;
        b=JQWpk67VjD5Ja8+5ILcUhkkgHuLAh9eilcqr5KkQn4Q0k5OJRzpFn66YvV4YUNpr4Q
         JsAxhlfabX4Axyks/p4qzH2Nsksmq4ubHVFdG9o/UdMMpW9LfzGxSl3oYOZTbV3v0L9S
         6yfrdKQbXUol5xAVNZLax9/lof8ZIyQsbp4KCxyg2Binv6mBNhBvpdBgMVYwiqMZm/rI
         GqvqRZfRF+jvwFOhAWG5NvV03n94r7ZNzxS6CIbUOHddp0xrDThvTeElUzjV8WoMhbLZ
         Q4ihir3sHNzF0HbiKX9AaibWfnbmpgNkRONOca/W+6mMaGxaHA/SksFffScuUoW8Nc5+
         MIcA==
X-Forwarded-Encrypted: i=1; AJvYcCUciglZLF0mp3eMOrxTSn3iUzwf3MTkA0slEd+DJS8m3PVjb8ulw1uNcJOH7p/oN4+SzZy8Zuy9SErw5bWr+OTdRiGiY32Skcl59a18wGwyrKpF
X-Gm-Message-State: AOJu0YwDWHW//RpHiK+kOfnfgeu/QUUDr8Gj94Hr3qlBNI1bNQXwCsEu
	mJnO6RUmw/YYDuB5zkUh4po+41/3Z+iBjjJZJMgAp1A8RlRx4kFaWZ2zH12EOGw=
X-Google-Smtp-Source: AGHT+IHG4nMoaKSD57SAIyTlyvLPyxnK1HAvzHuj382xIJFY3e72ktmyLHdo6Y32nrQ9p7F9ZplNGA==
X-Received: by 2002:a17:907:36ca:b0:a52:551e:7502 with SMTP id bj10-20020a17090736ca00b00a52551e7502mr8380201ejc.9.1713282807516;
        Tue, 16 Apr 2024 08:53:27 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:27 -0700 (PDT)
From: amergnat@baylibre.com
Date: Tue, 16 Apr 2024 17:53:07 +0200
Subject: [PATCH v2 06/18] dt-bindings: display: mediatek: dpi: add
 power-domains property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-6-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=P6NTpV6Hcl2nq4Xnripe5Czc4f+S/tebkAJSAKKZfY8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7q7A3lCxlMP0/HKhvtUiqGnm0iuZfwyvQOOBOs
 O6ocHteJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURUboEA
 CszLi6XJJcSVfKekD6IFu8zgjjPhyOHS6yOkiwK1inBDCiL3iYY9FBJJODWPA45yDccHp+kS4CM1GI
 NidF35oVE8KzVxPLph5vvUjfTxPpWKMuZwCMiXrOxD4YCqgtruDi6/6+ksSklxTXykiDoXer95bh/Y
 8eMnvUYTqO56etpeuErbtPrUhT4J1A41d3l7pWDN40+/KUnp36d+I/RYO7BIdBHTTQrZ/eJ5Uew0/a
 A7MjRoAHfoL/OEmgEIdAmOsFJKqTR/ixYvBJc/dTN9XshT2UAozJ6LhB4kiJ4ztGMm3xmPyIWeXg8s
 quX+bzYiYIXQnJzLJPL4UG3Y8/TUKzTC3tVajNjQKMqB2464mzI+0hfvz3ENLxmn2/IjN/nTbnkAeG
 V2t4/XyTcFKp+pMx9GgBFYcReVm4R/jYTnSNeCbo+cYKyhWHBiWdsAKqisWBXrduxVPO3Kd5YKHdwQ
 Nan0eLZTWTPJ5EjqQvp1YEM9IiQ1nc06gGpDpZnUJPi+nBGb43mp7BXlRFovjqJi9eB3yqfnLTpucj
 k8/7+2ZXJYtCi5i8D8Uzq6FWSrUUsefx3izGPKRDfNNQUtHjFs+W+C6Nqk4aH7qJ4+GQTkC2z84xgM
 trLY+7vwAgVDrICwYMmqmo8xqFYYrarWAME8lE4m6l1YvqB+8T0sfoZEGCng==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_085330_278115_00CE92EF 
X-CRM114-Status: GOOD (  10.51  )
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

DPI is part of the display / multimedia block in MediaTek SoCs, and
always have a power-domain (at least in the upstream device-trees).
Add the power-domains property to the binding documentation.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 803c00f26206..e126486e8eac 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -64,6 +64,9 @@ properties:
       Output port node. This port should be connected to the input port of an
       attached HDMI, LVDS or DisplayPort encoder chip.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -78,11 +81,13 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     dpi0: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
         interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
         clocks = <&mmsys CLK_MM_DPI_PIXEL>,
              <&mmsys CLK_MM_DPI_ENGINE>,
              <&apmixedsys CLK_APMIXED_TVDPLL>;

-- 
2.25.1


