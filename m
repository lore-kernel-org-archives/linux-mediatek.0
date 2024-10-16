Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07ECD2069A
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 03:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UX52YhdbKgD96uWWXtuamNI4w+fkohPbaLtS/+eKN6U=; b=T7yPYXApifEDCGLSJ+rVuYSvUE
	CXiZsPC+B6McHHbuN9w8u6WP66YZTRRxBZ6ugzOW4VW7hnSR5QNxCuwA/CrKQAIuLLGRY3nPJQkDo
	U1PVekqv8C6A2yc4WvY3jQN/2mMZa+Y8cAND+uf7YmYO/HYIEZ+oxI2Mc3Wl9iIraHXNYpmoQ5/33
	A2X2diHBGDNYGym0KZsdEulYjlnTxLt+16Fp06zT1e8beb/EtGHLMqau+ehmtOYXy6PLp8XyYoLJF
	VsqJV6ICl7+gGyURnmVr+c6Cvn542F4Qhi9t0nhJtvYD+aACgK9v1g/g/yQnHm0eTZfHbEg4QLGIJ
	pij+eq6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0v3G-0000000AOdy-3qEQ;
	Wed, 16 Oct 2024 03:50:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0v2R-0000000AOSP-3Wp6;
	Wed, 16 Oct 2024 03:49:33 +0000
X-UUID: a55bb9488b7111efba0aef63c0775dbf-20241015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=UX52YhdbKgD96uWWXtuamNI4w+fkohPbaLtS/+eKN6U=;
	b=nDSVfLp2/IQ+n4FIsafpBaNO/zI7F0N8BU5mfp1zgFvoJlKGLYl/+NIZ6in+7D8W44pj0s6k3so72okIA9pk9/7ytbQ0DEFydwN+BttVpfIs1+MTnYDue5SQJ6TpDYe5ZVVCdgMIQD4Kw/efalK6p5sfjNR2rZi6R0U+XS2Rw6c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:7c2fecdc-a8b9-4ada-aec6-3e36ecce02c9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:f90c5165-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: a55bb9488b7111efba0aef63c0775dbf-20241015
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1284294456; Tue, 15 Oct 2024 20:49:29 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 16 Oct 2024 11:49:26 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 16 Oct 2024 11:49:25 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve
 Cho <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 0/6] media: mediatek: vcodec: support h264 extend vsi
Date: Wed, 16 Oct 2024 11:49:19 +0800
Message-ID: <20241016034927.8181-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_204931_906118_64F332E0 
X-CRM114-Status: GOOD (  11.13  )
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

Re-construct some interface and add configuration to support extend
and non extend at the same time. Needn't to parse nal info for extend
architecture.
---
This patch series depends on:
[1] https://patchwork.kernel.org/project/linux-mediatek/cover/20241012064333.27269-1-yunfei.dong@mediatek.com

---
compared with v1:
- combine some pathes together for patch 2
- re-write patch 4
---
Yunfei Dong (4):
  media: mediatek: vcodec: remove vsi operation in common interface
  media: mediatek: vcodec: support extend h264 video shared information
  media: mediatek: vcodec: support extend h264 driver
  media: mediatek: vcodec: remove parse nal info in kernel

 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   2 +
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 511 +++++++++++++++++-
 2 files changed, 486 insertions(+), 27 deletions(-)

-- 
2.46.0


