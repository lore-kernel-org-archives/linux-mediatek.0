Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4650C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 09:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NaqmMPfKXAOtSVjFcLvPHbWm7slgkGY5/ld8VMlAl3Q=; b=s4VVdwb1Snbim+mBUhmNC3DvK8
	ap1IhQDRyLWY6OBePHAJW0aLqQotdw9Lsxd05T8zLGc/ew64AByO4Fo6/Ql8kfxmQiBi6QawUQixK
	crLp0SWKDSuY+DSjEYGWb8GKXO0VWRWQ0G7eSbecua1SoCd5QopZ8uvxiHztqEhl4lewzk9gqK1DX
	DNaL8wY0jA9YcQJzAJgElQ7A30BHJV+56KfVtdXL7U21xpU6upPxH3julRZzDlSlSrKioKwj11nrd
	07/jHeMCQe8KWz/3a8ytX7Q7lVksTaALnyVhOlZ/T1nVeIfKpLWFR/0qLttYD7v8poP4GGCb4k+4B
	Vp09pgTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUpf-007EXk-1Z;
	Thu, 03 Aug 2023 09:41:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUpW-007EPp-0Z
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 09:41:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fe1d462762so7664715e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 02:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691055673; x=1691660473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaqmMPfKXAOtSVjFcLvPHbWm7slgkGY5/ld8VMlAl3Q=;
        b=ORHKnuWxwNVvjhuPg+lGCHO2YLJA5sqiZdPzQsNUCwPqjluQs7KGXlQ8CubTtLmlQT
         c8bm7rPEPljBDm4e8hAyNHrnsMCInefUM5LcxQs7KP7xKaMJcmhFWzZrJD/xbaHkMq4K
         0J5eFFVdb/TKh/yck1LHmLiMstpoxAt+ruXdmLEWzqe8yf1uh6C+rft1ICXtICDAjph2
         HAspl4rKv91tZHnMiJUXBNwCch9/Fxri0gWcp5/L+rN6gbuBXEwIDeeqqmJuodktKHcJ
         gTTY88x8CVZsDWuBaRdCVQWh1gGKYMDVVyptnAv+x2ZNSyKHJeFpJx6eA9Ib9qSSYFuK
         SDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691055673; x=1691660473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NaqmMPfKXAOtSVjFcLvPHbWm7slgkGY5/ld8VMlAl3Q=;
        b=Plgs5GIrpUv3Er5M9FD7yTwB6RRlpJEaXvjZ+UZ2UKBZMTJJEivJnvSJg1NmNdlDzx
         2DgkLwf16ARffr0RupLaHcaPrDY3QcSa23tvvU+SxdeXFc9IoklLG1ial3mO8qT81xw1
         AzItD8habUyMN59x1CWV1afA872d/5MeKugptU/jk6GGfTcrS8iMaH2SpMhj2yNjmSfp
         H0oG/gW4BB9p3X3heXQOGKCTYWmI2fqUlqefLpC4uuzckmJvcDVrL4lMTgKvYeggr987
         uWFpZeZggPK9C0QfUdNrm+q7M92Jk/+3l7kHTKGY23vuOISSMH/hJl1Pt2YfYIWP/br/
         KJvw==
X-Gm-Message-State: ABy/qLYMQNhNTCD3TFTWdG8no5vZ1p/g0yABfrajoFq3vvtxglBHMu4L
	Hd4XpE+KmhpRbgTWjSlwdR/GCA==
X-Google-Smtp-Source: APBJJlE4g/QxkkNcPkq5XGfDtMFOGuI1W8qHwNsMr4YidpB8nT+vJcn+uCpQv4l+jguaoqHYqH0UeA==
X-Received: by 2002:a7b:cc88:0:b0:3fe:1d13:4663 with SMTP id p8-20020a7bcc88000000b003fe1d134663mr6818673wma.1.1691055672966;
        Thu, 03 Aug 2023 02:41:12 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id n1-20020a05600c4f8100b003fe15ac0934sm13294994wmq.1.2023.08.03.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 02:41:12 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 03 Aug 2023 11:40:59 +0200
Subject: [PATCH v4 7/7] arm64: dts: mediatek: add iommu support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v4-7-84798657c410@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=9vmrSAYQ/OJGejgymOj9rq18l0jyb8olHnhsKnJiPYw=;
 b=owEBbAKT/ZANAwAKAStGSZ1+MdRFAcsmYgBky3YuJx6x4dzDhkJEC8For4LCR2hLUkAQ+++WgYvK
 LGwc6IyJAjIEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZMt2LgAKCRArRkmdfjHURedSD/
 i0CM6VH7TYVqNFUOU3Vvvj9lj3yLia/HYD5uuz2nC0zGYQeLx0mOPVnS7DEF8TBRwRXc8PLyiuWeIk
 faqvsYAXVImDAominB2/0DREyXWQ8YIBcnKzi92enu/y+pwFo/aS4WblRnwc4TzN4cFjFeS4/4O6gW
 89KNusCnwqg20iHE/bTxOjaAHz598/azpJ/eawPEydC+Wd7GUudVnkXiIbsQzvYJ83I8UHMXH8kZQi
 pKg4StMsGHCS3mewVMRZCtmgB2tGmMwo/X87RD77II0ZVIV7I1OI6amUzBSNXB/nJHsMvIEYiapECo
 bxLrIHWMT2V9KcSxkgdp81B+ZbIRkro1vN2+M6fS5LTJMNAAd5YiIRyTxAWJ4Af5A986e6roNmUN3Y
 Om8RsQmDHwgKAQoDhsphdgKucuhPDEx897OX0Uk7SNgW/1qlGVM6nyBoi8kDGtyzBJZVACdT9vr01j
 Ijjc21Jm+h0tOits72Ao7oYZxXIdRL370X3vEn4yGPkTxK0lsei/mlY1DL7tQb1jMfCPSW+WLL1JcY
 gYvGxfzhdkyGXi2K59ZcwqOSYPg8N8SjTxg2HUgNd8c175WRL9tn9rZrY/c7K2ifAZCfJ2ZyVAB4M0
 GNhxXJc3aVW+DycPFeL+AUfJvCrUMNclqlF24ClQJ6VRXjvTy096lXvt8W
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_024114_265349_8868AA69 
X-CRM114-Status: GOOD (  10.49  )
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


