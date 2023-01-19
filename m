Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6C7C00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DozicllB5aSf0NJHXLU7ZCZpto2E7CIim3OCyCfRck=; b=3uIfOg9mDe4UJc8dglmDrmQlvh
	1/m9dIeLZDOOH1jfloTz7zBcYLVVPtIQ9NPsRBwNnWF9xGU6h7BwI3SyH4hLXzkfas28f1Oih8tO4
	IjqTn+NL/hUxBcbhSEtLTQw4R63bHguTD2aoZOjhwKuy3RjhZc9/ZSS0DVj65e8z1SRQEEk8Sn17S
	n/tt/v7xuANtA8Xx3sIlkLmO4dowz16/3MCAREfpRE2H4hjAPeHG/sAhNzZvW0rlHO8klGZP6kf/b
	T1s2iaqlnbNbj678v0k0V3hs/OG0Mpvs55EsfxYJ68ZHF/IOkbRquv5RbmyUTzZkMQKvPjrsBFr/R
	dpxrhJnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXmq-005zC0-Bs; Thu, 19 Jan 2023 16:29:12 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXmd-005z4J-GP
	for linux-mediatek@lists.infradead.org; Thu, 19 Jan 2023 16:29:02 +0000
Received: by mail-wr1-x436.google.com with SMTP id r2so2396146wrv.7
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Jan 2023 08:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DozicllB5aSf0NJHXLU7ZCZpto2E7CIim3OCyCfRck=;
        b=NHXZRJW2r4Eea2Fq6bbn8bqBLj9R38yAdJ3SNzksX6KCwk9YGSukNefWB037D/S9Ic
         Bj/Z0732mvGk6au5utPQNri0zxflXaEyfBvWPJKYD2n4FRT4/6UG8bt/6/y/wylPSko8
         bkmn+lB9UF4UJISdFP24udMcqk7qhrzjlVOn3xHTjUuZ07EFmYCFfik2sfEvHRJGN9Ee
         oykgK5BrHI9zNDO0gTIYKZHqrY7fOdqv0IafXGWFVsmWQXpP8azkJYf3zQP2tKq+7wUF
         m931tr3gf84kLiTXi+Kw9GASoQFOWH2DeOo2cw8RO+vhxN+TJKm+SDZ8jFV9TeeTrNmj
         6dwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DozicllB5aSf0NJHXLU7ZCZpto2E7CIim3OCyCfRck=;
        b=vNyWGK8PUW+aQC4kWZJ6oOA/N3z96QDPwu2I17/T8cRLB0nE4Nv3ZBfDycR7QK/BPM
         1CF+MjwWgXNLcN6Tcbrwo784zUFEf2NVRnT22nzHmw2DsEeC8AcZpQDFMPLj7C0RP63H
         UYWRdJ+FILqmwndAawxqHAR+CsfFu38lruNnrjcuZ8UvFNAS2oMxtus2Cac3eRm9dx50
         ccbKCtMmX+gTj3nS04ZIrHnFe0haoir1gTD+DO8yYNFAqKvr5yXVkegulvSSUOcsLKWd
         swxaJ8Z+8JibN+XVPc2A7JwED5fWCF2rd9xHqsYNcydWtPbpGkOBJ+TspeR4PYuJ3bBR
         BOog==
X-Gm-Message-State: AFqh2kqzhr6o/lMFQQW5TxbJt5aqbgIv5LvejIJBIPU9GkIUYanOzXm/
	fsxjwlGHwskWPGk1btuD2nqzyA==
X-Google-Smtp-Source: AMrXdXtiiCW9cPmJt+sOqlVLAk1K/QrcT5OPbQKlsBELKwCUcAl8ZoaemX+z+i/8HaYMBi8jl/YQXQ==
X-Received: by 2002:a5d:5708:0:b0:2bd:bf4d:9a1a with SMTP id a8-20020a5d5708000000b002bdbf4d9a1amr17640458wrv.25.1674145737828;
        Thu, 19 Jan 2023 08:28:57 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f7-20020a5d6647000000b002bbeb700c38sm29008771wrw.91.2023.01.19.08.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 08:28:57 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 19 Jan 2023 17:28:49 +0100
Subject: [PATCH 1/2] arm64: dts: mediatek: add spidev support for mt8365-evk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230118-mt8365-spi-support-v1-1-842a21e50494@baylibre.com>
References: <20230118-mt8365-spi-support-v1-0-842a21e50494@baylibre.com>
In-Reply-To: <20230118-mt8365-spi-support-v1-0-842a21e50494@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1215; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=pU0kgdkxC01dKg9iYuR4AqxL5UqzT7jxF+KQ4Hjq0X4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjyW/GhA2jsFlKrwNu/Bq0D8txpeMfuIPSs3hrK73I
 B4V8yCyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8lvxgAKCRArRkmdfjHURfvDD/
 4i14e/xp86ZD2uYjBWq4E6Nj46bAdjD9o5SMPDYvQaIQMJ83yt09xTMFnE/gc1qgANCoAGJb7KUQy9
 IVpTdu9YQnOkeop9yleZ/9XMvxFSjZ7sEHkgqr5qL7lAau+T1OTallxCdKqiyXb5/GJznZhBhRGGWo
 4JXaf/1X1ocVjq61PMzIZhXgR8baULiQ2IVA8nMSj09uNAmO16VBo2oRVdUqNp06S9G7f+rB6dM0d6
 gflxlcFbRd5OBFWGEeu5QSqL3AAcFa+1/BeWNxYCDNhsTsbiNc44FEae6wmF5jGnmszlG5QVH8wTg2
 yaUvfQ+f4Q1IsMzHBoUGz1CjxicgkAd3MaS4/zr3Uesu3Wr6LDG4hUGNQg5Pdl43IA0S007QZqvjDY
 Le8PbAoEp+VqZ55fJNkZd+/rLQk15c8Fbhnlp3OiHMos+r8cxl0/SHtq7MsUwvAYyCDSFbF49JFzhz
 wgZ+z42rU2dmokL6NI6H7kf+F1QTO0hJYjeruj4Nq1zihygPAtNv1nUZhI3sbGcspTBVQB2pCfgr2L
 QxA2IgjCgOla7ObMRInASVXX87mbUa6hBt+O2AQI/n/P8zxE+Gjne0H4DMycweSNyzFKytSrPaFK9j
 5PkK0DIhpfZuVsyOp69smzuzAk1SwDc9vqS2QQq+ULl9cSFojjZDMwnyNrsw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_082859_602645_E99004EA 
X-CRM114-Status: GOOD (  10.01  )
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

Add SPI pins and spidev support for mt8365-evk.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 275ea3a0e708..c1d603cb129a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -142,6 +142,17 @@ pins {
 				 <MT8365_PIN_116_I2S_BCK__FUNC_PWM_C>;
 		};
 	};
+
+	spi_pins: spi-pins {
+		pins {
+			pinmux = <MT8365_PIN_26_SPI_CS__FUNC_SPI_CSB>,
+				 <MT8365_PIN_27_SPI_CK__FUNC_SPI_CLK>,
+				 <MT8365_PIN_28_SPI_MI__FUNC_SPI_MI>,
+				 <MT8365_PIN_29_SPI_MO__FUNC_SPI_MO>;
+			bias-disable;
+		};
+	};
+
 };
 
 &pwm {
@@ -150,6 +161,19 @@ &pwm {
 	status = "okay";
 };
 
+&spi {
+	pinctrl-0 = <&spi_pins>;
+	pinctrl-names = "default";
+	mediatek,pad-select = <0>;
+	status = "okay";
+
+	spidev@0 {
+		compatible = "mediatek,genio";
+		spi-max-frequency = <5000000>;
+		reg = <0>;
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	pinctrl-names = "default";

-- 
b4 0.10.1

