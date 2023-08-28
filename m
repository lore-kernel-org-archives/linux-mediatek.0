Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE233C71153
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 08:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xpSTtdmJy4jDo8cdoWEQV989S/wRfkzHbnC1sar0k10=; b=rn6XHNToeQlc7L7YA0PN6UXhTd
	TLRUrMrbW5zmuJdJ687izONXsISHZJsgqhMFmgevu2mc8UIbCBFVWwj8KW8wbvrk2k3+P+DFu9gVG
	iIWwLkUG3mqsdZgV2fE1rw2xCII1EsQ1wypMbI4YsTLSPbqpy0vbzNUYk2ZOx5JM3sRGn+S201fzH
	WvolDH9B6hGHCGz/bJIbx5zjjUWTCVlDYp3AWgARGD9GbYyGu9JxwRr37R1+FiGWMzhWb3Uj72hFJ
	ut2H/YnDO49hWZByarwkDVIEEhtyKer46SW8QEpi4i/IyK2FX6H7CcOUSn/BHAidMnPjMAVVE/+YL
	yhJBabBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaXcr-00997a-2A;
	Mon, 28 Aug 2023 08:29:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaXco-00996P-0y;
	Mon, 28 Aug 2023 08:29:31 +0000
X-UUID: fc814260457c11ee83ed1395ce914268-20230828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xpSTtdmJy4jDo8cdoWEQV989S/wRfkzHbnC1sar0k10=;
	b=oqHGyVrrJ8qbQ072Vf27BSbQ3ZtfSLd7AAJYfIw3NbX2X4+0nj99rqli0KU98cPL12SL8KVdiCFRsB6mUsP+lX4kL/xsA+3iCmgCDK+Bk/ANgwKEjv3lbS2IFcfg9jJpxWDiiATjGqc2oA4JP3r+Bn/OjRHrdxyedgErkyuykZw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:bc049fad-dc72-4b6f-832b-2b92f4003b48,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:22cbd31f-33fd-4aaa-bb43-d3fd68d9d5ae,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fc814260457c11ee83ed1395ce914268-20230828
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1899842807; Mon, 28 Aug 2023 01:29:20 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 28 Aug 2023 16:09:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 28 Aug 2023 16:09:17 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Fabien Parent
	<fparent@baylibre.com>
Subject: [PATCH] spidev: add compatible string for MediaTek IoT (Genio) boards
Date: Mon, 28 Aug 2023 16:09:09 +0800
Message-ID: <20230828080909.16610-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_012930_355765_9EAD0DE8 
X-CRM114-Status: GOOD (  10.39  )
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

Add compatible string for MediaTek IoT (Genio) boards.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 drivers/spi/spidev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spidev.c b/drivers/spi/spidev.c
index d13dc15cc191..9d7952dbbaa6 100644
--- a/drivers/spi/spidev.c
+++ b/drivers/spi/spidev.c
@@ -714,6 +714,7 @@ static const struct spi_device_id spidev_spi_ids[] = {
 	{ .name = "spi-authenta" },
 	{ .name = "em3581" },
 	{ .name = "si3210" },
+	{ .name = "genio-board" },
 	{},
 };
 MODULE_DEVICE_TABLE(spi, spidev_spi_ids);
@@ -742,6 +743,7 @@ static const struct of_device_id spidev_dt_ids[] = {
 	{ .compatible = "semtech,sx1301", .data = &spidev_of_check },
 	{ .compatible = "silabs,em3581", .data = &spidev_of_check },
 	{ .compatible = "silabs,si3210", .data = &spidev_of_check },
+	{ .compatible = "mediatek,genio-board", .data = &spidev_of_check },
 	{},
 };
 MODULE_DEVICE_TABLE(of, spidev_dt_ids);
-- 
2.18.0


