Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FD4C636D7
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 16:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DF6FZsrOq2uDI5i5iuOV8rZTGBsKRUNllbLLHeT5egs=; b=li2gxCJARJ925KWPj0NdaryC9q
	vBy/ZbnBlIA8oc96GfgMO+WGe5OVafKAzqLha9t66eyTHgUtx5Xvk3hyupZhvUu/Q+1BddT/tvHvx
	rpaN47PnOn/celKXaAEKVo5TpGlBR7ohb7RoFuGHMF0ECvjCmQfhBiSNjfwZsg/VX9pTx1dKdBzzN
	pySgoZmqqs0GbSvN3Esky6gjoy52MWrE+BEtqaZWqzGBDc/iWMQ5KIjj1K00dcdsl7UhNJ7thXRal
	bb47yP6QJ55cwVbkArV4CG44x93JSScCZDydf7JsMZxorGO2i5t+K7XBFaOQoqQGqpHL02xTzoTv3
	S69YjSUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ9Pf-002Ksm-PX; Thu, 09 Feb 2023 16:04:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ9PD-002Kde-60; Thu, 09 Feb 2023 16:04:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BF1C2B821AC;
	Thu,  9 Feb 2023 16:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E74C4339B;
	Thu,  9 Feb 2023 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675958653;
	bh=W6/zxyE3r9vkvCVzWlsyZFdzMy4bAnzeK8VqgkMPGPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nwICIkquvfIOsjgN+LNY5EitG/nGzm0LKvAmP9lLt9g8Y4oWULma/OvCxAXpqxmSC
	 PwIEqFEvm1OymCUdI006/v1utrFxZ943TSRm0qBlXCzZGqyk+cQnSRoSeB2uD84KVF
	 Fo6RQxWLXzj+gg3GGtz8Ne3djKlPcgI37KTCs/RWggCaFbWZykZo90qf1NgAg3I1fv
	 u4Pgk4tV4WzpB7EG3FHiYoZeD4Nklz1ZMilooCL0R44C/LkggwpfXe1mpexd7ZGLlo
	 4MugJEVBEydIMjVTTpibUWlxu+5Vs0Jp2FYshpD2xN7YaoCUh0yY0jepUZSm52Mskr
	 phSxxY+7NiNtQ==
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v1 3/4] arm64: dts: mt8195: Align vppsys node to dtschema
Date: Thu,  9 Feb 2023 17:03:56 +0100
Message-Id: <20230209160357.19307-3-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209160357.19307-1-matthias.bgg@kernel.org>
References: <20230209160357.19307-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_080415_410303_32149304 
X-CRM114-Status: GOOD (  12.47  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

As the node is a syscon, this has to be reflected in the compatible and
the node name.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---

 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 8f1264d5290bf..5261367031426 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1795,8 +1795,8 @@ mfgcfg: clock-controller@13fbf000 {
 			#clock-cells = <1>;
 		};
 
-		vppsys0: clock-controller@14000000 {
-			compatible = "mediatek,mt8195-vppsys0";
+		vppsys0: syscon@14000000 {
+			compatible = "mediatek,mt8195-vppsys0", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
@@ -1900,8 +1900,8 @@ larb8: larb@14e05000 {
 			power-domains = <&spm MT8195_POWER_DOMAIN_WPESYS>;
 		};
 
-		vppsys1: clock-controller@14f00000 {
-			compatible = "mediatek,mt8195-vppsys1";
+		vppsys1: syscon@14f00000 {
+			compatible = "mediatek,mt8195-vppsys1", "syscon";
 			reg = <0 0x14f00000 0 0x1000>;
 			#clock-cells = <1>;
 		};
-- 
2.39.0


