Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EA5D1D460
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jan 2026 14:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgbuU3ctu3ix/84S+BJRtRzgP1QvSCFy5pru+r2vm10=; b=T+qYZ85fW8Ogm3txmatluow7L4
	tm9Wb7sLFTCyCYIiijZgzFDNDdCIAkVHCSVL8p/ykLblnvMHJPZMXBg5/SmsDRcC5DARssTMoSMeW
	HJxnKlYT8ZXcVze2KGcjsf8GPaLzStZou73M7hnWfgOuMMb+6/QZtJzgQTFvV4vJ88QWuifvQxTl6
	o1IvzCJpmojuCBSJnzsPS4tVNM69rhN5iXBqXIt6E3GVBwiVUoqM9iXdadjMB1+JAZHkBtO1cLWSR
	u2guvcvm/UourXKibdGpEhCzv2b+8JOUJH1G/I53HUFhKn3eqJ9Uk/LObu87eq6vjxl91Pf/wBOuh
	Cckrsp9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrBA-0000000HNcv-1Lpm;
	Thu, 08 Jan 2026 14:40:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrB6-0000000HNZo-1DtV;
	Thu, 08 Jan 2026 14:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lgbuU3ctu3ix/84S+BJRtRzgP1QvSCFy5pru+r2vm10=; b=lHL+QFpxX+OJSuw8Kf1wYuCS8q
	Om/YT4wk/D9q6mQXJC8AdLOW7qQLyE7yroLMJewpddkeCiF7bnWu+tIIhhc7rnNg1Us2pBaXuirlX
	Vtcd+4CKBzYBGkntYyu5UYIGkE6MtXCN8/xGDlFwXbI27WI50pLms69KoYztZFE5QMp8wzTWW5K2i
	JZjK6evq/CZVPPyUvC1Jmqwvx5htNrFdsXNxDKmqOAtCIAs8dZ70oioBDCSXxAbVq3K0sktwHc6f1
	pJ3dtHfuyCB1qYtVE8iZFChM9d+BemuM3gSGXf6x+9WIKlWKrJ/UUC7u7LXMO3zrL5km2XLuSRME5
	M5+S+hgg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrB3-0000000DOdY-1EHW;
	Thu, 08 Jan 2026 14:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767883186;
	bh=uECYkDwl0HnfxlQNQ8iqkxcehiXDOKCT+cD5JTYw1c8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XTObFu1vuvSFoNwOfFU7vbcO6F0tZwtbnbn91ogK5KyEhlo8lWN9T4I7QZ3SsjwID
	 Lp+dZh84fFrx5UlO3U3GTk9aud3NqeB5f23Fd/IGUmwKLhddvdVD026gDGowy6thhM
	 coBL4vgE/eUAjJLwrxPk8w2Zl+UaJbVgX4tkjYQTxvVb2DrP/wC3XB2RiH47Gd8lSv
	 qUALpiKO4mWCKqOh1E/TbuBvPgH0Vk8fIC6lLo9U+otHYoYXDQjDx+0i2Dz2p4G8Pw
	 rJmHCSEoGqKsO3wnhtSav0ElwWWY31FZPlMS9/oiWRig54G+kAemYuSy+BKpXnwFWg
	 0xu9OU4oIUDQQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F94417E0020;
	Thu,  8 Jan 2026 15:39:46 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8188-geralt: Fix warnings for vdosys0 endpoint
Date: Thu,  8 Jan 2026 15:39:34 +0100
Message-ID: <20260108143934.69634-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108143934.69634-1-angelogioacchino.delregno@collabora.com>
References: <20260108143934.69634-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_143953_455313_A3FC4891 
X-CRM114-Status: UNSURE (   9.33  )
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

This machine needs only one endpoint (@0) for vdosys0: remove the
address and size cells declaration and rename the endpoint@0 node
to `endpoint`.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 7fedbacdac44..64a4e798a05f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -1279,11 +1279,7 @@ &ssusb2 {
 
 &vdosys0 {
 	port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vdosys0_ep_main: endpoint@0 {
-			reg = <0>;
+		vdosys0_ep_main: endpoint {
 			remote-endpoint = <&ovl0_in>;
 		};
 	};
-- 
2.52.0


