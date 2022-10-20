Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB778C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 13:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OTh+ZIjQwPwHMVAfy9H3FuL7YWrhAHg4js/lzlDK/M=; b=ccA0R17j386fMFG18MJPOyh2RL
	4ZqjmJz3jvoFVKnOkCqzLeNTuJ4/ONcXJtzDZav2NSk2yKcn8+VMwHRr43w3WY9KuYoq7Tghu11j3
	/Bg0v3iB2thdhbf2KXFnmVK3N7CIQKT8F2owGY+rhr668aJ1vGsjgiHxsHQw7adwcpiyBMIq9lziG
	/zE5BzPiW0SXwHId6aPATf2lCupMNnwxfhHxXJwVPhGasRd29k+uWe/fBMhLKw0gvJo6EZXw1m6ln
	eTm9BA24Gl89IsAOCAA6Zpr/tSqZfL5ySsM4COqvqhCCerVMupgZCSsY469j/EfDOP6AlF62KB8DN
	2HWzYJgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olVXg-00FQbB-F6; Thu, 20 Oct 2022 13:25:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olVKT-00FISO-3T
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 13:11:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id m29-20020a05600c3b1d00b003c6bf423c71so2327666wms.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Oct 2022 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OTh+ZIjQwPwHMVAfy9H3FuL7YWrhAHg4js/lzlDK/M=;
        b=6EDUCv6G2UgQRsVfJ2I9xQEL96UJ12vdRg5bkhFeSUS8KL3XWADImhOHZXbAIPHbsz
         GmHQhGgrSI/cNNtSpNEpHuRe/bsQhMGTz09Hv9UvDI33MyLuh7pZgk43VdA3PpgjLAwJ
         NmoYOQN2+ZrW718j2+WcpYVDPIjYAvYHpuL3bpDNOFzUt5Ln3uXrnMfZAbbBEsduYBMz
         DoMsVgSf2XfB5WZ9oxb2tvygvBDN3VYb8W2AaHe/GAZlS1CQbpFIOMQqVd+UtNo8K6bj
         ndPy/tScUYbYM5Y9AQTV27ydm6D4mKb8Oh/Dmu0yY3juBM8PEVuiO0IO6vXjafg/tU6g
         jGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7OTh+ZIjQwPwHMVAfy9H3FuL7YWrhAHg4js/lzlDK/M=;
        b=OzqVotJ/yESZ16INpdySefeaHwCBmhN3dJk1jOmvmqAuOLZZHqohtLZe2Vd6OaF2BE
         MSw3y+IrRyFgieDGShqSRhHcPuACOO3H5losQQKNmcl1TbnmDZ2/tKKf4KHjN0kTpIbR
         QfWom4v3edTw8+8FLNvxWoRD5F5lADlBD/Jb+hZ835bjR7n4VD/LXsACd9mPj9L64DGi
         1/Fb9jfu91yDt2LgxL4srwVMGfwDeclQj29+PMpMQAzHwq6Rt2VHM1ZpD+aR7mtyUE6s
         q7WDvdgDN2vF3VCiJcyo9X9jP7SLqRnLk4ObqdG9NdmqYbpeH2ushC+x5wTDuemkXUf8
         rO3w==
X-Gm-Message-State: ACrzQf0uWnHo0yJRl+JKRICFw0QSC7rGctkX0eUMcDk5+EliyqFoGPxo
	KjsLLSWmh04hoMGCyh4hffk/hQ==
X-Google-Smtp-Source: AMsMyM4H6QWebgtrEClimXbfEJCgl+fA7qmmKxkNw9CwlgBsl2gKl1/603yBgg+rs0YW7nVYwcm+2g==
X-Received: by 2002:a05:600c:4691:b0:3c6:f154:fdc6 with SMTP id p17-20020a05600c469100b003c6f154fdc6mr17950920wmo.195.1666271478376;
        Thu, 20 Oct 2022 06:11:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3a82:90b0:2979:1615:9a68:f204])
        by smtp.gmail.com with ESMTPSA id x8-20020a5d6508000000b00228dff8d975sm16453927wru.109.2022.10.20.06.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 06:11:18 -0700 (PDT)
From: fchiby@baylibre.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	"Zhiyong.Tao" <zhiyong.tao@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Sen Chu <sen.chu@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: soc: mediatek: pwrap: add MT8365 SoC bindings
Date: Thu, 20 Oct 2022 15:09:55 +0200
Message-Id: <20221020130957.25197-2-fchiby@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020130957.25197-1-fchiby@baylibre.com>
References: <20221020130957.25197-1-fchiby@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_061121_167427_810AB70E 
X-CRM114-Status: UNSURE (   9.97  )
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

Add pwrap binding documentation for

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
index d24e2bc444be..8424b93c432e 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
@@ -30,6 +30,7 @@ Required properties in pwrap device node.
 	"mediatek,mt8186-pwrap" for MT8186 SoCs
 	"mediatek,mt8188-pwrap", "mediatek,mt8195-pwrap" for MT8188 SoCs
 	"mediatek,mt8195-pwrap" for MT8195 SoCs
+	"mediatek,mt8365-pwrap" for MT8365 SoCs
 	"mediatek,mt8516-pwrap" for MT8516 SoCs
 - interrupts: IRQ for pwrap in SOC
 - reg-names: "pwrap" is required; "pwrap-bridge" is optional.
@@ -39,6 +40,8 @@ Required properties in pwrap device node.
 - clock-names: Must include the following entries:
   "spi": SPI bus clock
   "wrap": Main module clock
+  "sys": System module clock (for MT8365 SoC)
+  "tmr": Timer module clock (for MT8365 SoC)
 - clocks: Must contain an entry for each entry in clock-names.
 
 Optional properities:
-- 
2.25.1


