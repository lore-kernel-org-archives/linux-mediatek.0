Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27E3C0018C
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 11:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38YgUroBcROrgOkebZdSz/tT4DqUofnFmrwkGM5mkFs=; b=dKGkkDb0wPTkdEhIPQup6JEYXq
	WFJBj/2PlCDB6yOpG4JbcazhQfyE3+jYNffuM4lnsI1Us2i6830M3+PXj4DrpFyjoBIg1E691V6CG
	FdRHBZXjFqdrJj+hOhX7+gRGdY4oAEKaZKGGHYehwliPb/JAnOZKTEONKI7rAkT2osOoNtzGZ0s6b
	tJPdO+9K4EoZMakZ8EPIIv5XZBUcG6guvQdXIuvw5DXOnVmJTSoyyGz6NoL99dVizpmWMflqsx5Dr
	uhsFpUKdXgkaCNPDYMkJxipZYqnVPUhWvaiGjIPEdSjjOuu8/nzO5hondXAE0qz22+dXF4R2fTV5Z
	Qmbs1bnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r12wq-0061nR-1q;
	Thu, 09 Nov 2023 11:11:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r12wl-0061kQ-0g;
	Thu, 09 Nov 2023 11:11:41 +0000
X-UUID: bdc8930e7ef011ee86758d4a7c00f3a0-20231109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=38YgUroBcROrgOkebZdSz/tT4DqUofnFmrwkGM5mkFs=;
	b=Et+kS7cMfjnskR3QcpZpPl0RTqMxlsOQ043dPU/U6tJpHKDjwJF5H6UGXru+dMSw1DE4TC+pi2we6rv5FOy+fDwbFYE1m1nNsaGQNeYccJugsnWc47esoUtpKMNnI9f4TOH4lGaIS8LgA3vOtc8TmFhBULo/yHMjYWbqTr3hXic=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:3844de65-183e-44f4-97bf-87bc0ff18a15,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:46343495-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bdc8930e7ef011ee86758d4a7c00f3a0-20231109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 135601627; Thu, 09 Nov 2023 04:11:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 9 Nov 2023 19:11:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 9 Nov 2023 19:11:29 +0800
From: yu-chang.lee <yu-chang.lee@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "Nancy . Lin" <nancy.lin@mediatek.com>, Nathan Lu
	<nathan.lu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Garmin Chang <garmin.chang@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, yu-chang.lee
	<yu-chang.lee@mediatek.com>
Subject: [RESEND 1/3] soc: mediatek: mmsys: Add support for MT8188 VPPSYS
Date: Thu, 9 Nov 2023 19:11:20 +0800
Message-ID: <20231109111122.371-2-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231109111122.371-1-yu-chang.lee@mediatek.com>
References: <20231109111122.371-1-yu-chang.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.284600-8.000000
X-TMASE-MatchedRID: uVuWzlu52Rk9S3IiQd+eNWNW0DAjL5p++OI6XsK3BWHfUZT83lbkEN6M
	yUV+2+DZ1uNt11toaXuY15VWej9HL49oUcx9VMLgFEUknJ/kEl4YSQiB0ZTudfoLR4+zsDTtc20
	lvB2foahXrpfaEp592sEs23TMfRYzaUMui/AN0TDdjZ8lzHONkFZca9RSYo/b
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.284600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 75A0303DAED589ED039FAE00D9BFFA553B1B59B0C7983767A66F03E9A441FF662000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_031139_285198_8D58430E 
X-CRM114-Status: GOOD (  10.37  )
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

Add MT8188 VPPSYS0 and VPPSYS1 driver data.

Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 88209102ff3b..1e5239cc5445 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -89,6 +89,16 @@ static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8188_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8188_vppsys0_driver_data = {
+	.clk_driver = "clk-mt8188-vpp0",
+	.is_vppsys = true,
+};
+
+static const struct mtk_mmsys_driver_data mt8188_vppsys1_driver_data = {
+	.clk_driver = "clk-mt8188-vpp1",
+	.is_vppsys = true,
+};
+
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.clk_driver = "clk-mt8192-mm",
 	.routes = mmsys_mt8192_routing_table,
@@ -429,6 +439,8 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 	{ .compatible = "mediatek,mt8183-mmsys", .data = &mt8183_mmsys_driver_data },
 	{ .compatible = "mediatek,mt8186-mmsys", .data = &mt8186_mmsys_driver_data },
 	{ .compatible = "mediatek,mt8188-vdosys0", .data = &mt8188_vdosys0_driver_data },
+	{ .compatible = "mediatek,mt8188-vppsys0", .data = &mt8188_vppsys0_driver_data },
+	{ .compatible = "mediatek,mt8188-vppsys1", .data = &mt8188_vppsys1_driver_data },
 	{ .compatible = "mediatek,mt8192-mmsys", .data = &mt8192_mmsys_driver_data },
 	/* "mediatek,mt8195-mmsys" compatible is deprecated */
 	{ .compatible = "mediatek,mt8195-mmsys", .data = &mt8195_vdosys0_driver_data },
-- 
2.18.0


