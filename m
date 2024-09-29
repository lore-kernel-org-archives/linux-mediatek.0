Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86B4CF6495
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Sep 2024 07:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=STXCOfMr88bze3bpw9ORgaFnaHy/N/l30mbf79iV5nA=; b=2eQzkpKlBR9D5qGmlLm/4bHOFD
	eb2wuxwquRSgCdXwJ75N/RMHMiSleEs9yelYO16AwR58h2BU5QRaxGLiSHLv/TT3PKIultP0yUXAU
	gs1m6XypOhyCBeZ6Muw9rucZ+mU6wWT6l9KMfOpHJ7JFfslJqgRdr82qPUs257LVg5IJycNU2kra4
	wyxvJrMMRV/3Q99ndRP2FnLrG1TsdVTgrmjIzKQYRMhZLWXPn7ItFFWow4MmM2m7X4nkRAn8Yi4p5
	gddjPT28hwjqH9nXOrwLNQ850jKAXUoQbJyxQ72x+zobLh6qJJfx8X2M/sYFqu791fysh7LwXspg9
	Yaf8YMkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suodN-0000000EMSx-2rSn;
	Sun, 29 Sep 2024 07:46:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suodK-0000000EMSI-26oa;
	Sun, 29 Sep 2024 07:46:24 +0000
X-UUID: e89f22f07e3611efba0aef63c0775dbf-20240929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=STXCOfMr88bze3bpw9ORgaFnaHy/N/l30mbf79iV5nA=;
	b=GAT1U+L3zSmujkwyli3YM7z1A5Jfsd1Xcpyn1xXPmyO+qChA7bQDK6iTu00TRftW+F7MBiU2zGIuDFJob71lcWk9UZfIW6dnVq1XveWNoP2CJDhDjWYu+lrsBPoPorY6oAPyylNaUMry9dLRLxefB0HtJCNcKjClNlZMWqXF+AA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:2b6c52ff-7719-4a13-9ca9-d507e57b7330,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:2fda6a18-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: e89f22f07e3611efba0aef63c0775dbf-20240929
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <andy-ld.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1664509849; Sun, 29 Sep 2024 00:46:16 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 29 Sep 2024 15:46:14 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 29 Sep 2024 15:46:13 +0800
From: Andy-ld Lu <andy-ld.lu@mediatek.com>
To: <ulf.hansson@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: [PATCH v2 0/2] Add mtk-sd support for MT8196
Date: Sun, 29 Sep 2024 15:44:04 +0800
Message-ID: <20240929074558.2076-1-andy-ld.lu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_004622_574826_E88730C4 
X-CRM114-Status: GOOD (  11.12  )
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

There are some new features for Mediatek SoC MT8196, which include new
command/data transmitting and receiving path (abbreviated as tx/rx), and
two modified register settings.

The driver code has to be adapted to implement the above changes, and the
compatible string 'mediatek,mt8196-mmc' is added to driver and devicetree
bindings.

---
Changes in v2:
- Use compatible string 'mediatek,mt8196-mmc' to replace 'mediatek,msdc-v2';
- Remove the 'mediatek,stop-dly-sel', 'mediatek,pop-en-cnt' and 'mediatek,
  prohibit-gate-cg' in devicetree bindings, due to SoC dependent;
- Add 'stop_dly_sel' and 'pop_en_cnt' to the compatiblity structure for
  different register settings;
- The SoC's upgraded version would discard the bus design that detect source
  clock CG when the CPU access the IP registers, so drop the related control
  flow with 'prohibit_gate_cg' flag.

Link to v1:
https://patchwork.kernel.org/patch/13812924

---
Andy-ld Lu (2):
  mmc: mtk-sd: Add support for MT8196
  dt-bindings: mmc: mtk-sd: Add support for MT8196

 .../devicetree/bindings/mmc/mtk-sd.yaml       |   2 +
 drivers/mmc/host/mtk-sd.c                     | 162 +++++++++++++++---
 2 files changed, 143 insertions(+), 21 deletions(-)

-- 
2.46.0


