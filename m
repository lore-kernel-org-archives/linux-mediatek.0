Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93741C7618E
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 11:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYN7f1CAByVYvlLzXuUMejik+2qClzRig2YDd5no2cI=; b=as/YuvSjbXfjgP8zDV2syamvWx
	3a/4dOWzfga62j0Q2CPe35H12fkXWLz/Fx19xT4tbrueGrXT+gpC3OvGsGrx/sHhU7NO7aMTFLQIn
	B0xID2yZxqUOH2OL6yDRbMRvBdMl6Q8NiIvjj5RKLZCf1lChdDf7ux4zqVktlp0jWpOZk32lm0njC
	Tf4u4/AYkyDYzPaLGnAuNR6pMKdaAW/C9IixTI10XVT80dXSp3v+IkR4NZbEQaj4w8GKYFGYf8oTV
	hmeDwLqrg1urZugYD3Ho8Tia33Yhaj5BlrnCVpZ+dSio5USThhu9g8O6OxImusqCEwU+qTPUYCKVi
	ZvL9TsnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pquKG-00GBgM-1N;
	Mon, 24 Apr 2023 11:25:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pquK5-00GBZr-2K;
	Mon, 24 Apr 2023 11:25:35 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CED3166032A3;
	Mon, 24 Apr 2023 12:25:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682335530;
	bh=E3a2HggcnHyNJ74IvNKxPxlRZM32GuP7ERQkfR2uopU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c05bQPsdHBaHdIUKTGFwCDDnZRKlU1p2vYIE+90NQ712UgdQYDYbtMoKDWv1bNONZ
	 4DUvoHgzRW6g3Wj8baavyazYFU0eUvhI9QH2CkaJTjQPI9LIgPWm/PfYiveaSV8Jl9
	 oh0daANq1QosxicEdaigSdqmKqUSrtuOg9PgY83F4RFMEgLcloSCer2RGYoBuwrrQc
	 oB5eZC6Y4Kvhrrom/hEGgF7qZriyD56pN3e85qCLwVYUWPb9bgV8p/d5NChdMW6lrX
	 TBXTzWXPe4GjWNqzJcRL2xJxp9v/Gs09st2hOvjgk+m5rHqrH1cQTXj4CCJu9AuW8s
	 maXVRW3bSDlnQ==
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
Subject: [PATCH v2 2/4] arm64: dts: mediatek: mt8195: Assign dp-intf aliases
Date: Mon, 24 Apr 2023 13:25:21 +0200
Message-Id: <20230424112523.1436926-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424112523.1436926-1-angelogioacchino.delregno@collabora.com>
References: <20230424112523.1436926-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_042533_917784_2D09A222 
X-CRM114-Status: UNSURE (   8.41  )
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

Assign aliases for the primary and secondary dp-intf IP to properly
and reliably enable DisplayPort functionality.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index a44aae4ab953..b03a42fe27a6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -24,6 +24,8 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		dp-intf0 = &dp_intf0;
+		dp-intf1 = &dp_intf1;
 		gce0 = &gce0;
 		gce1 = &gce1;
 		ethdr0 = &ethdr0;
-- 
2.40.0


