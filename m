Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5DFCE7AB9
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 18:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qqq71BmglqPdWoPEtToCLWEFpVEun8ESIoG7WuZgwYc=; b=Lfg1N6AuAWLBCnZ/NoSUiUUcMi
	XLYX1yIvt+AuMYmqBp2KvRmMdXiV/8NVbDZluE12RAeYSCUkfRL+WJMS8SM2oGrnbGdDV/FO/WGsw
	alNSXoRHzZ2FpekzYO6dQ0K6TzWOhnRTSB+X9zjQCU6UvpuUAOos7LFaSEfDSGqyRfaoS17EbueJN
	1m5Q5QsUW9lxLvbI1RDAt2y6Npl2ZJpVk1TVPPDwoy7D/6NDUpcfHVYTNKofuNVDZdKVi1O5bYOBo
	G/QvybynlaOsAqGBCdCfhOJlzlZdmxR6edHYER1jZ1Izkf7vhfbAnDa5qdrZftpFGQ8/mq94XlM9y
	nui4F37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkqA5-00EouK-2n;
	Mon, 25 Sep 2023 18:18:25 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkq9Y-00EobH-1Z
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 18:17:54 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9aa2c6f0806so860793866b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 11:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695665870; x=1696270670; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qqq71BmglqPdWoPEtToCLWEFpVEun8ESIoG7WuZgwYc=;
        b=Us56sDKRr5dCy+xsDezkyZPLgex5eUzIkFBcK/CH6zyCY/Sv+59xqmoRvgWKiJ3bWC
         Gvh24qAyGK+7mSlpyBMmXMjw7TxLZiNQWsPIpIAcGT1Qmnh4sX8vZGbvta5SmQuvpktg
         5SdSMzzewuymo2lAViFLXsZbLyjDTdaNEcGvsknGCIpxJ+TXuiH31bwWCZo3qQDDQTO0
         jVRinn/m90VDn6Wgx3oQQA16BJVEThNZPf63pIDOTO1E/MoNtHHahyw+sszfltNQkSTc
         bpTguTuEW/I0k7xpQB68t1mu7jp4arl2GcFdKMT9IhwfIC7AZ8ma1qoKEW+fqlljzueo
         /i3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695665870; x=1696270670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qqq71BmglqPdWoPEtToCLWEFpVEun8ESIoG7WuZgwYc=;
        b=wTEkmsBKO4f3SGS9Z9hwvkRO0nUp2oGzF/FmwC/4DjwRyM7Mr+j2vMAFub1b9zxoNI
         HWfSTpbzE7OZI3urHiEjmBeFtk0upNFrTrzl6RxfxEs3kdf0Z63OYhgUn6uIF1M5abJy
         AAQ866/QyRkhJ7k20bv0KTkQ59EV7L1ggxwNWC/FPUhKJitzFwgQxBATtjXVGc6kMoJx
         DC5Ey9Vt8fJ2Tn4vctG9zi4fHEqIVo9iAV3HEoD90D2LYgqOuow/2yM6BItm2sA3xyQ9
         bJxwutrthokyNgoOVv27DGxGCyLAIc+FSSFBUGAYjxLQygpwgykKA7AxLcOy8Fdcv0rW
         unZQ==
X-Gm-Message-State: AOJu0YxOuY9pEljWwGx4cXtd3T6k56MRYf3WrP7xLg426WnRODJPGsTs
	Zxp9mydhtDJSkYXDxbr/oHLLBQ==
X-Google-Smtp-Source: AGHT+IEMW0D4RL4XutuqCdBjfC9hfPonSP98tq7X8qAUWLouKrT/Ecb+2L8B5v7B6vOhgAOXSTEYWw==
X-Received: by 2002:a17:906:30ca:b0:9ae:541e:7310 with SMTP id b10-20020a17090630ca00b009ae541e7310mr6564400ejb.33.1695665870368;
        Mon, 25 Sep 2023 11:17:50 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j26-20020a170906831a00b00997d7aa59fasm6793962ejx.14.2023.09.25.11.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 11:17:49 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 25 Sep 2023 20:17:39 +0200
Subject: [PATCH v6 5/7] arm64: dts: mediatek: add smi support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v6-5-24453c8625b3@baylibre.com>
References: <20230207-iommu-support-v6-0-24453c8625b3@baylibre.com>
In-Reply-To: <20230207-iommu-support-v6-0-24453c8625b3@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2121; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=lJi09wmfuA1CnXJrdr2+qCC0CVBcfrZwevdWJeNOAo0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlEc7FEVSjGHrSkrW+FZLtcEUWl13xhTtayX8+9r0L
 ox5XimCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZRHOxQAKCRArRkmdfjHURcE8D/
 oCX9XceWnTnvrl8BWagMD6eSAJw12HSntAuLDm5Mh4VSePapKwF+YtdBSdye+NW04rD5+/R3/enaIm
 Fcodp4SWwIRHPzYhW4tVswoWBaoHN/vsHx42s8kZYC8d8vovCzkrG9M6jyaXsmXulUG6kpICd8ZV8b
 iv3XNNkzYw7jtWd5rOQHQknQ6W+J2FsI4vChmN+isiK0+JRRiSEjBkWwaT8Va0wQOwA85zmw3SgMxB
 A+nwnbP1my2HKYWCOcnDGnG5UkeS+CMFyYTkxYvXTuD2lgCXKWvIjNiUY7G3wUv7l0UHyBG1wjO0s6
 3pKmyuY3J16fXGUy3dtwGmqRSSm50PzW7oZefu2MLyDmJu1wcFLBznBTcH5N8uJ3e8TT0kbCopo8ct
 rlMJbNoASMEXnAb1hk5pYcwjf5IY/pUyoS5pPRHXCgTR1DhP8ql3SsQbRnWBviwpaAom4v5udwxkdM
 wqiKSCioTRQ42bnWW9PZDEkC5oSaZHTFJoEBRECB6P46X9AGTLCcWiAPMuE9974XuKjfCswCU9t4YH
 np1bFl2UH/zE1LYbUXT/tto4ebmeDDarhHF4sgDCg16io2CeSpKWfIVDDOf9fGe2Se3DRGwR31d+fX
 dOwIvZ9DcptgXFDE2IUyT0YwwUIKd7908/O7vSoI6hnUX3aRMgp3tbPrDZiw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_111752_523687_17EA31A9 
X-CRM114-Status: GOOD (  10.15  )
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

Smart Multimedia Interface (SMI) local arbiter does the arbitration for
memory requests from multi-media engines. Add SMI in the MT8365 DTS will
allow to add local ARBiter (LARB), use by IOMMU.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index c2f88d153dee..a03b8c0da68b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -340,16 +340,19 @@ power-domain@MT8365_POWER_DOMAIN_CAM {
 							      "cam-4", "cam-5";
 						#power-domain-cells = <0>;
 						mediatek,infracfg = <&infracfg>;
+						mediatek,smi = <&smi_common>;
 					};
 
 					power-domain@MT8365_POWER_DOMAIN_VDEC {
 						reg = <MT8365_POWER_DOMAIN_VDEC>;
 						#power-domain-cells = <0>;
+						mediatek,smi = <&smi_common>;
 					};
 
 					power-domain@MT8365_POWER_DOMAIN_VENC {
 						reg = <MT8365_POWER_DOMAIN_VENC>;
 						#power-domain-cells = <0>;
+						mediatek,smi = <&smi_common>;
 					};
 
 					power-domain@MT8365_POWER_DOMAIN_APU {
@@ -367,6 +370,7 @@ power-domain@MT8365_POWER_DOMAIN_APU {
 							      "apu-5";
 						#power-domain-cells = <0>;
 						mediatek,infracfg = <&infracfg>;
+						mediatek,smi = <&smi_common>;
 					};
 				};
 
@@ -720,6 +724,17 @@ mmsys: syscon@14000000 {
 			#clock-cells = <1>;
 		};
 
+		smi_common: smi@14002000 {
+			compatible = "mediatek,mt8365-smi-common";
+			reg = <0 0x14002000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_MM_SMI_COMM0>,
+				 <&mmsys CLK_MM_MM_SMI_COMM1>;
+			clock-names = "apb", "smi", "gals0", "gals1";
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
 		camsys: syscon@15000000 {
 			compatible = "mediatek,mt8365-imgsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;

-- 
2.25.1


