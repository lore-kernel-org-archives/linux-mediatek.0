Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D12C54EAA
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 10:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oq9ZeEBJe3kRXlo/6/IjznWvVQskObsD2w8mpTfUG1E=; b=yEgYYXv0mmcDNhdV15INoJFVUs
	maRoPAt3VuRGNNPGNFZB1TAl6wPm3qVnvmes4glrKz64rXHy+ds0YUpNjyQ1/94gG1BzQfUUSjRmf
	N8fw/wN2kUbdvu24q35HkjLLsYqHDMnC2kjHBjpwOpaVLrPhU88D9r2prIPvnLT+xXm28WkBW9u63
	AYscAlKXkk6XjFSBwUDRG7pvqLUXJ7B6zFNbkeldecvoVU0PuxBTVExSbMEgM9wrOTeKZqQJR4hrw
	j34Xyim30JNQ1z5azEAvei+EjcQy5rjAJAMgUwLHgxRgtIeEPIU9sPx9M/yStxHbRdK2p12HtBOxN
	rKwaxCUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKzbt-00ATQS-0O; Thu, 26 Jan 2023 10:36:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKzbV-00ATF4-J2; Thu, 26 Jan 2023 10:35:40 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CE3086602E69;
	Thu, 26 Jan 2023 10:35:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674729334;
	bh=iKRWu1G6lRj82iCKcuPFgVRRJGOdOZ+wFl7EKyG3ooo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WBmewUkJe5wonIHRiTpTwd4y9LJFeNiqAIRlyHP0ntZd3YdC9VuAR4IWXrnCi5j6O
	 bVj76/T7a4Mvh4jI3IHgOXufyAPmv1JhOd1wOXW46ObYVRwnp5ULe49E51NDG2vAXs
	 RoI4Do0lmXPc5o7ngrW1HkNemIZzSBhStzqhh5U8w/ti2mscnMobiokVo+yQBe4UB1
	 kgdoW1GG5Gq39tRfG3/3T57TtAmr3f4Y/66k025ngMKJS+HDXPBQVoBp1qUq8hXiOk
	 dANmYtFKfSL3Upae90DEf0qATiImCLsraUIEv4/y87LfFMI2wikuI2CRB/zHF5RKES
	 dgJQtDozy246A==
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
Subject: [PATCH 1/6] arm64: dts: mt8195: Fix CPU map for single-cluster SoC
Date: Thu, 26 Jan 2023 11:35:21 +0100
Message-Id: <20230126103526.417039-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126103526.417039-1-angelogioacchino.delregno@collabora.com>
References: <20230126103526.417039-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_023537_803287_CB0CF35B 
X-CRM114-Status: UNSURE (   9.93  )
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

MT8195 features the ARM DynamIQ technology and combines both four
Cortex-A78 (big) and four Cortex-A55 (LITTLE) CPUs in one cluster:
fix the CPU map to reflect that.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 926325935777..f04f836d9a72 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -199,22 +199,20 @@ core2 {
 				core3 {
 					cpu = <&cpu3>;
 				};
-			};
 
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


