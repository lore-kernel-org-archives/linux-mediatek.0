Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BB4C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Nov 2023 09:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSxEHER9rgZJO6xVEezgZza82f7zlYSaeP4HD1Wipa4=; b=HQBaQUAC941l+dwBVnhBtMho3K
	jYJaLzbN4siHsfitYoHCJMdhf8RSYRf5SaSSYdlVgDc7WF1PCoXxe4WqDXfo7QmVnGP+vfE6OAJ/5
	zeUqbNrBOpOYsgDmaHDrn2QAzkPxIedstyVcmmlQq+716XYhLVal06DcUnABuQUwO2HnySX4/Nl+i
	wo6jAEfZv/iQDvHCWW15bI1vo60d8qaExD9pPeqGhXSshS8y9VVCDEOpeoUalufmJj0D8ktNvTbTI
	TZ4/v7Rs3CW17MILE/SlCNy9pp7ikZNH4fWmH2TyTji9D3KTcV7aGh/3ifPtVrzoxfEuRGfDXibdu
	XwkyKpHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyqtm-00B5GZ-0N;
	Fri, 03 Nov 2023 09:55:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyqtf-00B5DY-2h;
	Fri, 03 Nov 2023 09:55:27 +0000
X-UUID: 1940202e7a2f11ee9b7791016c24628a-20231103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=SSxEHER9rgZJO6xVEezgZza82f7zlYSaeP4HD1Wipa4=;
	b=XhoycgLrsLIkL/p2GmDL7fcAKoFNp6bjCG/pe1I4D5iyUPDodFEcg6c6UW45Nk2jLjp18n2wZHxvtiwB3dypAvodZuVyMkohCj1DmydrzMW/IMn+911n1gUcj8+JhCNEZxZB8rMlsk680tAnFUhp7UGECUpLlWR/SvbL1hcJHt4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:6f2bce9b-bffa-40d6-b128-5b9ed77b90a3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:5e87fa94-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1940202e7a2f11ee9b7791016c24628a-20231103
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 528157695; Fri, 03 Nov 2023 02:55:20 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 Nov 2023 17:54:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 Nov 2023 17:54:41 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <daniel.baluta@nxp.com>,
	<broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <yc.hung@mediatek.com>,
	<sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] ASoC: SOF: mediatek: remove unused variables
Date: Fri, 3 Nov 2023 17:54:32 +0800
Message-ID: <20231103095433.10475-4-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231103095433.10475-1-trevor.wu@mediatek.com>
References: <20231103095433.10475-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.994200-8.000000
X-TMASE-MatchedRID: tbBnGR+nfu7HO8eAxCOj9uEbUg4xvs+wYKeVO7aMEHPfUZT83lbkEGOr
	KvsUT0pAXTvgb5xI7gVpnryVaiXugB8TzIzimOwPC24oEZ6SpSmcfuxsiY4QFDraVU6lwonzkc5
	WVJ1GXnkS2VhzX+fgmBqqw4SleYJWMr1nDozz1oXRaxPVfNDWN0QrY6+5fQPAwAu7lS0AxFfi54
	NN52oAEEma3zYT97IFAYfQIAUhBayZvmCbKVb49sZL6x5U/HriPpCuffGH9zI=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.994200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 073E768117C1B0B82F8444E44C9CD65E3774C4004192C4ABD2DE76B85F9A1C532000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_025523_887585_F36815B1 
X-CRM114-Status: UNSURE (   8.62  )
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

To prevent confusion on the follow-up platform, it is necessary to
remove any unused variables within the struct mtk_adsp_chip_info.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
---
 sound/soc/sof/mediatek/adsp_helper.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/sof/mediatek/adsp_helper.h b/sound/soc/sof/mediatek/adsp_helper.h
index d41e904e6614..35527567962e 100644
--- a/sound/soc/sof/mediatek/adsp_helper.h
+++ b/sound/soc/sof/mediatek/adsp_helper.h
@@ -15,17 +15,13 @@
 struct mtk_adsp_chip_info {
 	phys_addr_t pa_sram;
 	phys_addr_t pa_dram; /* adsp dram physical base */
-	phys_addr_t pa_shared_dram; /* adsp dram physical base */
 	phys_addr_t pa_cfgreg;
 	u32 sramsize;
 	u32 dramsize;
 	u32 cfgregsize;
-	u32 shared_size;
 	void __iomem *va_sram; /* corresponding to pa_sram */
 	void __iomem *va_dram; /* corresponding to pa_dram */
 	void __iomem *va_cfgreg;
-	void __iomem *shared_sram; /* part of  va_sram */
-	void __iomem *shared_dram; /* part of  va_dram */
 	phys_addr_t adsp_bootup_addr;
 	int dram_offset; /*dram offset between system and dsp view*/
 
-- 
2.18.0


