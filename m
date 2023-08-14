Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5550FC001DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 07:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ScMc7QngLstpgVAhhM6RUzyc9XkcPLvVT78mgVYvIBI=; b=ZmS2oaJw6eFvEDHen57Oayb6N3
	90P4ZUaGDrZc6qm61XY5A6jufw07/e7qUlma/7Ib1Wr57Wi1q7KD56vRQ3PxkhWdvEoVZfXhTyzRt
	IMmQDMEdf6ByxCipDA1AmfGMuQxmCh4RJShlpudmRX73lrbZJfM8RCYvgXCGcXAMGdcOYWg02Urzo
	EEYd2UKysw6mEsgPdVmx4uVSSiWBkVkLEO5LorBgWG965pkHbxjFX60tLWbsjiv1Qc4bSCoNJv8IC
	N28NnwuK2nTGym/yuW4GOOsYI9pZxOqdZTRM8f0uNUwZuycGfKYw7nR8CVy1vacz43Yvc0L1JbvVb
	EhbFLDLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVRjI-00GL3I-0t;
	Mon, 14 Aug 2023 07:11:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVRjE-00GL2K-3A;
	Mon, 14 Aug 2023 07:11:06 +0000
Received: from eugen-station.. (unknown [82.77.136.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A7CAE66071A3;
	Mon, 14 Aug 2023 08:11:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691997063;
	bh=KaHF1lu9ki5nM7dq9OdNk5QTWGSREzV+dbzYiF0kfQs=;
	h=From:To:Cc:Subject:Date:From;
	b=Lh/S4ftR+nP+CCpsb+ioiENM+dlFGA4xZOaCjxyACXSiqhZLm7SR5lvdxMlh5i1v1
	 +Kp4mCia6yTn1WUwxDPzqbR5zhRSSZvJFa5ZgQhWvAYfUVv00BnVAo4eBzvrWZ0psB
	 plQpCqi5TVe+rlVMjK8GfNiLfvULeZ3D3jVTba+OdwIa1pnYmjrkbfxuhkh/7NwT9p
	 5R4NJcc89sO9BLIYEYpqrzxHx29ZNSL++U2sB/7b6ZK+KSwyPWC2Yx1O85S9wGHpe1
	 4ceJwgPKveHAGxdxEZ25mVOZkGyAT+Yy/lNZu543VLRvwM+juL48l3FgbD1+4IXVe6
	 aC49Q6tqDWB5g==
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kernel@collabora.com,
	hsinyi@chromium.org,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH] arm64: dts: mediatek: mt8183-kukui-jacuzzi: fix dsi unnecessary cells properties
Date: Mon, 14 Aug 2023 10:10:53 +0300
Message-Id: <20230814071053.5459-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_001105_148189_3581ABC1 
X-CRM114-Status: UNSURE (   8.60  )
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

dtbs_check throws a warning at the dsi node:
Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Other DTS have a panel child node with a reg, so the parent dtsi
must have the address-cells and size-cells, however this specific DT
has the panel removed, but not the cells, hence the warning above.

If panel is deleted then the cells must also be deleted since they are
tied together, as the child node in this DT does not have a reg.

Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index bf97b60ae4d1..649477af2f41 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -91,6 +91,8 @@ cros_ec_pwm: pwm {
 
 &dsi0 {
 	status = "okay";
+	/delete-property/#size-cells;
+	/delete-property/#address-cells;
 	/delete-node/panel@0;
 	ports {
 		port {
-- 
2.34.1


