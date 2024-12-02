Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E98D10DB4
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9gfcfEqLWRgyB2HQV5UbiI2sXq612OlwtqN3jGuE7po=; b=bJXU+U4rsN5aX1DF/WjcMSZee9
	W/5xSVyfIvk7orujCmrh/Gp0airuVFdhHa6NH+9CGl8uBYCvLYcXsA+bjdYCLFkRi7QJdp8d0gIxt
	uuvi7kdmaSUknvuUXL3MCYlh1zPfr5Uk+X5icghPdKt7Aa5OZrAwi4nVchebSpeMDfdFDKb6Hfa8Y
	Q/Oi1Kq4EBocJsY5I9y0jvz7mE9ife7CnX2iThxybyrc7D98FSn2J9hwTeXPxFaHk/LwJvYqIpFgf
	CFkdupD09kCsZekV48cWzShFSIhpqxFAU0z8i3MvIzOROTqK/26x0GW2aWCbIcx4feRczUGoXrp94
	OPcfNP3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1bO-00000005OcD-1KgQ;
	Mon, 02 Dec 2024 08:16:18 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1bK-00000005ObE-3VN3
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 08:16:16 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7ea8de14848so2362840a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Dec 2024 00:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733127373; x=1733732173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9gfcfEqLWRgyB2HQV5UbiI2sXq612OlwtqN3jGuE7po=;
        b=G2wzC4+Owol/1o2DmiNdDxw+qWUKwCbjcKtCVGsktQTJBSZx2H9t27EksL4zqcV5+v
         CObPdyLS2TUKdgzRrLyA7IjILhAj2edG8hcGzr3KLhyh2CO6GL3or3GI9qeiIugUYBYT
         ZYZ9oyfTw9IOMv6I14CsIy9B6UTWyD0oq9ccA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733127373; x=1733732173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gfcfEqLWRgyB2HQV5UbiI2sXq612OlwtqN3jGuE7po=;
        b=wUo0CUsYb/2rL7INL+uq9faLefHGMlZxkHiU3Ee6pHwNU1noboag3X2Drs1UFvD2Xe
         kB+ogdYHNWHoaLwtEVVJqZ4okXiq38O6OmmIpGRWZX0mPmztuBksWED+tTyABAeAPpHw
         qPbbm9S2z5S52YdoWHQR2vjJnrw5M3+0MlMnD1Pc11itwoolvjvJQmDlxkXPX81rjyc0
         JRYzKytxveoFzEc0H/NPvoC5GeDplLsHLtmYXFXqdyhbjNwd/JlQof2KkiW6aqLOW/F3
         mW2wcRYDnMt5EPywNlxyMqTddqCyQKyH3TKOOgC4+ZdRo/iO4zYx52bdbfG8FG65XgwN
         zDOw==
X-Forwarded-Encrypted: i=1; AJvYcCXBBiX/+Oz/gbqDkdsDUQpLfAV7DDnpP0uk49gaU4ijnWRm2OvcM/puqXk65YPUfZPVNaJkfqHqDuDuaIgexA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0YpR/Yx+7Wq+VMUOxoDgPe8ySJUHXt6rs1grC5y8/XkmFOR8h
	9BqeHRmw9ka9pzjMGEOTKnvv6vjQesj1/MO0stS33ONhT8cdNmfdOeR85q2ufw==
X-Gm-Gg: ASbGncsmq1nYwJy+R5ThGau/RSeMIqwAzZwe9ZUXKNgCr2dwQ+WXrV4uBslP+GcL9hK
	Abi6g/jNzB8p0LKcZIXavPiD1KlrfiCxGHsqXpWnCS3qqfO7NOXB11jw3RW3KdqWeNFu4kfOgtW
	Dhaetqq5hhsr19T4KYVfqemIjMm+IAuenFZf6ivTpYgj33USax5oiAqn9pU7HPQF9rGfbhGQY3+
	39e19YKv5sj45J1M5dG5qvEvYM75GIcMJzWtqF64C8bB8Re3fsuaprYwx+fNlQy7ueJ
X-Google-Smtp-Source: AGHT+IFqZTzJX7eXH4gzncrgMaOzS5d2OoQ3YCV38eFWBvyrMOWlzrisueoiJ989ZcLF70r9MzLOag==
X-Received: by 2002:a05:6a20:1593:b0:1db:df7b:471a with SMTP id adf61e73a8af0-1e0e0bf54d3mr32960644637.43.1733127372940;
        Mon, 02 Dec 2024 00:16:12 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:94c8:21f5:4a03:8964])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72541848505sm7891833b3a.178.2024.12.02.00.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 00:16:12 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Koichiro Den <koichiro.den@canonical.com>
Subject: [PATCH 6.6 1/2] Revert "arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled"
Date: Mon,  2 Dec 2024 16:15:49 +0800
Message-ID: <20241202081552.156183-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_001614_904059_7FC7BAD8 
X-CRM114-Status: UNSURE (   9.57  )
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

This reverts commit 090386dbedbc2f099c44a0136eb8eb8713930072.

The hunk was applied to the wrong device node when the commit was
backported to the 6.6 stable branch.

Revert it to re-do the backport correctly.

Reported-by: Koichiro Den <koichiro.den@canonical.com>
Closes: https://lore.kernel.org/stable/6itvivhxbjlpky5hn6x2hmc3kzz4regcvmsk226t6ippjad7yk@26xug5lrdqdw/
Fixes: 090386dbedbc ("arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 34e18eb5d7f4..b78f408110bf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1312,7 +1312,6 @@ &xhci3 {
 	usb2-lpm-disable;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
-	mediatek,u3p-dis-msk = <1>;
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.47.0.338.g60cca15819-goog


