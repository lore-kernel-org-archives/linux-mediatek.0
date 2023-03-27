Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57CBC761A6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXySEw6VHHY4T8YUjW6WkiV2MVpH/15AZY9UsR+ehZA=; b=jOZiazSkp38iIGo0lljbJymhtO
	bviGAayUde8hM8FCRMuQundZedEq0p+N28Rsf5iTN05WaCe/Z6l2RxCKLMINa1cdq/VNGST1D9BFR
	iRcK/bTY3ftRK+o+hn6ywmfd5Vp6JyjuVuD91Ykp/AYYKnq9oD5cldrDkoDhEmwK5i4n3SJdxumPo
	FP+/4AKmGNgSj3+8LF6h4dxYTN3M3EsEIWIHgorvwqPWE9omKJmlKAonkks6NaHXwB2Vv+VwHj2x3
	2IuUP6SUV/Qa2ZFQ6G8qry8GldndLEEOBFRSB03PgbjM9TA8pJKgc1cawS0cjViYnFUAoyYn0dXhL
	kjTp0vgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiDK-00AFS6-0C;
	Mon, 27 Mar 2023 08:28:26 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiD6-00AFMg-24
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Mar 2023 08:28:14 +0000
Received: by mail-wr1-x42d.google.com with SMTP id t4so2526362wra.7
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Mar 2023 01:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679905688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXySEw6VHHY4T8YUjW6WkiV2MVpH/15AZY9UsR+ehZA=;
        b=PbdSxxfQSvfmaNR7ESQq4AVpCFq0z3EGuqRUt3geaqXZOFOFXUOZZzFLW5n8xnavtD
         Mh1diY4TEudKvid5kklpGG3yIRWbYS+s5zDaZbi2aNaDDvoR5YApIy+pCrOIokNLFirm
         PCIL8lrhFucIMvan7yh8S7XTYbp8zlk54oLfTmiZi+Fjxy9Wqx/FvaE7pBn8UIMWzExN
         EkUAJlTY1nbw+IIUrnPthHgaLGNLnV/X0b6670ApH12mF7eAsnT97WZEdm4dGnqT86em
         TA2pM/k8WaY4OjTtBDie0wneYvJxktADEZR2AX6LO16VjgLtkb3BTbr1zdx8O4rT6xie
         t7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679905688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXySEw6VHHY4T8YUjW6WkiV2MVpH/15AZY9UsR+ehZA=;
        b=y0rhurGXfuysizb08Uzk9XOvPUx2iGX3EldtSMAnPY+FKukc0OZfCInbf0o34DNDw4
         NMYttCmheway2MninCLW8MUcjjA3d2pouzcODIWxff3HPkRVodhVxbdSmhrKOh+77XIK
         RUtFsYyE4FiZz/qitEunZephvawApmmA2c46Sz/8iBk5TbuOp3ezf1IAtCjgSclb80Q9
         MN1i9340jHNMHXCoH06XuTnc+BTfHdfb5x+SLWW7E45pe376+OPKIVvnZE1bs8Srpxey
         tRvN+rpG5HodLTXfSJyzPEhKK9tJ2S6hiU9QqDstYPqaj4pwYEDL9j9wRSFD/TNW9ftg
         E1UA==
X-Gm-Message-State: AAQBX9dHjmLQ3eDJ/37vgKl8KhRDTilq8b8rvPygcEV+3I/kCVQWW7MY
	fmxl8Rzzrb4YL5j1O99Rh0w+qA==
X-Google-Smtp-Source: AKy350ZPTGuHLzmCMgOTOYYL6zs44rzYzlU2HkPczYjzD9B7PvW6Z5Y1kyB+NTTXcTXgglVUth5Dhg==
X-Received: by 2002:a5d:4e90:0:b0:2ce:a85d:5319 with SMTP id e16-20020a5d4e90000000b002cea85d5319mr9830086wru.39.1679905688659;
        Mon, 27 Mar 2023 01:28:08 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id p5-20020adfce05000000b002d64fcb362dsm19192398wrn.111.2023.03.27.01.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 01:28:08 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 27 Mar 2023 10:27:58 +0200
Subject: [PATCH v5 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221122-mt8365-i2c-support-v5-2-6e4f3b54937f@baylibre.com>
References: <20221122-mt8365-i2c-support-v5-0-6e4f3b54937f@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v5-0-6e4f3b54937f@baylibre.com>
To: Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, 
 Rob Herring <robh@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1247; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=vLQRmdlf8w5DsX+xgQD+R1WqZbSZSTtE1/ylilkoFi8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkIVOV650DOqclHY8dCbK7OCEAXd7LbFA4eAKp8KZJ
 HXoB5c2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCFTlQAKCRArRkmdfjHURZ2iD/
 92hVpCiu0r88n6RohOPfuJYD4yr16TvX7ZAA3Vs6/nH427wt0ZbJjhWa8tPhBNWDQmb2pXcFKMpJE6
 ZajYoJwnnT1gG32M0RQ+PY29O4nVhoGIoMJjvXB55zb0ywt6ZqUSkMPwKRTNd0xG9OQ/Mhi9HKn+6Z
 OaATkPoVOovlf50O7rzZZRoY/v6phi2R1uCvVqh76M/7zTVUHBvXKXS6wy+3Wznlo8IymQj7a85J7H
 0rGNNLaRO5xWoICjtYcCXz+3dhIWGHHFtyNeTHkr65uHnG2u4sk4kpDbg38o1tZ01WVO/ht2it5A/H
 LM/MuM0SLaiewdI79eO3bU/dvRjROm6ceQ037QN3tM+YOULWL+cIzSHahiPGunvTEZQa7Y65NFnv9k
 ZvyDAa0yZ6ANuZuViPeJazPwM1F0lNnNjeuy6MUwhSQbh2sJ/LFbHl1IzGuMJTjNkbhKey/EaIL6Xa
 f2Bf+bxsGjA3dsJScYIydGuDub+synek7xflQWdimmtl+yJjU75cRit/Xu3Ya0E4NtZJy74sKDSoC9
 YnE6sD09o6fT/lfERGbHAXOVWSMzoHz/TL5Xfs8a4pAfZ+HNoBLV9oaqOhYUbxWNT6UsB/twxfwcyq
 MkyCm9UYc75RoCQoDhnr4P6MCVFBhI9Y3okd162qrDlakKLHeJUZLhOpPp4g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_012812_681678_B27DC4A9 
X-CRM114-Status: UNSURE (   8.66  )
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

Enable the I2C0 bus provides communication with:
- The integrated RT9466 Switching Battery Charger.
- The integrated MT6691 LP4X buck for VDDQ.
- The integrated MT6691 LP4X buck for VDD2.
- The pin header, to plug external I2C devices.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 4683704ea235..35cb142004a4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -87,6 +87,13 @@ optee_reserved: optee@43200000 {
 	};
 };
 
+&i2c0 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {
@@ -96,6 +103,15 @@ pins {
 		};
 	};
 
+	i2c0_pins: i2c0-pins {
+		pins {
+			bias-pull-up;
+			mediatek,pull-up-adv = <3>;
+			pinmux = <MT8365_PIN_57_SDA0__FUNC_SDA0_0>,
+				 <MT8365_PIN_58_SCL0__FUNC_SCL0_0>;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins {
 			pinmux = <MT8365_PIN_35_URXD0__FUNC_URXD0>,

-- 
2.25.1


