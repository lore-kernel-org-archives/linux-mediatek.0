Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7586C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 08:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzNyns0UVad0oAtB463nUueppzHDt6e6thwwaV9IvXI=; b=uMdzLMRrophbPZiYEzwOcjLbHx
	S0tNJOGrqwAm33s/+0CXYSXEX1NaFivxnKDLILENUkFTV7XOJ3oBRONwufLk5hS2Zvx31CaE51LTe
	cXr3hBKURQsEF92DIxpd8kGuatSZ+eSg+CzglkI0T0YbBjDMlQASM3fFREmWJyPNVw8Al6re2GGf0
	KnS5XN9xdPbwIsKyyYMAY+CqBLrteHCgND7bZGKZs07uOxG26Sae1Evwa9XwYLN5mZSKO+UksxP1f
	6Rzy7zdQfhKuhSh8VQyjr8YiC555ZxwvTYft2Tr8W0zevg/IIOcYlZzxFaLuMAkwRJDHsoHXf4B23
	6tMpU8ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9qM-00ErvE-1t;
	Mon, 18 Sep 2023 08:42:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9qC-00Ernw-2x;
	Mon, 18 Sep 2023 08:42:50 +0000
X-UUID: 5730f30855ff11ee86758d4a7c00f3a0-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JzNyns0UVad0oAtB463nUueppzHDt6e6thwwaV9IvXI=;
	b=N2bUpN9MVPWmPzwMRpkV0yH+fM16VvcupbNrpBBQeVLgop4Wg2J74XMNy1P9rFI88iPvUoHyeS0EP+rt8VDSVu2NcUdGbmJqxRTQp+m0RNaaoF4aMMDBsyArcowITTlO73WSL6gtbi47ZM2h4j/yMFcIYrRsur4xJacDtqGs9Dk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:7b1efded-7d75-4aec-b998-048fd898cded,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:8b5527c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5730f30855ff11ee86758d4a7c00f3a0-20230918
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2139924596; Mon, 18 Sep 2023 01:42:46 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 16:42:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 16:42:11 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Chen-Yu Tsai <wenst@chromium.org>,
	CK Hu <ck.hu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Hsiao Chien Sung
	<shawn.sung@mediatek.com>
Subject: [PATCH v2 03/11] soc: mediatek: Disable 9-bit alpha in ETHDR
Date: Mon, 18 Sep 2023 16:41:59 +0800
Message-ID: <20230918084207.23604-4-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230918084207.23604-1-shawn.sung@mediatek.com>
References: <20230918084207.23604-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.052100-8.000000
X-TMASE-MatchedRID: alJg/GEaUw2+Yp4vsvc0tLMsPmSZxbpksvllF/5zpT2LEf4RB+xkYVaP
	6AhhdqyDrUhQzMxACbpkTkpOguG6lcYsXQyX9kH4e5NWR5iixe0ol9KlwBS/XZsoi2XrUn/Js98
	n9dYnJNNQSFbL1bvQASAHAopEd76vYRbNu1tC79JEtnyHlOOG0IX+n0vRN9Ql2LhP3SSUgZTaKw
	jkgd6X8w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.052100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8FA9CB363904B36906B867D4D261DE7DA6C7027E87BBDE1085A96C5D835E8B5F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_014248_975176_01890C5D 
X-CRM114-Status: UNSURE (   8.31  )
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

ETHDR 9-bit alpha should be disabled by default,
otherwise alpha blending will not work.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index ffb75711a1da..8b6c39b5d1b4 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -209,6 +209,7 @@ void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16
 
 	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_ALPHA + (idx - 1) * 4, ~0,
 			      alpha << 16 | alpha, cmdq_pkt);
+	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_HDR_TOP_CFG, BIT(15 + idx), 0, cmdq_pkt);
 	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_HDR_TOP_CFG, BIT(19 + idx),
 			      alpha_sel << (19 + idx), cmdq_pkt);
 	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,
-- 
2.18.0


