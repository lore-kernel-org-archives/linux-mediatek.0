Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE917C04FDF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 09:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wErjPQt6qENv87TZs9KiIyjig4b2yslS27coAwsNZVw=; b=o7ukGe491S5/QZNaS1FsVYvEV7
	D8971jH+XxsDUUJo51ovMq7tkoMB9U6oAkoy5EkC9oZZKF2/EAi3hL3Cykl2HExDHOxkd3pZA3OVH
	ENROdfWqhXraXu+fQzfZn6kRvQ2joiKt2NczLOggHI76gF5eaVewmKe+gbiHoJ1mOQ9f5AsQLbxJi
	Q2l8nqhPRs2CBkjwrDv/zS92t1Wbb7sS100HnScCEsLtm9aF73Qmt4v/JXK3hXjXP9XX+2xV2x5cB
	oPsImCOKzASVsF/g8ez0/E+e1JvzQUqMjM+1tBfJDpaYnNer2LTbktsoTVsYZ+I2L6EsMO+iwplV6
	ejV9No0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUpT-007ENn-13;
	Thu, 03 Aug 2023 09:41:11 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUpP-007ELI-1b
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 09:41:09 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b9db1de50cso10471471fa.3
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 02:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691055665; x=1691660465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wErjPQt6qENv87TZs9KiIyjig4b2yslS27coAwsNZVw=;
        b=QGFti+HY+QQe5LC3G/0lDrQ2VYSb5KoZKX8ZnH/pO4R1TpWJktXHTYQlaakPyF95cr
         PUhlo33Ig0P1ifERPRzNLBs57wEdxYiT8cuUrdOHuVGteASQ3hXq64p5cAiJiMd6ZP5Y
         JIGa5Fpo8tjngO6Up/6RJuwUe5/M1b+vDNMHODiq9q8tnL+3HbulfRxuHKc4h6Csw46r
         oVajZqpexvPC6TPZhoudyEdHDa+5AyCqf3XP9e3/raAI0hrS7sCxNm5SRSryT4bg8zwz
         dasrGyr5La7/7UimXTsxmRmQbnAEPmH3LjYiv5LX0hdZTXe7oORH+rbZRGUwxMfBB3Ue
         yK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691055665; x=1691660465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wErjPQt6qENv87TZs9KiIyjig4b2yslS27coAwsNZVw=;
        b=Ar32zlLWpNkS53SAQMywdCxFEKJzgcPGJzxtCqRro5CelHcoEirUORLSv0Om6KONBT
         ULr9CnihOdrcg00Men8R7IlbWMP7/mKmJn+QzUYwvyX3T0GiKQp8vPR9N+0hibvfmpum
         lyYHBG9YIrtJQ6C1jJsKtlg6P60ChS1c63Vfe3+RHMTs0MoLsfi5f8IbFeAkRxgMS5Ea
         lM2Rn6/jRtcbtbQStlJmJcuMEApiISZ24gm4U9LL/NV49GqGPPKwXEIqWBDoR96K/Wb5
         LKIaezTg61OlwzUK7S8LdmSfx4eRK49SlJtERwSGkDyy+s+3OknESCEfUkXLO90eIG9t
         sA/w==
X-Gm-Message-State: ABy/qLbGsClS4wuETGnXJnHPkuHdcH61KEtTNXl4bFAcwcnw/RDBGoJZ
	I7V0+6fleeLOWkYsjG1URWfP5g==
X-Google-Smtp-Source: APBJJlF8OCA1c+0+v9Bwna0TzEzHiArRZ7AzDrwGj/4GdA5Tv2uF3b+DFyV6p/26okEKWfxm90Wm9g==
X-Received: by 2002:a2e:9054:0:b0:2b6:e625:ba55 with SMTP id n20-20020a2e9054000000b002b6e625ba55mr7589092ljg.41.1691055665493;
        Thu, 03 Aug 2023 02:41:05 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id n1-20020a05600c4f8100b003fe15ac0934sm13294994wmq.1.2023.08.03.02.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 02:41:04 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 03 Aug 2023 11:40:53 +0200
Subject: [PATCH v4 1/7] arm64: dts: mediatek: add mmsys support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v4-1-84798657c410@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1264; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=5Tm918SwyWroVCRT9x2Od4dOEXsJxNFB5Eps83AeIaY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBky3Yua0NFqC8gbsqFLWmjdFOfQJ8aPh736LBg8KCn
 Hd4Rrp2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZMt2LgAKCRArRkmdfjHURaL8EA
 CDPSg8MJKZTsa/itx2lqm1PK1xL5MVZHgNNlU21RwE4o3/AwbNc7TY2RWknCcEgVL4REl8/AoWklXw
 BoSLVnVri56WO3ifPTIi4aP4DUZIskdoavlozIRn1cHz3ifXckHty4PZdKDHKIR5znobuVLPwsh/Nc
 wwYzrhggRlxvOlDgFQdosiPuKixHW+aNiFSoP0UcXyJ++/KNRsnDqqXt5U7be18ZAnOANk86xnLeB9
 pg7YzM6FabLesI3x0tDSGT4yihICpbDIVTeq5ZuDGEpjx4N6HWnIpApnifGZSFY+v5rGwwLI7KkfuT
 bbWzwm5ri3nmwE9gGfbB2Ksjw04rjHATbKHObKYc1+y3qrPeDcn4UB7xAkEkeQS7LK5BHxmitd6vRG
 ZV9frVipNJtLFZfh7hhA9CC3jD2a6KkwPF+6ypAbnOSZi3al6sW4WmUCXDHoV5rjRKnWRxgu7ZmA98
 W6XAnu2SNlHocF038Q8lUVXAeVSzXumId9M/02MrQE3wYG+4YKXCqQt01EzbZycI378yyFnqynua/u
 mvJsSVvccfZ9NgMnuaAyeXbAvXmWpp9BHQsC1cH2rI+lTSCbAcAALIqKFOjfGy9HlbJl9dBqgT7wcU
 5eeMoAa24/BWbIp7I3gp2bgCRdY8nOWWP6vsW0pJx0RW7yvQrY5QC8eqZvkA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_024107_537542_3659E318 
X-CRM114-Status: UNSURE (   9.27  )
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

Multimedia subsystem (MMsys) contains multimedia controller, Multimedia
Data Path v2.0 (MDP 2.0) and Display (DISP). The multimedia controller
includes bus fabric control, Smart Memory Interface (SMI) control,
memory access second-level arbiter, and multimedia configuration. It
plays the key role in handling different handshakings between infra
subsystem, video subsystem, image subsystem and G3D subsystem.

For more detail, ask Mediatek for the MT8365 AIoT application processor
functional specification.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 413496c92069..bcabc2b89a94 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -603,6 +603,12 @@ u2port1: usb-phy@1000 {
 				#phy-cells = <1>;
 			};
 		};
+
+		mmsys: syscon@14000000 {
+			compatible = "mediatek,mt8365-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.25.1


