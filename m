Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEECFC5907
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Feb 2026 07:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfwUdpA5rCWf9a4/nMgxhcP8TttgZio63fOINzploZA=; b=A69lSvv3l9YOtXdKTUYqcX5lrc
	Aa9oPjJRKkRhKpRt52kEHtGjB96nLy9kcm41RygKRLsaGWKeGbyfig1W6a/8fgD4LF2J/WdXZ5hB/
	vlfCfY+K0j5+Kyfuht05sNC9phsj6vrHaGUWvujO/bPp1oJDzEaS0+VuX+6AqqGii4X24UYOFQqcw
	H2n/hrKrPXWmjM4Bvj2PQGUVQSUOEI/Xq1D94w22zLkBmsugzM7Kl90LIsCmvHYCISXXdIuPmftnk
	O4l4bz243drr0PQR9dOoFALcrNIeQ5kvnPbBWuas+59sNI/+Bmt3ZnUQBDFh9/Z7hEsw5B69MGrab
	YmDdZ66w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW5a-00000005bC5-1QWp;
	Thu, 26 Feb 2026 07:47:14 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW5Y-00000005bAp-2h3H
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Feb 2026 07:47:13 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2adae92249eso6030975ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 23:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772092032; x=1772696832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfwUdpA5rCWf9a4/nMgxhcP8TttgZio63fOINzploZA=;
        b=Np5Cw0i/r1NutOCdW2p9mtEb7Debk41dEnMx4PmqULb7T3cVVDBEtqj+23izieHKoR
         tbkawqvt2g5u8JU47gso9AEv7HOsW6DQwCwAYAcuABiLAEymwD5mZ7W0hsFy06YPBsj+
         NdSbkVYcH5pmpuAay/g3vLo1YdFfYrZu/V4es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772092032; x=1772696832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cfwUdpA5rCWf9a4/nMgxhcP8TttgZio63fOINzploZA=;
        b=Bnv0AnD+iQ25BmdduhbOWdxpHkD30dEd07R1Y5kDWtoTjfmV0HxdNS9+IMxyJdYdIf
         dLwCp3rkdtwW69+5ENFRicLgfwTVRLLPQE/uQDpoZj/bzn41aZSOp0bWY/Pd7IDj2axp
         U5y2H+bpF93vj2paC4PAvS8TWVxlvOFEjVqM5QlQ3JhthPI+hGJl1vpkqXUlCXMJkNqG
         N4KUUehSsKJpf00UTbBI3z905Ah4G6DMOrM5HBKGQJg5bsP3XBmU8bGAF4gndmqTwM7i
         l0TInOE+apzertNkbX7tKjSkEnl5ojwr1D2aRNiSxTWLgPGr3zPhR4mdijJEYNHM9COA
         jPsA==
X-Forwarded-Encrypted: i=1; AJvYcCUP/BuC0NV8jC+CJ9ehVBtXjWSaPcdD2H5nTJA4tiYkzDtgDFyQQ0G/PpnYcW9+ss4CkwUkUU5+JsAzsRZ5qg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfKyTwfPe5VPvyvNNKdjnYk/yfiohTcAwtN16/zoJVKEeGvV/H
	rFEJJ6cDG1lYbsrN+BO0IFbf1xbKq9nCH8lUCXi4mmHS46TV00WnVtZdFHGFvnArTQ==
X-Gm-Gg: ATEYQzzwv6gUawxh5gZm/dhpTZz1KT1onvFxlNGoHLGs6X3euhE21ZoUljsjX3E5EWp
	tOCW/3EtfWjkECuRerX+lMk6oIpcgIkS+ElhE60liojsFP53s84yNVLBlIoGOq5HNHR85Jy4RG0
	NJ6yK2L59mLPhw4z4kNwDFYaxsl8qM5zOkW92ObDqlHBNAH1aZ/0CX43KD0as4ngLu2/KxCBWxn
	0ZLK7ji/Q/vEqkYf14viYmySi7Fiw3uNqpzJ56Atr51JKxXnAdCS4s0CdZh4MPQMzT3bBUgzYll
	tZFkCXSeR6Au4mnhX8hXCcemVs+7qdV/2iiwArNm1nsl51qv84Wrle7f5r841EZvs6eMSCxIoVA
	TWPopzRw1ie7XyOesZYXuOjRWrZJYI9I7cQNZTeT0Oa4MlOlBqqTBLS2fEtnK88utZiNR3rYKfD
	Gu6QcRlljMCdVLN1CB/SmkVltGe4IqCSKlRXyZjpf64NeBFsFSAEzLMsiM4DIXXCPza5orHsf9f
	PC/tEatEJ50RT460pU=
X-Received: by 2002:a17:903:41cf:b0:2ad:ae4f:345a with SMTP id d9443c01a7336-2adae4f36bcmr89126745ad.36.1772092031982;
        Wed, 25 Feb 2026 23:47:11 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bf01:7f64:477a:2f97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b22f3sm15238245ad.12.2026.02.25.23.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:47:11 -0800 (PST)
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
Subject: [PATCH v2 7/7] arm64: dts: mediatek: mt8195-cherry-dojo: Describe M.2 M-key NVMe slot
Date: Thu, 26 Feb 2026 15:45:23 +0800
Message-ID: <20260226074524.3808081-8-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260226074524.3808081-1-wenst@chromium.org>
References: <20260226074524.3808081-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_234712_682478_10A53E0C 
X-CRM114-Status: GOOD (  10.69  )
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
2.53.0.414.gf7e9f6c205-goog


