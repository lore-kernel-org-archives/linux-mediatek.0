Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366D1C00528
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 09:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RatweBkvtrU6P41JPdWUfgV+9gxtDS8Z15ua81Y0Obw=; b=A8kh/Cz55QDGJnmVfC8lLtLc/a
	zazK+RrqbsXeFQYpQ4qcdOlLoTsTOQrEvMoW3O6uNHu8Db6qn9i1LnFbp4mRJtOnc2rsscizQjjj/
	YLD6U3To0K7At2ZFrd7OtSOEwsVQYHJr87KUe8iIbZFyPfam64esOACcoWQ/WTSMH1u9T/2PBYJYc
	Ywo+a/q08D01riMii2Baf2/NSBfXrjQytnrpmZCCaa+2ia2BXZ9pXykjvmgc9uk/b5PYyLnWYRWVX
	9bunV6sNOX4wtMLxxoYXHnmtBTI7Lvf+qe1v/FTTaG2Oa9tYJfjgXK43sstpsSkdXdMfb93Bs6aIJ
	8PUJE4DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUpX-007ERW-09;
	Thu, 03 Aug 2023 09:41:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUpR-007ELn-0w
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 09:41:11 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fe2d218eedso7726855e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691055667; x=1691660467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RatweBkvtrU6P41JPdWUfgV+9gxtDS8Z15ua81Y0Obw=;
        b=APeHPOyXf91yHIRI6YBNzlWPRQbO1IR+eQsGr21Ao+xfB9anfLQGbZNT/J1aHg9Byp
         v6LAOPFOZlNliD/AKDOIs050mgezdwlUWdqwUDf+jO+hD4pBMcLSgg9SLwNPDFgZyWq9
         SHLCTzxtL5hUt4jXWRzaONUoMufxm2+XYb4TGVsQ1WddU9CP8s5pH7MHmyOIZUo/JBMy
         8zOQZSL12lSc78hThPvHYS0X6NOvVDF64BaNQU7abAJZIkSCyUt14YVIzhovOlyZQfr1
         jSI/rMRDAj9KvyayyPCmYpuw/xpC3Uu13AvXaooleAhrag0RetHNtRAnyTOh3prDBxRV
         pGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691055667; x=1691660467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RatweBkvtrU6P41JPdWUfgV+9gxtDS8Z15ua81Y0Obw=;
        b=e6Cr/cRxJTEs9r9+nV+/3fwsSPK9evxpdRjUeFFgYvXLHDPVBCo74GPNMHIB1CLvV2
         qkzsEMohrnQqpfJk5weQ3T+84axocUfOHwweEdKYjXno7D/rEfv+bjI2yh1vdlUaSfmT
         yw2aCgSDqLGmOSJ2o6bMXDapXVd0BBO1NbrVMEyvMIxMBToJ7NV6PL6K33mcoV4Mvb7H
         rftXAoL+gTQ6/EcjQc7Ik1AClOYdNjIN0C38PGZ5kVYtqIHFtcWWMmAPGEcHAzKR68DK
         FM3pj1pUzYbHN3otkkLRroMwQGqGPON5zBtHacs93hIAYQE5EWj6cVRWk5QoCVto8gt/
         OwJg==
X-Gm-Message-State: ABy/qLaRAkhV6LJsjRhbrAi2YMtELstsFETeMjX+uPKv5aDMbVjbefnu
	v47Ok4qOKos2/y7LWkyKiGYg7g==
X-Google-Smtp-Source: APBJJlFdQc7Hmxq2dsKHT6YWTWdGlvcTVi/JAbNG1Bne3H9oL8moyeKPEPygjcJT8ejEkDONpsbtRw==
X-Received: by 2002:a05:600c:20f:b0:3fe:1820:2434 with SMTP id 15-20020a05600c020f00b003fe18202434mr6613795wmi.1.1691055666846;
        Thu, 03 Aug 2023 02:41:06 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id n1-20020a05600c4f8100b003fe15ac0934sm13294994wmq.1.2023.08.03.02.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 02:41:06 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 03 Aug 2023 11:40:54 +0200
Subject: [PATCH v4 2/7] arm64: dts: mediatek: add camsys support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v4-2-84798657c410@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=gpd1qVgLFNytHp6mp3Oxt2b2oXUpJ1x+ZZ2jt7uMt0E=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBky3YuE+488b4g/54Hcf31FvCM1sQ21gc7YrC0+OFX
 n8nhfbWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZMt2LgAKCRArRkmdfjHURS0IEA
 CmumZJyt4Gu96SS7OfBEGId/hR7PZyr8cF6qcQFLnoSJICFp7JNYXWDe6r4lw5aiZimmG6LbXpTgB1
 z5yrnL2/ULnRZA5KFBll3L6dGjnte98QKZwMNLquQfZO6YDz6r8mEUH4fsT8Z2MvHZaf32HffKShq6
 IhhSQC7KUNSWqn+el8qR6pXY6fE+o6UdHxod/lyOU81kjuuqf42DafKBfdCQ+HbFluUYMYuZxvCjpL
 o31BbfKGE+YGxXVpXwHtz8cFBwxlKRHZXe3U4oIxPUMrTHIG3mivQhp8a5nOXPoM00aLBdvNLEuN/t
 GVFPGgUORS8IIR2SkPZiU73V4mgMQmbNsH0CVcF1+uIAJ4V5ue3mLihG87shhzHiDNAy4JIBV3LnCm
 ZG7xbGHh6K4hZ5Npu57AbawgTP0OCZi0k+PKijLDN6dBJfEPRvFCRZaKQpGdSzUvcLsUm1q5JGKh43
 VUU3qFGt11wJR8B/WdaKrdnk//Mu0O0GVH03dtc72QLFxe91GsmrV1Wlh9PfOqxF3tPgFkiP4PNsR7
 RDaEPAVjr2YIpnmKO+3gpxvdPHz0pEsDaxz2Kg1yC8RdN++1HSjCEEURWY9MaX6/lK7sfGR5dWyBXB
 jKs5ME+8RFC5Ru+NaiTLto5KhmCAbGoFdm39Le7KO9Ebr4Gvo5t8gi8AZHkA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_024109_327337_1F0F4A81 
X-CRM114-Status: GOOD (  10.08  )
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

Camera System (CamSys) incorporates an enhanced feature based image
signal processor to connect a variety of image sensor components. This
processor consists of timing generated unit (TG), lens/sensor
compensation unit and image process unit.

For more detail, ask Mediatek for the MT8365 AIoT application processor
functional specification.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index bcabc2b89a94..f9cddce5bd9d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -609,6 +609,12 @@ mmsys: syscon@14000000 {
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		camsys: syscon@15000000 {
+			compatible = "mediatek,mt8365-imgsys", "syscon";
+			reg = <0 0x15000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.25.1


