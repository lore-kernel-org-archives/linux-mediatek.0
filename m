Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57642C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tORp1I37+JIRNlLfmuNLwniBkIh0XbsRy1El1Qwfh5w=; b=YEzWaYkYE2+ERkA3OqDm7lAQPM
	cCwlTVJSPeP2Z+35thHoU8FINgIq4Vwwl1BKBre36yzL10y9dd46NTL9bxg5HW4NalUDYgd2z3B9o
	3AmfOorXGRSTHZU/sigsfZoav5iF1OISdRqTyrPPm6FVHe2nVbwbNR1wachBsfU9qEFSmqLxISo+R
	e3uEOAzm1xV/ZeRZyiDy5528v9JVpzazXCE/paxHY5emEsa0KQ2it49Z6gzFp4k9bXy8nh0tMTpHB
	iimcze9ZWBSaEMDURWyTNX55kBirlmz7xltvV/Pv14OpqwLk4nhDHNOc10IMthPB7Me5MHMuNnLs1
	x4WJKAYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiUk-009gEv-0T;
	Fri, 07 Apr 2023 09:34:58 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiUZ-009g9K-0Z
	for linux-mediatek@bombadil.infradead.org;
	Fri, 07 Apr 2023 09:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tORp1I37+JIRNlLfmuNLwniBkIh0XbsRy1El1Qwfh5w=; b=hq4kEbrUbaRI6AGmMQkP13uK94
	rqfOgenXgzshUAwPJtXTNQ9G0uenwIkpT5VxHMzxAZI7pIznVshp5FLGHWXcTbZ199Ps02u/Wrjlz
	ojVGIoQmZcPjvd1LV+zMgzdY0OFlZkEFglh1IckNZUqZBC2u9lBtTdZ+UXKH2ykQ5bEtAIpzfgFXA
	w8Q5W9fVcx6UYilvmSvCOsdqIRCHKMPmoqjlIy1oMco6Ch7EH4ooNErjMTaqqCukPYNMIlqHRbJnm
	F1cHiw+VTuZOMFxQfS9ec3vEiKulf/kgsgH+KWvnVRPaBOE66tSSINp+28gLYWsjPbROBVVAHXQUN
	V/JkdeYg==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiUQ-00AzDV-2a
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 09:34:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id m2so41852139wrh.6
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 02:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680860071; x=1683452071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tORp1I37+JIRNlLfmuNLwniBkIh0XbsRy1El1Qwfh5w=;
        b=RSuG1BBx4bCJQ0eYtxaDMD910vcDXWy+sIyWzJ1nIcv/nKMsdJB1eaQrQyFQz+4FGF
         xuqULq4rBZ0/Kv7cxGn8KM2rTQaBoUjJgrF+k0xZbk8Tf7zvSEw9CyEiEWebrd/sIO/C
         pdQYBZgmsjzw92YR4NwCKHl7C7kQKkhmJ0dcRQeuAI9Tb35vmPY59HOfQeewwTsPys27
         mdXTTX0/+BJmP8AS/nIvNZacmkXpxKa5U0MsNq35Syd6OI+1JpAFzvCG9UEKjiP/OaX3
         Ed1xWybbx5PBFFwBlb2IPeTqAMl9Ye1keoxUvrh6yH4bbwywOq8QcOanwdWKjBwMqFql
         zmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680860071; x=1683452071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tORp1I37+JIRNlLfmuNLwniBkIh0XbsRy1El1Qwfh5w=;
        b=Z7apEMAcpWfv7u7FD3jsURRqyDF/k01jHLKC/o2QEc7FxE3aRma/0wv5xWlgc5BsB4
         p5BW32jIyGP9GAevEeSGBCphareBVquP+pIS+0xbP+jt7pAnVRy/uVNci+Wjm45FRvYs
         z9aJf8xepkEA3318wrXjkNiAASK77ZUAybs9Vk8XE+hqfU52pWQNRchohJDIQg9zvxbi
         8PcbpcxrYeRCxt4CvuE5wo36MRMsMqqvfv8iJNBPVnrKRtZxx5LTFSPxEowaiF2Cqjk8
         LtaKvmQnhpmtpQypGR7wBPvnn4NfsZO9v8OHbszXaceZX1SIHjn34ad2JillNqIQnnyP
         jrpw==
X-Gm-Message-State: AAQBX9df/yr5jBzj9gfz+wmm7gUZ9+spxqHus10PfzYVXtycnrqq0HB4
	rTBraBpkTqqYmpThohjsrAfsKQ==
X-Google-Smtp-Source: AKy350bRaX25BJjuwBAyn87C14/6uA3JGJnA5KyGgh44d6eFan6tIBFWLkxt/l2BsXfJJPQMt2kKiA==
X-Received: by 2002:adf:ec4d:0:b0:2cf:ea5d:f5fe with SMTP id w13-20020adfec4d000000b002cfea5df5femr955931wrn.36.1680860071643;
        Fri, 07 Apr 2023 02:34:31 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id s13-20020a5d510d000000b002d64fcb362dsm4020432wrt.111.2023.04.07.02.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 02:34:31 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 11:34:16 +0200
Subject: [PATCH v3 5/7] arm64: dts: mediatek: add smi support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v3-5-97e19ad4e85d@baylibre.com>
References: <20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com>
In-Reply-To: <20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2121; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=J4LWefgCJNgBuhY1OJrPCpnKJtdzqFO3621y4agMuJ0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkL+OhKpEy6cL/H1p/HvPE1aODq1i4kG0au3hXRwDH
 /tjxL7CJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC/joQAKCRArRkmdfjHURdIKD/
 4iom3SPa8zqPqQUkQ9Jm7J4cF7sgWkc8BOx84oRJ8+klX0dQE0QFEyPsdSHaAjfgWKlikAiuiUzW+v
 EUJ9L7d0mPOg6IzWcAxHE89S06vjqmpBoyVwztw35bheyqzdstL6yfylwrYAfMY8+E8ZkxG9irn6II
 QokCOjedbM7IR/0urZ2vsz0EGilZjbzRKnqxlNUU7GGxXlau5FyS2HID92k6erM51JdDWQO/H2S5jN
 Ug9pUYQfPIH6SX/7ihLD5LIapPfAu0f4JDKp1o6aBgEpriwTUjUEr7Sv34ijvWR8uogIml1R8yPouM
 Yz31dI3xVkQmY9cDh2HO8weWhE6p9VtrCpDGWu15avcMKkc83aro1JbQTbbwsk3kVMgbpUcCkWJpOX
 2HG8JGA+FHVBSEQU4RqPZ36TUDw3ayzOc2NX0SJFN204VVQG/0K3tfMzuMaJrldI8qVDXYr96Bj/Os
 6JNHkOIUzmVyDzHSCcxjNg6wapdWcPot90H3fE4k1ii3ZRjoCescfAizuwSjVWo1HXip2K+qbygS1F
 HlixobTBiOxSESZ9MP5/RQv6lET9NlZ34jSgjvg9fxC5aDzgey89HwW5xaJk5HWqbygLPPOXmsrVgB
 2TqI0+Pab5wV4PfNuKsu+u06FNj1V2P8fsleq/GlHrwT1f4BEzbGXGJKzlmQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_103440_975321_6D0D6D53 
X-CRM114-Status: UNSURE (   9.59  )
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

Smart Multimedia Interface (SMI) local arbiter does the arbitration for
memory requests from multi-media engines. Add SMI in the MT8365 DTS will
allow to add local ARBiter (LARB), use by IOMMU.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 0e4fa69a2415..70915beb513c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -324,16 +324,19 @@ power-domain@MT8365_POWER_DOMAIN_CAM {
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
@@ -351,6 +354,7 @@ power-domain@MT8365_POWER_DOMAIN_APU {
 							      "apu-5";
 						#power-domain-cells = <0>;
 						mediatek,infracfg = <&infracfg>;
+						mediatek,smi = <&smi_common>;
 					};
 				};
 
@@ -709,6 +713,17 @@ mmsys: syscon@14000000 {
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


