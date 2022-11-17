Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C001C43217
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 21:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3nU7X0djX9jQ80iI8+t0kZ5Fy4kB3s5F+snjwXKwEE=; b=yy1zBWGlvJHN4EHnd/HHCjcLA8
	RNKsj+Nu0Mh2WJ9yN8KKB6JoInjetuYgv8iYhg/D9q5zpH4QqqRigPhT2vKj35hkU8dthfFOIx+ss
	X1cBwyy4fsHsKWgJv13JJMZ98409V9OsRRBL37Xol9giWMBzjV8wcXR/DyEeut6wU9XYh8T1YQxSy
	nHOHarZPUgLKfeEWr8soGPQ4CwbbBrXxvqKbVcXutYkpWl1NJNNlanGhB9ttzTgzHuTLkQKlbGwxs
	NcCh2a88lXXf6IAYXw5NUKHcpeEj0JlMf2WSh3Ko6Tf7g24T/ByUUMKrnmk3NFXFDwKzFH6AfxQu2
	yU5oz92g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovm3T-00HUBd-GA; Thu, 17 Nov 2022 21:04:15 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovm3M-00HU6O-J7
	for linux-mediatek@lists.infradead.org; Thu, 17 Nov 2022 21:04:12 +0000
Received: by mail-ej1-x62b.google.com with SMTP id f18so8244195ejz.5
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Nov 2022 13:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3nU7X0djX9jQ80iI8+t0kZ5Fy4kB3s5F+snjwXKwEE=;
        b=x0/2+JLtr5Wevfc3DaNs8djNaF+ABrzMQdBLyBvmMIRdvFr6TTAal/W4ymfMF/LlMm
         UmJRTSm/5ZTxaaFM+jIxzkNZt/gGSeS94TkXx6WN8rWl7SsHcL0P9Dzz+sVnmPvFa5OY
         zJe1wFSiHOnYcbK5spt/YUA+pX2CpMN2X5HCQxWMCok+28apKKiMYIznTp6dENuNVIbH
         5a4KZsa0LSxYYLUSkVZ5hMRsVQ4tnnjBL2eq0rB9hADwj/LotVke1a/rmuiScWKgwFPb
         9yHqrhNxV5adPmAm5q/DnxiqoWKxH/nf/e9WDHuxJHHT6hh3r0fpL+BaiJqrcrxrqF5D
         oPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3nU7X0djX9jQ80iI8+t0kZ5Fy4kB3s5F+snjwXKwEE=;
        b=A/Xr/c4shyhhwkMVMODNt6R/+NF2ixP+TjrtPqJOtp/YysHLo1UjhE7XoSrcSTSsnP
         JjQhXQHbbLeCYSmS5GlcT6QBHbNJAURx4gut7nsw5yrGTM8IF5WEvO9iGIUfydKe80Pn
         xd4CNWeLxFvjUqySSxvEKekAK5JJdCIKT2nKFZedRxUHvaXotEndOn8wHK/DaDsBW8Au
         BKeGOQneJKHdGL9goONXYBZZkP0q5/aEQMxiCbRbeZo5O3Wp76iniMYgD0vGJ43NnGWQ
         K1oHsvi1V8N4BGRN5YOJxgTib3+WHVYweSFGwKN0AHK/NIXitiuFkPVbUXNkw4turM3f
         q0Pg==
X-Gm-Message-State: ANoB5plxEDhVfnyJkz6Fm/Ecvhc8Nlsziwr8iiS9MTZ3eMD4NTHnCDKw
	DtXpeApnaZ1Y139MDMKDRDDBsXb7pFluKBx8
X-Google-Smtp-Source: AA0mqf4uoNtESHdzhp16/6ko0ItxfiZu0quayLxZD4UoKpS1Y/Tuw9fVd+KNhzvHX8Qelbqbvsb62A==
X-Received: by 2002:a17:906:4e46:b0:7ae:129b:2d3a with SMTP id g6-20020a1709064e4600b007ae129b2d3amr3568516ejw.552.1668719045581;
        Thu, 17 Nov 2022 13:04:05 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id p15-20020aa7cc8f000000b00461c6e8453dsm970807edt.23.2022.11.17.13.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 13:04:05 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogiocchino.delregno@collabora.com
Subject: [PATCH v3 2/7] dt-bindings: irq: mtk, sysirq: add support for mt8365
Date: Thu, 17 Nov 2022 22:03:51 +0100
Message-Id: <20221117210356.3178578-3-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117210356.3178578-1-bero@baylibre.com>
References: <20221117210356.3178578-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_130408_672889_0ADE1877 
X-CRM114-Status: UNSURE (   9.23  )
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
2.38.1


