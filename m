Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2617CE7107F
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 14:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RatweBkvtrU6P41JPdWUfgV+9gxtDS8Z15ua81Y0Obw=; b=nItej3rt3Q1v+eE0HKLX660rwt
	AiwmNgkKe6ALVV3Qn56tcipQq63oZKSa/hFIGpJZ3aH9Dwqi8nslWIPUpSQGq2ZMcsqoc679eTn4p
	Ijr0ucGz6dUEQQpmEUKgV/ABcSoGIVqRDTCJ1RSdh10GokqJAKvzneyviPMy1WP9hxZ8IHJ/2Uzpp
	9ACmgXgdONpnwloX9t7unEt0oFXeXsdePq3G7Ipu0ESCHe/8JOocrsxepDTJUUogWiijAXQhgPHon
	FJ+wTFIuQC7IQWgO34aUzq7ZHOVq9XwYGItJjmxD2QbGTI9fDunN2b31dwZflMj5v39gqpcKFFP1D
	QrV30jcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKjn-006Hy0-2y;
	Thu, 21 Sep 2023 14:33:03 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKjf-006Hrn-1j
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 14:32:56 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-98377c5d53eso124409466b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Sep 2023 07:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306772; x=1695911572; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RatweBkvtrU6P41JPdWUfgV+9gxtDS8Z15ua81Y0Obw=;
        b=hXrWSNOKD+jh4wKCIzWZPJroT3Zo7wi6SrHlSI14BLBEIIyY+6kNRfnfRxfbZjiN9q
         qmREBffaJl/eVj6dD8Qt1CW38xXVopMD9cojbV5Enj7B8uNz5hGnnvm4Gmm9YvEWCR7Y
         PazP3AGo3idq28o64A3LVfIXeODmslSwhCVYuNEWVb/mAWX+3KPheBG6GiluFwPSRyWH
         /sD742VrzDIWXppIPTJXd9Z8bqKdsPdbJaSQDGB1kAKxQhG85ScWAA/KzTQylNbJi3Jc
         bxxD9nZWqfCiPaY8V1XNCcjEdqW9cxqbMqzrqMS3eGZEuZ5UvEZ3ZCKGBFjnI3V/lxyl
         1ogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306772; x=1695911572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RatweBkvtrU6P41JPdWUfgV+9gxtDS8Z15ua81Y0Obw=;
        b=oCQ52ud9Rdp5yphxGiudK//e31R96XvIbdzm+aSyRbslJQ1tZcBS8Dfnh7rTzGpU2d
         n7XxNbk8rdJhEfv/VuEP3jtqVYUHXyWiYJ+7E81Lhvvyczr/nu49uXao2mhzARVtKB8Y
         veY2IKUTo4i05LAcxRiEPJ7u30zBamSUrArBUTP6QR4Aff7NdvLm+lcRmtfkWP3OOD/V
         h4OY2sc2pqNTMD4tM+Tf7SYK7I0bgsArK0+DlYyJxX+Zr4iaQuFkDWJ5tztHE2Cv5plI
         3TiDyw+fj1VTR+l52XAjn+GiHoH98awVakQJgXjwZJw/pv1nk7ZpAjZJgemObnTllL8r
         U5Lw==
X-Gm-Message-State: AOJu0YzZO0wUd4EydAOMnePkvLw2HOgULJvhkkXpkHgWUS+FkcoaTZAN
	Pu6bLNxzOIOsR/SHrbOYJQ3+5A==
X-Google-Smtp-Source: AGHT+IGSkyWUtvar9ZLWBQZDLiST02yDQZgS7/saoVxYhwoVJNzn3LoyxXtwhZyKoMkQv/KBTVhA0g==
X-Received: by 2002:a17:906:194:b0:9ae:5848:3f8e with SMTP id 20-20020a170906019400b009ae58483f8emr2323416ejb.49.1695306771871;
        Thu, 21 Sep 2023 07:32:51 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id lt12-20020a170906fa8c00b009a219ecbaf1sm1153327ejb.85.2023.09.21.07.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:32:51 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 21 Sep 2023 16:32:41 +0200
Subject: [PATCH v5 2/7] arm64: dts: mediatek: add camsys support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v5-2-fa6f03680832@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=gpd1qVgLFNytHp6mp3Oxt2b2oXUpJ1x+ZZ2jt7uMt0E=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlDFQP0sH6dzPgSy2dVGfVl1WaQu1Hm5yWCM/Ma55H
 YHT71FOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZQxUDwAKCRArRkmdfjHURbmBEA
 CNUoSrRob1rh1wg1N/+dAXP8ugPQkCTciCkJAoV+tvqQOyC/NYqw3bav8ExTwrfk7xCQ8gpE4vrKI3
 DorQIlZWdHiFAyqZSdMC7c8HiDZ3thBPXcLkEfX4FNlbbdCKd9Z310gFzjcTQKew+2QvBrNZomCmM8
 RMBvpn7RJIv/V2DxcTYPSN9pYYtYPoc9buoibKE0BGR86kJPjiWb3zk+MghfR1DfKMTF9xG0Mfvz8g
 fnMxDPAz1JpMWFXelGY2dIE5MBr5lmKt0j/ifEoIIQgCjGmfi4VYvN6E+b2PrmWDx9y9w3YApWrFJY
 4Z6iQgjC/mrZUGcwpbxquRQt7l9bZg+Ry657e9N8jxOhoj5Ng5jZhsPavKxqkpCp6TgJjdl6sg/VbO
 iJdR/OeolrPkH2Ws6s3AAWtTGXae0oyuJHOERcAyroMPRFXqKcBFccDDepqq6kpO9RNdMtdyjB8+c0
 b/BdeXZeORCt9GhWNKB+u6NcVLZ5dn5ZXuYo1r1OkezOtDAyiTPJ36+9h/kD3vsMfnEwa83f1eNACz
 d3r/F9dPCJfFxEzJv6fDNwgJU+ZZWVlalUZCxqFnqwxrgPBqbxyohTTupaRaSSo/UzNR/AvFS7wNDg
 T0MfzOqxQaDhh0E1SpQR5zH4pH+oDYof7B10ofS00iV4qd9G2rWLz06W/kTA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_073255_571534_8050FBBC 
X-CRM114-Status: UNSURE (   9.53  )
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


