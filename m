Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E9AC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 13:10:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC0FB22285
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 13:10:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rk5fJWWY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OEyST/4D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC0FB22285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DWFzfy2dh400ApByVYDCTSxAvWMI4wMttEYqMtnVcWg=; b=rk5fJWWYRcEgvMLsY+P8A79Gq
	zS7wTeQnV6M4WQ+AvikRLipqIOgvIpEwjL6Bafr7MKq6S0aMHpe5mZKHquDSncmkzuYXCE0zC37bg
	wNyT5/G5YX/znBcD3F4X/JwS2FEscUVl8K9IB9N4nD1QekvsXKyL9fcudO94c50fTBRDhbWsZ+w8J
	WG5icZNJyZCG2K4yvmOef7Uh+Jy7ypBi4VbscSnFK1jxTgMJH8sv+uylKVstbrWaE1D4Y2YxQ/ZqP
	vny5uTDR/UXeJ3B8YTTdOgxULSZqFN+7R9Jp/iZXtIdDDKKQtxXmt19RFjXuRCfor2MNDghpUQy5K
	sV17d8g/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGioW-0000Ih-BR; Fri, 11 Sep 2020 13:10:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGioK-0000DI-N8; Fri, 11 Sep 2020 13:09:54 +0000
X-UUID: a83e50c9205047e2b933a737b1ba3980-20200911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DAk4ZLiJ85a7SZSqLzCU+r3oKFMIHRDhPdBXOk4LJMo=; 
 b=OEyST/4D9C2+CPe0i+N0dOah7Z7rt/VkeNI+MfEwxBkK7hUDRekWe124tEi9LjhdNya6zbrzKV5GmjL52zhkNdATUBdriq36guyg6WR8fP+rG4fs1sgasXDRHXT2dwRfHLXIEI+5P7nLRNg2bLjF3O3pmhkYRPA5XDVm2VoUDrA=;
X-UUID: a83e50c9205047e2b933a737b1ba3980-20200911
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 999615909; Fri, 11 Sep 2020 05:01:32 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 05:57:44 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 20:57:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Sep 2020 20:57:41 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Russell
 King" <linux@armlinux.org.uk>
Subject: [PATCH net-next v4 3/6] dt-bindings: net: dsa: add new MT7531 binding
 to support MT7531
Date: Fri, 11 Sep 2020 20:56:25 +0800
Message-ID: <3890c6b32e984e75be2e5fbfdfbd8da8cc30beaf.1599825966.git.landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1599825966.git.landen.chao@mediatek.com>
References: <cover.1599825966.git.landen.chao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_090952_922348_FA13C71A 
X-CRM114-Status: GOOD (  12.96  )
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

Add devicetree binding to support the compatible mt7531 switch as used
in the MediaTek MT7531 switch.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Landen Chao <landen.chao@mediatek.com>
---
 .../devicetree/bindings/net/dsa/mt7530.txt          | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
index c5ed5d25f642..560369efad6c 100644
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -5,6 +5,7 @@ Required properties:
 
 - compatible: may be compatible = "mediatek,mt7530"
 	or compatible = "mediatek,mt7621"
+	or compatible = "mediatek,mt7531"
 - #address-cells: Must be 1.
 - #size-cells: Must be 0.
 - mediatek,mcm: Boolean; if defined, indicates that either MT7530 is the part
@@ -32,10 +33,14 @@ Required properties for the child nodes within ports container:
 
 - reg: Port address described must be 6 for CPU port and from 0 to 5 for
 	user ports.
-- phy-mode: String, must be either "trgmii" or "rgmii" for port labeled
-	 "cpu".
-
-Port 5 of the switch is muxed between:
+- phy-mode: String, the following values are acceptable for port labeled
+	"cpu":
+	If compatible mediatek,mt7530 or mediatek,mt7621 is set,
+	must be either "trgmii" or "rgmii"
+	If compatible mediatek,mt7531 is set,
+	must be either "sgmii", "1000base-x" or "2500base-x"
+
+Port 5 of mt7530 and mt7621 switch is muxed between:
 1. GMAC5: GMAC5 can interface with another external MAC or PHY.
 2. PHY of port 0 or port 4: PHY interfaces with an external MAC like 2nd GMAC
    of the SOC. Used in many setups where port 0/4 becomes the WAN port.
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
