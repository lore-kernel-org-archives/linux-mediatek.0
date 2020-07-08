Return-Path: <SRS0=VCtr=AT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB297C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 10:40:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A81022078D
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 10:40:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QNBF0GbM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iBEfLFTw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A81022078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rZdzFEmX7uDOg0EpGdc8uA2lJnvYBRS0ugEPX3xn/II=; b=QNBF0GbMiTnTb5B+I+3jjLZDh
	eyt5JWttx7h4U0yTCQ+7OVeQeFem3/5AXS+7Cw6NcTG+5GFB8y9kZ4ezBgGaBaFa996Cu6vnAxUJN
	sL5tovJp3ZddBC/OoqNy+pVJFytHHnYvdCIs4EXT1eQ5ELtFK1Dd0JQxvpLF1D7h7g5mRa6Wy55y1
	LTSGy+8RTcoXibuBTmlLTlb/VaBEUlH9J+zeefotsI6vQKbbhJgIlKxcNdQBUs+kVajOeJmkmPFXN
	a2q4pltmpcIM4Zo43yOzR5v9mlJaAJVVRv8GEg+VwTEcQAZq/JknI8qz0XWAr2KpVmUllbj/kf1GI
	Z4K884+qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jt7VL-0002bS-1b; Wed, 08 Jul 2020 10:40:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jt7VI-0002Zs-Jk; Wed, 08 Jul 2020 10:40:41 +0000
X-UUID: ff04f49b05084c649223d84d7ba9c7ba-20200708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Dv3GB0am1WFCJf6ZN7KVrUkgtNaBLQyeWNE0Wp3tHxg=; 
 b=iBEfLFTwFV4hSScrfKkKhK/7yavjYwFKmAUDf2sz0Bt7s/pI4lDRNOBluqbM/KWNamRu/sWeGpn6UHK+vElray7LLMVQ4olYZrXlqdH3MgN3gsEBJ1EztOAs158sTSdFtT6z8Jfiw1SsLI9Zo7PSRaRIs8ZjqfbZbv6n36GhZ6c=;
X-UUID: ff04f49b05084c649223d84d7ba9c7ba-20200708
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <louis.kuo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1378766935; Wed, 08 Jul 2020 02:40:41 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jul 2020 03:40:28 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jul 2020 18:40:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Jul 2020 18:40:27 +0800
From: Louis Kuo <louis.kuo@mediatek.com>
To: <hans.verkuil@cisco.com>, <laurent.pinchart+renesas@ideasonboard.com>,
 <tfiga@chromium.org>, <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
 <mchehab@kernel.org>
Subject: [RFC PATCH V7 3/3] dts: arm64: mt8183: Add sensor interface nodes
Date: Wed, 8 Jul 2020 18:40:23 +0800
Message-ID: <20200708104023.3225-4-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200708104023.3225-1-louis.kuo@mediatek.com>
References: <20200708104023.3225-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1E7307CC0B067F93EFFF6B5343014E9F5BDD12D783DB5CAA4B3CDE50008950C32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_064040_801621_E7874143 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com,
 srv_heupstream@mediatek.com, Jerry-ch.Chen@mediatek.com,
 jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org,
 linux-mediatek@lists.infradead.org, zwisler@chromium.org,
 louis.kuo@mediatek.com, christie.yu@mediatek.com, frederic.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add nodes for Mediatek's sensor interface device. Sensor interface module
embedded in Mediatek SOCs, works as a HW camera interface controller
intended for image and data transmission between cameras and host devices.

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 7b781eb7edd7..d487e539705c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -762,5 +762,31 @@
 			reg = <0 0x1a000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		seninf: seninf@1a040000 {
+			compatible = "mediatek,mt8183-seninf";
+			reg = <0 0x1a040000 0 0x8000>;
+			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
+			clocks = <&camsys CLK_CAM_SENINF>,
+				 <&topckgen CLK_TOP_MUX_SENINF>;
+			clock-names = "cam_seninf", "top_mux_seninf";
+			phys = <&mipi_dphy 0>;
+			phy-names = "seninf";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@4 {
+					reg = <4>;
+
+					seninf_camisp_endpoint: endpoint {
+						remote-endpoint = <&camisp_endpoint>;
+					};
+				};
+			};
+		};
 	};
 };
--
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
