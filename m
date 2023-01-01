Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DD2C4167B
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Jan 2023 22:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Kf0xOoeDeJQWB1TH03nWqIDkbfzo3q+4qiIvdKLrU4=; b=mZXXvx633AepWgEhgydh5Dek0N
	NVb+svJ+h28qVYnhfsZHinGJfQfkiQRykhDRa0ICHU72fDaW75o3cbNy+A9SR4DqguaX29WpfLvhE
	rUu1jynspFMJ05D2TKS9vMkvLdvkn+zBgbqmlEWRBMa8RLUBT/ibnf82XNIE3NK9C2eh86zDiB0W4
	ZvoOeUhAsAf7ZKx4jwwJtJ5XClQfaeNhvc+KPlwozDt3ruZ7L07b/Mf5wjWCn9A4hvmQ1jxQcj98X
	yCPSfP2+t4UThzIfApF0Fi2XM5UyieQUMotXy1wRLZYR6vaHHBcdohUoUOeSXbeO0J5Lm064i3e4V
	dIU7Cptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC6Ts-005iYR-Hw; Sun, 01 Jan 2023 22:07:00 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC6Ox-005f6G-TK
	for linux-mediatek@lists.infradead.org; Sun, 01 Jan 2023 22:02:03 +0000
Received: by mail-ej1-x62e.google.com with SMTP id gh17so63023364ejb.6
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Jan 2023 14:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Kf0xOoeDeJQWB1TH03nWqIDkbfzo3q+4qiIvdKLrU4=;
        b=Pp9O2j/6k/ED7Zy9xSUA1swB+79DjfeS1LLO8QUVSOUPDQhjdFTI6HmVbOByk7Qfqw
         8R7sM+pohS75N0A70uGkCJFlkQ/8pwH29SjEpGRk46LJ3qxd5WoZtm5tJmKQdGl9srWi
         7a5jn2kUoe1csEEqMhrGDiIkBGk09Q39P3hsoSY3/vjKme+mg6PMfdXnVuicGbfXNci7
         641q5iHZSeFgiChjefUUhedBqDsaadwRYCGwivJZJwDM4Jj7U31V9T3+ntsmOj2kPVO+
         /18q4h50FzwMtslvoR9puJ6h8Xq15nFuWO78RNR+xGYoGaHaDjBtMAdTH+MR1fFJbmbv
         4wjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Kf0xOoeDeJQWB1TH03nWqIDkbfzo3q+4qiIvdKLrU4=;
        b=Vi6tEsyClYBoIpfv2GSzopTcUCcXYQo5iKEUFaRdzqZnUAE21sARsuIaJSgbfXSX1Q
         ePOoq94QrW+tUqjM9X3mfu+c9lb7y2F/fwDUyGw1sGwkP/Q52dkgTx/5Nt9/RmNixOQ3
         FwlAlOiD7gtwP+cCGuakQ9U+V+rQpj1b7N6G5ea3M6OOzcP1YY74F5/zwaweOmnYy6eD
         4F5OBiMb5Bi//iW3dtrOJ80UJNEcjD/7ZF+kLACEGVRaB9w3e4J1rJ39ilPPuPHLDDqG
         5RYZg5Yar29w8FZHjhRWVGYOz/DxuYsNkHxnMdHIKgXEGL0oc3mtTxu0o7Ez+/OhgK7s
         12zg==
X-Gm-Message-State: AFqh2kqJArHW2SD+GDXgym0IgiYop0WoXMRvMUHpwTGkLAX3bey51bae
	Okb9jYPWMo1kRRnYVflVxsS/WQ==
X-Google-Smtp-Source: AMrXdXt5vQTH9/i/RsawNBgObbyJcwyNurkF7NWps0XcMCUu+231BiRRvMAEvco/haTYcbRF07Kang==
X-Received: by 2002:a17:907:c315:b0:7c1:b65:11d with SMTP id tl21-20020a170907c31500b007c10b65011dmr29974534ejc.12.1672610514090;
        Sun, 01 Jan 2023 14:01:54 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-2a01-0c23-7c55-d800-0fbe-25d2-487e-ae5c.c23.pool.telefonica.de. [2a01:c23:7c55:d800:fbe:25d2:487e:ae5c])
        by smtp.gmail.com with ESMTPSA id d12-20020a170906304c00b007c17b3a4163sm12486807ejd.15.2023.01.01.14.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 14:01:53 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tglx@linutronix.de,
	maz@kernel.org,
	lee@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	angelogioacchino.delregno@collabora.com,
	allen-kh.cheng@mediatek.com,
	nfraprado@collabora.com,
	sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: [PATCH v7 2/7] dt-bindings: irq: mtk, sysirq: add support for mt8365
Date: Sun,  1 Jan 2023 23:01:44 +0100
Message-Id: <20230101220149.3035048-3-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230101220149.3035048-1-bero@baylibre.com>
References: <20230101220149.3035048-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230101_140159_994400_BC55FE5D 
X-CRM114-Status: UNSURE (   9.29  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
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


