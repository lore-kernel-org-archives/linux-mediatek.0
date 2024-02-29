Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA97C48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 10:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8mZe/2ayLC1nbMG8YNHZKyZz78ymXaSQ8iXw5n6PhEY=; b=mZRYJea6bhJ16kiKH+Q/VMKy1+
	WUsZdasrxUHZogx7dCwsgQwg8tOy2ZLNyQGLiy1ZciNiF+PUbT16saCZMD1E/jcSz1NM0fhH8RH5B
	ns3Aa0hxCV2oRxxbt9tQWXCzOIoKMpshs9viCWrdrsfZ3gpc1L0nsuv/zdRpRzuCGYGH2a1WUdCgJ
	cx1Qpt2jXoJCTioIyCgWLGoNDo6B8pfPK2Hf4Aeb9haaRKtQIKwnNa7TFgbp2MRLp4JGl5IMbGJW2
	j6otzdYdF20XwVqSoMulqkkTfYHQOfs+Yfr2/g0J0I5Wo+lEknXHLd0xNRPGNQavo7X5W7VR8J3LC
	MMUHlYVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfdSh-0000000D6iH-2o3B;
	Thu, 29 Feb 2024 10:16:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfdSf-0000000D6gv-12Fi;
	Thu, 29 Feb 2024 10:16:22 +0000
X-UUID: 933e0012d6eb11eea40fa5ac21cdad35-20240229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=8mZe/2ayLC1nbMG8YNHZKyZz78ymXaSQ8iXw5n6PhEY=;
	b=N/cP+7EMBel7PGEdQ2X0OEdtEbJgZsV+mBcucne+5S43i4PWCLE86YdKO5dJjfgaOpE4u4HX3zAMei/q+c2J3LNmyjA8TlgUeHBhvcZ1+7pgi2bXb7oaQKVQWn1nEG17pR5u8XY/MkZFgVD9UCwqzpg1Oiv+UXfEiSxO/4pbaO0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:e78dc7bb-69da-43ae-a5fe-a33f6728936d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:b17a7384-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 933e0012d6eb11eea40fa5ac21cdad35-20240229
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 873764065; Thu, 29 Feb 2024 03:16:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 29 Feb 2024 17:56:12 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 29 Feb 2024 17:56:12 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 0/3] media: mediatek: vcodec: fix vcodec smatch warning
Date: Thu, 29 Feb 2024 17:56:08 +0800
Message-ID: <20240229095611.6698-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.692400-8.000000
X-TMASE-MatchedRID: GsIztItoYiqoft0ZW3r/iTCaEJt46PppMZm0+sEE9mv7efdnqtsaE2qs
	CKGiHb6RWXHfTJ/rMPZKhBUJyxjhBiY0eULsNBXlngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIfiA
	qrjYtFiQtkoiozVGxQwPgUY24KmPEUzhAlmaaSM7Hh1Xl/pN1bX7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.692400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C12846495FBB9F31E1C1D1D305CD86C0CE38D318B493888AF7439DD448A5A48B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_021621_303959_66C34990 
X-CRM114-Status: UNSURE (   5.83  )
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

Fix below smatch static checker warning from [bug report]:
The patch 397edc703a10: "media: mediatek: vcodec: add h264 decoder
driver for mt8186" from May 12, 2022 (linux-next), leads to the
following (in development) Smatch static checker warning:

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c:351
vdec_h264_slice_decode() potential NULL container_of 'fb'

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:337
vdec_vp8_slice_decode() potential NULL container_of 'fb'

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:728
vdec_h264_slice_single_decode() potential NULL container_of 'fb'

---
Yunfei Dong (3):
  media: mediatek: vcodec: fix h264 multi statless decoder smatch
    warning
  media: mediatek: vcodec: fix vp8 stateless decoder smatch warning
  media: mediatek: vcodec: fix h264 stateless decoder smatch warning

 .../mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c    |  9 +++++++--
 .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c       |  9 +++++++--
 .../mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c     | 10 +++++++---
 3 files changed, 21 insertions(+), 7 deletions(-)

-- 
2.25.1


