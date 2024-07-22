Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6743CC3DA5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 15:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ltMCUPMcfqsW53l40a6/Lh8UO0aLhKmbyoO/qNXL8Mo=; b=gfMe9hTyBzRTTYzRls8VpexW9L
	UxC64zfq8z19CC82pWJtZkYnmCINg0L2VmYLCb0rkVrVlL9cqYhBJeDRMWYMaSqzFLpPMTEZJm19s
	EEgnHdakfbQUH81sDrMw+YXKQK0bHH7QYQr7XAp1ElRbMtWv/glRHbVNuGxV1tbFxlngDC/JCTHus
	waNxBmtIbYdESW30eLjDbUcfLKhEFEAKpEKBkfhSGNWD0Nf3bzBc/18efVPnB9MCU+3jXsYb33RxW
	2Oflh+Ci7KPqa+3e7BDfpno+kKhMW/1zRc+yA2jjDbHfGUQ3YfyPff+u/aYMlFIDcHwEdy6Q9AxVn
	jFCKgqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVv4K-00000009yV9-3vf7;
	Mon, 22 Jul 2024 15:35:20 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVv3m-00000009yOq-05bu;
	Mon, 22 Jul 2024 15:34:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721662484;
	bh=pqX/1pKn6IJcxlRJ+2ycKGD17KperRGQRzjRVL8ZRBc=;
	h=From:Date:Subject:To:Cc:From;
	b=Hq5af8zEoSqr9BQxGsL/7brCE3yfykI4+XK0q0X/R2RTPrNlxfUMRyp0ZXHbcLyfv
	 zt4fIaJ5B4QTqkxlfDYzQdDtAcmmfXYsOvr1ctqEUYAHBe2pFP9e4+od0Z7QeI0/3N
	 XV3pcA7uQ6jtx5g4mQRZ57AvsLeTg0ML3rZG8Qc6gpCEmIZZF5e8IcQq6wiqXM9qsc
	 12/GDvGY6slpMcxRxmPCONHW1cGkaBdRr4qhjf+OpdvEabHAqMtPf7eWPNvyLHPP0o
	 2SKiGqM3QgF009rWvYEhULM5hm70BaleDcdbDKrJj1P5jTu0yTM/dVd+qP+jQIjuWP
	 rPCm9Bw9JnJRg==
Received: from [192.168.1.217] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0CD603780613;
	Mon, 22 Jul 2024 15:34:40 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 22 Jul 2024 11:34:25 -0400
Subject: [PATCH v2] arm64: dts: mediatek: mt8195-cherry: Remove
 keyboard-backlight node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240722-cros-backlight-dt-probe-v2-1-d77cdf7018ec@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAB8nmYC/4WMQQ7CIBAAv9Ls2TWAtNWe/IfxsFAsROwaICSm6
 d8lfsDTZA4zG2SXgsswdRskV0MOvDZRhw6sp3VxGObmoITSYpQ92sQZDdlnDIsvOBd8JzYOx7H
 XdD4pmgcBrfYhF06f37jKhtv/R5UoUZieHm7Q9qLN1XKMZDjR0fIL7vu+fwHK543ysgAAAA==
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_083446_235368_505B98E9 
X-CRM114-Status: UNSURE (   8.76  )
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

Commit 970c3a6b7aa3 ("mfd: cros_ec: Register keyboard backlight
subdevice") introduced support for detecting keyboard backlight
fuctionality through communication with the ChromeOS EC. This means that
the DT node is no longer used. Remove the unneeded node.

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes in v2:
- Removed RFC tag
- Link to v1: https://lore.kernel.org/r/20240715-cros-backlight-dt-probe-v1-1-0b5afe64c94b@collabora.com
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index fe5400e17b0f..20dfa18c9dda 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1228,10 +1228,6 @@ cros_ec: ec@0 {
 		spi-max-frequency = <3000000>;
 		wakeup-source;
 
-		keyboard-backlight {
-			compatible = "google,cros-kbd-led-backlight";
-		};
-
 		i2c_tunnel: i2c-tunnel {
 			compatible = "google,cros-ec-i2c-tunnel";
 			google,remote-bus = <0>;

---
base-commit: 91e3b24eb7d297d9d99030800ed96944b8652eaf
change-id: 20240715-cros-backlight-dt-probe-7754a832ad60

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


