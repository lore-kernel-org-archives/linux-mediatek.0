Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29908CF043B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 03:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=54xyWz4a2D85QI+xC3BxVKJ9XDsv9VZMASkib0bdO84=; b=e8IOPNIqdlpIGNoEseorysOy6I
	EtgQehm/qOYvdiAJ6NajZHjZfnvmCWc6lTXA9et5Sr+6FEUVxj+BBf+EutNHSAMer6Pw0926GM43r
	/8FeG4UDeaX7PgDIjT0ecnPQ1cI+WyPV8140V++xcOFJEM+q0VO6sbR5xxeAlLuCMgzSq7VJTXu9v
	LwRnkvmc/CDKK1OQnuLvJEbgFWT8H+s1AEjiztNudx/V6WEG7lfssGCILGVGHcwj8XEKkqIURDElz
	jFV6pRfUNeZIqOV4zrDwRcWYm0MgLOJytfU+ofnE7NnRbqOuDj3WU41hh0IcrE0GCzSXx0U0ISFFP
	qMrhyEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syNmy-00000007pEU-0wOZ;
	Wed, 09 Oct 2024 03:55:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syNfT-00000007o8v-0R8M;
	Wed, 09 Oct 2024 03:47:20 +0000
X-UUID: 25be1db485f111efb3adad29d29602c1-20241008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=54xyWz4a2D85QI+xC3BxVKJ9XDsv9VZMASkib0bdO84=;
	b=P5pybmcOqV+bqsin6NMA6k+Nzb0a64kYg9IKtuftGLntqxYOBZlokXD9r6u7wUyq85+dYCGX5GMOYFKPQrOo7P4M425rUEsQ9HqelZrl9QRmSiy5WxtLgKM70XJvas7/9GXt3qP8aE7q6NmyGLPEXqXVGu2Ov3PXmh5OqPj7iy0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:4e2d699c-6cf0-4616-bb02-09610c2c719a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:0773f764-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 25be1db485f111efb3adad29d29602c1-20241008
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2117727660; Tue, 08 Oct 2024 20:47:03 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 11:46:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Oct 2024 11:46:46 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Adam Thiede <me@adamthiede.com>, Yassine Oudjana
	<yassine.oudjana@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Shawn Sung <shawn.sung@mediatek.com>, Alper Nebi Yasak
	<alpernebiyasak@gmail.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v11 0/5] Fix degradation problem of alpha blending series
Date: Wed, 9 Oct 2024 11:46:41 +0800
Message-ID: <20241009034646.13143-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.487700-8.000000
X-TMASE-MatchedRID: Bmel4SMifV92eFocrSghDt8tWTI1R8epCt4iaV1DkEPXIZTIUrehXn/s
	DLdkieHykxyCprbGHp2Z4TZMmYnlr2NvKIW9g24ouHNkj91+t04hotH7bEpEMlvo8FSqar5SuI1
	3sJeM6KfZU73Z3Yt4Vn/OPC6s46aMrcd0tH16JfGzI1v7J4hECoEcpMn6x9cZZ3q824boKrIc17
	njdGO+ZQPsLEg6BY+lZlmpNfxAMbQAzT8btdR14x+WEMjoO9WWfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtJC9jS54qtzUFGfLQlTTMHhdwYvuMXwInYYXWMPWzMtso/HuGXyGdWg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.487700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 96CF009706D716DBD987DC11F0397D6490E6F2BA6C6C9BAFB14B8775034B70DB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_204719_222702_661A9C23 
X-CRM114-Status: GOOD (  13.55  )
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

Some SoCs do not support the ignore_pixl_alpha flag, which breaks the
XRGB8888 format. Some SoCs do not support pre-multiplied pixel formats
and extending configuration of OVL pre-multiplied color formats,
such as MT8173.

Fix the SoC degradation problem by this series.

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---

Change in v11:
Fix typo in commit message.

Change in v10:
1. Fix the commit message and comment for OVL_CON_AEN

Change in v9:
1. Add the fix patch for the XRGB8888 downgrade issue of MT8173
2. Add the refine patch for ignore_pixel_alpha statement

Change in v8:
Remove blend_modes for not supported pre-multiplied SoCs to fix the
return error from drm_plane_create_blend_mode_property().

Change in v7:
1. Add the remove color format comment patch for OVL
2. Fix warning: 'const' type qualifier on return type has no effect

Chnage in v6:
1. Use blend_modes instead of function pointer in OVL
2. Use ethdr instead of mdp_rdma to get blend_modes
3. Add 0 checking for adding blend_mode property for mtk_plane

Change in v5:
Add fix patch for mtk_plane

Change in v4:
Add lost cases of mtk_ovl_fmt_convert_with_blend

Change in v3:
Change MACRO approach to function pointer in driver data

Change in v2:
Fix build error and typo

Change in v1:
Add fix patch for OVL unsupport color format settings by driver data

---

Jason-JH.Lin (5):
  drm/mediatek: ovl: Fix XRGB format breakage for blend_modes
    unsupported SoCs
  drm/mediatek: ovl: Refine ignore_pixel_alpha comment and placement
  drm/mediatek: ovl: Remove the color format comment for
    ovl_fmt_convert()
  drm/mediatek: ovl: Add blend_modes to driver data
  drm/mediatek: Add blend_modes to mtk_plane_init() for different SoCs

 drivers/gpu/drm/mediatek/mtk_crtc.c           |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  2 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       | 10 +++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  2 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 70 ++++++++++++++-----
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  7 ++
 drivers/gpu/drm/mediatek/mtk_ethdr.c          |  7 ++
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |  1 +
 drivers/gpu/drm/mediatek/mtk_plane.c          | 15 ++--
 drivers/gpu/drm/mediatek/mtk_plane.h          |  4 +-
 10 files changed, 92 insertions(+), 27 deletions(-)

-- 
2.43.0


