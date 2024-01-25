Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84E0C48285
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 09:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwHQQ3y8mRIC5l7GJR/3O2cr3VUs7tVDE1ZJ0OPgKKc=; b=Z+bWcb4OsaHybUX72JAI8K8/ku
	IAvfjG/AKxpuIqHNYOyXGHEsZkygHTbuYH54h/g6zsUj69y+NjKeWYPj/5BWsUcUqnArsZUyms3kO
	7qiH+L9WoHUunLNGUfHlHH7Xhze/M34wxn/sK9buOVTLlSc917UGrJHeCcsZGbPBn0X0mYtQC0BiK
	ytuXZHbuOguv+OlYK4Y6FA4EsQcNzlGWTDBoj8H5Vcqb28OTsnYo1Keza81P3G254lECMK5IvTleJ
	HGIp/9ohrOfAruQcn1k0KDJBNfcOGwU6tPjh16DJZ79bn0H7ZL49ruYdIGHth8bfv4f7Rv67TKsYk
	Qj+5KZ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSwQ4-007fOm-1X;
	Thu, 25 Jan 2024 09:53:12 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSwPs-007fKH-2c
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jan 2024 09:53:02 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3bda5be862eso4089294b6e.0
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jan 2024 01:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706176379; x=1706781179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwHQQ3y8mRIC5l7GJR/3O2cr3VUs7tVDE1ZJ0OPgKKc=;
        b=hT5CpAu6boZ3Xzt6JA1c0UTbVU4z93Vu8UoVkYz+4tpEKndnu2M+fexakOCTxTxZqu
         ozeUkk2DuK9T7cV/4J1iYj/+66nQMXVhxXCJlk/fftOQJKFXap9LsU2MWlPk57TAai85
         HCRiDxx2VBE+ZHBzUrl291abXLSNLLTjAn4Qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706176379; x=1706781179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwHQQ3y8mRIC5l7GJR/3O2cr3VUs7tVDE1ZJ0OPgKKc=;
        b=GLHi7alzb6BLrUVBpQj8i9CXiuP968ggM0SGeQ+2YLND1GajUMJgBWhHDawGseJx0f
         2Mr6ikS/1esnFPUlZzwWtUVJh9hkb/tRx5eACFdQNCbmPJP+VamPJN9aNFt/jYElK6rS
         jmUI8D4dZ270sS/3GQGdAR/roH3Rf7xcOjzzqh/lYj/PxeYTxHFCFqdjpjx4eldnQ+Lg
         3zw7r9rowdAneaTwc3z1NZsq1k18ny9YIxtWEI+nZiMEsmo3IaA50d8CIlvG5YyPdlCt
         3vsJ2xhg2cpifY2OeasYFHdXTFgSolNlB3t6Z0acnlpTaSGa2zDQVCzXQafcOg5nbH3a
         AvTw==
X-Gm-Message-State: AOJu0YwRlCahFJE8nUGTbecSBVTmJEyxcSwPeh4BGOWpMwhLIFzFkQc3
	riHJViK97vAYxK/4t4WU6I5G1mEU4FUwJHPwMvd5hMd6MTKoPr6cE4JTle02AA==
X-Google-Smtp-Source: AGHT+IF9ouqrxuN/kDRByMxn/PlL63gtfiQf6zEmcMi2K5+Vu4orKTJyiaEsZI9CeowBst0wk6XIzQ==
X-Received: by 2002:a05:6808:1911:b0:3bd:c038:b71a with SMTP id bf17-20020a056808191100b003bdc038b71amr770409oib.25.1706176379179;
        Thu, 25 Jan 2024 01:52:59 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7fb6:ed02:1c59:9f9c])
        by smtp.gmail.com with ESMTPSA id gu15-20020a056a004e4f00b006dd8a4bbbc7sm3228275pfb.101.2024.01.25.01.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 01:52:58 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8183-pico6: Fix bluetooth node
Date: Thu, 25 Jan 2024 17:52:38 +0800
Message-ID: <20240125095240.2308340-3-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240125095240.2308340-1-wenst@chromium.org>
References: <20240125095240.2308340-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_015300_884650_D9A7474F 
X-CRM114-Status: GOOD (  12.46  )
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

Bluetooth is not a random device connected to the MMC/SD controller. It
is function 2 of the SDIO device.

Fix the address of the bluetooth node. Also fix the node name and drop
the label.

Fixes: 055ef10ccdd4 ("arm64: dts: mt8183: Add jacuzzi pico/pico6 board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
index a2e74b829320..6a7ae616512d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
@@ -82,7 +82,8 @@ pins-clk {
 };
 
 &mmc1 {
-	bt_reset: bt-reset {
+	bluetooth@2 {
+		reg = <2>;
 		compatible = "mediatek,mt7921s-bluetooth";
 		pinctrl-names = "default";
 		pinctrl-0 = <&bt_pins_reset>;
-- 
2.43.0.429.g432eaa2c6b-goog


