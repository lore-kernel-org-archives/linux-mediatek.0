Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669AEC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 06:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f3OU7CjnbH//nRBpQtLH2qmbYACQpUO/AoU+C4fdwSk=; b=cJrUqzNMFj/8BM3jB2nNyx8VEG
	eguHXiDTP1DDYhcqMmQEVhCFCIJSMQ7WZLHdYkY4D/CMR71qz5wWNQ/i4Dchr6IF1FYOd86pmEeZu
	WxvCF2tkfzuFCJRWh4y0Gt19eRkcBaqEDfjZ50iwr8M4zwTsg2kEvmxckAxbGTxzaa85Suq2vNEfv
	4vBL8jn7NQfXb79RCZiMDh+msg6OWsukuCvYZ7uTTELNCemLXLJsh6EsSfIjLRw+lC8r16y3cxOm1
	rwW6Z8SgwS3TsMIhC6E9HWX0XD2GO+sIbyXN6sqRR1B0nhdD/C/EpPb33vtwQm+AW7iBKm4zwNsJZ
	KoSUbKvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDJ0m-00DpDR-0t;
	Wed, 13 Dec 2023 06:46:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDJ0j-00DpCd-0f;
	Wed, 13 Dec 2023 06:46:26 +0000
X-UUID: 532200f0998311ee958cff29c719f35b-20231212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=f3OU7CjnbH//nRBpQtLH2qmbYACQpUO/AoU+C4fdwSk=;
	b=cITbByqaRDolW3VOoU2HncXua8F+CWuO9+aYe+d5ayBKVaW64em2eCWSBKSm77u/5zfkUkNfvV8Ser7wsM5fv0LxFlE7c45/N2TsWGqAJpzptjw8ux7juS0ldqA9FgCKGo5OrLYFpZS6VWsfJxxXeb6Wmi8gAls0HecSPpegx/A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:76eee61e-5197-4558-8a63-2501eb10ad70,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:86b2bb73-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 532200f0998311ee958cff29c719f35b-20231212
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1368747604; Tue, 12 Dec 2023 23:46:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 13 Dec 2023 14:35:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 13 Dec 2023 14:35:45 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mathias Nyman
	<mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Macpaul Lin
	<macpaul.lin@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 1/3] dt-bindings: usb: mtk-xhci: add a property for Gen1 isoc-in transfer issue
Date: Wed, 13 Dec 2023 14:35:41 +0800
Message-ID: <20231213063543.12435-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.784700-8.000000
X-TMASE-MatchedRID: qeswZJixemc28LK855iUisp9Bgr5ONKhXxT5cg8K/td+YesuCgkiXLiN
	d7CXjOinEs/2xsX/gQY8osFhwSMl+G94Ipa1otxodARARTk4h595y+Nu7/EOOvHFoBcOsKez3yV
	lQmz6NJXYcj7A8ibVERc9sLlt0gKBwrxsKoa/qe0Q9/tMNQ4aijacujaE3jwhmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1eqPDNxZp5CwymZplauphdjnPhlbu/1N0Qxp+Se8vDj6zKqplBvusUA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.784700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0140AD80CA739D4971F882E7ED6BC57CCD2352AD2BB0F20DF4AA9A0AD1D19CE32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_224625_264594_0D8E6854 
X-CRM114-Status: GOOD (  10.90  )
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

For Gen1 isoc-in endpoint on controller before about SSUSB IPM v1.6.0, it
still send out unexpected ACK after receiving a short packet in burst
transfer, this will cause an exception on connected device, specially for
a 4k camera.
Add a quirk property "mediatek,rxfifo-depth" to work around this hardware
issue;
The side-effect is that may cause performance drop about 10%, including
bulk transfer.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index e9644e333d78..b8ed68574ba4 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -124,6 +124,16 @@ properties:
       defined in the xHCI spec on MTK's controller.
     default: 5000
 
+  mediatek,rxfifo-depth:
+    description:
+      It is a quirk flag used to work around Gen1 isoc-in endpoint transfer
+      issue that still send out unexpected ACK after device finish the burst
+      transfer with a short packet and cause an exception, specially on a 4K
+      camera device, it happens on controller before about IPM v1.6.0; the
+      side-effect is that may cause performance drop about 10%, include bulk
+      transfer.
+    type: boolean
+
   # the following properties are only used for case 1
   wakeup-source:
     description: enable USB remote wakeup, see power/wakeup-source.txt
-- 
2.25.1


