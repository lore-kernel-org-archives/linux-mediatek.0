Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECBDC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 05:50:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5869651F1
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 05:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5869651F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cmzHbx7B64c7BGBQVzR1/q/Bq8dXaeg9L99QQ4n6N30=; b=k8AE3ZlbbL4vJrmx/EctvEEi2
	l8GzqJv3NzeeqJrZb6Yj7YZ2cjmD6ZzO9PQ96J8nQC4rWg5ZGtQSf27t1UPVhi4ppMgJMJplzPskc
	lOtktAJE26IWRik4MYtrtmgsT/eLddNkEkaP1HlDKVeyHYlxuITYJPmIBwTDhAsWp0hxNRyfiEDje
	2WMBYDzgl9HxEkR6q3WwmGsjMutTLWH+7DoxGrFwVueP+oC9LV1/viiEPev1N17KH2hoHQrfZgcMK
	HmozDPTCOdLuB59GBpGhf4yTaLwgbn0ITuyikHOMH8RDbeH2d8ODfnH5rz79mcKBjGkNAV8ewGE9A
	YZ23TPMYA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ8m8-00FLeN-EF; Mon, 08 Mar 2021 05:49:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ8lA-00FLJU-AK; Mon, 08 Mar 2021 05:48:56 +0000
X-UUID: 7283c645b7b043a98e08b32744102417-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8wfkttZWnAB7Hd6T18TTA6CIkBDIjHNqeULAiw9i5QI=; 
 b=IfLxIZTvCZcYa0tBsKnYPUd74rNp1tyK3b8RpcOSE+gZ7sRRj6oBnY17coksPC8NpLIbF9LG0i9Wn9NQxeFh+wmoIS2/dXcZ1vh13f/Mi4GOJz3+PP8ESW1xygjrSCCUDMDlliEfBgU4y6lM289ketRlIGd0N0tLQo6uUS73jHk=;
X-UUID: 7283c645b7b043a98e08b32744102417-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 993783441; Sun, 07 Mar 2021 21:48:37 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 21:38:15 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 13:37:50 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 8 Mar 2021 13:37:50 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
Subject: [PATCH v4 08/12] arm64: dts: mediatek: mt7622: harmonize node names
 and compatibles
Date: Mon, 8 Mar 2021 13:37:41 +0800
Message-ID: <20210308053745.25697-8-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210308053745.25697-1-chunfeng.yun@mediatek.com>
References: <20210308053745.25697-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 74EEB831D98E506BC6192B49CC99B1B66B241134E7177A9A45771D99F371AFA22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_054853_159845_68963CEC 
X-CRM114-Status: UNSURE (   9.26  )
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

This is used to fix dtbs_check warning

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v4: no changes
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
