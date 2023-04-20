Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321B4C77B72
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 09:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDUB21caBT11xSdaBDpgs/BXGwRJXg7OuKiXe1/ippU=; b=a70yzAszFysPu2XUBkp1Hdz+2J
	vncRZdfiaV8MrDtBWsZRaho1ggT8gFfHLJhKn/PJwY+hdE3z9qJLg+XICkFlvLSFQAUUjmNRtQFPi
	d1TWhExnUfZGkcfi+rOJ6ZgeFMfwWAdVNtrh03NG5d2d6C6kZN8w9fiPSCZvakt9N9izpuKPRhmuu
	S52Ylx1qLQd0Eyv4ZBljlL7lYxFufy+8cS08DkkjXAPKo9DIP4Rps/Py8/YuW296JjgWnEhAfUeOR
	NTWvqUE5gm0wkukLAMNbRbNIFH9F1IMfPOEuOxc9pEfskUiZ9ngn3o3nkOayVumrc6U5I/1FBZ/4r
	99XrI6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQqf-007ZVv-24;
	Thu, 20 Apr 2023 09:45:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQqO-007ZNj-2X;
	Thu, 20 Apr 2023 09:44:51 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5E31B6603277;
	Thu, 20 Apr 2023 10:44:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681983886;
	bh=Ki82b4gc4Fw7arzhH5GwpAwTU4+4dn3MwLzf+E35F7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i9MxS6MJ2jPtcCh0u1FFZtTDC2G63yQc8253Cb6PGy/OMZ53SbLfhsn2H+iJ/0GYG
	 P7MMNwZtdOqVxuxyJQL/h9q2eUkMYTFWuIIBbhEP06SHP2Zm5F0TCcMjChLSfLDS/l
	 xCAkzdwGaZltA7wRXbOdpHFMS7s95ZWpqxtbgOyIpt9MmobDDAZoTqhKeMA6zNZ8jl
	 RH0czZq6TOQ2CT0J1vW+5FTSfz/8to02Nbj+X4lxaL0tO2etlYLgflmUl3orBm6xYt
	 GTQr7ngNDziMKRd9hW0KGKGxDbmc9w/E2D0yfBVrxtl1kCMLMpq5lePDoYD2r85aG7
	 GsT7c6UbK3AHA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/5] arm64: dts: mediatek: cherry: Assign dp-intf aliases
Date: Thu, 20 Apr 2023 11:44:30 +0200
Message-Id: <20230420094433.42794-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com>
References: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_024448_983085_803B519B 
X-CRM114-Status: UNSURE (   9.45  )
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

On Cherry boards, the IP at 0x1c015000 (dp_intf0) is used as primary
dp-intf, while the other at 0x1c113000 (dp_intf1) is used as secondary:
assign them to dp-intf{0,1} aliases respectively.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 0820e9ba3829..918380697a9a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -10,6 +10,8 @@
 
 / {
 	aliases {
+		dp-intf0 = &dp_intf0;
+		dp-intf1 = &dp_intf1;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
-- 
2.40.0


