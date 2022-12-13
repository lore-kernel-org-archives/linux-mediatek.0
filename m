Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8642FC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 23:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O64VFuluv/+RAMm/QFXRr7gO6/gguZoVuAfGvEuXsBQ=; b=VhRUN7TKqsJDzj6JQ4bLZkGG3D
	akimJ8BjXDiNGTdCP+cGN8kKst0ta0vf66b0fYmEt1IGFwjJqWluTLFiIuaSK3ymjOG5V/JP7G/fa
	RLILxgG60eYMVc/jrCkwBs+H/0uJQ6A+L9I5OAgVexY7aR/AkF6MNnj6jM6jnrUVqs4oWN6eyAHg5
	kpov9V9IXgVmSuWeoMsDPsjFN5C6kXLfx6YH2p6HK1nWXpEK161ez7z1ROBO5OCgDqfccX/IodDp8
	/eXqlYU0l4SIXbkXUQowTQA9hS8hEH5Ttf85j0aZFOZYExxr8KeqlARHDCQr6ZJ9ZGdKUjnrPHUKT
	oBeOJnNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Ewp-008BGY-NL; Tue, 13 Dec 2022 23:44:31 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5EwD-008AyL-GK
	for linux-mediatek@lists.infradead.org; Tue, 13 Dec 2022 23:43:57 +0000
Received: by mail-ed1-x52c.google.com with SMTP id e13so20202028edj.7
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Dec 2022 15:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O64VFuluv/+RAMm/QFXRr7gO6/gguZoVuAfGvEuXsBQ=;
        b=F9RT9ErcDtYTRk4QvJML9Q2BwydzJrsY0EeEGEb3lyQZkpJPZ1825l40mqF59gmBf6
         IEP8/v5jMBBYbDVWMW35gsJbsDp6lrE983cm5GCT4nE4ccUju771j2+52gLQlO8oilL8
         wnWt/26odfyzZNddt7U43WNY+7mNwD2VuKihmUMbVw7x3poO0Tyk2AVzjzS+U8ahunkJ
         ZKsvl4t4z4deKT11qyMyAXvqQdylk1DXpf5MLAHcWsr7LWp3E/wQOdr9J03F0KskP+1x
         riOq9XMk9doRBgxrxIBs3e83RozJhm+4mnJHoQL2RzxKMt0Jbbca/oB0f5BNbaw+Wed2
         CUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O64VFuluv/+RAMm/QFXRr7gO6/gguZoVuAfGvEuXsBQ=;
        b=gqprCoimquTacFSoqlEdFIsl3d4fKXXJa/OXkuTKXGmYn9CeK2fgm3vltgDsh/hGP0
         9lmaVSgdp9OPZKlnS/mq/8P/STTKrUNG6MlJhqGeQaqsGG9zgpSK0vOCIKDuh0r2F8b9
         NnORjUxl6XgZ4Vhfv6ETBeS0/itBKm9MpnmbO4/RKDLxulIlAGu5BfjWCSQUthslofbv
         yn0UyokRT33aa15dnrezK40JVGROs4je3BMfF1OEic8pty8UAuISUb6q52Lm99Xk0kw7
         MJ3pEAiv7mhEPHwQoyX0KP/qGdbY/OzsKhygMaGw0T0G18aXwxkkOwqDb5QHboUBIQRH
         6Qzw==
X-Gm-Message-State: ANoB5pmd8jj0luXc0ImihAJVhYM+QYkQQX694a+XAIdpBT14yQ/bSTjc
	BFPhIvOJLapwVWadZNLFIsZXfY6kQ5Zvl2CXHDU=
X-Google-Smtp-Source: AA0mqf44+TtTHjB2d/Gl2sH9AH4zHu5kBAdtGeps2WGjNdvMA739ICQX1O2kyUGBcd+nn1H6QRtCRQ==
X-Received: by 2002:a50:ee1a:0:b0:46b:6214:44c8 with SMTP id g26-20020a50ee1a000000b0046b621444c8mr18101392eds.39.1670975030826;
        Tue, 13 Dec 2022 15:43:50 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-093-129-109-038.93.129.pool.telefonica.de. [93.129.109.38])
        by smtp.gmail.com with ESMTPSA id f5-20020a05640214c500b00458b41d9460sm5407498edx.92.2022.12.13.15.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 15:43:50 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com
Subject: [PATCH v5 2/7] dt-bindings: irq: mtk, sysirq: add support for mt8365
Date: Wed, 14 Dec 2022 00:43:41 +0100
Message-Id: <20221213234346.2868828-3-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213234346.2868828-1-bero@baylibre.com>
References: <20221213234346.2868828-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_154353_614848_73FDBED6 
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

Add binding documentation of mediatek,sysirq for mt8365 SoC.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/interrupt-controller/mediatek,sysirq.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
index 84ced3f4179b9..3ffc60184e445 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
@@ -25,6 +25,7 @@ Required properties:
 	"mediatek,mt6577-sysirq": for MT6577
 	"mediatek,mt2712-sysirq", "mediatek,mt6577-sysirq": for MT2712
 	"mediatek,mt2701-sysirq", "mediatek,mt6577-sysirq": for MT2701
+	"mediatek,mt8365-sysirq", "mediatek,mt6577-sysirq": for MT8365
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Use the same format as specified by GIC in arm,gic.txt.
 - reg: Physical base address of the intpol registers and length of memory
-- 
2.39.0


