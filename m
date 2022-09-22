Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37509C6FA8B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 10:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBcVM+dNT7dGuwcayOX+tTFI67v7gXCXjDKDeCaPN1I=; b=B0HUq6/y7kwlFnYQLcJKf7sZuf
	aOK4bONxSDh8qWThLobzsHBlrZF3Z3w5nOc3VFuh8GU3ZPdZyynxJspwC7uEWCNBrSnidQsDaQvEm
	GiTCuHzQnNbZo06TQcmlpPHczNRwIy1yGPIgERgcoWWmppXgcWQm3SZVN7/uZVEXv+qF2nJf8L9Y6
	sxDhwHNDah8rqnyjmGNxIifTQ/JwjV1v7nwcRoGtwOe10GzZIMz2+EXl3IXRR4Jra1KKnhI8c0FSp
	AzwWcVPdTEwcUy8Rs9Ibv2DJUfh16Ma0mN29Yu8mq6tdhkHKoKp0dwiP7n/GK6aSdv20czsrKaJtO
	IusYziig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obJ8G-00EnGZ-BS; Thu, 22 Sep 2022 10:08:36 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obIpb-00EZ44-GO; Thu, 22 Sep 2022 09:49:21 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 31D1E660221D;
	Thu, 22 Sep 2022 10:49:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663840154;
	bh=HBq0403+8YpuivvuFKBBDzFD3nvqHpkf4SYdCxNYb+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LNCLBrgBKICqL6Zc2LWoquUWoO3DCOlq28tDIoj598l9jpRLe5F920EcaKFgA/jT5
	 okrEDAY5AUDWJ02UsOTatrut6vF9uFkLsL+4gsrWT+Z8pieR2NaxieTGkIFaNKpUgg
	 hvO0rpYiR7nfn9im4zz0Md5UA3TeRjxzjtj5SDQV8XPQPOwjDFJw7hj0v+XK1jqI7f
	 657GcI2AGuscMNkCdTwKL9IhF875xgIIdZvglEPgzL7zmOMFSCzk3vyVttClTRcQih
	 lIFpZFD8DWpgHX6PrMa22f2yM+uOVj8lqG97v0rwTq5+KOzZ1uhk2Wu4t4NZ5MvO+y
	 l8AqpkCok77WQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/4] arm64: dts: mediatek: cherry: Add Audio Front End (AFE) support
Date: Thu, 22 Sep 2022 11:49:05 +0200
Message-Id: <20220922094908.41623-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220922094908.41623-1-angelogioacchino.delregno@collabora.com>
References: <20220922094908.41623-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_024919_868316_FFE0ABBC 
X-CRM114-Status: UNSURE (   9.28  )
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

In preparation for adding audio support, enable the AFE HW with
the appropriate eTDM configuration and memory region.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 9b62e161db26..bc7890300a57 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -117,9 +117,23 @@ scp_mem: memory@50000000 {
 			reg = <0 0x50000000 0 0x2900000>;
 			no-map;
 		};
+
+		afe_mem: memory@60d80000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60d80000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 
+&afe {
+	status = "okay";
+
+	mediatek,etdm-in2-cowork-source = <2>;
+	mediatek,etdm-out2-cowork-source = <0>;
+	memory-region = <&afe_mem>;
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.37.2


