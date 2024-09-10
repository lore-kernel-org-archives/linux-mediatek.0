Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665B1ECE564
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cBBzknlK+lLnrfwKbcqJfsrQ3C2pRWbeBhTXiYHvZyE=; b=jzo3Nk0ZiQ9m+s1O7mpA1GNQXk
	7H3qNXU1XQXWo5DdvzTX5oNcqkTpRZnog1OgcAMDSesZspLlZn3oMbPhabJpsdUnZVs84uvZ37jQp
	zs0uHHgAfJnsiCALuDIbiKC9omOPfU5rZsCbMZQr8vB3+5/Iq7eBvmWOOi2aMM9nczVjcN2hWCQaX
	yeADphCZvAwGergic5JsMhhi64ARsLRUrHk3nmrKR7ANUhbcgqA8noC+Y0mAmdqbEUzlBPIPNuCKO
	iRMYUsNzsZA11hXP90UbWrCxfDXdvNi4WwIkmnkLW+z6KSB3DkHNxs5WUAjdItV5Ht1+OL7kZ8jJe
	FI1ksGpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwXR-00000004sPF-3hN9;
	Tue, 10 Sep 2024 08:47:53 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwXO-00000004sNY-3hcN
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Sep 2024 08:47:52 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-39e6a1e0079so1872175ab.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Sep 2024 01:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725958069; x=1726562869; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cBBzknlK+lLnrfwKbcqJfsrQ3C2pRWbeBhTXiYHvZyE=;
        b=HgX3Nxa3FyXuHALdow/uBm2GJJ5PvyM0CNLuWf2jabGqeYIS5p13G4hBNjyj7yGql+
         A0G9A9182jUhRghc0O5LS8NCG3P7XZCVRiF3Vphih83E6WWX1yRcjC9GWxz5kdeHZ7yI
         YgP5n0NG3nvH22PozO/iskfD4J0htJLExt9KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725958069; x=1726562869;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBBzknlK+lLnrfwKbcqJfsrQ3C2pRWbeBhTXiYHvZyE=;
        b=snAufnYvBOHjiYOBxSIOTLsBCgeeFMcTibMWwJRAxl2Da9JR8KINygEZmE4Zsm085v
         dFPM15iHvCGystCB+JxtQ7WXIwuApOlmzoIcnut9phPo3zELa5IAvkIBNf2QjXlaJ5fq
         QBMu/YNTq6wEpa5AIToWp6u108A/3obd3QsvM9oNUfGXmQ+ajnzgVSOnmkNef4hrH1f6
         Vh/NpmvvDV5E8uRpb+NI7drbw3UyEBQFwutn4/r3uwGUM/dS6+TWS9fVLDAgiEOKrQlv
         F7nJRL6pIClr++/3nKPZJINGuYe5BTM9qG9AoyLP/UKOisP+lt+JLL3xMCeIY2xu8r0l
         I3cA==
X-Forwarded-Encrypted: i=1; AJvYcCWQf7rbLDM2FK1X37eZepwuYHnlRp2GSW+ATekAyjRtySamThzu39KKdUWkZ+Ypp+KoQOppeAcVrRoJ5Kpv4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4IQiSdl8Ck3k/OZuiasYoFvA1TnVBWbFaE/erY6Cy2x5YZHUm
	gQaG8ghE6HRh9YnLee3M8f0xrFXzV6u8JySId7yhKAUWV3eSJY6Mw4jqiYQoTQ==
X-Google-Smtp-Source: AGHT+IFOVFWWzyNSgsRLILhNfgn8ya/XNChSnkapjK3BwdkIfk05bwfwygl28fTApbbAe6jPdsd0hQ==
X-Received: by 2002:a05:6e02:1d82:b0:3a0:4603:70df with SMTP id e9e14a558f8ab-3a04f07e7d9mr156667075ab.7.1725958068990;
        Tue, 10 Sep 2024 01:47:48 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (30.191.80.34.bc.googleusercontent.com. [34.80.191.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d8b0fbffa0sm3931470a12.1.2024.09.10.01.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 01:47:48 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 10 Sep 2024 08:47:44 +0000
Subject: [PATCH v2] arm64: dts: mt8183: set DMIC one-wire mode on Damu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-one-wire-v2-1-2bb40d5a3cf8@chromium.org>
X-B4-Tracking: v=1; b=H4sIAK8H4GYC/23MQQ7CIBCF4as0sxYDWLG68h6mCwrTMosWMyhqG
 u4udu3yf3n5VkjIhAkuzQqMmRLFpYbeNeCCXSYU5GuDlrqVZyVFXFC8iFFoL8eTUgfvugHq/c4
 40nujbn3tQOkR+bPJWf3WP0hWQgmvj21nrBms8VcXOM70nPeRJ+hLKV+4ODgSowAAAA==
X-Change-ID: 20240910-one-wire-2d0f7113dc8b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_014750_994311_68604C57 
X-CRM114-Status: GOOD (  10.57  )
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

Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v2:
- Add fixes tag 
- Link to v1: https://lore.kernel.org/r/20240910-one-wire-v1-1-d25486a6ba6d@chromium.org
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


