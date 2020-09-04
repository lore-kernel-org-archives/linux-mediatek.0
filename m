Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85905C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 14:23:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42709206B7
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 14:23:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K8rOFaw7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FKi0h0d1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42709206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LVvCuHrBWgFyINCFbaPEjFTwi03Qs4nDcG1a/F/CuWE=; b=K8rOFaw7VRwB2RKAU5dQMPB0t
	AqoIItUH08lLdyhf2YvlJbFrhTBmvmxOwXojOXnDswiQYwWIsUULIpaxRiJQgFZLJZ5KekBOkwJ5h
	6PKYGuO6wZcgEi1cdXJqgxs1UtRKkqraW8ybs2/wJb+ny5O4Rgo5bJpyHVeXkaQYGTIiAZsp9arB3
	Y696/XNs+Ya0+uBjHKB6HwxEjly73Fws1qYZBH4ZCezOV+mP+PT1gD/3vsN4FBCt02YT/D20npvfz
	cI3knvVQjQ2jbVI4JnDWQi65Q6bIw39o1jxSv5GErCWKv4F95FHXjycJc3rHJD1Z6yBfoNT3y1bAX
	iPyWsjYpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kECcN-0000mw-HC; Fri, 04 Sep 2020 14:23:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kECbo-0000YE-80; Fri, 04 Sep 2020 14:22:34 +0000
X-UUID: 7aa21589ae36413da2b949748a6bd513-20200904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BTL6X8fSaZsikWRWd13KVTZPGLYYIeADDItPNkTY2EQ=; 
 b=FKi0h0d1vkuaWusuVzu/z6rc1NVakzfU/ERm6wYYrsN4uz7+WlwbU6VhySkD8bUuqqydCA86n9jVgaEjVz8fg3o14iP3I3huz3qxfM6Ejss3JqkZAxGVg9e3jUaoG7Nb7ZFdktAE6qB6ICCXT2M9ssVTztxbUmnUzsgy3seKnb4=;
X-UUID: 7aa21589ae36413da2b949748a6bd513-20200904
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 643195323; Fri, 04 Sep 2020 06:22:29 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 07:22:27 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 22:22:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Sep 2020 22:22:24 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Russell
 King" <linux@armlinux.org.uk>
Subject: [PATCH net-next v3 3/6] dt-bindings: net: dsa: add new MT7531 binding
 to support MT7531
Date: Fri, 4 Sep 2020 22:21:58 +0800
Message-ID: <4ec3c9e6a219c09fc90d1be8d3d63da587ef6fba.1599228079.git.landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1599228079.git.landen.chao@mediatek.com>
References: <cover.1599228079.git.landen.chao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_102232_600189_C303AE38 
X-CRM114-Status: GOOD (  13.20  )
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
 Documentation/devicetree/bindings/net/dsa/mt7530.txt | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
index c5ed5d25f642..e22cd56d83fe 100644
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -5,6 +5,7 @@ Required properties:
 
 - compatible: may be compatible = "mediatek,mt7530"
 	or compatible = "mediatek,mt7621"
+	or compatible = "mediatek,mt7531"
 - #address-cells: Must be 1.
 - #size-cells: Must be 0.
 - mediatek,mcm: Boolean; if defined, indicates that either MT7530 is the part
@@ -32,10 +33,13 @@ Required properties for the child nodes within ports container:
 
 - reg: Port address described must be 6 for CPU port and from 0 to 5 for
 	user ports.
-- phy-mode: String, must be either "trgmii" or "rgmii" for port labeled
-	 "cpu".
+- phy-mode: String, the follow value would be acceptable for port labeled "cpu"
+	If compatible mediatek,mt7530 or mediatek,mt7621 is set,
+	must be either "trgmii" or "rgmii"
+	If compatible mediatek,mt7531 is set,
+	must be either "sgmii", "1000base-x" or "2500base-x"
 
-Port 5 of the switch is muxed between:
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
