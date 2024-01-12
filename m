Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC30C4706C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 14:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JzjRm5CmUHtKY7/maYZZnos4VHDfHigbtWtqgQqR1mU=; b=oCirvG4ptTJuU7PyIymuno3cka
	UEJrGbNfltoG0ErMegXECGa33voYIMketxHbOaq4y14b0hlWM0GPoRGBbIsIsUChjahcLh+6f3qI7
	0Q3ccSbTPlvq7mhbhC2zObGnSfSELhqc5xMaEeR+AtjNrHZWsZ9yBJNEEUhJeTh4/uHIrjE1glFmN
	InrqSiR71Y7pXl5WWm732W0oSAUz2fndShV8Vqji9Hvdm1Z2O5/v2W317c1VE4SYxSIMRlc3k/QW5
	4fFjzkHYIo4q/8fY0NBoIxxEaOHAM7+0E+YHSnrbcEvEhNHpBnjn1JIy/EDpMafjbPNmdABiDe5n1
	T36UCiNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOIQq-00312J-06;
	Fri, 12 Jan 2024 14:22:48 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOIQm-00311C-0V;
	Fri, 12 Jan 2024 14:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705069361;
	bh=2cBD3Lbpl2cRVVQBqOcu4sRyjCaGrfbaTxuW4Uf9u2k=;
	h=From:To:Cc:Subject:Date:From;
	b=5IswpgLyvJQ/mJIsfPnF4WKCupnP39c+fFVV1tvMQdxIs1duZkylkmsmdnG3dTY07
	 ffU5rLJyazvVoCGTVMnM3eI1JJm0HpPt9psFhDvT9Vei0roUZZ2t3EAY57K2jTcQfF
	 F7kRJttqjHnpy/UQk0lHe9sBm1h4NRgMtwUUVSfD5Jad7f5ciCtGMD1RmEcoghPr5y
	 qZrHeSFeACqYw1ZaOmdxbX+SfaPisa2qOCR3/8+qwIaHzvfy9gyO2SXFcKThx1NWf8
	 uBTVqheYQrpVpOLQRjPPjmPs8K7plC4OJJtWnsKT7fVp17PpmtDBihD+AtuR8wns9c
	 6WE44Hi7+6Wcg==
Received: from localhost.localdomain (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0605A3780624;
	Fri, 12 Jan 2024 14:22:35 +0000 (UTC)
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Ikjoon Jang <ikjn@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] arm64: dts: mt8183: jacuzzi: Remove CrosEC base detection node
Date: Fri, 12 Jan 2024 11:20:28 -0300
Message-ID: <20240112142032.909736-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_062244_325282_CBC10BC0 
X-CRM114-Status: GOOD (  12.07  )
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

The cbas node is used to describe base detection functionality in the
ChromeOS EC, which is used for units that have a detachable keyboard and
thus rely on this functionality to switch between tablet and laptop
mode.

All machines in the jacuzzi family are either clamshells (ie normal
laptops) or convertibles, meaning the keyboard can be flipped but not
detached. The detection for the keyboard getting flipped is handled by
the driver bound to the keyboard-controller node in the EC.

Since there is no base detection in these machines, and the device
backed by this node fails to probe and goes unused, delete the node from
the DT.

Fixes: 4fa8492d1e5b ("arm64: dts: mt8183: add cbas node under cros_ec")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v2:
- Moved cbas node removal to jacuzzi dtsi

 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index 7592e3b86037..8c9f7435cf4c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -484,3 +484,6 @@ volup-btn-odl {
 	};
 };
 
+&cros_ec {
+	/delete-node/ cbas;
+};
-- 
2.43.0


