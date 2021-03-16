Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B0D1C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 09:25:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3DF865014
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 09:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3DF865014
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DZN3cNsOD7Fi16EIbBxqptukvbbPFy5VVyfAW+ClFH4=; b=BQaSSPFg9QjcF2pfYn4gHP37z
	luCL/J1HXwDhJABHEtWv0nF6s+SBvko5YV7uPRhl7nBEHZbXuYZb9G988offOB7SebCdUvan6M7rH
	jRr1+/nW/X9zWlV1UQzmYzmQLSD54EsPxAWC3OvdBGDjrupePEJ612a3ZoRUyJbMfNJPxrvLxCCc8
	CaVXBNGV3/SHTjDLh2L4p8qUJHfcMAiJiOtK72NBSu/++QZVPgUANUJo1b/sTTkv9n1Mo/MGPmrbe
	BbmPe0NY/hxxNFDB9PFXJfWau2/lbnvvSV9P6cFwrCOuOBJj/lH8zSCqX03AsgDzBI37bxplpGBTZ
	KRnR7RTaw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM5xL-000G7E-S3; Tue, 16 Mar 2021 09:25:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM5ui-000EiS-9C; Tue, 16 Mar 2021 09:22:58 +0000
X-UUID: 797fca850a404995bd05a9b97ff93794-20210316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=i9bj3mWzzbvV4MYk1I7HHAl+qUi6knx6RQDQMXhg0pA=; 
 b=u6WyCGh7CTXacbzI4F9c3rs9JBiUuVEhUAEQxU8EbZ98hYdu/AKrxspQ+vAn+b48XG8sGwXKYcj41PI5HNirx8g2rEe+dvL8SEgtEUD2wo/brtWVm5TgDa3PtTdi5qUu7fAK7LJvRqNA8i/zjv1OCI72GGZIYH6h/FADc2J5QXc=;
X-UUID: 797fca850a404995bd05a9b97ff93794-20210316
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 233471944; Tue, 16 Mar 2021 01:22:49 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 02:22:48 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 17:22:34 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Mar 2021 17:22:34 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jie
 Qiu <jie.qiu@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Cawa Cheng
 <cawa.cheng@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: [PATCH v5 09/13] arm64: dts: mediatek: mt7622: harmonize node names
 and compatibles
Date: Tue, 16 Mar 2021 17:22:28 +0800
Message-ID: <20210316092232.9806-9-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
References: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_092256_761026_2C8EECEC 
X-CRM114-Status: GOOD (  10.06  )
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

This is used to fix dtbs_check warning

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v5: no changes
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 7c6d871538a6..890a942ec608 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -742,8 +742,8 @@
 		status = "disabled";
 	};
 
-	u3phy: usb-phy@1a0c4000 {
-		compatible = "mediatek,mt7622-u3phy",
+	u3phy: t-phy@1a0c4000 {
+		compatible = "mediatek,mt7622-tphy",
 			     "mediatek,generic-tphy-v1";
 		reg = <0 0x1a0c4000 0 0x700>;
 		#address-cells = <2>;
@@ -877,8 +877,9 @@
 		status = "disabled";
 	};
 
-	sata_phy: sata-phy@1a243000 {
-		compatible = "mediatek,generic-tphy-v1";
+	sata_phy: t-phy@1a243000 {
+		compatible = "mediatek,mt7622-tphy",
+			     "mediatek,generic-tphy-v1";
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
