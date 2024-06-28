Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640D5C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 11:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xfb8qh56GtYXoD9jZvOPRH85DxPa0JeSyiOdHUBDC38=; b=J8GxCn8sziHOeB
	w6M2NEAhAnFvw4d/XK28KiIVVZs2CrngTmvzaO1grd5xVaQBNxTAc7jXS9aiXFXTtvO5M94CjNkZd
	bLvRTcNPHy07B1zDFQMc0lHmceHlJ2PiafE+HGB/hu7RqttdrbN3GkYOkCzYE20b/yits6Mg64var
	coBUiNGQxiWBFHCGjGySgwChk+aURYnxxXuW1uFCBRfUUfrGlwDFmzz2Cl0qZ4WK3SigPcgrw8CAI
	7OEigVxX5pEnXhyJuL/VH2tO6cc7b565uxdSVqfiY3xYJVPOeqENLR2oMJ9s5EGfBvO/utKF0M4ZX
	BY0uNf+B6YhxyA9pV1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN9cV-0000000DW1z-1iw3;
	Fri, 28 Jun 2024 11:18:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN9cM-0000000DW0Y-2z8H;
	Fri, 28 Jun 2024 11:18:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42574064b16so547055e9.2;
        Fri, 28 Jun 2024 04:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719573493; x=1720178293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xfb8qh56GtYXoD9jZvOPRH85DxPa0JeSyiOdHUBDC38=;
        b=UEOFejCs/2RnbLY/+l1TChOJwTI0WD0/u/zMM1zBfbsZAMctt+v8ZdYKr2349eGvCQ
         oCFS4rr0X9dZSJP9kbCTv2fc7cAiVNv/S9JWrul/X2h/beQOedbXEXE2MzfvHJEy9ygD
         dt7HD6acWdexYvVWSSkv5NThP80dsa1ICeeEmPc7dRsO2x3ChEqtxeIbjs0sbiHr3yZr
         zbKTxLfGqVoL0qCbrlfNEyNnFBa82cvY9+iBCeV3aMKTl7ZI6sfWOEh9enaw5B319aqQ
         sRscJxtLbAdTuqVMt0spTwbovbocwKWvubMfMPnwJyuOqDlBTgRX7HXmfT5jcaaOgV6J
         0k9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719573493; x=1720178293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xfb8qh56GtYXoD9jZvOPRH85DxPa0JeSyiOdHUBDC38=;
        b=lxEGx3Mk/hdysgx+LyxJW5i3LUg8Y4XaRF11Z0iBk2cwkVr4ch1MXkp6KovTX5kPug
         ho+AU78ptJFcSNs7X/5G8wjQln5Wr6HZpOtPPQgpAJkjZ/Gw3g3B7B0OdD1GvEfZKcTU
         cRrSOuNI54DIFzyrabigP4WLle7Pb7J0D3MOjUFq788PXIC3QBaZMSSTq8x0LU7DbTz8
         clSqrPBDHoqRGYo3MnQZqKxoYBFBsf4NrgAPdKROvHGREn6S/rwmZ2TwJuYocLfpe0VG
         RWu4Z6QQSpArru3vvXabUb/QDf0emVuAx0mB7sR9BxInzqTh3SqXDIjSmOWhNfajhCed
         Os1g==
X-Forwarded-Encrypted: i=1; AJvYcCXm9EyHY7NdyAtVSA34UDLO+YC4UMbXTTtjmnNL00Te1HqmKAAz/eiZ9ttF99OJaxnPp4aVsTtjLAQOjlSMZ1Dj+t2mRf2PLGX06AJl/OUXdl0wTXhPu+LFVRNPkiwsznWLxjA7zRgH42gxdiUT7C+3y8mfWJ8uCFk=
X-Gm-Message-State: AOJu0YwnX0PCpC+UFJfjwiOdsdIOnsmZegK/AoCgU85vAcy0YHvoTvNu
	He3eJkb6xFUOZkZ9Ng1DnLgeNjkUka8kXNUI3IT666WBY6Gn27qDHFEl2Q==
X-Google-Smtp-Source: AGHT+IEgaXUd+94Izm1S8dyRGK9F05m7nglJMAYA5JVpVKSGCoyzmAAlgx33pqSiP1IHukiCb84uNQ==
X-Received: by 2002:a05:600c:2d84:b0:425:622e:32f4 with SMTP id 5b1f17b1804b1-425622e3408mr45368885e9.26.1719573492849;
        Fri, 28 Jun 2024 04:18:12 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3675a1055b9sm1979495f8f.95.2024.06.28.04.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 04:18:12 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] arm64: dts: mediatek: mt7622: readd syscon to pciesys node
Date: Fri, 28 Jun 2024 12:55:40 +0200
Message-ID: <20240628105542.5456-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_041814_758548_75A092DA 
X-CRM114-Status: GOOD (  13.30  )
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
Cc: Christian Marangi <ansuelsmth@gmail.com>, stable@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Sata node reference the pciesys with the property mediatek,phy-node
and that is used as a syscon to access the pciesys regs.

Readd the syscon compatible to pciesys node to restore correct
functionality of the SATA interface.

Fixes: 3ba5a6159434 ("arm64: dts: mediatek: mt7622: fix clock controllers")
Reported-by: Frank Wunderlich <frank-w@public-files.de>
Co-developed-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Cc: stable@vger.kernel.org
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 917fa39a74f8..bb0ec1edbe5b 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -790,7 +790,7 @@ u2port1: usb-phy@1a0c5000 {
 	};
 
 	pciesys: clock-controller@1a100800 {
-		compatible = "mediatek,mt7622-pciesys";
+		compatible = "mediatek,mt7622-pciesys", "syscon";
 		reg = <0 0x1a100800 0 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
-- 
2.45.1


