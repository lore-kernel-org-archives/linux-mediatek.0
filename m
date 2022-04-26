Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54129C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 16:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fGhkVY1mkC/J2W6d9m9B6oLYCim/jCOsZuh//optkM0=; b=ESntc8BBfGiUiW
	VjCu4RySBPCGkoNtPW7vXuCMoIZzJ1jl+Wrem9XYU6sFEidJdgcTbE/DbrPZGMkrFCXLZRp6QZGtC
	Uu4HiBhrr33juDxlIMlfTqpi4powU0VfsA7BmH4S90dtxoqOMTCRQvLQBNtAmD1QIoKDg0FdtktLa
	tlCN6o52/MSJs29ZDj8McOf1jSEkZjg1w6h3Z8kwAtdFh6+COjmCfRSLx6VBdy/5Je6s0MX4AwF82
	txq8hwgZyK49KeD2qDo6vxxb9y7TDGxUpAponhH9FlebKsA0COwCg6h6L5xggFltGL+lydmFSZb73
	ZcYRnEX9hTx6Om08IV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njOKT-00FOcH-L5; Tue, 26 Apr 2022 16:46:21 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njOKQ-00FOWu-0Q
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 16:46:20 +0000
Received: by mail-wr1-x432.google.com with SMTP id q23so13408984wra.1
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 09:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a4Dsh1MIN0xZI+gwJI4fdmqtKhkwKXeMWuLlT5BOjsQ=;
 b=4RGJ1GWCGaRqYH7/PaHb5ZLmdutMuHjUNGWfkBquGA1U2RooGiMDqO9bvYVUWCYTeS
 3pgWEyaxGDIyUEW6UYtA1v9zTpn01nmefLwkSVdhQuvHtemFICCmTNhLxkRCOpPxAVL/
 Qrhk8lyyFac2/hwXxfqOeNV0ujOVdxkxkcPOf8IPAWWTUbcA+5bkhCrxgnFBqCYOTfrA
 2a9f8sGovPTc+4hS2XPwwRrws22Eu2m78cWLxOCwwSwDoiP12ZvEg3QsIqj6HpceMmVu
 MrKqwLvcfgXDc2pKVro7BGyQizR52D14IABJKwvfREGIPZF51VRnjwcBjQ8yjm3BHjbj
 rI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a4Dsh1MIN0xZI+gwJI4fdmqtKhkwKXeMWuLlT5BOjsQ=;
 b=txdxprv3EW4xRHsg7dcZCnb630dQ0zAhgtuCadO+1T+TdtEZHGMIjLhIhqmR6/YuPp
 UG5NangeQjQEk4TeVFwRFKv0pmfjPGvWwA8xKn/kd3GtURGdd/KgwFyzST/hkxuS95sw
 bd63tGYlb0pmzYRbQiJmVkz+az1rWmvqtRD5aIf7T/AmrZPIgr8rk/QNd2RAW5rBC7Hv
 V4tNM2N2jwMelNsCx4T04NAzu8y8AkiAI7ktR/dK6wLqsWOY8WHTRm5fcaIPOhxFIjTg
 Sd4+FsZpXw9p4H7MPvdYzml1mU9hNr0uE/KuV9DQCWqiHDHVgNLzdEXHFEpyr+87sTbE
 cDJw==
X-Gm-Message-State: AOAM531eg4b/eiyHfn4VmuXLYCLDh8oi/AlUaFire7rMpfGLzIFLLtLV
 29C+izg3jVcVSZRapzUYdT4fZQ==
X-Google-Smtp-Source: ABdhPJyQj4nlAzq8f49npdb5BnklLFCtyQ6VIVK795e5133V4LSp0puZE2gqfmU4YR9lWfCCN9WEsw==
X-Received: by 2002:adf:b34a:0:b0:20a:d6e4:cea4 with SMTP id
 k10-20020adfb34a000000b0020ad6e4cea4mr12132328wrd.675.1650991573906; 
 Tue, 26 Apr 2022 09:46:13 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a1c2506000000b0038e6fe8e8d8sm14499539wml.5.2022.04.26.09.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:46:13 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: mt8183: add dpi node to mt8183
Date: Tue, 26 Apr 2022 18:45:46 +0200
Message-Id: <20220426164547.434324-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_094618_257917_63BF9A7F 
X-CRM114-Status: UNSURE (   9.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Pi-Hsun Shih <pihsun@chromium.org>

Add dpi node to mt8183.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
v2: no changes

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 4b08691ed39e..49e662e34b36 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1507,6 +1507,17 @@ dsi0: dsi@14014000 {
 			phy-names = "dphy";
 		};
 
+		dpi0: dpi@14015000 {
+			compatible = "mediatek,mt8183-dpi";
+			reg = <0 0x14015000 0 0x1000>;
+			interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DPI_IF>,
+				 <&mmsys CLK_MM_DPI_MM>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL>;
+			clock-names = "pixel", "engine", "pll";
+		};
+
 		mutex: mutex@14016000 {
 			compatible = "mediatek,mt8183-disp-mutex";
 			reg = <0 0x14016000 0 0x1000>;
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
