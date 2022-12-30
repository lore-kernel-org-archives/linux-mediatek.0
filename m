Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB91C3DA7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 21:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Kf0xOoeDeJQWB1TH03nWqIDkbfzo3q+4qiIvdKLrU4=; b=kzXpUr3j4cZE3KOVy0EE7CKqXL
	W+fin54CLUXq1QNj8bz7a/nVGLbxwpPD5msLy0C+n0ed2GITDyL2gxId6P0EMunmJ1+R86uc5asq9
	RdaCx01s2B2ZinTeSd67x1u8mP8gxPWzFbhusEpdWXcul2LKIjnXcAu6nwVPLkA/CgNKH44UO6q0w
	BoBAvqirJNyUifOWuKlwQ7YYGvS/CcxAWZiou/MXV4VABQzK2sbgW20bjLYG76DlMng+doi6UK5SF
	GQcMBPVNequFpd6Nha1cYqt5NlK9eECq6fc9DbsJnG/LCm6Fqq4vDpyD2flFbXt7G1CgifttvQ/fT
	B2p5j6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBN6j-00DoAb-LY; Fri, 30 Dec 2022 21:40:05 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBM6V-00DLeI-OF
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 20:35:51 +0000
Received: by mail-ed1-x529.google.com with SMTP id z11so15864069ede.1
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Dec 2022 12:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Kf0xOoeDeJQWB1TH03nWqIDkbfzo3q+4qiIvdKLrU4=;
        b=LLQoS38OnHASC8acnayjA4I5IhqidYoxtW1YHfRPgckuXaIsfjLalsXQBSlCse7MnE
         fWqmi8FuRnXAGGRvUF/tFAZhGn0L2ArZ+yhcCK1YnojVIyD6N7VtD6/RnnCaPqLFnRRi
         HEcPa/UwJ5H1PEthsRu7N9Zw4bwR3ISVRYQzp3A/0lBXtkmb0Yqs/qzchm74/MhrVDLQ
         3s0gq05bYZrEQS+LpY73SKxiuqPl3BkbZ1MYRSruBcMVzUfJZFOwxawLJNsORlHbBvgQ
         bpy8yuJCFNBXcuNIBHY0ucKZpljOO5vT0h6WLooiHHwFQBJ286iliUyCJFV09zwpu9vv
         wZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Kf0xOoeDeJQWB1TH03nWqIDkbfzo3q+4qiIvdKLrU4=;
        b=tQoXgIorNrm2Zj9YNvFMD79+l0reaWqPQh6mc4m2kwvmpXZykMmHR8OqLk3OMH5D7A
         RFmcT69GxMyF0Ov+a4QdWYzPeABOiYeriTCmHltVJzEGlOdCRZs/muo9WKR2ChNcv547
         dq7HUz3qsbb+W3DdfH1DAxyC2tCLSKtLLUedu2M2zolaynufIPeePd+SnRirC5OkajXd
         0GQKGhMu3Efys3pCNKzqP7Cawv7dbhC3CgeAOg2PJn7f+zGw4ku4KLZ+nbXqg6UZcZsG
         0BZWA449u7IAFKCSHuanCI2nIVEeXD31TUrHhAVnUKufsqBqzLTEusryrJOJAoe9uN7f
         WJfg==
X-Gm-Message-State: AFqh2krhJAo7fGBpuw9kT0iCKJH65ZfToPBcvX1byd0t+TAcoZQXdPvj
	hZyV1+r3EPj8U1il31eqAMLG82q3QgT3ZwGEysI=
X-Google-Smtp-Source: AMrXdXu9goJPB88HKG+CvZxdGOglMZLhVQ70bS4NdrOMdf68jLD6EjYBlX8RUCF8snwUJ6O4JCUJhA==
X-Received: by 2002:a05:6402:456:b0:484:8b49:e117 with SMTP id p22-20020a056402045600b004848b49e117mr16804743edw.3.1672432545224;
        Fri, 30 Dec 2022 12:35:45 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-2a01-0c22-cd9d-4b00-ef17-3c78-1696-7315.c22.pool.telefonica.de. [2a01:c22:cd9d:4b00:ef17:3c78:1696:7315])
        by smtp.gmail.com with ESMTPSA id c10-20020a056402158a00b00482c1f1a039sm8350500edv.30.2022.12.30.12.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 12:35:44 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	matthias.bgg@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	gregkh@linuxfoundation.org,
	chunfeng.yun@mediatek.com,
	linus.walleij@linaro.org,
	lee@kernel.org,
	maz@kernel.org,
	tglx@linutronix.de,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v6 2/7] dt-bindings: irq: mtk, sysirq: add support for mt8365
Date: Fri, 30 Dec 2022 21:35:36 +0100
Message-Id: <20221230203541.146807-3-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221230203541.146807-1-bero@baylibre.com>
References: <20221230203541.146807-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_123547_825304_77BB9005 
X-CRM114-Status: UNSURE (   8.74  )
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


