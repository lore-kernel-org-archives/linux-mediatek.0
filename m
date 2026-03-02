Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701C4D58E5D
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2026 05:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l55rscaGmzYhvn0+eMNyy4NMWKpZ4qt99Qpf3fX6h+w=; b=CGKw7dTP12msdOxU/SwzbbL8rK
	1WiDtjK5MRBXltjMN+pYRCo8Y8IeoCD8vOQPLk41loO7+VnOEIPSWUso+RbjlTum9d3jVtHzaWfSI
	CAeHcyUxyP9SMED9yJq8tIaA4u2j9jB1OTyltGQck3amFxKDxnyVky5k/jW+SbZZRSkhX5FIdEU0z
	yHEiDxODRvBfANiSeqdnu7ExC5IdmUvC+VErAbB7kUYL4OCwCBK52MrT1gnClrsRODdy9iE8nEcGn
	HaBzlXfgToDAc5NAL5xunRf15C4VXv+U+BPPASDfpC4+XiWtQ4YPAX9+J8oUfInlx8T5y8yX+XloB
	ipt8WoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwvsa-0000000CIoA-2Jv4;
	Mon, 02 Mar 2026 05:31:40 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwvsY-0000000CImm-0y8B
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Mar 2026 05:31:39 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ad617d5b80so25594705ad.1
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Mar 2026 21:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772429497; x=1773034297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l55rscaGmzYhvn0+eMNyy4NMWKpZ4qt99Qpf3fX6h+w=;
        b=ocs1GtIg9kfL/aZhuee7XcYrYt64ozDE+xC4vOcUtSCVIzBleQYr2Q3XZo4Rh85JL9
         RjTEO5SXbzRKYS4q2ecpXOTMuRzAONxvWap0SezYGg++5q9f4qjqlSqYyB/G4dtG/v6O
         WBDsLBOIiZB619WF4QDqiOdDOc2UL4E0sRuuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772429497; x=1773034297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l55rscaGmzYhvn0+eMNyy4NMWKpZ4qt99Qpf3fX6h+w=;
        b=wTkSax2l4lBzFJ1i7ArP7PSHcUld7C7ZKu1qEstbsyP2Xlvw5+VX9OknAytftTVi+t
         NpvL3CoYfFWV1vfalxcpTZ4eLKGLzjdlotq/BZUaM6NNGLdBtkggtukGy3tBpCLCpody
         ABM2S/xmeU5lCAWrxu8hkavx2305YhfXnrLK4MLJJ5Me+FY0VMLFcpHZvzNWeODejQiK
         JqA34BLa+6MO8qiTMfJ/2qVHyQOYZQUb6MhI02WyssH/FVjXgukLY0ecEWQ+A/ofpdpH
         gDlIuwWGWA4OoZUitmVsgX6mmuabbBQlwC5GM8x+nfWLt1OYoOqDH6d5AEnOA3EU9kpE
         HQYw==
X-Forwarded-Encrypted: i=1; AJvYcCVdLBFZZ2gPCoSaulC6oIdl4iKyP82QQK6VLPAyQJUGgHXs68wdGhBnSkk7UlyIQnCobm9LUcRUYJS38RfbPg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd59HqFcLMkjAkks5StQePBgcc0NLNg/HG1yOsgToWLf+GFkK5
	j9FJjF7muKYndhNK/S6isONXoFotmbCfSlrt57v3euH0CSgvqOiQPZocvFORWOycCQ==
X-Gm-Gg: ATEYQzzLE0qGJ2ptsV/peFUdAwXPZ3j6GjOXh9N4xXxBMVfTWSikavBh8veRXpXIUC0
	LuGarqMZIW/DAXXK6c0pYJ0Eyl7+wtC5J/e6efiwtAjdW7KbnBpqXjyARzFepm0mJbBZ2h03OQj
	obtf9AZpL9M2GU/s84RvgPAswVJW4rtI+QRDZ2wLJiFEGr244Frr20SJU0B+s9C7eTYpR9nmkJX
	96pdvfcpAcDlwVoop+0GBnWxYhLQVpv+ycpVF+tnwZ8pmSbk/ltcDfd2VXZBmdKuf5/TsKxinZS
	fPxte6o7+Qo+nJ8KY0+WZPXvUdBij/EcPF3Lj9UBfZypL7qOK7qhA2HTpSlPydW/vqw1gTdvuSD
	XjISQr334VMhLtBcv4zXy2EgTFY+WySMxGjAJHkRduxQQ3ZHwwWjbABpBo9MvlGZf/5IJGF55Dh
	4PfNxuI+vTo2EKPQZTnCYVBQmzgVqWPdxNdsDHLjSas8JEjyAJgi7P1TOnTu2Z+MYOl5ilHMlAo
	yserjmyfBj54W3wjhc=
X-Received: by 2002:a17:903:46cc:b0:2ae:5426:da49 with SMTP id d9443c01a7336-2ae5426dcf7mr12070805ad.34.1772429497286;
        Sun, 01 Mar 2026 21:31:37 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b9b7:93f7:8c3c:59d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5229cda1sm15196435ad.23.2026.03.01.21.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 21:31:36 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] arm64: dts: mediatek: mt8195-cherry-dojo: Describe M.2 M-key NVMe slot
Date: Mon,  2 Mar 2026 13:31:07 +0800
Message-ID: <20260302053109.1117091-8-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260302053109.1117091-1-wenst@chromium.org>
References: <20260302053109.1117091-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_213138_267939_1E29B9B7 
X-CRM114-Status: GOOD (  10.70  )
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

The Dojo device has a M.2 M-key slot for an included NVMe on some
models.

Add a proper device tree description based on the new M.2 M-key binding.
Power for the slot is controlled by the embedded controller. As far as
the main SoC is concerned, it is always on.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../dts/mediatek/mt8195-cherry-dojo-r1.dts    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts
index 49664de99b88..57cc329f49c4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts
@@ -11,6 +11,28 @@ / {
 	compatible = "google,dojo-sku7", "google,dojo-sku5",
 		     "google,dojo-sku3", "google,dojo-sku1",
 		     "google,dojo", "mediatek,mt8195";
+
+	nvme-connector {
+		compatible = "pcie-m2-m-connector";
+		/* power is controlled by EC */
+		vpcie3v3-supply = <&pp3300_z2>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				nvme_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie0_ep>;
+				};
+			};
+		};
+	};
 };
 
 &audio_codec {
@@ -72,6 +94,22 @@ &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_pins_default>;
 	status = "okay";
+
+	pcie@0 {
+		compatible = "pciclass,0604";
+		reg = <0 0 0 0 0>;
+		device_type = "pci";
+		num-lanes = <2>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		port {
+			pcie0_ep: endpoint {
+				remote-endpoint = <&nvme_ep>;
+			};
+		};
+	};
 };
 
 &pciephy {
-- 
2.53.0.473.g4a7958ca14-goog


