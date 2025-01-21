Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8D9C02182
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2025 06:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G4jUXsEbJlbZvKNo47vVFAbnJBqKkTE/5kZxLs1/jak=; b=2KSyjah3QtdnF2OvFvVu2XYnnR
	ErU7rGzTNKtM2WK8gM8yeQz+AL7hO4SET4OCOyzQSeoRQ/ErucLV/nn4RrQHfsLmroccKEwS9/Voo
	BgqIQom+GsEMP66TkrJVV9cYLAVh/WE4SnsBfbiHbaRZGEDeoCVxC+fYcbt0AKdWtxX39Cec2W9a3
	gbPj43sedBZ8W5OJqrh/IdIeKHvQzxb+iztQxty/DG4Sh7GU1hd3LeCGXJfXcce5XKEeWP5rXg/uq
	q4nSrVUJ2HhPJyjRxuH2qrZM9oN9PKeJd7139S8K7DyjIeLi5IpJII6btYS74BDyMSY/aqpCP2EN/
	OV2EbDkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8A6-000000072Mn-1pM2;
	Tue, 21 Jan 2025 06:54:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta86A-000000071u6-40h3;
	Tue, 21 Jan 2025 06:50:56 +0000
X-UUID: 0c2fe556d7c411ef9048ed6ed365623b-20250120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=G4jUXsEbJlbZvKNo47vVFAbnJBqKkTE/5kZxLs1/jak=;
	b=Sdd7gGOsXf+uD3XzKJxnaO7LEaTLPr+0bR4Cgd2GNPa/OAzaSGgE1L0RgjrkvatKQhC06bFW3ORLu8uD3gntCw+DwZsABxQkMvM4LVA53ZqK5+5PHKjggztm1YpWan7pBSed1/fSND6ijFCBUMqtu2Rah7D3PHtiysZPq/+Csew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:cf805b60-4bc6-4318-bc81-153151760d69,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:60aa074,CLOUDID:74c63638-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0c2fe556d7c411ef9048ed6ed365623b-20250120
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1667418290; Mon, 20 Jan 2025 23:50:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 21 Jan 2025 14:50:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 21 Jan 2025 14:50:45 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Garmin Chang
	<garmin.chang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
CC: Friday Yang <friday.yang@mediatek.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 0/2] Add SMI LARBs reset for MediaTek MT8188 SoC
Date: Tue, 21 Jan 2025 14:50:39 +0800
Message-ID: <20250121065045.13514-1-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_225054_994617_CCDDEA1B 
X-CRM114-Status: GOOD (  11.44  )
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

Based on tag: next-20250120, linux-next/master

When we enable/disable power domain, the SMI LARBs linked to this power
domain could be affected by the bus glitch. To avoid this issue, SMI
need to apply clamp and reset opereations.

This patch mainly add these functions:
1) Add reset platform data for SMI LARBs to implement reset opereations
   in current clock control driver.
2) Add bindings to support the reset controller driver.

Changes v3:
- Drop the v2 smi reset binding
- Add '#reset-cells' for the clock controller in the image, camera
  and IPE subsystems.
- Drop the v2 smi reset driver and use the existed clock control driver
- Add reset platform data for SMI LARBs in the image, camera and IPE
  subsystems.

v2:
https://lore.kernel.org/lkml/20241120063305.8135-2-friday.yang@mediatek.com/
https://lore.kernel.org/lkml/20241120063305.8135-3-friday.yang@mediatek.com/

Friday Yang (2):
  dt-bindings: clock: mediatek: Add support for SMI LARBs reset
  clk: mediatek: Add support for SMI LARBs reset

 .../bindings/clock/mediatek,mt8188-clock.yaml | 21 +++++++++++++++++++
 drivers/clk/mediatek/clk-mt8188-cam.c         | 17 +++++++++++++++
 drivers/clk/mediatek/clk-mt8188-img.c         | 18 ++++++++++++++++
 drivers/clk/mediatek/clk-mt8188-ipe.c         | 14 +++++++++++++
 4 files changed, 70 insertions(+)

--
2.46.0


