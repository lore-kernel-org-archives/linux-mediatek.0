Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA662C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 13:49:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 748B820731
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 13:49:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gus3ntIp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Dcl4auch"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 748B820731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DWFzfy2dh400ApByVYDCTSxAvWMI4wMttEYqMtnVcWg=; b=gus3ntIpyF7JYTy0QhsLI/Iti
	ZYKgKn1YGSdhvWVrHJNiEj+N86VsQc63PerF8/B2AwxW5g1I5j3Eo+OlUAsitsdU69CO+uF1nnFOw
	4zKAM4MmOE6cLMwgOqFKGhwwOhm9xWGI7O0Yh4OOhNYUKea7q7CJSe1/cv6fLZiozycBcrv6t+aS2
	8iS+VhbdmON+smqphgCmWIEQRQxFFRFWdmT0Ht2xbYbEQR4yiM1Iwg0TrGV5oUbVGzCc2u1OPW+pt
	VbgxhUIM+i+PMZgwdeYB6pAGt2ROLuj3h2CrdalscjYIDk6WNB5PlA6y+Djdy1aZ7Mkd7DQbMkn5r
	PLfJJqThw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGjQs-00045M-3f; Fri, 11 Sep 2020 13:49:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGjQZ-0003yY-9p; Fri, 11 Sep 2020 13:49:24 +0000
X-UUID: 6e3933229e514351af2cebcd2dab3fe1-20200911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DAk4ZLiJ85a7SZSqLzCU+r3oKFMIHRDhPdBXOk4LJMo=; 
 b=Dcl4auch2vs89VqeaA5hBNR3kV3SB/JZKibFy/hwOleZHrJMsDpJpeSeMH7/uUdctIJG3x8pZVRH8Cp4Kui8VqHYS1j68kH8RvTrQZlnvONdCmN2XUzikBcWMHAPp4StVS7ShW2qPm955HmsvtwNA2qBYE6zxd3ObaE9Kgr9zCk=;
X-UUID: 6e3933229e514351af2cebcd2dab3fe1-20200911
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1061173244; Fri, 11 Sep 2020 05:49:18 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 06:49:17 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 21:49:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Sep 2020 21:49:13 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Russell
 King" <linux@armlinux.org.uk>
Subject: [PATCH net-next v5 3/6] dt-bindings: net: dsa: add new MT7531 binding
 to support MT7531
Date: Fri, 11 Sep 2020 21:48:53 +0800
Message-ID: <b5d44dc310a45dc139639d968350f5888dc7e1ac.1599829696.git.landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1599829696.git.landen.chao@mediatek.com>
References: <cover.1599829696.git.landen.chao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_094923_517143_012F6958 
X-CRM114-Status: GOOD (  12.78  )
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
