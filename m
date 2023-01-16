Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF96C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 03:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5IM+T/EeHPaIjcB5oMvcI/085Imht9mibpgKuwLJpfo=; b=0xn0CoMBpx0O9vMBrGQBdJBhJm
	JXlG4DVCvczArSASPWm0c1wNw9YIcU7aFJ/zMBDAmInU14huAAYEhukkvz2HBdbdNdgta3Lrp08CG
	XHKVgoBd55lsjOlyqV6HDAmYB7hR4ZRKf1RQ5Lz2wV+SXA+IyF5Vgzro0tvgQyvs+y/bf87kCbPk4
	RA5mcwI9d4NtejX1y99BNDFIuZUcKA62AqVA2BPSikKks1Ro7wLcapH3vn0+UGxduwdH4sxcoSVhR
	04jb3Q1GYY3QiLH92owvvGNqVKazfctMSkdK05U2er1rxUkZ5podHswGno+Q3Tj4IKC76pI/vV7jA
	MS7Tx1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHGSm-008YJP-VZ; Mon, 16 Jan 2023 03:47:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHGO3-008W0p-6H; Mon, 16 Jan 2023 03:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5IM+T/EeHPaIjcB5oMvcI/085Imht9mibpgKuwLJpfo=; b=R7plF0/MwkSxqo4uUCNUEfkQoW
	1bJoxgyQjIttlAfiQwu7MftDIqbhFYjoU34O08gV9Qbh9dxuEvB2oPkDnx4QVNi1pcVC5xDvwTipV
	ogX4x/31ed/qcVZsZg0fF+WHMdutTQZrwyrXQ6buUUL/f+HZHNKRpS28sH1N+hY6APuxeQqA/Eka8
	Yu7W+mnPhFKhcHR42a09fhu3q7EGLaetDsOASaZosum/7eaFtoULNekQ8tqqs/xwNK9iywTV3eEwN
	CVVCLFueVIhej9s04WGALoNlLLOo+OuZxk4hUHlfv4v8hkxJBnzE3JC30QYCl2pSlFcyxODgOKHpQ
	LT1cQX2A==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHGNn-005Syt-2j;
	Mon, 16 Jan 2023 03:42:08 +0000
X-UUID: b77cb5ba954f11edbbe3f76fe852e059-20230115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5IM+T/EeHPaIjcB5oMvcI/085Imht9mibpgKuwLJpfo=;
	b=LvfjkRQrRKlM3+Rt1TWINuXF6i9AhlZzJ0T5lorYFx80ovpb2uP4DAUJYo76j7kItZHCBnaGT91Y/qNFGy7fxJ9dedckMJHI95GOqqAilTeO32eZZMiXg73m9gnaQOaSIK8aQp9Y2DcHBQvaOobdNgDJL3AnR+7Woxt8TPDToeA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:2d4aa354-0c24-4017-972f-b90dc4de8437,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:543e81c,CLOUDID:9bf0568c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: b77cb5ba954f11edbbe3f76fe852e059-20230115
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 800033671; Sun, 15 Jan 2023 20:41:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 16 Jan 2023 11:41:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 16 Jan 2023 11:41:35 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
CC: <trevor.wu@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [RESEND,v5 01/13] ASoC: mediatek: common: add SMC ops and SMC CMD
Date: Mon, 16 Jan 2023 11:41:19 +0800
Message-ID: <20230116034131.23943-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230116034131.23943-1-trevor.wu@mediatek.com>
References: <20230116034131.23943-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_034205_735299_DE08298B 
X-CRM114-Status: UNSURE (   8.55  )
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

SMC call is required to communicate with ATF for some secure operations,
so we add SMC ops IDs and SMC CMD ID to common header.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/common/mtk-base-afe.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index ef83e78c22a8..f51578b6c50a 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -9,7 +9,26 @@
 #ifndef _MTK_BASE_AFE_H_
 #define _MTK_BASE_AFE_H_
 
+#include <linux/soc/mediatek/mtk_sip_svc.h>
+
 #define MTK_STREAM_NUM (SNDRV_PCM_STREAM_LAST + 1)
+#define MTK_SIP_AUDIO_CONTROL MTK_SIP_SMC_CMD(0x517)
+
+/* SMC CALL Operations */
+enum mtk_audio_smc_call_op {
+	MTK_AUDIO_SMC_OP_INIT = 0,
+	MTK_AUDIO_SMC_OP_DRAM_REQUEST,
+	MTK_AUDIO_SMC_OP_DRAM_RELEASE,
+	MTK_AUDIO_SMC_OP_SRAM_REQUEST,
+	MTK_AUDIO_SMC_OP_SRAM_RELEASE,
+	MTK_AUDIO_SMC_OP_ADSP_REQUEST,
+	MTK_AUDIO_SMC_OP_ADSP_RELEASE,
+	MTK_AUDIO_SMC_OP_DOMAIN_SIDEBANDS,
+	MTK_AUDIO_SMC_OP_BTCVSD_WRITE,
+	MTK_AUDIO_SMC_OP_BTCVSD_UPDATE_CTRL_CLEAR,
+	MTK_AUDIO_SMC_OP_BTCVSD_UPDATE_CTRL_UNDERFLOW,
+	MTK_AUDIO_SMC_OP_NUM
+};
 
 struct mtk_base_memif_data {
 	int id;
-- 
2.18.0


