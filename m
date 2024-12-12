Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571CEE7717F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2024 06:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyTPmfk5nlWT6oblaTqVg0NzyCQ779C0HWVuTXhDcag=; b=YWVd2tatxWypcjUkYHsOtyLIib
	0Ej4OQ0+PVSS4hM+PHBD/wLiai83c6/+pZjz2jh9WDTgobRnDJCDqIJcJHdmvdRSN7FH6YFV2zRq0
	0v30+2iFQ5CkVYefMwNJv84SBQGe9NtO+Avtr2c2H2/c1dCLXtT9oonKPFOanWVHd+FUyjeageuna
	WajcAesP7ayUArJZ8yd9avADgKBKZmttYc7uShE7WqlXyBbK3Posk1fYcMFpOZ/MuJAdK9uKE18u7
	2i34WWVTOnKsOFWFYZbxpQYE6pefKb+8YOO0SWUcD3ZTa68zlSn6uiLD8PhjbU7ZRmtxqJE8tdgC4
	/GQ9nmAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLcdN-0000000H2N8-2fws;
	Thu, 12 Dec 2024 06:25:13 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLcZO-0000000H1Zc-2qf6
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Dec 2024 06:21:07 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-215e2f17dfcso471755ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Dec 2024 22:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1733984466; x=1734589266; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OyTPmfk5nlWT6oblaTqVg0NzyCQ779C0HWVuTXhDcag=;
        b=idngwNE4zv1SUxeoRnim0HiGE2vsTJtL2AUgm8+/MfxgjYxtqDqgZZvtEjDRSxC+dV
         2kTBtXBJi1YrwqcWGrD2adLDRo8GW3Qvsp/zsY9jeO5Flhd8eC0jGJLAFp9Wn4jscWFF
         VrcMhipGh7i1CJcSKTHgNgS7C297TPWd0JAhWIPs/5K+Xutqe1O8HPTXIjWpiUXAL5TK
         rFp/84qm1mUg1tJUKsQUsTgme7FnquVtk0WEeIbEHR8379DP2CzjQEUo5xBEEEcuoHD9
         bJwQmTfFHJGk0hUZkIgncgSEIYBz90BhFSFQtVcHQvGImrm3uqNZhMD5qQhvdR1XNuHA
         q8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733984466; x=1734589266;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OyTPmfk5nlWT6oblaTqVg0NzyCQ779C0HWVuTXhDcag=;
        b=F0CfCl2Exy9SFV/93AGqUSrB+AhMEFE3t5a/rFB2CkmznGm02xZdXjgwtrKh/roiir
         h/3UmAt6bHLPtcCsUaV9fiCGKphu7kcYEa6XCJ1tjzwew1NY5dqSVaQJcca1Zr5Aifgp
         e4itcH0O97swo0jr5o7y/OtOtUwTyr8V797ndT7qALsAafRPj+Hkk0WvJpVGU85yg4oF
         XCDEzOBgQfOsqBDpyrar3NoIy2UPdAPUJ3P64sVHT6t4MsDtao0apiOBIExTvYL4KyM1
         csJyZRJuVLWfBfeoJQgu+3XJRTWbcJU8FQByr51Aivn+VHNUT4oErNCFJRVOutccIdJu
         Me8w==
X-Forwarded-Encrypted: i=1; AJvYcCV4qwxE7flAtG03P6Ri44ULQhNG11LRjr/18cVuubeyoNGL7x6R2heQiMWD5s5sXDhYXRlzymHmk4TrPnSyGw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHpTGqO2WzoanV8uXEZN2i9y4myO/oLiJwR2zMaI5+LZbSXL5E
	1AH+p9U8naoMDZVuT/pHSxZLFnH7I2NwUcGH2Nsk6F1qwVvCAM9xJ5P7Ppk7Ee4=
X-Gm-Gg: ASbGncvHaCyEwP9LQQkurONSVffeuAr+OvPlThXHOt6uLH0Esdx2B+JJsM7pLnTW6q1
	EjsbCJkMMy7panI9UuPpD46nhDbCYEj57x9Hqj0YNnJLzaJM0vcZ0P7XJG8yTFnMaa6pQWwtCoF
	gDF7mzSSAa2IEudDqY+BHFRNP6RNcVpKePimSReOeDaOzE2Qqb9PlIj2xQQrr8UMRha23yDAbja
	QgRG3fD6qkc6NN+zZ7v4SuD1vE/SI2q+daJ4v2qCYwUIwF76o4X1nhtaichaXSTwK60OXky6A/C
	l6T/EuV2xOovpHr2cXtv
X-Google-Smtp-Source: AGHT+IFTcByLcObOG6og87W+8MmWO127PMV4RjfGUn4gbh7uXS5H+igPgK+lk69avI2I3fCZBkEIxg==
X-Received: by 2002:a17:903:186:b0:215:2bfb:3cd7 with SMTP id d9443c01a7336-21778592996mr34393885ad.10.1733984465748;
        Wed, 11 Dec 2024 22:21:05 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2162c278668sm83579165ad.81.2024.12.11.22.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 22:21:05 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	dianders@google.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v5 3/4] arm64: dts: mediatek: Add extcon node for DP bridge
Date: Thu, 12 Dec 2024 14:20:45 +0800
Message-Id: <20241212062046.22509-4-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241212062046.22509-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241212062046.22509-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_222106_710379_0E516698 
X-CRM114-Status: UNSURE (   8.18  )
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

Add extcon node for DP bridge to make the display work properly.

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index cfcc7909dfe6..e324e3fd347e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -424,6 +424,7 @@
 		ovdd-supply = <&mt6366_vsim2_reg>;
 		pwr18-supply = <&pp1800_dpbrdg_dx>;
 		reset-gpios = <&pio 177 GPIO_ACTIVE_LOW>;
+		extcon = <&usbc_extcon>;
 
 		ports {
 			#address-cells = <1>;
@@ -1656,6 +1657,11 @@
 				try-power-role = "source";
 			};
 		};
+
+		usbc_extcon: extcon0 {
+			compatible = "google,extcon-usbc-cros-ec";
+			google,usb-port-id = <0>;
+		};
 	};
 };
 
-- 
2.17.1


