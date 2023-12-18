Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CBDC35274
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Dec 2023 08:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xGMjqCnU4DOn/f9DXOXBpSzk3yufxfmuca8NVriI3g=; b=s/z+2H7aCYwIHuq5ogFDWrMpGo
	ESFpOT0RfGMNIOliS6fmn6Ess95WEtd9UbDF5rmTGLpSxfhhi4fKGic7+QGz3qM2sAB4a3DVfH6wU
	6tUEFYngy00jSRtM5775N/0IYzuhPSi1hVVTWehp6LSzHGSNciatBeG0ylegXnQe+6oiaZX1A4Ayn
	9XveKdUysvSSy+kkEyoutzGWB/6dHfIJBccTSPWwLTdpRJK7fieKrLu1YtmIy+K7BiKCANoPxDcEh
	1FxQSJYKmKlLC6N3iQONeHDwwVWa61iuwKQ1eHwPDBx0jm/VqO9SIms00QqiYvxOlIZsAwJXXUNXX
	4pDfoaEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF97Z-009UTp-1y;
	Mon, 18 Dec 2023 08:37:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rF97W-009US8-23;
	Mon, 18 Dec 2023 08:37:03 +0000
X-UUID: 9b04244c9d8011ee958cff29c719f35b-20231218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3xGMjqCnU4DOn/f9DXOXBpSzk3yufxfmuca8NVriI3g=;
	b=NvERfp11Qk8qFK40I2xgTd0xfqR2PdT6/3oZYSU9dbb8WVmXQzV95ZanSyoHsxvOuPTlY3bPbYQVjh2PZ9e3pheKszsrtRBwXPep+xMZUZ5yz1JHWJRtLBTSEjWv6nty4tRTgtS2YLZR/QBDA7wBk6Jbp5LrbXPGau5ysIsU36Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:ddcf5d06-2b6c-4cf7-adef-20fad27345c5,IP:0,U
	RL:0,TC:0,Content:46,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:46
X-CID-META: VersionHash:5d391d7,CLOUDID:0011ea73-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9b04244c9d8011ee958cff29c719f35b-20231218
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1413639720; Mon, 18 Dec 2023 01:36:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Dec 2023 16:36:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Dec 2023 16:36:34 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 1/3] dt-bindings: mailbox: mediatek,gce-mailbox: Add mediatek,gce-events definition
Date: Mon, 18 Dec 2023 16:36:02 +0800
Message-ID: <20231218083604.7327-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231218083604.7327-1-jason-jh.lin@mediatek.com>
References: <20231218083604.7327-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_003702_678909_7509F652 
X-CRM114-Status: GOOD (  10.99  )
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

Since mediatek,gce-events property is a HW event signal from GCE,
it should be defined in mediatek,gce-mailbox.yaml and change the
description of mediatek,gce-events property in other bindings to
reference mediatek,gce-mailbox.yaml.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml  | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index cef9d7601398..e4da0a58c943 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -49,6 +49,13 @@ properties:
     items:
       - const: gce
 
+  mediatek,gce-events:
+    description:
+      The event id which is mapping to the specific hardware event signal
+      to gce. The event id is defined in the gce header
+      include/dt-bindings/gce/<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
 required:
   - compatible
   - "#mbox-cells"
-- 
2.18.0


