Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82D6ECE564
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 06:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+/aJw7OF4dGO4YwB0NFwJSdiUCvGjw20wyqsbh56zsk=; b=os+5sd50ULfYGKD+OC955jhM1J
	vy4HyifFSBjE9Q98NdvMJC2vav1kPyK90yNxliGtZPA9pRQDdqSRKZt9wtA5qNHW9XlE7hhbWhkfv
	GnlOV/Vu7u8dhhrhUK1UkpfErm9t7b+4UG/ooqyNzYOQd6K0KdO3bT2p89FefoLvkFpe+PibZBSUR
	ptcTyAMGNqMSGihDV+FAc1+g13piK3BhXoruhAAmFJUmghwY7ojl9p9LzZuWu9/cGGYRI15JmfYi5
	Z9vk1B9pH5UPlSYSrfa09CceB9PRLoARghL81Xo4E07I8K7Z4YHBkgVmVZ4m5PMK+e4VeQtk7hhkZ
	QyzFQ/QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snuSZ-00000004Sdv-0sKF;
	Tue, 10 Sep 2024 06:34:43 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snuRX-00000004SQe-0LDp
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Sep 2024 06:33:40 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-6c5bcb8e8edso4015429a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 23:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725950018; x=1726554818; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+/aJw7OF4dGO4YwB0NFwJSdiUCvGjw20wyqsbh56zsk=;
        b=FRI7E/2LG67AnQhQ7bREeBkBh1cYp7SgrT1wZaxzI227myw7I0tdMQIEULyHch3dkY
         lxalM8q0jSak2hWgTRHPv8hKBXtnTTvVNLPuE1vwVW+H5dxxnoHgaleCtL9Kr4qKyDP4
         9YA7r0T6naP9u1ezAx/paF5j1vsvKsaHbJHWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725950018; x=1726554818;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/aJw7OF4dGO4YwB0NFwJSdiUCvGjw20wyqsbh56zsk=;
        b=i89HYRV+noTgSXKqGSfuEtPG9pSeOKO7nBl0AJ7gR4oLl5Ny+iZBC2jx04m1ZU8K+g
         RrwcckjJC0aNTN18lmataItiqXcxRv64NJ7oziepl0LmKl37ZQLCPqhtK958oeC49vwE
         EoT3GDRxSKdt26g2OlZwdMeDpbZNlQwlcMuiO2dmpfzotYna4SLM4B/7Dx2rCRH8Dz1A
         RHbrbs0wrcl/RDHT/ZyJPYm9nyetzJPM878oOF7cauGZKSjxOQ2F4/M+/CyUdXUTwjhB
         pS4ijyTMOr+OeZgxSy10TSEAdSbPArbxksaAJyInWDRuVu6aT2vjggeODo2hnVOg2IHp
         WgfA==
X-Forwarded-Encrypted: i=1; AJvYcCWWT8dznkp/MqlLaQrmWsnAdC6VQv7sTqjxObsbHaREPBRTsEdzPh98+RLzxXCoeSiTvrnfv3iW4Qxdh4fP8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsLnjxFStO1JCqA8GrLlaZYCvQ7d7LJPn6aBsD2eChIsPNjlD+
	Dx+mmTtKvJktygIRBJtYw7Sj+Byqs6AfFKSs/TYIybI8MFgkVxP2doiBi6ZyLQ==
X-Google-Smtp-Source: AGHT+IHZAOmJi6NMS7af0hTyK5lmGDFP2TH09MXuOWEpUh2DhKcLpAp2eDRZDwrIT3I2ERS0dm+E9g==
X-Received: by 2002:a05:6a20:2d0a:b0:1cf:451f:4624 with SMTP id adf61e73a8af0-1cf451f4876mr6216404637.21.1725950018062;
        Mon, 09 Sep 2024 23:33:38 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (30.191.80.34.bc.googleusercontent.com. [34.80.191.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090c9b08sm696684b3a.207.2024.09.09.23.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 23:33:37 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 10 Sep 2024 06:33:33 +0000
Subject: [PATCH] arm64: dts: mt8183: set DMIC one-wire mode on Damu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-one-wire-v1-1-d25486a6ba6d@chromium.org>
X-B4-Tracking: v=1; b=H4sIADzo32YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDS0MD3fy8VN3yzKJUXaMUgzRzQ0PjlGSLJCWg8oKi1LTMCrBR0bG1tQD
 hj87jWgAAAA==
X-Change-ID: 20240910-one-wire-2d0f7113dc8b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_233339_193268_4D4A6754 
X-CRM114-Status: UNSURE (   9.92  )
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

From: Hsin-Yi Wang <hsinyi@chromium.org>

Sets DMIC one-wire mode on Damu.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
index 0b45aee2e29953b6117b462034a00dff2596b9ff..06a689feff52945d141d196d439cba034f25fdf6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -26,6 +26,10 @@ &touchscreen {
 	hid-descr-addr = <0x0001>;
 };
 
+&mt6358codec {
+	mediatek,dmic-mode = <1>; /* one-wire */
+};
+
 &qca_wifi {
 	qcom,ath10k-calibration-variant = "GO_DAMU";
 };

---
base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
change-id: 20240910-one-wire-2d0f7113dc8b

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


