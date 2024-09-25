Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC03FC369CA
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 10:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TugJHXCaFkeeyesFwwQUZjkVyiQ4jMA5hShejsDmsrA=; b=XQOpqX3FFFos4/E8DaFDNXcqD/
	tzn2nSK1oQvVNVkCGkQ8MWcpOOLaRnuEOT5HkwT1AK7bwJxkOpCgm7ZtnSYlTGCEGtWKYueUJiKX2
	oWIQTCBxZ0W1J3t4DEVtVxGvHtsLre9PTUkQE1qRXiHTtat4rXK3VrJdp1OK2FrN3DsXNIRWLLKb0
	g5BkDZUb259vclb7K/Oil7H5edTgHkNxnvyZIu6KgzbmyFdAVb72KGQYP+8sneiWJpqeeUIigy6uo
	MOfi5GCuVMcqaqFCjaMSrA++QsXvE76rUZTUKsHLgquU1VmMH/01GWi7oHCLHFChe8gdov5teJWBE
	4ordDUHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stP9k-00000004jqZ-3brj;
	Wed, 25 Sep 2024 10:22:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stP7T-00000004jU7-1SMD;
	Wed, 25 Sep 2024 10:19:41 +0000
X-UUID: a83b30e47b2711efb3adad29d29602c1-20240925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TugJHXCaFkeeyesFwwQUZjkVyiQ4jMA5hShejsDmsrA=;
	b=EGf40Cak4lWXquov7qXmLodBmK5ijblXtOq+bzctm7a37WpqcV54ToY3pPF80gzzOj0LdUVZUj4Zn2aH7ojicdDnxHGNoePgUlvPeC633FfaW33pBnSYdhVIfhqrJsTA75/stbN7kMf0ewxH3MV2HNLe/3kXtu1vxreVEOzD0mw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:6ebdb6f6-e740-4d4a-b3e0-57eabd4f9b21,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:14f7bed0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a83b30e47b2711efb3adad29d29602c1-20240925
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 753935497; Wed, 25 Sep 2024 03:19:32 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Sep 2024 18:19:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Sep 2024 18:19:28 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Shawn Sung <shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-jh Lin
	<jason-jh.lin@mediatek.corp-partner.google.com>
Subject: [PATCH v5 0/2] Fix degradation problem of alpha blending series
Date: Wed, 25 Sep 2024 18:19:25 +0800
Message-ID: <20240925101927.17042-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.489600-8.000000
X-TMASE-MatchedRID: 7VDZqSP3y+1zDgxKJu7ruvSZ/2axrnPB1KoSW5Ji1XuPaLJ/Ca3ST/T9
	YCTkB8JLpEJ5RjVa0d0+zJdigxeeCDW+K/PcvqBrydRN/Yyg4pi4vBuE2X0HlQdFz8y7LneV8oL
	zUWewXkiVMlcqqHWd7aBVvEjzNBpCHxPMjOKY7A8LbigRnpKlKSPzRlrdFGDw5s9yGugQduwwcm
	99lxyatwQsom3hlNW0uy4ZmLibKBgwPvERclccVw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.489600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 646BF43563C005C7C2E41D5D2A092AFB2EF8869251E77B8858EABB8248E8A2462000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_031939_483812_B1A56872 
X-CRM114-Status: GOOD (  10.43  )
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

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

Some SoCs not support pre-multiplied pixel formats and extending
configuration of OVL pre-multiplied color formats, such as MT8173.

Fix the SoC degradation problem by this sreies.

---

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

Jason-JH.Lin (2):
  drm/mediatek: ovl: Add fmt_convert function pointer to driver data
  drm/mediatek: Add blend_modes to mtk_plane_init() for different SoCs

 drivers/gpu/drm/mediatek/mtk_crtc.c           |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  2 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       | 10 ++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  3 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 93 +++++++++++++++++--
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  7 ++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       |  8 ++
 drivers/gpu/drm/mediatek/mtk_plane.c          |  9 +-
 drivers/gpu/drm/mediatek/mtk_plane.h          |  4 +-
 9 files changed, 122 insertions(+), 15 deletions(-)

-- 
2.43.0


