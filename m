Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED3ECD3431
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 18:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ru/MdFcC19oEZdBkk7TP7Nyhe6O+16jZBwSrBv3JVY=; b=Q7/vigonH5AAM10SnPb993c684
	dWwOl2Ga0OdFa0q6tjJv8kAflGSIsvChL+QXR/ShyLvNnSXGomO1876ST5XEVdHPkfIfEjLoGmxuu
	WflvYfD9ZW6cX4rYnqTg8xRSOENIPeTk/SBVWgrxMM53gAKqJP0VGB+oi1tUN4aPvyUvaj90L3mWn
	PFm5k/pSjvFiwLI1J6i/xQX1tbOY7iSIuOqnFMXidS9IC53PvrRMb3q6uXTKP3AbKvY/x+IeCgvUg
	tpSe2GDjhrz40car9oS5sYxmest6UwNlB5UNbAALCuAKNYRLcdm5Z61u7oCBXlDqUj+JwptWfbcnT
	g+hw+bcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkq9f-00Eoi2-2o;
	Mon, 25 Sep 2023 18:17:59 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkq9U-00EoXq-0h
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 18:17:49 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9a645e54806so855295966b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 11:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695665866; x=1696270666; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ru/MdFcC19oEZdBkk7TP7Nyhe6O+16jZBwSrBv3JVY=;
        b=aEeh5bcmj7Br+NsVu1pdsVKvdRLrFSjXy26i8JNqA1uZrKBRrMlUDYDhBYbBsVJSXQ
         hlVG75Q6Q9cUg7eoPczp1KFMjP7f5KE3JrJEV3gcHuYY/eX7UpcTWU3m2FCN/ItZ/sbh
         DlW7CRdKmbh/ri2psdRPDAKpQSBFlvKs3JRh9tmoYfCpAUgcgNSeoj4qMv7GhkROymxB
         IYP9MPOtY0yKJpHhb6U2FHi7Vq+tRCQnRtWDw7ppJQ6wlSkUPPK3u93EqxUh4qc6LYIJ
         Z6FNoZsOSHKPCPE4qvTNRZwcKqUFQTBex9+cKNksNtQI13mDU0E2Icnlwc6maO3D2l0E
         n6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695665866; x=1696270666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ru/MdFcC19oEZdBkk7TP7Nyhe6O+16jZBwSrBv3JVY=;
        b=OUz6JE45GjAWszz9a/C3sFOyQ+l/FysdFAVsI1B4hiKPRYMy8VusPCeeww1MKxHRS3
         TS6zo5+TSTHKQRFzKW1+QPC8y5Mk4qplHRQxLzQL9flzaRHpZxTvT0CY3Uee4IX9Hwmd
         nvfVzR24lCRiM85Vn+A0yOo4Wlac5IFwL9uITc6AIS4f+4NRt+sr1Svn5zZNsCOpOtwv
         6bOR0goxNT7UNTRLjkSK86v3Jm420fnPv+KH4ToB1VU7PLqso3hpsL0+xrgKlTQXzeJt
         Gp1HW53WM4lR8tDBa/DwDKraphB24iWVnlTMt3JxX19isXPe1Q51wiNTEn0L+T9y0Q2G
         y7NQ==
X-Gm-Message-State: AOJu0Yxe7Btr1DwoPbUo71Cs4dmpUH/v/j+yub/KfhsTFBr5TYCRQtN1
	uG7lzpPLBQTqBkxqTDD5GMWhZQ==
X-Google-Smtp-Source: AGHT+IHGP5tHvdelrtnH/VblVMJTWJ0HstjyNqWVh7KRRITlIZNsm6r9NPQRTYI0sF9q2peBjRhBHg==
X-Received: by 2002:a17:906:8b:b0:9a2:474:4aa0 with SMTP id 11-20020a170906008b00b009a204744aa0mr6854027ejc.48.1695665865822;
        Mon, 25 Sep 2023 11:17:45 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j26-20020a170906831a00b00997d7aa59fasm6793962ejx.14.2023.09.25.11.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 11:17:45 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 25 Sep 2023 20:17:36 +0200
Subject: [PATCH v6 2/7] arm64: dts: mediatek: add camsys support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v6-2-24453c8625b3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Lk6qSks1FWZtF7N0V2O1kU7gpoVtoT/NLAYxbDBGin0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlEc7FC2MRtrQZWUwmVtFlhUOQbXLAvvGEUpOZLh/U
 6M5lCGiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZRHOxQAKCRArRkmdfjHURdCZD/
 9ufYH/c6b4zcV+X9wOd10BpsBn386LElzmNxHU7oHBraV7lvrDcSEPAnobUSFN8FMlXXl+74YOgV9g
 TIFRuEFIjHJSnR8p3bLlObNC4WYAhQbNk1wSrGT+AuY8AXPq9a88xBoWBlipOGYocbrlrK6yfsAHsV
 D9XftEKtH72m2MHxP+zPcIMlRCcOVemuwX74sWCIA/K4QgHVFpxrGYgcBbBreMbObA/SsVmV7y0BnD
 8uz0hm0ImK6jFjvQAU28ks1ewKZc79K2DfWBPHU7r7v7K4G/cQ2yTqOoM+yaY3BgWVeywtbVPVi3Ke
 6lnoudCNW/D1BxtLWCQgZJyz438o6+Gz7RVc7o6rzam3pa5bMTprZ+ir1/giQjqcO58e2fQtmxd9/b
 D+gRtfikktXS2tQ5mC+MDo5JpINx4UUvxv8VSVj/pjbbsyyHdonKv/X/T1GApJVWy5LRq39DqwJ06Q
 z9argNbzVuBLUUkoOKLvqNgd/iN3CXzrvWznOluPH1ptwFgmY4wdvYG0Rm7cfI3PLXH9inRUIGWrH+
 ArnbifQa9yXLWoKo5xvNLqUoRzvf/LS2ysO7gswHvVpYSmnL4LxccZbZIJh9Ox8muDT30E4d8vTZ8i
 lUxBc4LxYlZrCYa07VgApwqM7xnun3a8JvSJF3w8qutpafLy1+Dn+GvoNKBg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_111748_254288_EB7992BC 
X-CRM114-Status: UNSURE (   9.84  )
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

Camera System (CamSys) incorporates an enhanced feature based image
signal processor to connect a variety of image sensor components. This
processor consists of timing generated unit (TG), lens/sensor
compensation unit and image process unit.

For more detail, ask Mediatek for the MT8365 IoT application processor
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


