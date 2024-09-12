Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501E7EED60D
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 14:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBobOyxG7h8nS1KWtk3g4MWOyKZOXk2z2jSGYhG4DTs=; b=KOKeiMTpE7Q/4P3X+YNQOa48qx
	MX0T9yVYqxGSQoJarBd/AM/wZB0QnLnvkl9msAZ4q0hKfmGwaBLM43l0YZNw8WvljjyIE9VEkCqf5
	msqawFIXu9ZJtY2YzLkFlMg8mCwhKEZMbZOTMdxh8nb2YuzLBeSpTLqfNwWkla1hHKrUOV4P4cFFK
	o07ov0EUo2bKTcvlXCVjPlNwmAWAh+8o9f/rg1wmWlsX9oDK0Wd1hWjiX468zWT2CsRqXblWaI+2P
	thJGmWbY6m6aOeQjAx5hi8lbzHl9BOXNcctQXitW+U8VDOSulBwM+ABs783EsrsuYhymT7qj1EDRN
	kdmW0j9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sol5x-0000000DPsV-3e8a;
	Thu, 12 Sep 2024 14:46:53 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sol3q-0000000DPDa-0rvv
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Sep 2024 14:44:45 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5df9433ac0cso548391eaf.3
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Sep 2024 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726152281; x=1726757081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBobOyxG7h8nS1KWtk3g4MWOyKZOXk2z2jSGYhG4DTs=;
        b=FqnjfYhKmDq6Gffz3bdlRRb1fBLyBeUo8P21rXH1Rm97tqFC1ylRcE7SOwR2BnXyFE
         gHpV3Cb17t3yD6bUGpkWfKMV7xd6xE6etLIYMSdd20HNGjtG1AxY0bZgxZzHSFELP8ld
         YlWfQNlD4DEJ4+cxnh11ewl9FPwgMG7/xucag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726152281; x=1726757081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBobOyxG7h8nS1KWtk3g4MWOyKZOXk2z2jSGYhG4DTs=;
        b=jrWosvoB/4V/VxAa08lqYS8eyN315zhB0N5fChrP8xwnT/r1sD6gVzjSFtNOcORwAU
         3n3FhbWoJq14GKCITprrQhMt8zU6Ze0XhCEwf/C7wH0PSnsyJupqK6CNGXan6AX8qBAF
         b86MPSonHnKLhFWnokTvwMB0tEa5MvQctSV/H4UkUPKfRZeGy1HLMzJ1OGaiw0AwDqbb
         8cNptMMmxExlBqV4GjcAx3ccNG2V1AqymKFhLMkepNBTVLls300SMgAF7aNDPBnugSTh
         VINj4XomZYqZfxRCH2o6jhiCcQct0O/35uAEYkhwqP26C7i4o6lUyeyTJhsAgw0ACiBI
         wnkA==
X-Forwarded-Encrypted: i=1; AJvYcCXjSwR3o38C39WDJYiSjlEGE39vKDniiG94TrSMyxuHLmcvf+0k3F2Sf0pnzlZux6xu01EkdJdQQQCJRzMaLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcPafAsvcpzb5Ac1tnJUQgqlWKTDv8cDNIKPhFy0BKjkrRC5V7
	HpKwXofimbC18tbM4d2de/aGjcftlL4pJTxjHfCC8085xCZMmlFl3mxx33XwSQ==
X-Google-Smtp-Source: AGHT+IHO/WoJUXlOGm3jql0fNBGLuC2NTWOQUgJ/i3VELhySJR9ptX7aA3pjDFcXYgWO/HiMD6f3fw==
X-Received: by 2002:a05:6871:2b27:b0:277:c21c:8619 with SMTP id 586e51a60fabf-27c3f0e0e6fmr1795567fac.8.1726152280812;
        Thu, 12 Sep 2024 07:44:40 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:8638:897f:b6cd:8c44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fdee186sm1826269a12.85.2024.09.12.07.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 07:44:40 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: display: mediatek: dpi: Add power-domains to the bindings
Date: Thu, 12 Sep 2024 22:43:58 +0800
Message-ID: <20240912144430.3161717-2-treapking@chromium.org>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
In-Reply-To: <20240912144430.3161717-1-treapking@chromium.org>
References: <20240912144430.3161717-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_074442_272390_ECDD4BE3 
X-CRM114-Status: UNSURE (   9.96  )
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

The power-domains property is used by most DT nodes using mediatek,dpi
bindings. Add this to the bindings to fix the schema check error.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 .../bindings/display/mediatek/mediatek,dpi.yaml           | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 5ca7679d5427..7e0bb88f5856 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -42,6 +42,12 @@ properties:
   interrupts:
     maxItems: 1
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier as defined by bindings
+      of the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
   clocks:
     items:
       - description: Pixel Clock
@@ -82,11 +88,13 @@ examples:
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
2.46.0.662.g92d0881bb0-goog


