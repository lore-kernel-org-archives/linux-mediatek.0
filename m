Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4D9C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0wAOYZVgkdcFy2J+qEOOeWr8TgaMSGXarO6ogj2s4w=; b=FPFBRjFoTRBb4HNy0TF/2cmbKc
	+D5lSFqkYtlyUg5ePNWaStFCQdFAFdEPuT9XYvQn4s3sYEBEniqE5AC4xmSVN10pYYwaQmZtsgsWB
	B1rctoZH9csRZ55ugiPNuRO2YS7JF8o1l7b4CW+bimX8pl0b7b6ZfMXdPGc/h4yu62CJR1WnYZt1J
	8XhI2M4hnxdgNyNo22qG6UR95gu7SL/41CX4OcSTYwx5FlVgG1gWULGPUZfy43gz5uNopzahOBrnO
	OdcgQG+2Tfhbo9+Gx9J8uOMUURxgokUzxXr0jNYw/Emsxl9mIDETFliBdN/voWloJKNVx1yIuq0cy
	YwZiyQYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg1Ar-000000001F1-2eLQ;
	Fri, 01 Mar 2024 11:35:33 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg1Ae-00000000166-3rK0;
	Fri, 01 Mar 2024 11:35:22 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a44888b123dso100893866b.0;
        Fri, 01 Mar 2024 03:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709292919; x=1709897719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0wAOYZVgkdcFy2J+qEOOeWr8TgaMSGXarO6ogj2s4w=;
        b=GQmsOlLksWayokkOcuR8fQvq7SIvvHNRNHctZhRqTc7fEWKhSKEqigObdz5HHHxWg5
         oWue1iPDJ7xMOu6Q7kpgp3Rc0i4aV892TJ407sPn7x90EV1gWEa/KqAN37llWbUpqM5z
         WCHqGHb8ANde2dOzlWFVe2jNE8wi89PhKpxVuAYA5vnP/zBEaaZ0MykRvljSW1YeGkP5
         ETrMI/LAPXpi17751NoWdbUk59ScpOxikU6HcTdsVcXurLuukzCFubUFqcZJU5dguTq2
         uhgCzQs1DkD3VTpoquS49o9XfbmRFWf5cHX109xJNTdnS1NKcM6t45L+mM51q2RBXOwO
         UcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709292919; x=1709897719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0wAOYZVgkdcFy2J+qEOOeWr8TgaMSGXarO6ogj2s4w=;
        b=Nh2fyZRf4iRo5b0BndYi2yxpR8V7ee7c1df8K4z8eI3WMWYr9SU3KNUydV1nXPbbbG
         jUNmnyxAbczxDLwYFRUTxW5vXxQnEWhcz1p2nSS0aRTKp7MN5qmr7ENYypEq5ExWQjsa
         MiGNTLc8gOiJnGRNT2stwGhTX5ong2ILkO4iRw7CnRJTW+N1XRGZtIZX+gfHPQk8S8sj
         8EKxblVra1ZBwlY4pNo7+sSd76+7WM/7zsy6N8FqvGqiYJrPb6tvOtcxz3NBQA1548LV
         g6BjEucWe33zNBQBbiiDPxiY+3QASjtkQ1sox6comnov8RWKZqCu7maWVweMbQrFvY9y
         4mlg==
X-Forwarded-Encrypted: i=1; AJvYcCUNiRdSVSnAMHCsoypk0cFcjbBb8IKrTW8t0LIMSIc4O+HtgdmSBI13UkJnrLHIoAMgkps1GeDt3yiYy468TxVn0EMhvAEdqDS5r+2fTWknapqX0sA57wPBQvYH9BTcp/U2MGXPaJ5+GmyzeVqB8zlL1A8yHnCMlIw=
X-Gm-Message-State: AOJu0YxHCSwxTFib3XSwiAhTgaLKFrAB7apEOQ9cyGwqRYeOAeB+m7/S
	Jd8uniWrxz23sXE07yROGBGcn5riGjulwyAr1Pw2BiCfBs0uK0Ky
X-Google-Smtp-Source: AGHT+IEXFliO0HGuCUrt7SbS2edsg8fiBIE1rDbRTtIDXkoOXXOvk9mUYsdKlIItLvK8rx6/3gjEkQ==
X-Received: by 2002:a17:906:6d09:b0:a44:2cc3:2ba9 with SMTP id m9-20020a1709066d0900b00a442cc32ba9mr1094118ejr.2.1709292919368;
        Fri, 01 Mar 2024 03:35:19 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id st11-20020a170907c08b00b00a3f5c39bf2asm1618457ejc.0.2024.03.01.03.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 03:35:19 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 3/4] arm64: dts: mediatek: mt7622: fix ethernet controller "compatible"
Date: Fri,  1 Mar 2024 12:35:05 +0100
Message-Id: <20240301113506.22944-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240301113506.22944-1-zajec5@gmail.com>
References: <20240301113506.22944-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_033521_064350_0E911AD9 
X-CRM114-Status: GOOD (  11.30  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Fix following validation error:
arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: ethernet@1b100000: compatible: ['mediatek,mt7622-eth', 'mediatek,mt2701-eth', 'syscon'] is too long
        from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
(and other complains about wrong clocks).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 7714775d1bd0..7da4ac273a15 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -963,9 +963,7 @@ wed1: wed@1020b000 {
 	};
 
 	eth: ethernet@1b100000 {
-		compatible = "mediatek,mt7622-eth",
-			     "mediatek,mt2701-eth",
-			     "syscon";
+		compatible = "mediatek,mt7622-eth";
 		reg = <0 0x1b100000 0 0x20000>;
 		interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_SPI 224 IRQ_TYPE_LEVEL_LOW>,
-- 
2.35.3


