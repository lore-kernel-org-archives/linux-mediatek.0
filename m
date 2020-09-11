Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19CCDC43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 13:49:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90B1F20731
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 13:49:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jqt83+/p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VuJmwV12"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90B1F20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jEiNS8kSXOdy2ivVVWirqfHhp+XIb0bXwtChKUtCiB8=; b=Jqt83+/pFnhkVaIon9JZQAo93
	+p06AZqcxSXdXaMDc1mmr0TcJ00+bItlrjQEpCLpJRHLRMSwTwJ+sIxR17EAqUgfpmAnz6y7I73y3
	HrWNGCQArvNOVXxynaOzLc6ONFx++AcckKJFoBmnFuQLhygFIvmNo+S8p+cZIj5v8wZTNgAnHQ5vK
	m1QyW09WPfsNS7UVDi0FVLRaOY8Im7FJdTKoc5PKNti+OTJcy9N8nqGqjD7dkgG4UmVix0eKkyGs8
	KiVZGgGl552loD5gqIAX0I7D4JuBApWXZXk+5trf/G8ie9El7kqw+7A/+k8l+hZ1sJZ/DO5guBf9s
	/TTPwfKog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGjQg-00041g-Ex; Fri, 11 Sep 2020 13:49:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGjQY-0003xy-9g; Fri, 11 Sep 2020 13:49:23 +0000
X-UUID: 56e2579d1db14607adf8840bedef0f49-20200911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qEsEEBcbZKKGz2cC6SnzGd3SfANTHd4U0tvYFe4wYGw=; 
 b=VuJmwV12yQHDHLimIzpryx7sTUAa2+RJDfXX37vTx5lDFJ9Df4xLOSyAQWxnHnIG0L0lXIr3a7+3dmOEq4El8LeQlFfTSbPX1mCG/aGdZt3oP6jktrvxffK5bU4jVuqnu3sgFAhmr23bbIvbTOEbZcKnj3qSVULkTg9RFaXBONU=;
X-UUID: 56e2579d1db14607adf8840bedef0f49-20200911
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1188947473; Fri, 11 Sep 2020 05:49:21 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 06:49:19 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 21:49:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Sep 2020 21:49:16 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Russell
 King" <linux@armlinux.org.uk>
Subject: [PATCH net-next v5 6/6] arm64: dts: mt7622: add mt7531 dsa to
 bananapi-bpi-r64 board
Date: Fri, 11 Sep 2020 21:48:56 +0800
Message-ID: <9ad3baefb672805153c737f6259966d1c9b98c2b.1599829696.git.landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1599829696.git.landen.chao@mediatek.com>
References: <cover.1599829696.git.landen.chao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_094922_467472_4F0DB1A2 
X-CRM114-Status: GOOD (  11.00  )
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
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, opensource@vdorst.com,
 linux-mediatek@lists.infradead.org, Landen Chao <landen.chao@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mt7531 dsa to bananapi-bpi-r64 board for 5 giga Ethernet ports support.

Signed-off-by: Landen Chao <landen.chao@mediatek.com>
---
 .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index d174ad214857..9a11e5c60c26 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -143,6 +143,56 @@
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
+
+					fixed-link {
+						speed = <2500>;
+						full-duplex;
+						pause;
+					};
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
