Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1134B109318E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ri/BYxZDRrhTzmVjBatU57hJrsLsmd1gL4sNMRhZY8E=; b=oCawXzx5naE/hBbxnaABt9Z39L
	IB3QJME4aoWFQBNKPU4yvthZGg0cGVgE9P8JUICjO3PggmgRwCTVzB3HEhTGUOCL2uQ6sG560e/3g
	7DL9On2u+Y5zRAxTbovdjmPelchZDuuMT0/KoLOUxvKQE1Kqj4t4NaeP3OLekE4f3qaZoykznmA8m
	sLD2ERSIevYfVZ5rBg/2COf+mYWK13Diu+4hmrSRikLGZiKOcNByKrKu0zjevpK9gltYeshAXqyq1
	JNEOR6ZZT6iQDJ5W8TRUeSbCWSMFG6u+GCAfcQxuLYCLSVXaQjJugvm9GiVYz5nvuTQ2KBNdymLPm
	P4CknpCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSn-0000000CNk1-1C9v;
	Fri, 20 Mar 2026 08:44:13 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSh-0000000CNdY-0aRE
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:08 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2b07069e2efso9503915ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 01:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996246; x=1774601046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ri/BYxZDRrhTzmVjBatU57hJrsLsmd1gL4sNMRhZY8E=;
        b=Uq86WpKUJ4lg/31sVwu9xr21MTtoqbWMggE1P9UiMigM6IFbTPqEc9gkDOhVbCGevb
         hUOoo6Z5jeNTOgt8SjcMSs8/HuUK2fsMq4sYqYuQVPRf0EAwGigxBT1CsgioZ6qrirtZ
         6XvZBeReCIgopMciIFCPG5GR3/bnDRGatd+og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996246; x=1774601046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ri/BYxZDRrhTzmVjBatU57hJrsLsmd1gL4sNMRhZY8E=;
        b=VWrjGIayDVVoFdO3kthfVkbBFJ8NAc1qCQ8IoL/VtcncWBNFj0ylqFkrGJsgWdgcLi
         8NSF+9FVgDeyIOxe5Ah5eelLwoHnJziU1gXcWK/bdMMC5jiLdlFgOgDYh5JpnWPc0jgj
         SnvXa/e9R9hPe7s0FwID6k4P3r0RTghMsx6T+ovgYJH9DJKIxO4gt+DL942CkOfbu3RU
         J32aeun+GRmaLCH5dMJfgtFMjZ4QaZjsbLd3b4kYrAV9BbtIEtoQ4ViX7SP27Ok9aKY/
         k8xcUdMqyWSvVovvPP9D+8TodCkt4+gR8kAAP4jZs/ED6xFHa1EqqIjjN0kVRCfyDoHh
         EPQg==
X-Forwarded-Encrypted: i=1; AJvYcCUVImHG1Y3w+lkb6Fty9G7Bt3QWWCYTnce5nTmomoo+vmUiB62QEfSVzF1dkrDrRcu5+VCZs6agMBws8jatfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YySomZ3qTA3DBnLCtLLJrUWN5/4HGsFhb+PED0QoXlJNpChBdmU
	Zl8oQe+8PcdG6jBWcV1YOj9+HxwIufCMk/B1VpzHN8ODjj7+2bYv/natNLGhCSEMpCgAyEwRflT
	uCPU=
X-Gm-Gg: ATEYQzyCv14VUrncyROw9EKD/g9cqA7AvYS8DQeL95l9Nag0XTk3k7XzKMPvttHjydq
	AReatKkRPJlUaNJPMs8zXlID9vQGgCqpz1t+vmaGfm+O2+MsKG5RyKrP6hPl6mGCqrJWlUpJhjp
	gzxyn3/2iyvr/eTay+1Q6TphyROkC4efPW53qJm5ca4wGCGVXLwqu6Nn5S2/KrXR1DLssFNkYv4
	LZz/3o530VED4hjlpNU4CGWSRXOlo91uSMDefU1t3ldKL+UyKGpcdSwCisWtyvUgoiPjmrZS8ri
	Aay1pPNg8X3rM68KNqhCupHrDSGxxCUMpC7YDhnuqtQeY4PUwTvYMftLBf+rR6/6Rgk65PZPk1s
	uIJJQGOTNulnuq9WJgabw+GQqDUmRYK4F/am9FkUHFZCHHGq/7LdzQtwEf+RVXLTqJ9T3xGYOKg
	QfIRweUkrIaCMWwpMgFJSFqRqfi7C0fM0op6v3dmtO92vWNqoaFzpyYnL7Pmp7O9d0jZQT1SYl8
	AP4Yeaa2rHo0LBPY3E=
X-Received: by 2002:a17:902:d4d2:b0:2b0:5923:515f with SMTP id d9443c01a7336-2b0827a905emr20186985ad.35.1773996246423;
        Fri, 20 Mar 2026 01:44:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:06 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/13] arm64: dts: mediatek: mt8192-asurada: Add MT6359 PMIC supplies
Date: Fri, 20 Mar 2026 16:43:35 +0800
Message-ID: <20260320084351.2461060-4-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014407_177260_BEA9EFD0 
X-CRM114-Status: UNSURE (   9.31  )
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

The MT6359 PMIC has a number of power inputs for its various buck and
LDO regulators. The binding recently gained property definitions for
them.

Add the supplies for the PMIC regulators to the common design dtsi file.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index d22c55c3abe0..d16634e9f342 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -550,6 +550,27 @@ &mmc1 {
 	no-mmc;
 };
 
+&mt6359regulators {
+	vsys-smps-supply = <&pp4200_g>;
+	vsys-vcore-supply = <&pp4200_g>;
+	vsys-vgpu11-supply = <&pp4200_g>;
+	vsys-vgpu12-supply = <&pp4200_g>;
+	vsys-vpa-supply = <&pp4200_g>;
+	vsys-vproc1-supply = <&pp4200_g>;
+	vsys-vproc2-supply = <&pp4200_g>;
+	vsys-vpu-supply = <&pp4200_g>;
+	vsys-vs1-supply = <&pp4200_g>;
+	vsys-vs2-supply = <&pp4200_g>;
+	vsys-vmodem-supply = <&pp4200_g>;
+	vsys-ldo1-supply = <&pp4200_g>;
+	vsys-ldo2-supply = <&pp4200_g>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
+	vio18-supply = <&mt6359_vio18_ldo_reg>;
+};
+
 /* for CORE */
 &mt6359_vgpu11_buck_reg {
 	regulator-always-on;
-- 
2.53.0.959.g497ff81fa9-goog


