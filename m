Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0ECCAC5B3
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Sep 2025 16:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhfgeWKTTFehUL5ME9QvRLQsevmzrNA8iD7btwmAz3g=; b=3tRytgxN4GESP16nc7ld/McK5c
	BEMaPgj1vWxnLDLN/rftLJrnaG1BYsUS3gEFMgwP5aJX1klUfC0wVgLKwIWUj9dGTZfbT/d7jBPZ5
	u/BLUz61/Ddnynv/9exbT9TO6rZL6NrTWiNn6Ij8cKhXfVHdokjDnOKkxMVqCIgcNqau5yu+3liE3
	OwLE6uldsFvW4sQbn/p5UYheL+VkCDcL+3twm5b1pmbuuhb1V3n39K7ss8OKZpYMbIdZYd7d0Q1TS
	IrpXDPSlgvWUKwpLZ1FVpGwYUgrHdnJxldB2HzbkeUNbXa83F4b9yR6TZxyWhjz7ex9ty6nnISvdL
	zoHkkObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1olB-0000000B53J-2fqC;
	Thu, 25 Sep 2025 16:23:57 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ol2-0000000B4sA-2yIi
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Sep 2025 16:23:50 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso1291095f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Sep 2025 09:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758817427; x=1759422227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bhfgeWKTTFehUL5ME9QvRLQsevmzrNA8iD7btwmAz3g=;
        b=GfJJV4AM9i15EMus4foLVJT9wYxvdiXwtJNE2AgEgnxnujb3HaXlFBaTqAdQzSVGof
         BigzZXG1VXQJ1qHreOXtc1Lj7Omjo7NJ3+tmXOy7j46mgwaydnd2+8hb8Ej5qwZAAO5n
         V2+lAfGChVlHHcri2wnzl2UkemrIrmucx2fCzCdTuPQVEbmOe4IT3VDwEtLGP3yZ+PaZ
         jZM9VZOTEnAYvC8iPLpZvHzQWPSB18gXFUbDwERWo5B5A+54C+ciL19SI5xpnVbog81D
         7lVrar/+B5K7PHySvpENF5gv44PRFTrk0FOQjqjd5M7GPZpKZdoRhUHgf3ZlAGeQ1+TC
         hw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758817427; x=1759422227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhfgeWKTTFehUL5ME9QvRLQsevmzrNA8iD7btwmAz3g=;
        b=bNWIuGAXYJDzm66skNwdKHU7G58JAtCiq/iLYOOGWDOX4GDtIerTgTUn2+VcBg9ykd
         HeXSw8jiJrubCnz7O9xYRwQ9MONPfezdA7GgkBnyrj2A8fSxTS8EJFBidRZOS2UPWFgO
         emXzurbo8gG4cucvCTc/zA33XkLouy8S5MbRbK1hveE5hlRI0KcnNQ2AbOqkny8chlzs
         UIB9QkuL27vqsT2bs3hkmkkw+cjuHVLdjb76QmxPMQt3E2LMQ4fdP3Oi5KQgn5RWGyem
         OLEbyQ8zIxbilVf6b5KhloVt2LKaGyD7T+fKIokxk58wy7spLDyURbB/FFYUDyXOopPA
         /jWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqiRau/TXU5Di84Zh67EmJT8hdPGmOQxjWVxi35jSAl3XnC9VwyPPM9leDaxNZXEq8d9X5Wi8eQV5Otq8Khw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1UNFegRXaz9B5yJHwHB4OpBiLQvoEywo4s8etqX4d5JhvxaJD
	c6JnwHV7mXSZLkYm5rA4ZO8CqXjrCszzP88HMj/NTlJbAXYjfR58WMM9
X-Gm-Gg: ASbGncvwkCnZFYidbzAOiRVBP0b9aiJQLEJGP0dsH8tFP/GB0Czjr2YowpWHM3ZjFF+
	4LBEguR5UN/E+RjL6D3LfimnWOCcj0k0t5mCAA356LEcH0lJlUja4S0dE1UG/gjTRLaRT3sArLV
	x3Now7LB/CgobNWXkYPSvUKPAOZtA/L8urhso/ZERv0va56XkCLAnKAtSr26ivfoURY726Tb3m2
	UvZJIk1D5Gh3hTL74CY0eGdLqR1gtGkaEcalVBp/UmQmM2ZB1L2ce1CNzJ5da9go1fx4re5hnF8
	DhD8gTgdD9dqhtrpl/0Q3Iz7nN3a9MMfKpjVTjR29GgQt0n75Ir5rg2ZftfVCq75t0dAwg/jbFd
	E6TXFd+kmv2ToMixolKR/oJS32dcl/zi2x6MFP3k6w93bfnvwhIL1i+2ueF7LFOTwqQwvCFE=
X-Google-Smtp-Source: AGHT+IE30qlsw+LGQbGsOMA9cwguph9rKHkg04I434dGAXsnLJ3Ub8ZjYMz0XZC+8/ecQZtZP2gmGQ==
X-Received: by 2002:adf:f10e:0:b0:413:46a6:6a51 with SMTP id ffacd0b85a97d-41346a66a66mr555231f8f.38.1758817426788;
        Thu, 25 Sep 2025 09:23:46 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fb985e080sm3534819f8f.24.2025.09.25.09.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:23:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Subject: [PATCH v3 1/4] ARM: dts: mediatek: drop wrong syscon hifsys compatible for MT2701/7623
Date: Thu, 25 Sep 2025 18:23:15 +0200
Message-ID: <20250925162332.9794-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925162332.9794-1-ansuelsmth@gmail.com>
References: <20250925162332.9794-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_092348_760933_2FCE5747 
X-CRM114-Status: GOOD (  14.45  )
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

The syscon compatible for the hifsys node for Mediatek MT2701/MT7623 SoC
was wrongly added following the pattern of other clock node but it's
actually not needed as the register are not used by other device on the
SoC.

On top of this it does against the schema for hifsys amnd cause
dtbs_check warning.

Drop the "syscon" compatible to mute the warning and reflect the
compatible property described in the mediatek,mt2701-hifsys.yaml schema.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt2701.dtsi | 2 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt2701.dtsi b/arch/arm/boot/dts/mediatek/mt2701.dtsi
index ce6a4015fed5..128b87229f3d 100644
--- a/arch/arm/boot/dts/mediatek/mt2701.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt2701.dtsi
@@ -597,7 +597,7 @@ larb1: larb@16010000 {
 	};
 
 	hifsys: syscon@1a000000 {
-		compatible = "mediatek,mt2701-hifsys", "syscon";
+		compatible = "mediatek,mt2701-hifsys";
 		reg = <0 0x1a000000 0 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index fd7a89cc337d..4b1685b93989 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -744,8 +744,7 @@ vdecsys: syscon@16000000 {
 
 	hifsys: syscon@1a000000 {
 		compatible = "mediatek,mt7623-hifsys",
-			     "mediatek,mt2701-hifsys",
-			     "syscon";
+			     "mediatek,mt2701-hifsys";
 		reg = <0 0x1a000000 0 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
-- 
2.51.0


