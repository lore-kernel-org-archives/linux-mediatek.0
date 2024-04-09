Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576EACD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 03:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gn4SVKjDp2+oRxnoHIuawfi3x9MS9w2xBc7UDFhjgkg=; b=HU41dnDaUzpkZt7ohLfraPzYbO
	JVOk9HYVzsr7m7YX1M61i/SiyAJOUA17+9ngeDUaMLEWm3MUXeA+dbPbuRp4xNdeqh2rpdmGVolPI
	dB6cmvi6uh+qeVz6TyHF52ZYa+QkkJE0cJ2iRzVznf1bi4+poH8JxQ5LYVwFEoTlrnbgBekBIMREA
	Kd6k98ktqSd2vNlutbP2bGmEtL5JR3tFrz1x2PYICOC02uqu/citka+Qttnkhzgt++XlGf/PkuxNA
	jxWqvX9dQvX1hJLiGdRcacKhLzCe6XZOpfBzmxWPtaIr2aGjA2UETYDhQf8El1KvgwdCsdMDestOd
	tzc8emcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru2ZK-00000000F2O-1Sxe;
	Tue, 09 Apr 2024 03:54:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru2ZH-00000000F10-1UMN;
	Tue, 09 Apr 2024 03:54:44 +0000
X-UUID: e116f886f62411eeac1957ae9f99f617-20240408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gn4SVKjDp2+oRxnoHIuawfi3x9MS9w2xBc7UDFhjgkg=;
	b=SYhSaaT/QBMZd2TFXFBZh6V3wIWlWzq1vLkAtaLZVpq/N6B8Vc7fxOED0sdiFuhvPPp63+bIXnLNqr0KsJxtfpX0G/Kun/pIOmQBMgkqI7kEWZy/E02VJi6YQ6Ea49qFGBY7mnDEIRXat5pemTxlN9BMd5BdjVMwzEvc/J76VJ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:67a9e876-ba21-4283-941b-ed9808831ecb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:20827282-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e116f886f62411eeac1957ae9f99f617-20240408
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1109723611; Mon, 08 Apr 2024 20:54:35 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 Apr 2024 11:53:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 Apr 2024 11:53:57 +0800
From: Jason-ch Chen <jason-ch.chen@mediatek.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-watchdog@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Jason-ch Chen <Jason-ch.Chen@mediatek.com>
Subject: [PATCH] soc: mediatek: mtk-socinfo: Correct the marketing name for MT8188GV
Date: Tue, 9 Apr 2024 11:53:55 +0800
Message-ID: <20240409035355.27659-1-jason-ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.265700-8.000000
X-TMASE-MatchedRID: VZuxIYcieyzh8RW9qY6+GwPZZctd3P4B7f6JAS2hKPhrTDNJQXOxDaPF
	jJEFr+olwXCBO/GKkVr3FLeZXNZS4IzHo47z5Aa+JSsrnm9gBe1vuqvSSWUSX8OmhAllm9BvzsP
	W6bH7ICFbnGka1c72QtIUoq3qtzf10Huf0+4h7vtorSEFudR6+b4uS7g0k2sdeZUpm6wun3ba/0
	6NhYDa4wyzCDjlUx89p2y3mIB+it9WXGvUUmKP2w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.265700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: CCEE519ECF554D8D2C4644AD0C835A1320B2366487E12B37B88ADE3CC7D605D32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_205443_406051_B87019C1 
X-CRM114-Status: UNSURE (   9.24  )
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

From: Jason-ch Chen <Jason-ch.Chen@mediatek.com>

Change 'Kompanio 830' to 'Kompanio 838'.

Signed-off-by: Jason-ch Chen <Jason-ch.Chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-socinfo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
index 6943ab29f095..74672a9d6d13 100644
--- a/drivers/soc/mediatek/mtk-socinfo.c
+++ b/drivers/soc/mediatek/mtk-socinfo.c
@@ -48,8 +48,8 @@ static struct socinfo_data socinfo_data_table[] = {
 	MTK_SOCINFO_ENTRY("MT8183", "MT8183V/AZA", "Kompanio 500", 0x00010043, 0x00000940),
 	MTK_SOCINFO_ENTRY("MT8186", "MT8186GV/AZA", "Kompanio 520", 0x81861001, CELL_NOT_USED),
 	MTK_SOCINFO_ENTRY("MT8186T", "MT8186TV/AZA", "Kompanio 528", 0x81862001, CELL_NOT_USED),
-	MTK_SOCINFO_ENTRY("MT8188", "MT8188GV/AZA", "Kompanio 830", 0x81880000, 0x00000010),
-	MTK_SOCINFO_ENTRY("MT8188", "MT8188GV/HZA", "Kompanio 830", 0x81880000, 0x00000011),
+	MTK_SOCINFO_ENTRY("MT8188", "MT8188GV/AZA", "Kompanio 838", 0x81880000, 0x00000010),
+	MTK_SOCINFO_ENTRY("MT8188", "MT8188GV/HZA", "Kompanio 838", 0x81880000, 0x00000011),
 	MTK_SOCINFO_ENTRY("MT8192", "MT8192V/AZA", "Kompanio 820", 0x00001100, 0x00040080),
 	MTK_SOCINFO_ENTRY("MT8192T", "MT8192V/ATZA", "Kompanio 828", 0x00000100, 0x000400C0),
 	MTK_SOCINFO_ENTRY("MT8195", "MT8195GV/EZA", "Kompanio 1200", 0x81950300, CELL_NOT_USED),
-- 
2.18.0


