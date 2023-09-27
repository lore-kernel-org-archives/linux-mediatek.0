Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4459FE82CA5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 15:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1mmhF6o10BWWriTPXMuPzcjKrUhlG8FFXawCAXG5Qk=; b=Tg/bSWzpHWHUQdIJsHdWaMy5sQ
	8tfO1hlnXg1vgPnEXxeS7Hgha5eqKU7ZhHTKKDvTmyGXX2NqLJTfqqH2a9F4/0Nk5qrOR+rgSbtGB
	Bjp31wafbZAaYUE2MGzoULu7ZFTjiUTa4OTUK5YO6qDOE4GryPl5A7MyvJ202mLn39VsKOY6NNzx9
	7PxNo4L6vLmryUd7Xm0X8OQLckuyqVbm/8nZ7RZY0tffoQD6Xzzxdel/W/MZ1jj5cafqvs8posimH
	1eKJw6U11TNAjV/feZS/8gIZEQC/lIRKddCEjNNF1KTNVeSqwBvm4U/zPm4oc5cpwB98tQ4qN0CnP
	Xa7f76mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWfY-001LsP-1G;
	Wed, 27 Sep 2023 15:41:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWdA-001JSK-1K;
	Wed, 27 Sep 2023 15:39:19 +0000
X-UUID: 00dcc3165d4c11ee86758d4a7c00f3a0-20230927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=d1mmhF6o10BWWriTPXMuPzcjKrUhlG8FFXawCAXG5Qk=;
	b=rt7sgvsvWUtl/HoBeZGWnAuVuCms0/Pc/kMuJtfirdtILD0exo7WTzIVsyXKaXKJ2uofC+dcBVOMENaa4gl7bmlQoQae6rzGz7Q7wv0NF4zBDvNPmnKbW3wehLPDWyQHgzFP4Ag3isq/SAD4CRW3lVYaIM7RPdoGAn8YUIhSbZM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:15f93e8c-074b-4363-b7ec-6c74738d270e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:efaa88c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 00dcc3165d4c11ee86758d4a7c00f3a0-20230927
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1223140600; Wed, 27 Sep 2023 08:39:10 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 27 Sep 2023 23:38:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 27 Sep 2023 23:38:35 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Nathan Lu
	<nathan.lu@mediatek.com>
Subject: [PATCH v10 9/9] drm/mediatek: Support dynamic selection of DSI0 on MT8188 VDOSYS0
Date: Wed, 27 Sep 2023 23:38:33 +0800
Message-ID: <20230927153833.23583-10-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
References: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.275200-8.000000
X-TMASE-MatchedRID: cAwOsowI+VIeMlyElPeCGGNW0DAjL5p+EbxKVXd70tXfUZT83lbkEH3U
	O6dm0hoW4vM1YF6AJbbGJQ3BiiLAggtuKBGekqUpnH7sbImOEBSYB7F0At05aAehBdy2joqW7eA
	HA/QBQn7dPfaML5fsmguAxSypZN+ZMZLjad6G1FVXjtFfbGidPT3upCq1bPhQCySi89VbZN5Jmt
	82E/eyBQGH0CAFIQWsmb5gmylW+PbGS+seVPx64j6Qrn3xh/cy
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.275200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 35D5E6353570CA3681EC435E17E608A8F71F93B028A3CC23EBE7276521C3C8B72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_083916_510291_7A1E251C 
X-CRM114-Status: UNSURE (   9.26  )
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

Add DDP_COMPONENT_DSI0 as a main display output selection on
MT8188 VDOSYS0.

Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 70c9501250a0..5226be88d088 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -190,6 +190,7 @@ static const unsigned int mt8188_mtk_ddp_main[] = {
 
 static const struct mtk_drm_route mt8188_mtk_ddp_main_routes[] = {
 	{0, DDP_COMPONENT_DP_INTF0},
+	{0, DDP_COMPONENT_DSI0},
 };
 
 static const unsigned int mt8192_mtk_ddp_main[] = {
-- 
2.18.0


