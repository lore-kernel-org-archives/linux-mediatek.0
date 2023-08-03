Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710ECC0015E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 09:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxkPmAViZ4bBY9DKE4WBvD6KeHCq77X51+2zFhsJvjI=; b=RcXJX+734/oRxyquxhallFDlJb
	esRLtA9MKg2egmB6/mFu6AO4Glk5VwGqIMMs/qrTkLduCaIdDNKmtHGZJ7pzoEay+gmw+EjCIc58X
	Tydo2S0JZ0Yx/MgzjrOCBhixEg3a6OlxpEDrvhkOhNbLCBcWQ4qaEeA0z9AGkx4FL3+6Exsghd+Kg
	Zcq7cbZLXSPexfHVRibTHat2cGcTlKXVtaBpr4G9MCN+i1La5OCXqeZNvcrA6Hri6AauGvvrAu32b
	tlkTGCPlLinNTGqs+cdqtWwwoT+aW9GMh/o8NPQ697r75to50nubrh4cml3kC7FmX9Y+uOEayCvZU
	G0WPkcCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUpi-007EaI-2I;
	Thu, 03 Aug 2023 09:41:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUpY-007EOt-1S
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 09:41:17 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fe110de46dso7604765e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 02:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691055672; x=1691660472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxkPmAViZ4bBY9DKE4WBvD6KeHCq77X51+2zFhsJvjI=;
        b=nVOzC/fyH+yzD8G9EHecBPK0eWIjtfrOVLSW24WxuU0FxPbQdHw/UyY+HdPU2PIFX0
         mi3TJBIDPjNyU/0l07O7oXWdswmLt0WzQvuym12mSkOPnDEqkitET7zdLpvS8KvJGENm
         FYHS8+n2yGUxXWRz5HnCrfZw2QVn2FCyIUtfMqB+aKlBg6hMzAwTgmTmgP8E18HUDUCt
         OQjwnNA8dKEQUIlAzf8eapVPu2k2DpkieAhKWfHCJ9ENml6/0BB3Qbo8OvAv51MMKi0w
         3wU+snUb5y6kf5e8OqQ/CDAnqfPwQOTddkbyYBv0mVWv4QURUNiKnmcoRQpbVCIqfPnS
         HMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691055672; x=1691660472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxkPmAViZ4bBY9DKE4WBvD6KeHCq77X51+2zFhsJvjI=;
        b=cqx/nAyUNeEWlBzmfjuAJTwl9exPlCyKUBc1fhENSTDVRWlXfi3patIrAroTZxnMh6
         U54dYwhLV9y8jWms0qNtKqlF6MiZb4Dcr4YU8jZrPxmbSVy9pSGkzSn+IoM49aW3wgyQ
         8RHDH304vx2JkMcIB5YDASCp+sfdAfGuMXzuVw8IxtI9vSRlc0jvw4KHypLJU5z7QJwk
         UJ82DcOASW2AhT+nD++30QArsJZIryGR+pCeyxEWrK4TjjvcvjUhpaA312cDU0Xw6RZY
         GBUe6YXLCpOM2LXKcnedBuUZevTr5H8jtyp51a7PPPUGPQDb2BZlAL72nHc23X3gmIYl
         RqqA==
X-Gm-Message-State: ABy/qLbW219XU3IuwMaWTA3qQazTSCkDo1sl1Xc2AhAbdWl5AyVQOKnb
	loYNKZGud09t0PPfrg0lMbRcqA==
X-Google-Smtp-Source: APBJJlGfqWuOZ1y3FemnkiQGD3vZ35hDptoXu7aAiWCmrn9R2zrux3fKhJjN70AH44CvsZEaEAqvpQ==
X-Received: by 2002:a1c:4b18:0:b0:3fd:2996:9d88 with SMTP id y24-20020a1c4b18000000b003fd29969d88mr6702974wma.25.1691055671647;
        Thu, 03 Aug 2023 02:41:11 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id n1-20020a05600c4f8100b003fe15ac0934sm13294994wmq.1.2023.08.03.02.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 02:41:11 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 03 Aug 2023 11:40:58 +0200
Subject: [PATCH v4 6/7] arm64: dts: mediatek: add larb support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v4-6-84798657c410@baylibre.com>
References: <20230207-iommu-support-v4-0-84798657c410@baylibre.com>
In-Reply-To: <20230207-iommu-support-v4-0-84798657c410@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2919; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=YQ4gFuFLZ3ZXhHJoLIMLvf6JGXdHrmuwZeJIyfaEitM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBky3YuBVw4i/Z9cSxRo3MXCg+TjdfkIHGZDri5k5Ip
 YHJc6mKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZMt2LgAKCRArRkmdfjHURcx+D/
 4yToAVIyrWA4woG7STs3ZuLzCnqTegSZw1KjRjBJMWKRnCPzGNsiQPnLHGiBXcfxrs3EC3/8ljLxy2
 4CoU71zfWWi3T/3aBfvLUk6kb3KqLMTFc/1/ipLh2p7eqqoYH89S+AUeR4uuTLdtqUP318svuSnjmA
 Z4IAl4mTVpfK3A8VprnFH6f463qbJD8nVvl6YyuHbfmP85v6eO82cpvCdNHCOeE7TPjL0YycBhKEsa
 axg2aVxGUPHr0aVGrxaLCFtL9ewWD5uCAHVJJ3ZGxfIEaSpSItz0eiTfDhH/DLFFOA7OzJKWdIWmIB
 o6cvangqcIz2Nxtc08zR82NpM9o995kB+MA4Io+NazQAfF5kjTIOxC87J0peEa9ZAW9dbTSUC4a+9p
 UyYuG+AukMC1t9U/er63LWZyU1r8mLTf/RwliEEvv24Bmc6b24RxrEZOeTn9C4gylf4z5v2UokpInQ
 MS8b+faKrWKr6iVa/B6G0NdqZBOYiu0ODVG6drg5n5oK/ZUJv2SanqPflrEwsmxU/yT0DnDtOBwqta
 sw1IyT8pmqBVk3v5LYxe71UX8EV6E4n5EQFUfaEtcRGPIOII/7rQ00KW/QJLF/Hav+Aq03HKBiiKBp
 WuajFlH8z2DGqPQXa5wECG+EPY+0n9lsnBtBQaZPGdPf2po6l+G408UBxfig==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_024116_506854_DFF6B51D 
X-CRM114-Status: GOOD (  10.47  )
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

Local arbiter (LARB) is a component of Smart Multimedia Interface (SMI),
used to help the memory management (IOMMU).
This patch add 4 LARBs and 2 clocks for the larb1 and larb3 support.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 59 ++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index a03b8c0da68b..afcfa1dd242e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -735,12 +735,71 @@ smi_common: smi@14002000 {
 			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
 		};
 
+		larb0: larb@14003000 {
+			compatible = "mediatek,mt8365-smi-larb",
+				     "mediatek,mt8186-smi-larb";
+			reg = <0 0x14003000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mmsys CLK_MM_MM_SMI_LARB0>,
+				 <&mmsys CLK_MM_MM_SMI_LARB0>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			mediatek,larb-id = <0>;
+		};
+
 		camsys: syscon@15000000 {
 			compatible = "mediatek,mt8365-imgsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb2: larb@15001000 {
+			compatible = "mediatek,mt8365-smi-larb",
+				     "mediatek,mt8186-smi-larb";
+			reg = <0 0x15001000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mmsys CLK_MM_MM_SMI_IMG>,
+				 <&camsys CLK_CAM_LARB2>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+			mediatek,larb-id = <2>;
+		};
+
+		vdecsys: syscon@16000000 {
+			compatible = "mediatek,mt8365-vdecsys", "syscon";
+			reg = <0 0x16000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		larb3: larb@16010000 {
+			compatible = "mediatek,mt8365-smi-larb",
+				     "mediatek,mt8186-smi-larb";
+			reg = <0 0x16010000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vdecsys CLK_VDEC_LARB1>,
+				 <&vdecsys CLK_VDEC_LARB1>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8365_POWER_DOMAIN_VDEC>;
+			mediatek,larb-id = <3>;
+		};
+
+		vencsys: syscon@17000000 {
+			compatible = "mediatek,mt8365-vencsys", "syscon";
+			reg = <0 0x17000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		larb1: larb@17010000 {
+			compatible = "mediatek,mt8365-smi-larb",
+				     "mediatek,mt8186-smi-larb";
+			reg = <0 0x17010000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vencsys CLK_VENC>, <&vencsys CLK_VENC>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8365_POWER_DOMAIN_VENC>;
+			mediatek,larb-id = <1>;
+		};
+
 		apu: syscon@19020000 {
 			compatible = "mediatek,mt8365-apu", "syscon";
 			reg = <0 0x19020000 0 0x1000>;

-- 
2.25.1


