Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD17DC64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvjNBXeeYphBWgNkcT8wLT8gdWY2M0B9Tjp0nJ/il2U=; b=iE1ukBdOq/TYLda3BK6d7NDWjU
	UUyJ+xNhTEq08Q1WWLp/lulXc9+cUOGFPkU1WZhWppD6VenLCdbmT32Nthj226eTy55iEGkqN/aK2
	5z/EOpcmOngI2XGQ90HFR4QncV3Rx2yQOuOWsFVNYoFSmwUxlCgTi5QVShVwfhTSO3OkgZSoalee2
	c9Txp3OKoVpqQycOCFCZzq+4zCK+EUh5a1oI34cPboO1wWSs4VkTyUf/2IIov6vDtfoNGmfYTUcGR
	JAO+c7MTXhz/UHCyLH8SZcmZiY0xHegnnxybufReK8+UOg/S+nl1Gfd/tb+9/o1w6HYXFUywOexiH
	1H810qxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHPE-00AaXu-Sg; Thu, 09 Mar 2023 14:38:08 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHMQ-00AZJG-84
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 14:35:16 +0000
Received: by mail-ed1-x533.google.com with SMTP id g3so7888979eda.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678372508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvjNBXeeYphBWgNkcT8wLT8gdWY2M0B9Tjp0nJ/il2U=;
        b=4KYfaUs16ATIQmgfHGIiO1XlwvR2SggVkcJBEfiVouxApDCubSiGgFbPnSShsETRYy
         osLsCoGwTaEk3ybDE64pvRN0q1CuG2E65nOYWfbGZ+C5SPT8YhTZCuNcLUQw2WY4XPP1
         NBz4RVlVi04CxccL1W3fnHHIIL09pwbpWKy9XAXSymeDX+btDdLk7yRgpY8uCZKrM0Nt
         W1Kx9TIHNdGQWDaXihZegh+OE3MrbWbii/J5URuEDCG9wjr5ziAtXL4E48LjIZNozQSu
         Ukh7NzPBPnVSHj+qW6Z63i8H/D9UBpDwqKXvQuiAetFI56QFgXbv2l57bJj0p/huvmdl
         NOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678372508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvjNBXeeYphBWgNkcT8wLT8gdWY2M0B9Tjp0nJ/il2U=;
        b=HlCKYL1wrpb1TvBP2tnND2xVuwkdyD7VLLFWWdt/RHLtgZZb58MBtC6ij+74ocz5mY
         /7eyDQwFhQp8sR0Q4qdOP2MJtej58BMPG5cVBxttDWhPIeV+czEuq54LRACN1VAoNErI
         2bb7L8kiKmcn929SiJiJytKKflM+q2nGqOwBhdHxr8PGc6puiAGyYxDsjgOyi/mniAfs
         9JtrKt6LaE/TfHLmwb7G1mB1dNUc+akpZYSlOBRsZxWTK51r9c8ZDbL9QgcKWFzP4J/8
         rpXayvuT2MzcLzlxuzpBxF5f1t/wm+f+C8F8jVbgEPB64gPbm1uxze5X1TcwGM8/TRWz
         SXOw==
X-Gm-Message-State: AO0yUKXJ6zKiTBnY9qb5oPSPLRiuO5waOuBsb7yfkYpSnTp+B9gEB5hC
	/NzHqr+39nj7zhqdJor9SyISAhfDDWR7D/KFMQE=
X-Google-Smtp-Source: AK7set8Qe8U6tp7US8u9NFqeRC9Aiio3kqtK7ujJVoqRZi/jAyoPIflQmwQykEFZpkPXbalGWg36QA==
X-Received: by 2002:a17:907:7da6:b0:888:b764:54e5 with SMTP id oz38-20020a1709077da600b00888b76454e5mr26631536ejc.71.1678372508260;
        Thu, 09 Mar 2023 06:35:08 -0800 (PST)
Received: from ryzen9.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id w4-20020a170906184400b008cb7473e488sm9046239eje.12.2023.03.09.06.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:35:07 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	maz@kernel.org,
	tglx@linutronix.de
Subject: [PATCH v10 1/3] dt-bindings: irq: mtk, sysirq: add support for mt8365
Date: Thu,  9 Mar 2023 15:34:57 +0100
Message-Id: <20230309143459.401783-2-bero@baylibre.com>
X-Mailer: git-send-email 2.40.0.rc2
In-Reply-To: <20230309143459.401783-1-bero@baylibre.com>
References: <20230309143459.401783-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_063514_350083_5327D249 
X-CRM114-Status: UNSURE (   8.95  )
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
2.40.0.rc2


