Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB4AC6FA82
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 07:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rapjfEd/0fAeylvQDoAQRYCFWy0PBtBkE73tULqyTRg=; b=mo5GV/tqZ223svKME5iuiqtpPu
	XP/g0IF1lQ8ZN7wG6aX+sK8+TwY36RZXvUnUWglcxjhXJsASjSQkWJ3O9mG7htpKX8SkD3p/q1gur
	7hgkr05jKNjfg9XQB46TylqcAvnSQjIn/pDanWkK/UC3dAF7K0xA9tUSmOIUiPBJ/OEZn5iojYBiq
	J/ESfgsHgMl/pYJMSiZCUSRpEfIFs9hRj+9KJQQLfXFGdfWoaSVd1ImnfQRsATMTCCG8D4Qwelq5I
	UPmV4KCdJ5DgQHwCfo0pCUTA0+te221qDu/gvdj44v9AJ3U+2S7CxocmOhLDrt7LoKriCj1nshmdg
	iOG389gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocime-002paR-51; Mon, 26 Sep 2022 07:44:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocimH-002pQ1-3H; Mon, 26 Sep 2022 07:43:46 +0000
X-UUID: f2ff2ab1beb8463a91bd8a72d26aa7f5-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rapjfEd/0fAeylvQDoAQRYCFWy0PBtBkE73tULqyTRg=;
	b=hZb20YDM+fjSh9t11Sxc6aOXq3LO2vwADpv5BXz6ykoKwHfDBfTeLSdegGXjrfMEINg3CvkfvFcwsH6UCkh736d2Y/FUdb/BEXjRNxJi+zu6BsuDU6qkP88zfeSTVkxJif0BR/PWbi6vamofycuE5YsQS3Y4gY0952Q9SorL/bs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:342b8e3a-6b4d-4898-bfad-1a71e7589c16,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.11,REQID:342b8e3a-6b4d-4898-bfad-1a71e7589c16,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:39a5ff1,CLOUDID:840d0407-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:2209261543271O4QRFC5,BulkQuantity:2,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: f2ff2ab1beb8463a91bd8a72d26aa7f5-20220926
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1136951113; Mon, 26 Sep 2022 00:43:36 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 26 Sep 2022 15:43:12 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 26 Sep 2022 15:43:12 +0800
From: <xinlei.lee@mediatek.com>
To: <matthias.bgg@gmail.com>, <jason-jh.lin@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <rex-bc.chen@mediatek.com>,
	<ck.hu@mediatek.com>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
Subject: [PATCH v11,0/3] Add dpi output format control for MT8186
Date: Mon, 26 Sep 2022 15:43:08 +0800
Message-ID: <1664178191-27964-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_004345_151353_A65AA855 
X-CRM114-Status: GOOD (  10.78  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

From: Xinlei Lee <xinlei.lee@mediatek.com>

Base on the branch of ck-linux-next/mediatek-drm-fixes.

Change since v10:
1. Modify patch title and add review tag.

Change since v9:
1. Modify the location of the mmsys_dev member variable.

Change since v8:
1. Modified the title and some description information.

Changes since v7:
1. This series is based on the following patch:
   [1] soc: mediatek: Add mmsys func to adapt to dpi output for MT8186
   https://patchwork.kernel.org/project/linux-mediatek/patch/1663161662-1598-2-git-send-email-xinlei.lee@mediatek.com/
2. Modify the DPI_FORMAT_MASK macro definition to GENMASK(1, 0);
3. Add all settings to mtk_mmsys_ddp_dpi_fmt_config;
4. Modify the commit title to Add mt8186 dpi compatibles and platform
data.

Changes since v6:
1. Different from other ICs, when mt8186 DPI changes the output format,
the mmsys_base+400 register needs to be set to be valid at the same
time.
   In this series, all the situations that mmsys need to be set up are
perfected (not necessarily used in practice).
2. Put the value that controls the mmsys function in mtk-mmsys.h.
3. Encountered the sink ic switched between dual edge and single edge,
perfected setting and clearing mmsys bit operations in mtk_dpi.c.

Changes since v5:
1. Separate the patch that adds edge_cfg_in_mmsys from the patch that
adds mt8186 dpi support.
2. Move the mmsys register definition to mmsys driver.
 
Changes since v4:
1. This series of cancellations is based on the following patches:
   [1] Add MediaTek SoC(vdosys1) support for mt8195
   https://patchwork.kernel.org/project/linux-mediatek/cover/20220711075245.10492-1-nancy.lin@mediatek.com/
   [2] Add MediaTek SoC DRM (vdosys1) support for mt8195
   https://patchwork.kernel.org/project/linux-mediatek/cover/20220804072827.22383-1-nancy.lin@mediatek.com/
2. Added mtk_mmsys_update_bits function in mtk-mmsys.c;
3. MMSYS 0x400 register is modified to MT8186_MMSYS_DPI_OUTPUT_FORMAT;
4. Fix formatting issues.

Changes since v3:
1. Fix formatting issues;
2. Modify the edge output control name & description;
3. Fix the threading problem.

Changes since v2:
1. Modify key nouns in the description;
2. Add the label of jitao to Co-developed-by;
3. Macro definition address lowercase problem and function naming;
4. Add missing a description of this property in the mtk_dpi_conf.

Change since v1:
1. Modify mt8186 compatiable location.
2. Modify MT8186_DPI_OUTPUT_FORMAT name.

When MT8186 outputs dpi signal, it is necessary to add dual edge output
format control in mmsys.

Xinlei Lee (3):
  soc: mediatek: Add all settings to mtk_mmsys_ddp_dpi_fmt_config func
  drm: mediatek: Set dpi format in mmsys
  drm: mediatek: Add mt8186 dpi compatibles and platform data

 drivers/gpu/drm/mediatek/mtk_dpi.c     | 32 ++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
 drivers/soc/mediatek/mt8186-mmsys.h    |  8 ++++---
 drivers/soc/mediatek/mtk-mmsys.c       | 27 +++++++++++++++++-----
 include/linux/soc/mediatek/mtk-mmsys.h |  7 ++++++
 5 files changed, 67 insertions(+), 9 deletions(-)

-- 
2.18.0


