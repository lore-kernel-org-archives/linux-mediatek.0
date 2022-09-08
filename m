Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3FAC38145
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 19:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oN8rt8SZCXADLx6jxUIMC30wpLr7gzVJHfpi0up2B60=; b=LXCv6hJGCez1AsVeXxtST/NdQe
	/muYfc3nXsI8BkaBnQoESPDsshi1YqtjVnYyx9QpIVRRNmQ+skdt5vgCk+YQwwzBwPqHIUOgNn4M3
	po97qV02kTD8X5uLa3krmZp7DLGf5JvpIz5viE7mqOylkKtGxl0DwsIJHy/O8EykfS+zSEpC/D6Gw
	QJQpduXMLuB4Pu06jZkvAh85b+uOCw1629yWAaX9yAYQqCCF6XE43a5J8pPQEQtC32fNec4+qyMoz
	S2NGlgcEWa4e1V8zhuN5NUrLKhZdifzlw5Oj9kusNy/FJBQLHpKxAezJoGRvquXZCWuXnPOFhzbcW
	VrvfWj7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWNIz-007gyF-Ry; Thu, 08 Sep 2022 19:35:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWNIv-007grp-MV
	for linux-mediatek@lists.infradead.org; Thu, 08 Sep 2022 19:35:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E1F0361DF1;
	Thu,  8 Sep 2022 19:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEED8C433C1;
	Thu,  8 Sep 2022 19:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662665704;
	bh=kYB4D/y+Ews0cFobxl2wcNCaZL6yhPF3HS5lGLSaQHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iW8uXyiqaI+2Y0Y3SQeYGhhDQDKgF7HZDTARKg/+khSslZU8DVQ7ZbsFTAw4N5m+l
	 Mp2EH4Pt3Awk6hQSjJqp59R3ul/MiJj/8MkCdvAy0tseGUsEX0IgqkS5Idw2Jt/GyY
	 ud/hNImRA0JNDnvP7RINaU4U5Jv0le117g7+2sSHLPgRxzuvEdVfgl8lf++4bObm90
	 3vYwERIMds4XHAynd52YvrFK30sBfnl2Y6Eox0ral65awmRKYwemQYsI0y86d+FAaJ
	 kv8HLuyah2cfgOy+fX/ormiitdhptz/ni8NFUL0NVQBCL4HXWTrpPelITjf6IrCsJo
	 8XQo8SRc1UsZA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH net-next 01/12] arm64: dts: mediatek: mt7986: add support for Wireless Ethernet Dispatch
Date: Thu,  8 Sep 2022 21:33:35 +0200
Message-Id: <e034b4b71437bce747b128382f1504d5cdc6974b.1662661555.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1662661555.git.lorenzo@kernel.org>
References: <cover.1662661555.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_123513_814150_71A63B3D 
X-CRM114-Status: GOOD (  10.02  )
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

Introduce wed0 and wed1 nodes in order to enable offloading forwarding
between ethernet and wireless devices on the mt7986 chipset.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index e3a407d03551..419d056b8369 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -222,6 +222,25 @@ ethsys: syscon@15000000 {
 			 #reset-cells = <1>;
 		};
 
+		wed_pcie: wed_pcie@10003000 {
+			compatible = "mediatek,wed";
+			reg = <0 0x10003000 0 0x10>;
+		};
+
+		wed0: wed@15010000 {
+			compatible = "mediatek,wed", "syscon";
+			reg = <0 0x15010000 0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		wed1: wed@15011000 {
+			compatible = "mediatek,wed", "syscon";
+			reg = <0 0x15011000 0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		eth: ethernet@15100000 {
 			compatible = "mediatek,mt7986-eth";
 			reg = <0 0x15100000 0 0x80000>;
@@ -256,6 +275,7 @@ eth: ethernet@15100000 {
 						 <&apmixedsys CLK_APMIXED_SGMPLL>;
 			mediatek,ethsys = <&ethsys>;
 			mediatek,sgmiisys = <&sgmiisys0>, <&sgmiisys1>;
+			mediatek,wed = <&wed0>, <&wed1>;
 			#reset-cells = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.37.3


