Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67044C4706F
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Dec 2023 18:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Q8RSiyjSUfHILmoW4urj0AJtB2OmdXHTaWG7QUm9as=; b=YASHgbnZAR39RrbjhJ7ZCzhxBJ
	t6qN6bdTU4nJvOvPVG5x1Q6ZEYibqI5tdbX+NOGwbqDwQYs8cIECYBk+uCO77P9qw+D0SQkW5u3hv
	ztW42FwFm4IyzexkYwHBflAP+9CX4p1kBmB+qDCEOzsHUVcmYe8/luT/0T/OiGSaV8sH2bJjHLupJ
	z3mH11qR3kyaZcYRpkGYZXbuVCQ20JsFloZs/FuUABiOudZVsGdxU/A1/4VJv2iobvZJ35618GoaH
	2krcxJjW6ly5am0/uAta3ESJfNJopBMXYXaHETQqudL+8F+2XG27UuZEVc6+HHm0eYeaRL1EQwugw
	2bBWjSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rH6lb-008Io1-25;
	Sat, 23 Dec 2023 18:30:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rH6lH-008IYf-1z;
	Sat, 23 Dec 2023 18:30:12 +0000
X-UUID: 4d7e6436a1c111ee9b09ad09c76753c8-20231223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9Q8RSiyjSUfHILmoW4urj0AJtB2OmdXHTaWG7QUm9as=;
	b=r24UaKmH/FI/yIQky0l3ENlyXwCdAlVWFVRxAcU2CFEM6HPhL/NkoBDSrdO5hKb/R02Uxz3llbrDowVx7hdZEd1tQRz9jbjy+QBWFtlO2u4tWGXoF3o+Z55VjNf1Ioruchc4PanXjxC5hkc4U3qs0xmXga9tsQ/1A2YPUdlhhlU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:ba505d3d-d34f-4ee1-9224-a1c1eb8918c5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:4d721882-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4d7e6436a1c111ee9b09ad09c76753c8-20231223
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1811069440; Sat, 23 Dec 2023 11:30:09 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 24 Dec 2023 02:29:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 24 Dec 2023 02:29:35 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
	<jkardatzke@google.com>
Subject: [PATCH v3 11/11] arm64: dts: mt8195: Add secure mbox settings for vdosys
Date: Sun, 24 Dec 2023 02:29:32 +0800
Message-ID: <20231223182932.27683-12-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231223182932.27683-1-jason-jh.lin@mediatek.com>
References: <20231223182932.27683-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.491300-8.000000
X-TMASE-MatchedRID: hnk2xlnUc9YCNMj/7qB/g11tpWYE7Ops31GU/N5W5BDOb3+o8TfeDuLz
	NWBegCW2wgn7iDBesS0nRE+fI6etkuizN9J3NgBH8RJ/GoffvHkPcq5zA38+/6zzbOcnWu8Z9mP
	29bcY/jAyNkLr5kiba29MNrHNAnxNgFAkt5cKyJCWOeeZGiKp5ICE5xpCtDRTUbJFyh4XXyqYo/
	TPOlMB4bCh3zE4wqa8DUCRr8oin+k=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.491300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 717D133535D00CDDC830E6143AA284E0754963BD2A23C955C3A4D68E41B2C6A02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231223_103011_660392_3814AA2D 
X-CRM114-Status: UNSURE (   9.18  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a secure mailbox channel to support secure video path on
vdosys0 and vdosys1.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index e0ac2e9f5b72..416d575be123 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2621,7 +2621,8 @@
 		vdosys0: syscon@1c01a000 {
 			compatible = "mediatek,mt8195-vdosys0", "mediatek,mt8195-mmsys", "syscon";
 			reg = <0 0x1c01a000 0 0x1000>;
-			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
+			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>,
+				 <&gce0 8 CMDQ_THR_PRIO_4>; /* secure mbox */
 			#clock-cells = <1>;
 		};
 
@@ -2806,7 +2807,8 @@
 		vdosys1: syscon@1c100000 {
 			compatible = "mediatek,mt8195-vdosys1", "syscon";
 			reg = <0 0x1c100000 0 0x1000>;
-			mboxes = <&gce0 1 CMDQ_THR_PRIO_4>;
+			mboxes = <&gce0 1 CMDQ_THR_PRIO_4>,
+				 <&gce0 9 CMDQ_THR_PRIO_4>; /* secure mbox */;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x0000 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-- 
2.18.0


