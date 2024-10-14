Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BAACFC500
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 07:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ccPUlxoWYb2N/Xj1O6fXBzFxm62ZRQMc5csPYeqYmk=; b=AZ2EU85Bbt+vSspzPitiLJG2B4
	lmlhDBvZbiFVkUYBcEIIdin2R0XqC3YH1RrgIxmu4+y84kHzzjqzSjtcg19AH+azV/9rPCjg/VDk1
	G3ggy1yTDvnGIAGW6k9iMK313S3IogodO2n/PBlekkudIhX34B+Vej5fFY4ZGSU94bvXo3bnnEvS4
	KPLEBlPSUGnlEUvpAYZ/7rt7AnVtrOCaIX/NDa3zpJb3rgR0+7hnLTwKsMb0bWpzePhgAoMfENO3f
	+G7nOjraa2aKnjEXdC/4JodwAm8VlcELqgDgSSpRQVAADcXeB8r/GIwxWZf/KfaMgMr77EeGVXJN3
	fiBbxOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0FaD-000000044WK-3wt7;
	Mon, 14 Oct 2024 07:33:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0FZx-000000044R6-1ksN;
	Mon, 14 Oct 2024 07:33:22 +0000
X-UUID: 92b5f00289fe11efba0aef63c0775dbf-20241014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+ccPUlxoWYb2N/Xj1O6fXBzFxm62ZRQMc5csPYeqYmk=;
	b=H22dOdLm0WQci99chqRDyPI8Mi/HPfHD3n2kcLzuCrg4wIjFyGcgAqzIY9n7uf+m7ChJE1bix94vBiJ3qacA+UUYRV90Wpq8EjtFT0HwRKe2pJT2msAcU3qdUDlKfrVghiY5/r629I05iqjlg1x1X/LSbCUMI+0fZjhTHOfqZaw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:5cdabb37-893c-4a1c-abc5-6ab9ff081f51,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:d1913641-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 92b5f00289fe11efba0aef63c0775dbf-20241014
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 835974239; Mon, 14 Oct 2024 00:33:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 14 Oct 2024 15:33:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 14 Oct 2024 15:33:10 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 0/6] media: mediatek: vcodec: support h264 extend vsi
Date: Mon, 14 Oct 2024 15:33:04 +0800
Message-ID: <20241014073314.18409-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.660900-8.000000
X-TMASE-MatchedRID: AIneCDrHljUEQqIqKFLtTmf5YFI3LLMhmX+W7bzPOQFcKZwALwMGs0cW
	Drfntjxwc6aye5Pnub+uVX99ICt6ji6NsFOtZ8f6EhGH3CRdKUVWOQQSa4vbHQfxTM57BPHD12F
	2GovFrSOVMlcqqHWd7aBVvEjzNBpCHxPMjOKY7A8LbigRnpKlKTpcQTtiHDgW4g49Ra2QKgvDfU
	E7T1eqLdVCaGNhZgZBCDiARPE8nvNojKASPn5iew==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.660900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 86686F6C60E70B8125DCE2D6446E57279E7D83F3E49091D6548527FC217E89402000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_003321_485352_D7CEC384 
X-CRM114-Status: UNSURE (   8.99  )
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

The working buffer address start and end are calculated in kernel
side currently, can't calculate the address end if the driver only
getting the address file handle, not the real physical address. Need
to extend the vsi to calculate the address end in scp.

Re-construct some interface and add config to support extend and non
extend at the same time.
---
This patch series depends on:
[1] https://patchwork.kernel.org/project/linux-mediatek/cover/20241012064333.27269-1-yunfei.dong@mediatek.com
---
Yunfei Dong (6):
  media: mediatek: vcodec: extend h264 video share information
  media: mediatek: vcodec: remove parse nal info in kernel
  media: mediatek: vcodec: remove vsi operation in common interface
  media: mediatek: vcodec: rename vsi to extend vsi
  media: mediatek: vcodec: adding non extend struct
  media: mediatek: vcodec: support extend h264 driver

 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   2 +
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 516 +++++++++++++++++-
 2 files changed, 493 insertions(+), 25 deletions(-)

-- 
2.46.0


