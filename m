Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D55CC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 05:49:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA3C5651EE
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 05:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA3C5651EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6/i8B5uQRvjZBX/ND0fDwUfo7teFyIsELL6ngH6RA1E=; b=fSyLiRUsNQjQImcUwqpkweR+Q
	akxsdDHus3Ri6KO2BGlSCVC4tdBzXfi2AJewlIQgt/9ZjGukYNyVI3uDFN9J4hgsxCbYFSYXEVr+c
	nDXv/6bD41uVZFnPIcYIm5zpzObYieZS/45bzVw28JJdyyRzkMuSrDt3CHzqK1jckZ/4zSVIDNsSL
	Wh2o+vwLYHMVjtGDQAyz1zLtWeB3UBEz+mQh8P55o3X4uhPtnbCpxPRsPqmvS6ZN4isDE/43Vo/TN
	OgMX66r/Jam8H24OgZ+wC2ijlsGxKdzVpHtGADvqRi3zpe6Ev6TmJi0dZzubjZd4ebvW7kq0XxnO7
	so2PXV9aw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ8lI-00FLOg-Gf; Mon, 08 Mar 2021 05:49:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ8ky-00FLJU-Ek; Mon, 08 Mar 2021 05:48:45 +0000
X-UUID: aa5657860bb642d3bbbe525f766711cc-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vUt83uaZ74x8mpNOiTRiaG9i+zb+gwMOmWmUWAk1WqA=; 
 b=Ao4vnrDzn5WeU//IDh0NLLTpUu48czx57Sgyush0Ip2ieBJtjkIlN4BEJ5I3IUmAndp5mq1Y0MNV8qG5FHjFzY+/D5kd7Pl7EYSTSkZE9AIV1IJlzdzYWhQYqsSmh2HR50hlTAuXu8vl4f7IsWR92j2n4cNB5QaIpJiwxHdLbvc=;
X-UUID: aa5657860bb642d3bbbe525f766711cc-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1459119739; Sun, 07 Mar 2021 21:48:37 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 21:38:15 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 13:37:49 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 8 Mar 2021 13:37:49 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
Subject: [PATCH v4 06/12] arm64: dts: mediatek: mt2712: harmonize node names
Date: Mon, 8 Mar 2021 13:37:39 +0800
Message-ID: <20210308053745.25697-6-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210308053745.25697-1-chunfeng.yun@mediatek.com>
References: <20210308053745.25697-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9F71C23802741888ED7DB20ACE42FC0D014A0D0F4C738FF44BFF78955D8412FF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_054841_859071_3C5AA903 
X-CRM114-Status: UNSURE (   9.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is used to fix dtbs_check warning.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v4: no changes
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index db17d0a4ed57..a9cca9c146fd 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -805,7 +805,7 @@
 		ranges;
 		status = "disabled";
 
-		usb_host0: xhci@11270000 {
+		usb_host0: usb@11270000 {
 			compatible = "mediatek,mt2712-xhci",
 				     "mediatek,mtk-xhci";
 			reg = <0 0x11270000 0 0x1000>;
@@ -818,7 +818,7 @@
 		};
 	};
 
-	u3phy0: usb-phy@11290000 {
+	u3phy0: t-phy@11290000 {
 		compatible = "mediatek,mt2712-tphy",
 			     "mediatek,generic-tphy-v2";
 		#address-cells = <1>;
@@ -869,7 +869,7 @@
 		ranges;
 		status = "disabled";
 
-		usb_host1: xhci@112c0000 {
+		usb_host1: usb@112c0000 {
 			compatible = "mediatek,mt2712-xhci",
 				     "mediatek,mtk-xhci";
 			reg = <0 0x112c0000 0 0x1000>;
@@ -882,7 +882,7 @@
 		};
 	};
 
-	u3phy1: usb-phy@112e0000 {
+	u3phy1: t-phy@112e0000 {
 		compatible = "mediatek,mt2712-tphy",
 			     "mediatek,generic-tphy-v2";
 		#address-cells = <1>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
