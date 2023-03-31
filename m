Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33E3C761A6
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 17:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwase7lH/pIQ+fdUHX1Peydgp8rdPYou8E/famXpXaM=; b=aVoyLSsfL3swFw9mF9c1JjyyBG
	5wwF091uVP4GILOFPKB6LSRNO6HlFi7feRSoQmk7TP9XXOOm2bK42UGaPxWqk4Z+kLo+ougnfOJwU
	vrkfihh7VBQhPRcobnr8/O16xwVX/yjaKxHfc9jKSRQsoCBldArnDbb9XX7cEY8DBB40HBtu3arx4
	0DGhjn2mlBAxhJzQ+TNkQOLkkLIEMA7xlYn6KIGqJTMXl0JMebPlNvo1ZFXBOnvrO4aRcP4asri5q
	hDyac6/qyVr9HiXupRMG6KUCZijYYB5DsEWIGeoWM2XJkWrl/y6uOyxEOg5j0MHQ0+SObda/csNZ+
	j5599uQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piIyX-008Mfm-0G;
	Fri, 31 Mar 2023 17:55:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piIyQ-008MbC-12
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 17:55:40 +0000
Received: by mail-wm1-x334.google.com with SMTP id d11-20020a05600c3acb00b003ef6e6754c5so10444892wms.5
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 10:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680285337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwase7lH/pIQ+fdUHX1Peydgp8rdPYou8E/famXpXaM=;
        b=vNDOaHRl2Kj/oqm2a+ZOvkVthke3hcEOsa1gShhrWY9pdOR4+1HnzUCEPpsAJwcG6i
         GfxmnUN9mHXe9yKlMkkLpUzj4EIULrAVlJfxYJKS3e6mFrQwIWWSUfUCOWknKnm4//Vb
         EuDdmwgw8XY4OBR+NB0ofqeh2lyl7XQ79uZiiHQC5/mB0uPcg+rcqUY3m1L5VlF8rO6W
         BjLQLPyP1Fjyl/QvTXcrQxJMgK5EmWldvEyRbsICGU+sz7bntwOQZDF2SuBQ8NX4HSzC
         8BOVPNlbv0Lo8bIKYvZPFKIw8lTYppLDhqG2OJ+yjrwBH/kLzaWxoWwVjm0qXRp/LtBh
         nV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwase7lH/pIQ+fdUHX1Peydgp8rdPYou8E/famXpXaM=;
        b=Z+MsqhMByCUxr6l+wEFN/zoPhuIazwcHUFR+cNlMZadQnLQ/+XcDwlWiRtMZZqdaKF
         LhLNsGESs59pYJwj7kfaGiAEMPaAzquOAnbVQT3pwfbrsre6uBUliEMSDc/IAQqT7oAx
         9slVpPoUnIVDFW8i9EKdaP8hQVOAUaiLjbLC2OLv0tsq86y3+EzG68M8mffgc7/w+d4w
         QIbaQkiLeZBLn/B9Wpp6FliW36ZchJgNP69Kh7sgH0WkPp28Icx2Eq0qKSYtweIRTMMh
         pnxo/appcGlZ0Np+wH1s79KIOhELSKHfaEHe52Oa1+hsB7zAsRh4xFUY4QOhautYCOjV
         Ke0A==
X-Gm-Message-State: AO0yUKXTReeStENB7P3+KeuMdmzGuOAwHHiL6WgrnEuREJQUvIx4Lt+z
	nx383zTy7fcIehxxLjEuE72Zmw==
X-Google-Smtp-Source: AK7set/7YiR+6uvInKBDF5U3X3vbS3p5pTgCtbpBCrUfqHWCLuMaRSiB0t9TdM3aAcsKlki7PIML2w==
X-Received: by 2002:a7b:cd0b:0:b0:3ed:2f1a:883c with SMTP id f11-20020a7bcd0b000000b003ed2f1a883cmr22924076wmj.14.1680285336932;
        Fri, 31 Mar 2023 10:55:36 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 1-20020a05600c22c100b003eeb1d6a470sm3370171wmg.13.2023.03.31.10.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:55:36 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 31 Mar 2023 19:54:47 +0200
Subject: [PATCH v4 03/11] arm64: dts: mediatek: add watchdog support for
 mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v4-3-5cffe66a38c0@baylibre.com>
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=892; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=sanLlORy8ZXQl/7pqZ+xOL9pEwEsbTjvO/nq6i79rEI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJx6TZlgIokDKg08GNEP70+ShS8iKpqmXUqsh1Ucb
 brcDys2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCcekwAKCRArRkmdfjHURY/AEA
 DCtwg3eRbv65f68/nKU0XXQL0jBa7Jmnsq1oE1w1oxBQXjWEbAlUceHhnFOiTnI02gs66zMgRJVaQA
 Bwn0bsRRebmE69Qdcv4qsuM8OsRy+hRFfEsaE5M+xNrD8zCw2Lrq/ywasJfn8B03OV6vb3KK7P0DEE
 R1e9eKbiyrf7xtnnU9bPMTyh1OBU8fzrzFpywsYfwh1LWhoMUusddFDpSGkF5APkissQxh2lvG1GWu
 IlPTxT0vdsfrSyaG9ytUtuPdVImYf35/NFym4xAGVElPSLYgeYdqgvNMCgb7wnRJ9OQfc0pYmJXDAH
 SsOllDF5506DJOOH5cQktSjuEX7svelefHuOIDIJYtZqv/1iarRy9TDiIKejaSHqJ8+uSGzatyqRyi
 KASvjPttRvVetoTUThLaXQ/ZmI0wPqV+9OmLACBc8DYaN/+uHTqbaB7CVEOzdqiQEMt4T8ymqMZgzT
 AAojcoN6b9GgbiAYBMPeLdt9LzD2wJ0ktVfz48i/M+kuLx6ab6qodgYYK4mXhMShcmMag5+fUkPAV9
 Fnl3ARBpMGsEnkybKwHIPspNMuBJ5EqevRAhhhzDhkDy4soWGmBMCLvfMlo1HteUCgcztc58C7Gqio
 nIZYREGCOXarfxBpLqJzXfpcp4eiTavD+40+Hd007I2vivYSCG7ZTjAL9SjA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_105538_358960_33E33240 
X-CRM114-Status: UNSURE (   9.46  )
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

Add watchdog support.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 1f6b48359115..bb45aab2e6a9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -162,6 +162,12 @@ syscfg_pctl: syscfg-pctl@10005000 {
 			reg = <0 0x10005000 0 0x1000>;
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8365-wdt", "mediatek,mt6589-wdt";
+			reg = <0 0x10007000 0 0x100>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8365-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;

-- 
2.25.1


