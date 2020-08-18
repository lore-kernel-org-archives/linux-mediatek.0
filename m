Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A767C433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 07:25:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 033F8205CB
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 07:25:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rbpxSC6R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="U+yfBnti"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 033F8205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+kv1jyJWq6DR+iaNEshHAz/HUA7v6s2p/PVxFboqoy8=; b=rbpxSC6RAxGsUp7dZd/xKNlq1
	xyqtrE72IPoyrBG0+Z7wyMVaFKc4AJ/9Hgi/WX7m5nrL8rivsWCDLQll0rUxbas/Gmk/2JBwzBABM
	6yfFf/VOCK+jHAfoiqfmxqkcFRgxQwH+Y0xC8fJnqQyJONPuzDucQ8gdGoEIfaefbCb9A8wQCmERo
	HnqKf7t/G+c82VqRJxfdB4UpvrVd3ihuX1nxkxoE0NmbZ6dkcGn1lfmrIJMtcAjxqsD6JIvZt2QIA
	AGsMR+5T8OyW91Mcoe7ZIUfLN8odXi0hjIwOl3BfXO6xQeMuKDxO8H7oaL1eoABVt/GrmohT/VQl2
	gvLFUzGhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7vzL-0005No-SD; Tue, 18 Aug 2020 07:24:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7vzI-0005Is-C8
 for linux-mediatek@lists.infradead.org; Tue, 18 Aug 2020 07:24:53 +0000
X-UUID: 1f2d6635bf8e4c01bacf80c4e6d708fe-20200817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=cX1RyWC6RhWrmSa5l9WmiLo7asIr+FhEw7uQh+t/SNY=; 
 b=U+yfBntiTCeAsf9E+TNx26TZRCZY/8mJbF0Tb0He5ewi3ViMsiJKrFXGRAQfzIZGuLo0brokjQ03TfxGdTp/TIz7j7GH1ruMQQSked5EIq2i0WGXvzi90FfkRLHlYUXLn40ZhTxrcd4stT+OzZNWEz6Xdd9XZYzkAWSZfZBv61M=;
X-UUID: 1f2d6635bf8e4c01bacf80c4e6d708fe-20200817
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 981247343; Mon, 17 Aug 2020 23:21:38 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Aug 2020 00:14:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Aug 2020 15:14:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 18 Aug 2020 15:14:44 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: <andrew@lunn.ch>, <f.fainelli@gmail.com>,
 <vivien.didelot@savoirfairelinux.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Subject: [PATCH net-next v2 7/7] arm64: dts: mt7622: add mt7531 dsa to
 bananapi-bpi-r64 board
Date: Tue, 18 Aug 2020 15:14:12 +0800
Message-ID: <2a986604b49f7bfbee3898c8870bb0cf8182e879.1597729692.git.landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1597729692.git.landen.chao@mediatek.com>
References: <cover.1597729692.git.landen.chao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_032452_581413_D36F88A7 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: devicetree@vger.kernel.org, dqfext@gmail.com, frank-w@public-files.de,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 opensource@vdorst.com, linux-mediatek@lists.infradead.org,
 Landen Chao <landen.chao@mediatek.com>, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mt7531 dsa to bananapi-bpi-r64 board for 5 giga Ethernet ports support.

Signed-off-by: Landen Chao <landen.chao@mediatek.com>
---
 .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index d174ad214857..c57b2571165f 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -143,6 +143,50 @@
 	mdio: mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		switch@0 {
+			compatible = "mediatek,mt7531";
+			reg = <0>;
+			reset-gpios = <&pio 54 0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					label = "wan";
+				};
+
+				port@1 {
+					reg = <1>;
+					label = "lan0";
+				};
+
+				port@2 {
+					reg = <2>;
+					label = "lan1";
+				};
+
+				port@3 {
+					reg = <3>;
+					label = "lan2";
+				};
+
+				port@4 {
+					reg = <4>;
+					label = "lan3";
+				};
+
+				port@6 {
+					reg = <6>;
+					label = "cpu";
+					ethernet = <&gmac0>;
+					phy-mode = "2500base-x";
+				};
+			};
+		};
+
 	};
 };
 
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
