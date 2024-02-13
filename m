Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC34C4829A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 05:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJdBOYmZsXk7rIacYxoRlSXsJMiBHH2ge7UM4axIZqE=; b=t8eawaRXO5h33j
	kO8YubjuXoQSBypnDhdM90KoLgdqdcKN/kbx23keAHwxlqxdo6JB9n1+rA5Tf3H5L6KRiMzRoIoPW
	4tv9cIX5L1yE6wL5Iw//6+PGDMRQX2UWVsqm0DqY+LN9gZZxZ/QBO65ZExtE6DOn3JYI7/Qvb8B5z
	C798UsRc3OY5agxChVsHJf0kwd5w8ecTomRs1E5cozsdQBmUbIx126OxdDGPgf5NrqXKBxG2WNeXj
	PiPUJCGm1dGfcj3E3caUBS0Lou/hsvWQjRHWwpsQIP/XBGhtE2Zbxde6uViDFR6NjWKN0FO/3ibZx
	yGYbrzpkMRF4YMIg47/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZlUh-000000080gf-44ix;
	Tue, 13 Feb 2024 05:38:11 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZlUc-000000080e8-0Vcr;
	Tue, 13 Feb 2024 05:38:07 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a26f73732c5so542548566b.3;
        Mon, 12 Feb 2024 21:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707802684; x=1708407484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJdBOYmZsXk7rIacYxoRlSXsJMiBHH2ge7UM4axIZqE=;
        b=KxYH2g89OkRJCpY7bg6hC3uWbdGEjUh/0ur8j4QFPXN4Jzefa0/IJweZZaecqTrODl
         Wz37Ct68kbCgbaEZX1ri9wp/jaqTZ1l5u19aMsvlpE84Cuoj5DaQ7/5GSgnuJfz89VWf
         h+Wp3KxjqvEnRoC70NIuHPDPF5rJo7U5scQnWypbtqWNgfvCGDl/am++EHgFvyXLiImS
         QhHXJenXwCC4CR1oHn7YwFcBLf2LxdnQIMyJQq8OncnrYS+eBgtZLGjn7RbYz8mG1iRR
         qS3qfN/xp2pl8TTqJ3aru3wsqyL2v1RsriMcGInKoeMC6p/Pg6CAU+kktJiUaAUexS4q
         z6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707802684; x=1708407484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJdBOYmZsXk7rIacYxoRlSXsJMiBHH2ge7UM4axIZqE=;
        b=RlxToCDGvr384wZ/f3SYwFWTKbzkjrEpa049SS+gSADrOO4wcmQWltI8oa265bIFzS
         +o6sinLp/AjwK0Zm/g3uF+co2+k3/kidq/PlF4K3gWttrdAGBwGUUuf9EYUszX9Kg5TR
         LvvelVaZyjkC1cEIiiPQY91Y85zo6mdgOVn+81Tl1LV9Yn2lrIS2axoXm+9OAqsA/q+W
         tQb88KAkEWO4sK31FOKEPKW0lJeefZikiIJu3Kicot1rU/0S0baBTPavvwPFLsI3CYpK
         B3HoK6Ix/kvjeu/n8lsFy+8WM+qz1ifGYN3HZO4mMA2Hn4YNXeMB6/re2sO1PWhQAJ1W
         LFxA==
X-Gm-Message-State: AOJu0YxUmottTH88JM0n1gAVFyjrb3TGhrKGUKXaurhpI0UAtSEoF4G2
	PY/QwG55bHiIvXbA9AxfjIe5UFUdeBmD8ryPVizJ1xcpr51tRSdW
X-Google-Smtp-Source: AGHT+IHj8PDFm9WvfH0oJ9IoTIMd7KXeKjcwCsvHZaL5xYhNGkGHRD+cGv4D2a1Wq9OVPb7T4nwSbw==
X-Received: by 2002:a17:906:80c:b0:a3b:a32e:93c7 with SMTP id e12-20020a170906080c00b00a3ba32e93c7mr6387043ejd.55.1707802683510;
        Mon, 12 Feb 2024 21:38:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUeBCncLLmXxdM4x+qvGhYPF5dNohZQ7BvWWOgtW+ELCVfJwm2MTUADPrkSQBNMn0vSzoJGhSj7xNxw84HrTmHWN3tA1/096OtfW62HnnrhwmGksJ2Th9jbC9+ZcUF0X6wcZpLSWEs1J8/6DyDsma948zAPP7rea0/+XFYuLDbxDI+tI+ce9WbFP4Ki6AeWmWJNslZsxutvyOHd4axLhDIfFN06Ht18xaTI3aKO4ivnWflaCuIsVAtfnmTusBsF2F+73JCzu+PPUQPIsRLXmONqpfkBl1X003PAX/JjVxRfcMYg8S0PSn6272jurvrZpDQ1yFJVa41eaMcNz5L81yAS1wOWryAv1nR4mkG5c9smVAngEyC8zaoeTQKBz6aBU2qpm1lrOEtYNIrGuqZEkvyrTIBIcG356tUBE63GM+9v9XvTcQfK1Pc1yAaeMZTDCwkdkyB3FJExDpnhHO8WBFbI9XX810EgDsMLeZMxUIrO2UKq43pBcWCGhrcsgbD64SrGsOwy1MwX02KXDiMgVXo=
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a3d125b9c0asm16659ejc.81.2024.02.12.21.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 21:38:03 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 2/3] arm64: dts: mediatek: mt7986: drop "#reset-cells" from Ethernet controller
Date: Tue, 13 Feb 2024 06:37:38 +0100
Message-Id: <20240213053739.14387-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240213053739.14387-1-zajec5@gmail.com>
References: <20240213053739.14387-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_213806_185495_9097BDA9 
X-CRM114-Status: GOOD (  10.84  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rafał Miłecki <rafal@milecki.pl>

Ethernet block doesn't include or act as a reset controller.
Documentation also doesn't document "#reset-cells" for it.

This fixes:
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: ethernet@15100000: Unevaluated properties are not allowed ('#reset-cells' was unexpected)
        from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#

Fixes: 082ff36bd5c0 ("arm64: dts: mediatek: mt7986: introduce ethernet nodes")
Cc: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 228e02954e85..f3a2a89fada4 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -554,7 +554,6 @@ eth: ethernet@15100000 {
 					  <&topckgen CLK_TOP_SGM_325M_SEL>;
 			assigned-clock-parents = <&apmixedsys CLK_APMIXED_NET2PLL>,
 						 <&apmixedsys CLK_APMIXED_SGMPLL>;
-			#reset-cells = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			mediatek,ethsys = <&ethsys>;
-- 
2.35.3


