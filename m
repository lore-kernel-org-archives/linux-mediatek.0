Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D309C00A94
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 07:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RdZHSk4TFU7CzZXHHxRZDn956keZAqDxJBl6Nwvleg=; b=1juCkPXY3iAwxIWKfV/b8OiH9x
	eDPFsRW/dRP70Ev4llNMTwrVjn9Iw1pqZtxDueg1Nj5FS5ppnV3ukaE4jGMCwWnhceKltOXqCRoOO
	pxcSY1omwS4+TDUx9p3ChpP1B1Ea4nJKgLOqO9s4MAlYfes4bZB5leCXgfKYNGVdofaB60wSVBR/I
	jwm4Y3gCnakpq+ybO9yjCKapwW0CODNP1OHJZEslmUVlfb/LGjGDt+EJBRs1UrzMFlCztqEv8GZQn
	BRYQd/VSjLLqfZWVlGyJgTa734x7Sid2GupxSTePnK4dFW5lhHu6t5jj4+HvJvrMPJRmZJKt2GV2o
	ijiKmsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBNO-0000000Fr2S-1rPm;
	Fri, 12 Apr 2024 07:31:10 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBNH-0000000Fqw0-19Qe
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Apr 2024 07:31:05 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-36a0d09e6ffso2983235ab.0
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Apr 2024 00:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712907061; x=1713511861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RdZHSk4TFU7CzZXHHxRZDn956keZAqDxJBl6Nwvleg=;
        b=AtHLPww6OYyXPFCjkHI4WG/zwAzfyQDeR9vkAuiQuAlLz0TWPgxmlnYEJObRw/5jQu
         GdkLaZrvKmZILdIF0x2TfDAqOi02xdwL7iQXzccwmOGvbeUz2WYipiDaMT+obRIO993i
         Pw+spsgpS7lVDGOlKlOVMQEiRr8Cq3JH1nzu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712907061; x=1713511861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RdZHSk4TFU7CzZXHHxRZDn956keZAqDxJBl6Nwvleg=;
        b=h76TQytvjYCnIc3rlA2J2Gn14D+nx8j3KbhX3G2FF/lV1BfeoQod3E3GUdEh6U7q00
         6BVW9SRU6A1vNlV47HD18jfr470+Fj1JQFMlLz44QNVuq+FSqgXIBgWmudIDnz+pQqf2
         P/oNf9MwPJLeFYDBoM+exBSBAWiUC+Hhe0k/NNVqANDdzfofZuAJkI/+kWoLeVujcBR9
         1nadm1+0vw7x/TDZib9NVniQC2VO0Qszo2Kogrlx3bjg/W0v1bHxnlSZkvB9QZWjItNT
         /RS1lmQgeBJREQO/3fFILciEqhH3EWax2uLHXk57W7IOQskfOZldkLHB8SvOBREOroiA
         emCA==
X-Forwarded-Encrypted: i=1; AJvYcCU2MmR427rCbdKU7UwlnlV70SnlkUVnmO5V4qfeUXAWkz8upoIOxyg0rwX7WD/nPdWZnITn9Y/cYANJURVcermo1xARo6TrTy/EeZzzCGoCYNNc
X-Gm-Message-State: AOJu0Yx+hf/kZCMav1odpyr8GBW8Y4kJsbH8f4HvmLTE/cvSlFzWJ4Mj
	9ed1M1DKlHjclRDCFKy3eSrkCSFWnnYP8SkVp2KgDNm1rZNqijoC5mn+P1H9wg==
X-Google-Smtp-Source: AGHT+IEL4CHJZN6cyV51F6bVm8k72tn6WE6KhBCBOK+lKr3ueEZGkvYYXfBhK3hbMLBmSdrvlM2k9Q==
X-Received: by 2002:a05:6e02:160a:b0:369:9492:c24b with SMTP id t10-20020a056e02160a00b003699492c24bmr2090150ilu.10.1712907061055;
        Fri, 12 Apr 2024 00:31:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e3c8:6e1:dcfa:3e8c])
        by smtp.gmail.com with ESMTPSA id d6-20020a637346000000b005d3bae243bbsm2149609pgn.4.2024.04.12.00.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 00:31:00 -0700 (PDT)
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
Subject: [PATCH v3 2/2] arm64: dts: mediatek: mt8183-pico6: Fix bluetooth node
Date: Fri, 12 Apr 2024 15:30:43 +0800
Message-ID: <20240412073046.1192744-3-wenst@chromium.org>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
In-Reply-To: <20240412073046.1192744-1-wenst@chromium.org>
References: <20240412073046.1192744-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_003103_392668_A477E0BC 
X-CRM114-Status: GOOD (  12.04  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
No changes since v1.

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
2.44.0.683.g7961c838ac-goog


