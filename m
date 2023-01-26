Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3270DC54E94
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMqsQ9Zf/3zRu5jyZdUXBXLRRFx/EViyHcyMuUzQvns=; b=LLiuGyUB6bFT6b5GT+rfdE+hTo
	hqN6QOQBKkXqoE3U5bm2b+f3GGZ8Fca3I4kO1Ye3y82upXT8TLE4Q9MTGoTU5UH4wlgwXcBqIiaD1
	dW7dRoeGVJeeZDUE9D7JnxhDT8mBlbaf3i15H1Ex1TCoxGRkfTkMxfKHjgqHW0bcmZDBHxfEo1x1M
	p7kFOdgR1eX9RXotNJ/KD/3IQTb0yvBGWD5QSjJxkbp0sRjzF/mV90nxlCGXOx8/paS2dJt4A8oWe
	4TaIKGPze1Z6ywGG3rIVb4EajwFadJ5NPH/QRB18xZv/WSBLrXyfxTG8OTPjTzyjszGotDEtO9ETJ
	+4Q+MvRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKzbq-00ATPU-Q1; Thu, 26 Jan 2023 10:35:58 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKzbV-00ATFF-J4; Thu, 26 Jan 2023 10:35:39 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8CBD56602E6A;
	Thu, 26 Jan 2023 10:35:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674729335;
	bh=wKr87X3ee2/ldebp0uI7OsQ8x9sd9DyzBVImLZaNJnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YBZ523GyKgfEXh0o9iDuKK9lS0MLU9urZBpc71Zuto/nmWwqp0dyCWJU6nDBgXQMT
	 +sT8N6fqDiDimxFEcv+AaoRCAlOMh8iDTaWvn3qsW8XJfnzE3fkM7sRyGAmVDKrrJy
	 coJKYSYxHDE7F4fRySuN5bJcVaWsrRvEDSMWCtdMCtN21XoNKrXMuVCUUB9bBBqMST
	 yafhWH8N5C0CCbQb0l3NPNyQPkG2oGzKunpy0ah1tVCrvbGIDtBpBKS9+TL+jS6oLI
	 XlechJ3tF6n4nF9K5I2qz43y+9IHAE2VBJzc3S8lnL1bApCWEI8KzFCk0Q7IuwPIV+
	 PgFGPNeJ4v2CQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	seiya.wang@mediatek.com,
	tinghan.shen@mediatek.com,
	allen-kh.cheng@mediatek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/6] arm64: dts: mt8192: Fix CPU map for single-cluster SoC
Date: Thu, 26 Jan 2023 11:35:22 +0100
Message-Id: <20230126103526.417039-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126103526.417039-1-angelogioacchino.delregno@collabora.com>
References: <20230126103526.417039-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_023537_795048_68E26D41 
X-CRM114-Status: UNSURE (   9.11  )
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

MT8192 features the ARM DynamIQ technology and combines both four
Cortex-A76 (big) and four Cortex-A55 (LITTLE) CPUs in one cluster:
fix the CPU map to reflect that.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Fixes: 48489980e27e ("arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile")
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index ef4fcefa2bfc..eb46cbadd310 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -206,19 +206,16 @@ core2 {
 				core3 {
 					cpu = <&cpu3>;
 				};
-			};
-
-			cluster1 {
-				core0 {
+				core4 {
 					cpu = <&cpu4>;
 				};
-				core1 {
+				core5 {
 					cpu = <&cpu5>;
 				};
-				core2 {
+				core6 {
 					cpu = <&cpu6>;
 				};
-				core3 {
+				core7 {
 					cpu = <&cpu7>;
 				};
 			};
-- 
2.39.0


