Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7ABC678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 14:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzSPP7tKpmDgMygbv6FfzcwtKqtIWlRKr/CY2KHoGGA=; b=W+jrYjz8Px98pLpG3V9umO3n8b
	AYxxNArIfws3F7ceZEzPU9c1eYPTYnKf7mZKtAoxhdX3OK+bu6O8tGeZIA2YcEeAphWrPJfVOcR3X
	5Xn2PdYPlFcTzMtideFaLrrht8B31DeOsfYjuI+pPJ5++CW3umeiT8obEMdKqY//n8WFBxpd27Jtq
	dBTNivXqjVBFKAadDc10DUCWh8FDlm40F9fbKZ3sWeZkEPOzh+1YW3fTIIf0YTfYxM043zPxHZR9P
	8AyFBU1rX+b++D5ewPOWvz2qftiWT1CxURGNOgyrpF8IbwERyZHwiqoJ61i85rComM0BmbBgch5N0
	abgDuJ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXt5-000bLt-23; Tue, 07 Mar 2023 14:01:55 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXeN-000V6E-Nc
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:46:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so7229174wmq.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678196801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzSPP7tKpmDgMygbv6FfzcwtKqtIWlRKr/CY2KHoGGA=;
        b=Z7ODCrFGa6AJ0GtvhIqso5qyFzfQ8NsAQww90erwC3wSHzob3XEBgT8+zkwqAAORlW
         ZZ8Mt2vbk9KeWXzHXDWyAvj+6nFDZ9x/8qZZmAMKci64xOmal08AK8sJXsrFg/BgJ39h
         d9ct/pBRpECWYRlubAPXty4ThI7dXf91+0nq32uzEMwN3oqa/0B71B8fAMdakcpatp2u
         Y6m9prXwx6kg5mYWnjSq1RjTpicRxTvKQbkX7TwYVTJExKScvio6GZ8p01yks0k99Biy
         vLHKnJoTXbfg7bluVCIeZtuX6aqdr4MK0R8LgJxiA0PizJgGpBySg+8a3O3QYTJ78uMY
         ckCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzSPP7tKpmDgMygbv6FfzcwtKqtIWlRKr/CY2KHoGGA=;
        b=dsLQXKhAibx0rd21YOr/U82wGIRpw1mC7C+k3DP9857tgDks1j1QO7MjwL1dXNvXfu
         g+oN0MG9gP2NY4I27zb/O89kqB1CuqDwV2Slxo4bKiSMbEASBhyV0SK1rUiE+qXll9sn
         vYMVYtqx4bG/5alXIJPFX5iD14/PTc+XtJabvsDb+irtEYgkEWCRDJ+RYrgKohKjIGBr
         6qw9/ByCl7QwtUtWak8wYEZQbOdrGBol0eGABOfyIhwNAQmmWeFqTf9am6P0Y4+ml0Hr
         6xJ58cZRzghvMMI9XP4mXsllSM9Nru8VY9pR++Y9t70tl8R9jV2gghq/zBAcjZNvghGl
         0LoA==
X-Gm-Message-State: AO0yUKUxTPGxKAHbNZ3uUGMxzbxNYpxYqKsFU10d02qoVYGk7JdwCSsV
	jaGhPugl0U5Jv+0zVt2zycvBjw==
X-Google-Smtp-Source: AK7set9A80XTJaBJRZGJ0NFVW6xppDxlmeTE+Ac0G8GrQqsRd4V/lXRbnCKr6tsJrhN0QVT2zxdufQ==
X-Received: by 2002:a05:600c:474c:b0:3eb:2de8:b74e with SMTP id w12-20020a05600c474c00b003eb2de8b74emr13385054wmo.27.1678196801725;
        Tue, 07 Mar 2023 05:46:41 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id o13-20020a5d670d000000b002c8476dde7asm12657607wru.114.2023.03.07.05.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:46:41 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:46:31 +0100
Subject: [PATCH 6/6] arm64: dts: mediatek: add iommu support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230207-iommu-support-v1-6-4f0c81fd52c1@baylibre.com>
References: <20230207-iommu-support-v1-0-4f0c81fd52c1@baylibre.com>
In-Reply-To: <20230207-iommu-support-v1-0-4f0c81fd52c1@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=969; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=r7GkCkHYdd12Bt7dFmR03rMsJTMhNcidJ4FTEsGU2Yk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkB0A7CDFByNdlviQNt8kE2Cw9wrh0z75ZvZpOdikX
 kFOxAUGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAdAOwAKCRArRkmdfjHURYKWD/
 94UAAbnpoF14YAwi4BJcFcufFpJmrKQxWeHQnzyW4ELK2wbH5OUOcak4XA4TcLSl6Re4TlCu8DQt4w
 UFvzMALTpLAF1FHEXQ+Z4bQJ5Ejcg6vsv3EJogtvguC/TBwl6AsJdrEU5QBaULWNdOJ+zRsGAW+Nmy
 PXDGOcIhPUFMoEU1TOoQiLhECf6n+/JXr+lUskFw5+nSnUtNmW7UgB80CHgbkhznncOdoVaGhSO2n7
 8XIVHMWUyfrcNOCUElq+HzYFjo66T9Mc/EyoEgBFdKJA6kxzfOnigv5SxTRGhYa5wOLp/8aQhUVNdw
 bGzseWg8NbAas+ViGqwB4J/+BKCvLLWbFcmccTg6WZ+L2MeLqO6iLwMrz7ejVOIhVawn9nMvU0OUjY
 MYDM0V/qS/OMaeD3Ecj5NRBKWIKD2H5tkgVg5NFEBPsVrqx/85DLfIQzNuTorMzniJTzlxFy5a8JO6
 h1uV90ov460FnvMbPkuEiBrtrCyNdVHM+TGtlifHNIVevMZL6u9pwBsjLQspfH5giaiRzj4XvmijZW
 SeulrzQrnKx0FUUV7r0ATeH1BZmuQeSakFevKCi7cUoxxZldlKL7h5FO5m9CqUmA1BZgtknWttAIEv
 JFgNMvi/ylZqDx4vPPib+Yq//xdlLY1pMP7xolKZYzFf03OxSA7+OKiWiVcA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_054643_852562_C6395C48 
X-CRM114-Status: UNSURE (   9.26  )
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

Add iommu support in the SoC DTS using the 4 local arbiters (LARBs)

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index db0b897f58bb..c713471c59dc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -456,6 +456,14 @@ sysirq: interrupt-controller@10200a80 {
 			reg = <0 0x10200a80 0 0x20>;
 		};
 
+		iommu: iommu@10205000 {
+			compatible = "mediatek,mt8365-m4u";
+			reg = <0 0x10205000 0 0x1000>;
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,larbs = <&larb0>, <&larb1>, <&larb2>, <&larb3>;
+			#iommu-cells = <1>;
+		};
+
 		infracfg_nao: infracfg@1020e000 {
 			compatible = "mediatek,mt8365-infracfg", "syscon";
 			reg = <0 0x1020e000 0 0x1000>;

-- 
b4 0.10.1

