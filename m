Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27610C54E68
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Mar 2024 12:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ExKWeZtF1o/H6VvLIV2C1PGZug2wLFclbrXuhugazns=; b=et/E0swwL1d66VxKVOqRZlB0gr
	5kVasPYe9WHgKrgskV02feGlLj3yP0y9hcamBAKE2SM4vzVX3L4QDvOssfkPRDza3Ec8lt3DWbduy
	HsnqfMBwB2A3iVRFfXa3AHnni4l1IPEEefqohfBOyKAEJsvPWZ/OZEWy9WbLwf3MgMG9UZyJpOepX
	Zn16TZEGCz+ut2TGmf2lZhCF3lsLvXzVb+pvxEB3bMnOWruCOjlyF4mvyHvnqhO6+tUue68p0Jlb5
	7O4G2A0EmLBSNUyOuXXhUnErtXUBsg3tKh0bUC+fQqKEEmlAy+YpGqv+vNPUr2v/i+1wHPgZSsVfN
	TrkfDf2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkkE1-0000000EFXL-3MTi;
	Thu, 14 Mar 2024 12:30:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkkDx-0000000EFVa-43Q4;
	Thu, 14 Mar 2024 12:30:20 +0000
X-UUID: 9b30944ce1fe11ee9aa9374d6d45775a-20240314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ExKWeZtF1o/H6VvLIV2C1PGZug2wLFclbrXuhugazns=;
	b=QjCyBJYeFKc957okieBTwMcitgoYSS5YWSDrTbDkLOXOauR/mtquFCPlBaPEoaovKZ3X4TdGUJpERXDhYSsz0P2XmGUPA0QERALKV4dwB4BH6yQIeMRNLnQ46tj8Jml1IYxoucnWJYN4II3zF0R9VvBJhFxXrO0iqbJkMB4RrpM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:4b24a543-914f-46de-8cf1-a27c4b99697e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:7dc10085-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9b30944ce1fe11ee9aa9374d6d45775a-20240314
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 755685587; Thu, 14 Mar 2024 05:30:13 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Mar 2024 20:30:10 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Mar 2024 20:30:10 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>, Irui Wang
	<irui.wang@mediatek.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,0/2] media: adding lock to protect the context list
Date: Thu, 14 Mar 2024 20:30:07 +0800
Message-ID: <20240314123009.20205-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_053019_137229_4F499048 
X-CRM114-Status: GOOD (  10.08  )
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

The ctx_list of each module will be deleted when scp getting
unexpected behavior, then the ctx_list->next will be set to NULL,
the system reboot when access the NULL pointer in function
vpu_enc(dev)_ipi_handler to go through each context.

---
Changed in v4:
- Re-write the commit message for patch 1/2
Changed in v3:
- change 'Fixes' tag in patch 1/2
- add cover-letter for this patch series
---
Yunfei Dong (2):
  media: mediatek: vcodec: adding lock to protect decoder context list
  media: mediatek: vcodec: adding lock to protect encoder context list

 .../platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c   | 8 ++++----
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c | 5 +++++
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h | 2 ++
 .../media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c  | 2 ++
 .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c | 5 +++++
 .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h | 2 ++
 .../media/platform/mediatek/vcodec/encoder/venc_vpu_if.c  | 2 ++
 7 files changed, 22 insertions(+), 4 deletions(-)

-- 
2.18.0


