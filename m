Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90F1E7107F
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 14:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NaqmMPfKXAOtSVjFcLvPHbWm7slgkGY5/ld8VMlAl3Q=; b=APGs1hO3a4cEcGYpfbN/Vp8s1G
	UZ/LuvpLS9z6NugBr/o04r28Ozl3sFWx4dTPYHZPqTuU00ssFjjCsRVyMfOOppHcvauerHpKE3n2r
	b83lZbKZrx2EdkIng4rjk8HFr+AVG8YAUtDLoCseWEgaIZF2NqIeM3IZHUzIHZyjgvV4b1gTrRycK
	y7ZTib5BX9xiRRyOpV4UfWOYIX3M3eeNFO0Qvlkmt+/Do4UklXBrzhRY6otDyLVjX4kmL7dmIS0gD
	ae6sgwx+OgomKCLc22IrnVIDvWv9MO3HQoVDevhPcvorhglAioYXuh4ACGtQJXzSDKpR55KVsmXmf
	5QieQfDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKkS-006IIl-2C;
	Thu, 21 Sep 2023 14:33:44 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKjm-006Hv1-1m
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 14:33:04 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99c1c66876aso124617866b.2
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Sep 2023 07:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306779; x=1695911579; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaqmMPfKXAOtSVjFcLvPHbWm7slgkGY5/ld8VMlAl3Q=;
        b=IDMwv5LkkCylMuqkSkggoLzuAj5cgl/G8ZO2I98NayFtZ34oDsyyOnGpu7qKNx3mVk
         7YeIYnMS+BAqxrhaWW2CZkAhr8EVxZuzMJMV14TinR8a+E7kE0jkaSAYdvW2rtOpVUK6
         PdVm00CasJPNstf22a7m6rekUiV/yeXnGCBusXI4O3Dj2iSApdPkrjeOisDkdYaeG5cF
         UtnsXPO1UWoRo1x2baQD7kdv3LLqsTmcOh3MjIult7Cp2cLyAcqQQeQLeM+LOcMF9/g7
         gCoZ0s/GT+82dhO7ezpILy/GCRwYi8uqyjjBDkmHJsNeRLVWcrbW9h3ZEyFK1bNKbvyh
         eXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306779; x=1695911579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NaqmMPfKXAOtSVjFcLvPHbWm7slgkGY5/ld8VMlAl3Q=;
        b=GaeJ81LrSyldydevimTtVnAE+jz4C8tZaGd82PHSdSc47cVdpi1i6Uq90Rvludlfzl
         k1KB+odgnNX3CTSejn9h5RnlIWsAtiP1gj8Y6wJNcL5rNiZxRkPfn7GJjCRuMliizXTo
         vOoTuZhEmUKehYl374ylLZuyGF0o1svqqXIT/zuzhbgYRRRwgfD12Z5gDQ1pksc4yzBy
         pgCo5eO0oitBjFS5wL/LMKzak3GhsiMRZg8YYVQGCh41+C5WDmL7NE2lArA0oBZj9Fgu
         cMEmw4OiM4dMI2RNskeGZciu7vz7v6cUn8NjomrwXNI1dmIUeXLBSIChj8tR55S2E8D1
         28WQ==
X-Gm-Message-State: AOJu0Yzv7/WgGi6mY7XSaGAyMS3oqZA6Ny+Sxb03XBYvXNCVU8ulG1XO
	dnubhopR1havp3cbbMW6VfngHA==
X-Google-Smtp-Source: AGHT+IFaAYDa6Vr0lrCvqGhnr3YcAh06ruBWoq695g+RZk8mUCM1VfhyAsQXvwPJdaNC8FQdqzlkZw==
X-Received: by 2002:a17:906:28d0:b0:9a9:ec12:4832 with SMTP id p16-20020a17090628d000b009a9ec124832mr5144140ejd.41.1695306778831;
        Thu, 21 Sep 2023 07:32:58 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id lt12-20020a170906fa8c00b009a219ecbaf1sm1153327ejb.85.2023.09.21.07.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:32:58 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 21 Sep 2023 16:32:46 +0200
Subject: [PATCH v5 7/7] arm64: dts: mediatek: add iommu support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v5-7-fa6f03680832@baylibre.com>
References: <20230207-iommu-support-v5-0-fa6f03680832@baylibre.com>
In-Reply-To: <20230207-iommu-support-v5-0-fa6f03680832@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=9vmrSAYQ/OJGejgymOj9rq18l0jyb8olHnhsKnJiPYw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlDFQPl1+LIdPl1L229+UVcYfLca3OCYNM/P0YnuXB
 v4QWDSCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZQxUDwAKCRArRkmdfjHURQJCEA
 DHuD1i2t/r+Gg3749MClPYGF6EvLT0nqGc30sqhS8plPDlblum+YJR+x5f9yqpboZgb+3sCnX7Zi6E
 d4A/JTQDZ1rL3QYD28iI3zVNVFl765+7QIM/KeVEJ9HThaF0sfXQe2i6Pvsy/IetfSueods9QemGkq
 JT9DTpz6wFf7Ciq57MLgYGvCxDq0zY0AsZ2sJV1mxmQNkfxVfakpoRgiiNmPbNrbzfFEzlLTf3Udp1
 j8iZCsdmO4kQT8oLRzMzepRpIIQNlFo+aWfjq3L/c7Gl5YoE2tgtsRcVt7b8czjJJH4xoMCD+mEHfe
 Pp1LRdwNJGKcOmDuH7Bs2MZTyFOYLWtmQ8Me+Ht9Nkj0P3r0iZTSvBRn7HVSzx9GL/eE3pTDJm/Iac
 s0Kqc/ySTwwbvhJn+a6NqUZaW5pI9szuP6KThc56aZnU8xKbo2b6ROzifjl2eEIqgSsm8tIyrMIMqn
 3mLLqsDL0vBKQdyhw+FjU0V482ifiB0swMjtuzEgQHjc+linbCEBFDWe4LfTnFV+6w0dSWCSaufIXt
 xPedYGgozlvbrJK8TJLdcfHzQYz6qZ+dl3iDu/yWu+MbXuRmXJ7pYgP99wIL+8bEORcE2Mj2J8VzFH
 wJnE5PfTyKrI/9/85Dch7lBPFSwIyjoAa+RochVFwz9nsl36hPVAF/8K5ktg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_073302_588779_F463A0AF 
X-CRM114-Status: GOOD (  10.03  )
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

Reviewed-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index afcfa1dd242e..24581f7410aa 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -471,6 +471,14 @@ sysirq: interrupt-controller@10200a80 {
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
2.25.1


