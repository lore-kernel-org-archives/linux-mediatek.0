Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9B6C77B7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 22:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oNdmLNDKUs/TKLR+gsT5NpmW/ws1iPV3pHW3NShG8U=; b=yxJYcAFK2il6a5fToDC1efkOsF
	wWyn5c3aSH88HJJUrTj3QYn/eOOQ68LBEeCscDN3oMnpFYFdheTw7l+GBMCrqg2AEKWt17Ar29Kqm
	99Efq3GmEuDI04PlphX3IpgJ6jdKd4fWd4RUf6YxF+7TMQyVKceg+tvFDdDQly/hE91Y4+q25Z5nS
	3XumU2eBMMCE9RaJsJ4XA9hXUjVCyhtMLZqYVjl90AYptret4x/br4GCLoPssuK1JpCPVysgBxIfe
	U04nObvBYzoSXCNdLdrqxnoSa7ynZkanWSzolDbGBSBIA88rHlyQSySAzGiEVhkyTeRv+C+IO9Uif
	bA6BikRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxERu-00A8GH-1m;
	Thu, 11 May 2023 22:07:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxERt-00A8Fq-1v
	for linux-mediatek@bombadil.infradead.org;
	Thu, 11 May 2023 22:07:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4oNdmLNDKUs/TKLR+gsT5NpmW/ws1iPV3pHW3NShG8U=; b=klo61syUbNDK5zkR2MQQJZHyzd
	RHCf4LK6EwCfe6mL9dUli9kgkRfpdI75+6P0opoIncv99AayyRmdm9TC+0upeGvVantMvWtnPlZo6
	vWThSmVkm7fL6mcY7YqldgYBZaoPmN2zWiYykWgvXUO+naBB4QQztI9C5MaCF+XMRCw5Xl1E+T04s
	m9btoL1UlZsd7M/o6bH5iUqtvft5wzK931ExF6ty0fJKbkxxpMea0orZl860oY9+SD3b28QCTNAlT
	ffu7WkoOq7VKt8kQSI8qztLKoh0DqjajTA6naCTtvitU5Un/OXELQfrZSqWZ0aqY2r+G7ClZxd5Sc
	rC7cO1Og==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxERi-008PU4-1v
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 22:07:43 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-250175762b8so7936086a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 15:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683842849; x=1686434849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oNdmLNDKUs/TKLR+gsT5NpmW/ws1iPV3pHW3NShG8U=;
        b=FKICgaJfahEVpza6/yNir+fScXx3x3STtdt4nOBeEqwSVZml+ci7oo7WA4LOpHskZg
         yP1GfbFkAfnafJDiyRdUcrop9yvD/R/KlOyppyOUZYqxS6ThoYq6mLS4Y42Vc70gg1rQ
         PTkOZyGoUNqzdK7YbeppQldT1a34MEx609nmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683842849; x=1686434849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oNdmLNDKUs/TKLR+gsT5NpmW/ws1iPV3pHW3NShG8U=;
        b=MIFJrN+ZLevsoLgZq3xMykmQb624p4D9023AhRveaOUrI0IMyhWaGKYL2vu6fBtsh1
         ut7MWrFknsUtF5YgEaZ8ZQxbDpSEtxrOvbD36zZXzRaGuAvSJe2/yz2r45tpgO10QGtP
         WMThQsSVenfR1rzFt72g4ZWy8LhX1fwkGM94p7l06M+rkrbKVNlJ02c+ADZgSL/E65b3
         gCGyraGhcvrzxIml+/JQ6dPHQatkCSw7y3AuNdfZtPkCmQhwmQO2ijjFFkYOyujWy5bT
         vpLD7ejCvKETKcd2MzrdsYzoPlbJf9Y4xY/FDiZCqv3raMUV3Pe8MO2LgsQmlzFxoc1S
         5BOg==
X-Gm-Message-State: AC+VfDx2FNNN16wQpHMn2ftoeeITc8fe3/MfY9FPvdECBYMEli9ZGsnD
	FonfXHevfjVzYNxVcqJZ3KYNrg==
X-Google-Smtp-Source: ACHHUZ7KHoYJUF8QcmYx3zYXY/ErcV8fKCA+CWgEODGDRJgk0tu1drw3OSzYGpFg9Cpo3TKkns7Hxw==
X-Received: by 2002:a17:90b:3a8e:b0:247:6ead:d0ed with SMTP id om14-20020a17090b3a8e00b002476eadd0edmr23026494pjb.28.1683842848965;
        Thu, 11 May 2023 15:07:28 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:b96a:d776:ee3:e572])
        by smtp.gmail.com with ESMTPSA id h24-20020a17090a9c1800b00247735d1463sm17589457pjp.39.2023.05.11.15.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:07:28 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	Eddie Huang <eddie.huang@mediatek.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Ben Ho <Ben.Ho@mediatek.com>,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	jwerner@chromium.org,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	yidilin@chromium.org,
	Seiya Wang <seiya.wang@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: mediatek: mt8192: Add mediatek,gicr-save-quirk
Date: Thu, 11 May 2023 15:05:39 -0700
Message-ID: <20230511150539.5.Ie7e600278ffbed55a1e5a58178203787b1449b35@changeid>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
In-Reply-To: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
References: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_230738_988919_966ED7D6 
X-CRM114-Status: UNSURE (   9.18  )
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

Firmware shipped on mt8192 Chromebooks is affected by the GICR
save/restore issue as described by the patch ("dt-bindings:
interrupt-controller: arm,gic-v3: Add quirk for Mediatek SoCs w/
broken FW"). Add the quirk property.

Fixes: 48489980e27e ("arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 5c30caf74026..8931c59c69f4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -412,6 +412,7 @@ gic: interrupt-controller@c000000 {
 			reg = <0 0x0c000000 0 0x40000>,
 			      <0 0x0c040000 0 0x200000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gicr-save-quirk;
 
 			ppi-partitions {
 				ppi_cluster0: interrupt-partition-0 {
-- 
2.40.1.606.ga4b1b128d6-goog


