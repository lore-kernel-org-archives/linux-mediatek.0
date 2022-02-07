Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198EFC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 05:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gOCYIKAlAHrHHHU2KsNvMHyPOt4Cmh9yB6ahNYS1aao=; b=tIl4LTNkd/CZ47
	ztjqPpgqXLEC+8CVlHmXFU0M9LBIsBVn5B0E+laC/fmfTfH+dr1OHRyGwpKcXFIwpP09Jyb6xizHs
	nzHSDZwtPwb3azkFrF1mxVM7QhtPZJZ/pNglHM1Ug2Ill4sn6Aj+e+stx/ZQE6hgenqCDt9HMcBGb
	7DaUIIgZ4VDiBCYA0UpIRN86PV/aGoBeINCTkP5+PQCAdXcDaQ8DNsSe0kd1L8KtJXC4TSNQDikXo
	Rpewi96cEmwe1U7d2JCvPNFQH+y1nvBJ050QnZFDZpJPGp+kwgh7VCaXJeOAjF/AaPODl9rdRfum3
	TSPxd7/tQDMd7UGc0Big==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGwF3-0092Gs-Ss; Mon, 07 Feb 2022 05:07:09 +0000
Received: from mailgw02.mediatek.com ([66.171.122.166])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGwEY-00928e-El; Mon, 07 Feb 2022 05:06:40 +0000
X-UUID: fd7c43e55d464443aaa01318064861f6-20220206
X-UUID: fd7c43e55d464443aaa01318064861f6-20220206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1948725120; Sun, 06 Feb 2022 22:06:34 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Feb 2022 20:56:31 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Feb 2022 12:56:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Feb 2022 12:56:30 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <narmstrong@baylibre.com>, <robert.foss@linaro.org>,
 <andrzej.hajda@intel.com>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <p.zabel@pengutronix.de>
CC: <xji@analogixsemi.com>, <jitao.shi@mediatek.com>,
 <xinlei.lee@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [v11,
 0/3] force hsa hbp hfp packets multiple of lanenum to avoid screen
 shift
Date: Mon, 7 Feb 2022 12:56:22 +0800
Message-ID: <20220207045625.17713-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_210638_521106_3B7D01D5 
X-CRM114-Status: UNSURE (   7.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes since v10:
 - Rebase to 5.17-rc3.
 - Add more maintainers.

Changes since v9:
 - Change description of "MIPI_DSI_HS_PKT_END_ALIGNED".
 - Use mode_flags directly instead of another variable on patch [2/3].
 - Add explanation of implementation in mtk_dsi.c on commit message of [2/3].

Changes since v8:
 - Use mode_flags to control this limitation instead of "hs_packet_end_aligned".
 - Add new bit definition "MIPI_DSI_HS_PKT_END_ALIGNED" for mode_flags.

Changes since v7:
 - Rebase to kernel 5.16
 - Add tags of reviewed-by and acked-by.
 - Add detailed commit message for flag "hs_packet_end_aligned" in DSI common driver.

Changes since v6:
 - Add "bool hs_packet_end_aligned" in "struct mipi_dsi_device" to control the dsi aligned.
 - Config the "hs_packet_end_aligned" in ANX7725 .attach().

Changes since v5:
 - Search the anx7625 compatible as flag to control dsi output aligned.

Changes since v4:
 - Move "dt-bindings: drm/bridge: anx7625: add force_dsi_end_without_null" before
   "drm/mediatek: force hsa hbp hfp packets multiple of lanenum to avoid".
 - Retitle "dt-bindings: drm/bridge: anx7625: add force_dsi_end_without_null".

Rex-BC Chen (3):
  drm/dsi: transfer DSI HS packets ending at the same time
  drm/mediatek: implement the DSI HS packets aligned
  drm/bridge: anx7625: config hs packets end aligned to avoid screen shift

 drivers/gpu/drm/bridge/analogix/anx7625.c |  3 ++-
 drivers/gpu/drm/mediatek/mtk_dsi.c        | 12 ++++++++++++
 include/drm/drm_mipi_dsi.h                |  2 ++
 3 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
