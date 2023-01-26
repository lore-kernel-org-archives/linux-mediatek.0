Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5586C05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 10:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdMhwvhhDbBYQI9iPyyHxhBBR1u18WorVVYVl8Rrz88=; b=w/fXho1NbVdlF5HJZieiGySmYT
	ggXych7FyPZZcnTE0/1/La5Im9+V7I1O2two5oNu+AC14uufKmROhQGDmYekL49vw9LFjvoZ4aof7
	JRoLj24/0O4h/Jy6FEdrQhSx37OT8dU7tmBpIubH4c0iEbwJr8OENHGSX1oy/VTCytl+MwQ8ovCkR
	Z5a9sMbcSjEBtLmrRCcDMdjew3HozF9NuYG/+N4/XFzFyCVsnZKEgZNDvnAG6qLTeq4EGKmCbl0re
	LMk0yzvxG09dAnseA+nLqNGbHVf3+ueVktcBaY9MwriQeFgHMrm3EFM2C84Xpl7Jr96K/Z+jqbumK
	h2KvuGCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKzcp-00ATrO-0K; Thu, 26 Jan 2023 10:36:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKzbV-00ATFO-J2; Thu, 26 Jan 2023 10:35:40 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4A5856602E6B;
	Thu, 26 Jan 2023 10:35:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674729335;
	bh=EMl5yatPQKhtWM2fU3fhn8R0Jnt0BN2gaE4N11T994Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y6f19OUrNeNzCjr6L+ZBaC4DyPgc+JYOsCxmwcQOLpd9vW6TCon7lYhjV6Zw/dHvA
	 NXl/DKKPev3eeQaRUrLg4e3pKPqnIPiLkaihZhPi4YCeXB5vFzCOlbirFICVQkLFvH
	 AUfnFIaWTar0j0B8ZShrBx2k3RrMOoQmtmtfuAstwkSyTeUGamZjdsXfPx74vUDpuz
	 ebk56daRyTxwQGtR73T07iQageU+SxG3GZpuRHfOIFWXvua4dnkrcgdQC8yeK54dGY
	 vYk8pgVJ5NSLlpwPOfts1xAnmHNAO5A3Jxy5QnudA19ZDNLf8C1L6OQfMWEqiFNNh9
	 UjJfElFU7zuSw==
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
Subject: [PATCH 3/6] arm64: dts: mt8186: Fix CPU map for single-cluster SoC
Date: Thu, 26 Jan 2023 11:35:23 +0100
Message-Id: <20230126103526.417039-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126103526.417039-1-angelogioacchino.delregno@collabora.com>
References: <20230126103526.417039-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_023537_809656_3D8E71C0 
X-CRM114-Status: GOOD (  10.10  )
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

MT8186 features the ARM DynamIQ technology and combines both two
Cortex-A76 (big) and six Cortex-A55 (LITTLE) CPUs in one cluster:
fix the CPU map to reflect that.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Fixes: 2e78620b1350 ("arm64: dts: Add MediaTek MT8186 dts and evaluation board and Makefile")
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index c9124bb0c960..9e8daaa044dc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -48,14 +48,12 @@ core4 {
 				core5 {
 					cpu = <&cpu5>;
 				};
-			};
 
-			cluster1 {
-				core0 {
+				core6 {
 					cpu = <&cpu6>;
 				};
 
-				core1 {
+				core7 {
 					cpu = <&cpu7>;
 				};
 			};
-- 
2.39.0


