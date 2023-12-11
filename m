Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0A6C10F04
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 03:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cV6riP0Ow3bKYWIQlnMOTDlEkCQ8oQ7sgKAuWFgdgY4=; b=PvdQwywRaR5Th1sN1vA5U4Ufkh
	/bi7vPpE1qOqBW0BOidUjBeYacR1jBieb54LyvVv8o02GkDjlt5BwiVw5ppQIWlyuUeAHEmKvUcA6
	WiCgMlDpoXdsFTteZxVFRqcb0Voi9dtA2BFvJKHdVFy79U/H1YGFH8Ik4bvS8hcIMa/F1YP32vnVR
	hz/mdj9IeK1Xsx6iYesXwUdIlM/B+L5161N+ewnQ9CxagDuKxdsZQscZjcBbZbibCqU9wVh9pEWgu
	afqMIcuRq6zHP8BpiGVyh/ZbsZpdrh4L9F7GD1Hn5ymbLjNQTrCNVX7EpAlibAYFsl4sibGHVq50k
	QeJ4xjdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCWcz-003r1F-07;
	Mon, 11 Dec 2023 03:06:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCWcv-003r07-1h;
	Mon, 11 Dec 2023 03:06:38 +0000
X-UUID: 48603acc97d211ee958cff29c719f35b-20231210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cV6riP0Ow3bKYWIQlnMOTDlEkCQ8oQ7sgKAuWFgdgY4=;
	b=X1clbtpVx7GagyIQVEFgpQjRHJvp5ECvLto8GaNbHHoWbkpLCnWOr0btlwetlO29Dinn1YDOeY2WGNgQV7Z7gHB0ix3am/vz2X12kTbVcgqdkuwQzilnx6auEQ5BvaaUmgv0/YNoXY9LXsghA6N0lH8wIfJM9WNeACHnt5HmHHU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:d598369c-990c-4496-af2f-a496b72c845f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:6cb704bd-2ac7-4da2-9f94-677a477649d9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 48603acc97d211ee958cff29c719f35b-20231210
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 661870958; Sun, 10 Dec 2023 20:06:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Dec 2023 10:56:26 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Dec 2023 10:56:26 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: phy: mediatek: tphy: add a property for force-mode switch
Date: Mon, 11 Dec 2023 10:56:23 +0800
Message-ID: <20231211025624.28991-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.360500-8.000000
X-TMASE-MatchedRID: RRfbWjdhZrr4Q348LKfXOO7KTDtx8CggtjHGWON8yeP9Ez/5IpHqp/pZ
	jWQiqBlh8/nBmhGQ+G7kiLqWsGi3RpShxRaS8Dn10FfSApnujPiAfODDLypXmtzOQo7mTgA+FVk
	w4X07kmjaFM5TPGLdCHBSByhCpcr+QdZuZ42vrpFu4W5gEinK6fMfibAjlaopIZUd3wirJi2jxY
	yRBa/qJcFwgTvxipFajoczmuoPCq0+xoUgd8obQZ05FFJdMwGG0mrAuei0ALC9AvG/HBY0xoHcO
	amUia0t
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.360500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 10541A3B766F5DABAF750EE74B7A1B24E217417B7A2FC9C7B112FDA6E978F3FF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231210_190637_585872_E098D665 
X-CRM114-Status: GOOD (  10.12  )
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

Due to some old SoCs with shared t-phy between usb3 and pcie only support
force-mode switch, and shared and non-shared t-phy may exist at the same
time on a SoC, can't use compatible to distinguish between shared and
non-shared t-phy, add a property to supported it.
Currently, only support switch from default pcie mode to usb3 mode.
But now prefer to use "mediatek,syscon-type" on new SoC as far as possible.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: modify commit message, and property description 
---
 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index 2bb91542e984..acba0720125d 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -235,6 +235,15 @@ patternProperties:
           Specify the flag to enable BC1.2 if support it
         type: boolean
 
+      mediatek,force-mode:
+        description:
+          The force mode is used to manually switch the shared phy mode between
+          USB3 and PCIe, when USB3 phy type is selected by the consumer, and
+          force-mode is set, will cause phy's power and pipe toggled and force
+          phy as USB3 mode which switched from default PCIe mode. But perfer to
+          use the property "mediatek,syscon-type" for newer SoCs that support it.
+        type: boolean
+
       mediatek,syscon-type:
         $ref: /schemas/types.yaml#/definitions/phandle-array
         maxItems: 1
-- 
2.18.0


