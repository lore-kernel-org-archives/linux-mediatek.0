Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496A3C27C52
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 07:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DHA3KEk2g/apjGrou/c+y75Q4vt0/85gH4m1Mkq0938=; b=pcOEBz4tsFT4RV3zZdycTM7Jua
	M78EPC1eWK94CEeCsPaNb2dn/2TbrIDM2rJixAbEzQs3tkB7fQKk2t2Fox9Wz/MTudzPyE48Q6uRI
	07P0jME7iisu1CnYVldtrCSpzgwImm8S3COGHeOJoo5faRzHTEjAqij0d53D4QRS0XUp7AU/etevD
	XpYLn18dWZijbQlAkgUFBLqZ/SBTTRIAytxS8Co5Z1vgGwJGedSeuIppOuIEyyGUdswKnajPE+kV7
	yYBvdGcDxCVHsMHM8t7kSQAbc9KeZsBqaz2Zs9cF8uWU/kS9SIi/PkHpZWcc6YzpHOuWLo9MY14lw
	QoDBtaoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEOvi-00000001ZVO-3Hxh;
	Tue, 04 Jun 2024 07:50:02 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEOvf-00000001ZTk-04Uj;
	Tue, 04 Jun 2024 07:50:00 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a68c5524086so64003066b.3;
        Tue, 04 Jun 2024 00:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717487396; x=1718092196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DHA3KEk2g/apjGrou/c+y75Q4vt0/85gH4m1Mkq0938=;
        b=C58elxD78rqNJcbQiLgQmDnlEvmmu76pimV3vGAuBW8eC2MYFAiJDDW67UMgnP7Cy/
         vRkM0gjsuy7yYtzTtM5RyIARXPL8iYehV3j6hNJ2nDYk1n26Ieg2MAiSpY1fTsAj4SkU
         boXW0XFu7lLe0DHQyDdGC+21TMm7AzjkIWLyLTJyE7XEdSbEUKzbEtcjKK9hpazgnHCJ
         xwRRBwIexi6peVqHrqaR8VilfkNqISXSSDBdAp8YpHQ+egB/wW8BRdmp4CYDgA41Q71X
         hNPd3NEgGNLH+1G6dDTmHv37baOpwWMOthEkRP+nD0odCaTxonpHkz9J1eHMKs/7oFvX
         S30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717487396; x=1718092196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHA3KEk2g/apjGrou/c+y75Q4vt0/85gH4m1Mkq0938=;
        b=rK/7ZPdr55K66irBTcnmW3PfP57BjbdYzChy/W+geq4s7YhVm7Oj3urpgSSXfhYvqo
         TDI+5jp+5sDBA5D5ZziSTVW2IYEcBjTl2NHtGUQUy+d7GbN/Izp18zlXV64lG6tQsov6
         VjV0uxqLQXBxRFTZIPRmhZEnwZg1rfaQHhhP6s2DUsOknmHbJbcAJggkub9TYkT5uu4i
         tcCERggtqaJCFcy+ewHz0AmXbcuBvqoNH2ulsdqIy2AYKd6ICmr0NMJJYxeNI8U1jrIv
         GpJeuDfpM4rOfW/qUNBS6zCum4ig81Tj9NOFjrqFBM4WWr8jS3nZFHk0Q1SKjzvloOaJ
         K3xg==
X-Forwarded-Encrypted: i=1; AJvYcCXZgKPCyg+8OIhth0fyUMCWdZlsLUji2W8UYdh5iiyFNacPvg0eLc0prIpKJMJ3NfowZhmLuVbJ+/4SmgteEBRZ3WGUc84fumAoO4S26oxLkg6XEWHiVMZvgrmtps1aeZxbNN8JqaOrLIKexwuuP/cV96T5HaPs9cM=
X-Gm-Message-State: AOJu0YwvvnFZu7Q/fJxaLkYHrz2oZJzxdgckPvxbUTJQwImnP6XsTiSg
	dPbr6ssJLNoXNUPHO551zMLq/qI9uJnGgNQ7VBCaQv4lWqJjBERp
X-Google-Smtp-Source: AGHT+IGsGK+GtqJilJahllHxxOVjumHcBrpj7rXJs3GGVqVNJKitgz8G29Il/To/F6Kuupk+XVyWzQ==
X-Received: by 2002:a17:906:1dcc:b0:a66:fb17:3567 with SMTP id a640c23a62f3a-a681fc5c632mr806547066b.2.1717487395926;
        Tue, 04 Jun 2024 00:49:55 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68a4071470sm480188066b.205.2024.06.04.00.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 00:49:54 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH RESEND] arm64: dts: mediatek: mt7622: fix "emmc" pinctrl mux
Date: Tue,  4 Jun 2024 09:49:16 +0200
Message-Id: <20240604074916.7929-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_004959_155325_7ADC7FAD 
X-CRM114-Status: GOOD (  12.54  )
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

Value "emmc_rst" is a group name and should be part of the "groups"
property.

This fixes:
arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: pinctrl@10211000: emmc-pins-default:mux:function: ['emmc', 'emmc_rst'] is too long
        from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000: emmc-pins-default:mux:function: ['emmc', 'emmc_rst'] is too long
        from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#

Fixes: 3725ba3f5574 ("arm64: dts: mt7622: add pinctrl related device nodes")
Fixes: 0b6286dd96c0 ("arm64: dts: mt7622: add bananapi BPI-R64 board")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
RESEND: Last time Rob's bot complained because we didn't have:
[PATCH RESEND 1/2] dt-bindings: pinctrl: mediatek: mt7622: fix array properties
accepted. Now that it's in linux-pinctrl.git let's give in another try.

 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 224bb289660c..2791de5b28f6 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -329,8 +329,8 @@ asm_sel {
 	/* eMMC is shared pin with parallel NAND */
 	emmc_pins_default: emmc-pins-default {
 		mux {
-			function = "emmc", "emmc_rst";
-			groups = "emmc";
+			function = "emmc";
+			groups = "emmc", "emmc_rst";
 		};
 
 		/* "NDL0","NDL1","NDL2","NDL3","NDL4","NDL5","NDL6","NDL7",
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 41629769bdc8..8c3e2e2578bc 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -268,8 +268,8 @@ &pio {
 	/* eMMC is shared pin with parallel NAND */
 	emmc_pins_default: emmc-pins-default {
 		mux {
-			function = "emmc", "emmc_rst";
-			groups = "emmc";
+			function = "emmc";
+			groups = "emmc", "emmc_rst";
 		};
 
 		/* "NDL0","NDL1","NDL2","NDL3","NDL4","NDL5","NDL6","NDL7",
-- 
2.35.3


