Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C859BC5478C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 09:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6B0HV0kGS0T2iBD7E8AlFvFIWEbIwJXtwEBE1cSDwcc=; b=oM7S5lRtO5oG3K5d/PAe/PBi3l
	NPenQq0etvI/lcjEEcHEkKMBIzvQs3ZNkZlZplZmALQyptRFt+wUhpKj5ddFFzZZ12ViY8piJO+mm
	5OnJeYrysBuBIcvdiBBk8ZsLo5OLQh3OIG+YzHDinknorMxaMsIMoXdalA42wpB4foYZGD8d7g2rJ
	BfchQ3LHZ3Lm+M8CSU5W3G+a2URdQOZbfXUy2KqlYeQ5/cy+YSlGUVsLaGaoHkSBRZohFHk1fN+Oz
	f3AUTN0wtAEktHPPLIIO9MzHDm9tCRw/xv8cMWLgz4NBmj50u0b0pkx4oYy9VTVWNC5ZQ2eVoAHdM
	6Phzb1YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5M4-00000004EJy-1AgE;
	Thu, 22 Feb 2024 09:27:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5Lz-00000004ECt-15XC;
	Thu, 22 Feb 2024 09:26:56 +0000
X-UUID: 7ef12df0d16411eeb017d5921c808e14-20240222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6B0HV0kGS0T2iBD7E8AlFvFIWEbIwJXtwEBE1cSDwcc=;
	b=fdJEjhpStBozUjQKLMxOSpKIYZ3GECjy8bvVjOtSCKL/E70JJ07r/75SIAOfXpyu1kJCT5JQ4kajntdbE8gsjrPZAanv8JQvfbCaL+NZ3xYwQfCuxwm7FyfcuXPr+wYpdmVSLxSPSokmeLZRRxSpsOIlF6REAXM5ccuidypX2RY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:12050e0a-8eec-4fbe-9c3c-5f4c94da3918,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-35
X-CID-META: VersionHash:6f543d0,CLOUDID:1806b080-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7ef12df0d16411eeb017d5921c808e14-20240222
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 302283240; Thu, 22 Feb 2024 02:26:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 22 Feb 2024 17:26:10 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 22 Feb 2024 17:26:09 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Irui
 Wang <irui.wang@mediatek.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3,0/2] media: adding lock to protect the context list
Date: Thu, 22 Feb 2024 17:26:07 +0800
Message-ID: <20240222092609.31382-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_012655_332565_1B14B5F3 
X-CRM114-Status: UNSURE (   9.93  )
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

From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>

The ctx_list of each module will be deleted when scp getting unexpected
behavior, then the ctx_list->next will be set to NULL, the system reboot
when access the NULL pointer in function vpu_enc(dev)_ipi_handler to go
through each context.

---
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


