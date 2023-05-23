Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390FFC7EE26
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 11:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lvk3JaTrwPLSWWOaMLoAICxAPDtCTseef/dYBEf8duA=; b=ayZBXnNJXOpY5cVg/w+cJjnRUs
	ebBEuzEwTfXa3edrVKmTg5Dp5/rHslcFZIhcbHGMdcGIxE6AG/4YXnRbHYTkATli3Dy8qftwGJlHN
	KG/VuETkxgdz12wNZZtttCN/jy5jCmgc4E8lvcxlaFF4rPTFUkw9XIpRShvpgOlf3x43xhCGtLt8S
	vfOvwWvs2YkgTfsDN9NJ3sq13w0zOtFuZ2umsXaQUX+Y+YWeH96bKigv4mybifKKwbQx5UXA4437q
	o1lHZKZpCWqZoU4b0gMK/D/dmkV05lhMDqy3gtf3993R8O/f19WCz7SYfpjJ87AVGW59tU2vOQ5MG
	7rdCjo+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1QA0-00A4Ug-1g;
	Tue, 23 May 2023 11:26:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Q9y-00A4SO-0D;
	Tue, 23 May 2023 11:26:35 +0000
X-UUID: a3ff8866f95c11ed83ed1395ce914268-20230523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Lvk3JaTrwPLSWWOaMLoAICxAPDtCTseef/dYBEf8duA=;
	b=FXAaU5RGXzQ2kOenbv8WN45X6C1EVfjzi2hGrA6cTe8njHl1SKRbSJRI/4Nu42Vk4Fm4vSmaGY47sLqI4Uu+rX5kWIydghPvRWVnUBlLY6LbqPku/yeJOqnQnKPmUlu+pgZm/Ucj+3nG5P1JCAdr37zmL8iwAez33WWJdaEscBc=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:3d2c14b8-c227-492b-a202-35953c26f440,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.25,REQID:3d2c14b8-c227-492b-a202-35953c26f440,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:d5b0ae3,CLOUDID:ebca183c-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:230523192622HC64XX48,BulkQuantity:0,Recheck:0,SF:29|28|16|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: a3ff8866f95c11ed83ed1395ce914268-20230523
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <qii.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 465120374; Tue, 23 May 2023 04:26:20 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 23 May 2023 19:26:17 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 23 May 2023 19:26:17 +0800
From: <qii.wang@mediatek.com>
To: <broonie@kernel.org>
CC: <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
	<qii.wang@mediatek.com>, "Tim . Kuo" <Tim.kuo@mediatek.com>
Subject: [PATCH] spi: mediatek: advertise the availability of Dual and Quad mode
Date: Tue, 23 May 2023 19:26:08 +0800
Message-ID: <20230523112608.10298-1-qii.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_042634_133092_E56FF749 
X-CRM114-Status: GOOD (  11.35  )
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

From: Qii Wang <qii.wang@mediatek.com>

this patch advertise the availability of Dual and Quad SPI mode
for ipm design.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
Signed-off-by: Tim.Kuo <Tim.kuo@mediatek.com>
---
 drivers/spi/spi-mt65xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 21c321f43766..1501ee8459ff 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1144,7 +1144,8 @@ static int mtk_spi_probe(struct platform_device *pdev)
 	if (mdata->dev_comp->must_tx)
 		master->flags = SPI_MASTER_MUST_TX;
 	if (mdata->dev_comp->ipm_design)
-		master->mode_bits |= SPI_LOOP;
+		master->mode_bits |= SPI_LOOP | SPI_RX_DUAL | SPI_TX_DUAL |
+				     SPI_RX_QUAD | SPI_TX_QUAD;
 
 	if (mdata->dev_comp->ipm_design) {
 		mdata->dev = dev;
-- 
2.25.1


