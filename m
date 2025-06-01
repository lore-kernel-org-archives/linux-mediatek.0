Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE2DC54FB3
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Jun 2025 17:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PY+ALpqUBHRjs74wiRoQJwK5x0+HaE1qFxtkUe6SylM=; b=PpVtNwOJXg9OUNjxoqHYk7W+2W
	c+6A+bkMqysVThYi32zneIdn3Ud8/VuyOjC15dZkx39H3mEHQuxaSabCcgeI6eowj7jlbCm/gSGqz
	1nnLf6svprBIz4DTibl2oo7mx5sWPL9zy6NG6Oonoh0wSeuhua+9Ovi6uJJeTGzpH9wOj4C0Bxl0r
	MaR2+qEFKCT2Kyio/LXeBNomUBAEsOjMn8PAfr229VyCLsByK3WJwvDDdwTU7Tt2tHpoN874/i17r
	r26ypSfKTdJ22VjZA4BgtqrgE4z5H8juePbbCO3MlzidGXIFgxtHFxKMoi71FfCiHfLp4dZEoubpi
	d45LUyVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLmtd-00000005nqu-0OXC;
	Sun, 01 Jun 2025 17:54:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLmZY-00000005l0L-3Tkx;
	Sun, 01 Jun 2025 17:34:15 +0000
X-UUID: 9e6a7f423f0e11f08d385d50fb11b32d-20250601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=PY+ALpqUBHRjs74wiRoQJwK5x0+HaE1qFxtkUe6SylM=;
	b=BZPOJ5HA3FIdhH4yrcMHVZbYbxafOzazghA1349BO9ciTNxgUYiekfj9o0FuuuB1EQj/mkxOWOqhOego3okI8lcv1Zv+HIJe/So6zKrZa+AKQhB4vzbvqtVr0V25jIM7B7a3rSgYkKklhxPzc/kbYqPMQ4mTdoCe5PFqsP0mbaE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:05e6a8de-61d6-406b-9251-b69990681f01,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:1124f447-ee4f-4716-aedb-66601021a588,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 9e6a7f423f0e11f08d385d50fb11b32d-20250601
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1988834614; Sun, 01 Jun 2025 10:34:06 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 2 Jun 2025 01:34:02 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 2 Jun 2025 01:34:02 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
Subject: [PATCH v6 00/20] Add GCE support for MT8196
Date: Mon, 2 Jun 2025 01:31:32 +0800
Message-ID: <20250601173355.1731140-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_103412_916437_78B19899 
X-CRM114-Status: GOOD (  18.08  )
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
Cc: devicetree@vger.kernel.org, Moudy Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Chen-yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Paul-PL Chen <paul-pl.chen@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Sirius Wang <sirius.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series adds support for the MediaTek MT8196 SoC in the CMDQ
driver and related subsystems. The changes include adding compatible
names and iommus property, updating driver data to accommodate hardware
changes, and modifying the usage of CMDQ APIs to support non-subsys ID
hardware.

---

Change in v6:
1. Move the removal patches to the end of series.
2. Fix build error for cmdq_pkt_jump_rel_temp patch.

Change in RESEND v5:
1. Separate the removal of cmdq_get_shift_pa() from [PATCH v5 03/19] to a
   single patch [PATCH RESEND v5 10/20].

Change in v5:
1. Rebase on tag: next-20250424 + patch [1].
2. Split adding driver data for MT8196 patch to 3 independent patch
   and add more detail commit message to each patch.
3. Refine passing shift_pa as the parameter in API to storing it into
   the cmdq_pkt.
4. Refine DMA address potential issue in cmdq mailbox driver.
5. Change the mminfra_offset related mbox API to passing it by cmdq_pkt.
6. Add new cmdq_pkt_write_pa() and cmdq_pkt_write_subsys() APIs to
   replace the cmdq_pkt_write().

[1] mailbox: mtk-cmdq: Refine GCE_GCTL_VALUE setting
- https://patchwork.kernel.org/project/linux-mediatek/patch/20250421035650.441383-1-jason-jh.lin@mediatek.com/

Change in v4:
1. Remove dt-binding header and add a gce header in dts folder.
2. Remove dot in sign-off name.
3. Change addr type from u32 to dma_addr_t for cmdq_reg_shift_addr() and
   cmdq_reg_revert_addr().

Change in v3:
1. Merge 2 dt-bindings pathes together and add more detail commit message.
2. Change type u32 to phys_addr_t for pa_base of struct cmdq_client_reg.
3. Remove cmdq_subsys_is_valid() and subsys_num in CMDQ driver.
4. Add CMDQ_SUBSYS_INVALID to check subsys instead of using
   cmdq_subsys_is_invalid().
5. Make use of CMDQ_THR_SPR0 define to the parameter of CMDQ APIs.
6. Rebase on the new MACRO in mtk-mdp3-comp.h.

Change in v2:
1. Remove the constant and fix warning in dt-bindings.
2. Remove the pa_base parameter of CMDQ APIs and related modification.
3. Move subsys checking to client drivers and use 2 alternative
   CMDQ APIs to achieve the same functionality.

---

Jason-JH Lin (20):
  arm64: dts: mediatek: Add GCE header for MT8196
  mailbox: mtk-cmdq: Refine DMA address handling for the command buffer
  mailbox: mtk-cmdq: Add cmdq private data to cmdq_pkt for generating
    instruction
  soc: mediatek: mtk-cmdq: Add cmdq_get_mbox_priv() in cmdq_pkt_create()
  soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing
    shift_pa
  mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
  mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM
    transaction
  mailbox: mtk-cmdq: Add driver data to support for MT8196
  soc: mediatek: mtk-cmdq: Add pa_base parsing for hardware without
    subsys ID support
  soc: mediatek: mtk-cmdq: Add new APIs to replace cmdq_pkt_write() and
    cmdq_pkt_write_mask()
  soc: mediatek: mtk-cmdq: Add mminfra_offset adjustment for DRAM
    addresses
  soc: mediatek: Add programming flow for unsupported subsys ID hardware
  drm/mediatek: Add programming flow for unsupported subsys ID hardware
  media: platform: mtk-mdp3: Add programming flow for unsupported subsys
    ID hardware
  media: platform: mtk-mdp3: Change cmdq_pkt_jump_rel() to
    cmdq_pkt_jump_rel_temp()
  soc: mediatek: mtk-cmdq: Remove shift_pa parameter from
    cmdq_pkt_jump()
  media: platform: mtk-mdp3: Use cmdq_pkt_jump_rel() without shift_pa
  soc: mediatek: mtk-cmdq: Remove cmdq_pkt_jump() and
    cmdq_pkt_jump_rel_temp()
  soc: mediatek: mtk-cmdq: Remove cmdq_pkt_write() and
    cmdq_pkt_write_mask()
  mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()

 arch/arm64/boot/dts/mediatek/mt8196-gce.h     | 612 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  24 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            | 115 +++-
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  16 +-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  70 +-
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |   2 -
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |   1 -
 drivers/soc/mediatek/mtk-cmdq-helper.c        |  68 +-
 drivers/soc/mediatek/mtk-mmsys.c              |  12 +-
 drivers/soc/mediatek/mtk-mutex.c              |   8 +-
 include/linux/mailbox/mtk-cmdq-mailbox.h      |  19 +-
 include/linux/soc/mediatek/mtk-cmdq.h         |  83 ++-
 12 files changed, 941 insertions(+), 89 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-gce.h

-- 
2.43.0


