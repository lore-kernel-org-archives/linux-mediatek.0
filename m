Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0603C25B7E
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 06:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fz+XDDXq5ys5kE0CMYMOtO36VP/HBwJd0Xynw9uYwg4=; b=vLCPKA0//Fs1DLbKG0+Rm3pbbN
	es9vssndhc36XJRDTSnX8qzPrVZ5djT/PX1jbqlFm8bZwW5ZDzXyOvRaRzTIZDrJ6Fx2u9XWXZ31R
	dzXJjEHMwjB6hz5p/pE0lcD/BrNkP/K+W5XwrG7DqDLxz6Dud6w4Z5pgrKYczKQyDFIdyaK7U4Wcb
	/C0M8SgQb9FYQgh52LDzmE40X3CYC/GKZm2nypDli6OOavFamcVSUMX1wsCaVVwZBoScP/rtCKsQq
	IjpR7C5s7nJ7vPMpCJYYBloKDil0TpDy8g00wRhAjPlV84KYUvKxunL0+2uiw96PwuHVe/HmjBU/J
	nuexV+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sENif-00000001OXh-07X2;
	Tue, 04 Jun 2024 06:32:29 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sENia-00000001OWL-2GRL;
	Tue, 04 Jun 2024 06:32:25 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-57a1fe6392eso5839781a12.0;
        Mon, 03 Jun 2024 23:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717482742; x=1718087542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fz+XDDXq5ys5kE0CMYMOtO36VP/HBwJd0Xynw9uYwg4=;
        b=E39HfAMUsOACxDlSxTNsfeuSEXv7Og2rD+MXb2xgCY5V0gudar1IIN4ygEtHHwb9q5
         EpHegphykUJJ1tNTT8R+tvynyW1QoN5bdT/OgqcwWC1D1d0HENHw/jsEg9YHk1090Efa
         mfaKq8QQ+7YLMeBiTxnY4ch8ujUtOnKvmRshtrMI/xZBO1risqznMS7xaIAAWIJ5k6P/
         z8+nH0UBizpXwXV+ibX3Dr3F8hQUBNEJjTffb3TBcwFrpjoaaPz7oDRQoDsR5VhXEcIe
         FG4GqjFot6cFrlaFXU3DTzhIihmwiQwgpEg74Ux3DBCmpZjOPFr7zEt0Hbp4M/cHFIFq
         EiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717482742; x=1718087542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fz+XDDXq5ys5kE0CMYMOtO36VP/HBwJd0Xynw9uYwg4=;
        b=KH5hnfpw2QOGOz/JwTa5TeGaK13mWvnifoaUrvww1V07OWtRvmR+9hPJhuDYyolEiK
         cMqM6nQSl69jYujM+hMr2BZ2Hg/1PcxRzrJWBQ1X7fzVUl7M/I2X7dYeAdp6hZOuKiDV
         K7Q7FvJmYkuVl8Dbl1uHYPpri/rP9vAUAJQ0mGEypTZUcnTusbaP2Wb90WhxXPXzZHtY
         8gF/QT7ewcEwLI0MhTBIo1pezx1Acf2I4afGvMRsMyEGe90ZQ/S7X7wAtAv6IqEVOUud
         BDkeX1ZqXz+wz/gGLy3fzKxZ9FSJoWmwAyovOmXCJOUx0RI5GGTx0fWtEtf8WVv3AcsZ
         fo3w==
X-Forwarded-Encrypted: i=1; AJvYcCXlqaAVKZxSxzDWfGtS98tH8Med1r8PVCVzqU9QAHEHkwCQ+cngmM2tFcDoi8g1Kb8X1A1m87uUeN0rSHQy1EtCi16Kck7rb/gMvhzo3Oco2044GcRtJo3/vkjwMXPUXxLHLvSGpFzHpP3xd0c5qlPLrpD5W8IVxbY=
X-Gm-Message-State: AOJu0YyjrTljBx3b3tE8SeuBP6EXArFyZ5yxiDnC/XQDtRkWYQcQ3tut
	Bjq2It3BxHfIxqkNftsKBQpUu5G+4wWJoLrWoa0IdG6NFZSWb6lugHJY5A==
X-Google-Smtp-Source: AGHT+IENlfqn9D6YRaI1QrG289xSj3O43M8np8Iv/IszPozkc38G4q4lvRCl010LNwGBSt5VyyL8Tg==
X-Received: by 2002:a50:99d5:0:b0:57a:243c:205 with SMTP id 4fb4d7f45d1cf-57a36450152mr7702632a12.31.1717482741525;
        Mon, 03 Jun 2024 23:32:21 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31b991a6sm6679658a12.7.2024.06.03.23.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 23:32:20 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2] arm64: dts: mediatek: mt7981: add I2C controller
Date: Tue,  4 Jun 2024 08:31:59 +0200
Message-Id: <20240604063159.29216-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_233224_601689_3F4548CA 
X-CRM114-Status: UNSURE (   9.97  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7981 has one on-SoC I2C controller that differs from recent Mediatek
blocks by having a different SLAVE_ADDR register offset (thus a custom
binding compatible string).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Don't put board-specific clock-div & clock-frequency in the SoC dtsi
    Thanks Angelo!

 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 0fc7c6d33d72..64aeeb24efac 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -94,6 +94,21 @@ pwm@10048000 {
 			#pwm-cells = <2>;
 		};
 
+		i2c@11007000 {
+			compatible = "mediatek,mt7981-i2c";
+			reg = <0 0x11007000 0 0x1000>,
+			      <0 0x10217080 0 0x80>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_I2C0_CK>,
+				 <&infracfg CLK_INFRA_AP_DMA_CK>,
+				 <&infracfg CLK_INFRA_I2C_MCK_CK>,
+				 <&infracfg CLK_INFRA_I2C_PCK_CK>;
+			clock-names = "main", "dma", "arb", "pmic";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pio: pinctrl@11d00000 {
 			compatible = "mediatek,mt7981-pinctrl";
 			reg = <0 0x11d00000 0 0x1000>,
-- 
2.35.3


