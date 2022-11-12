Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D3BC43217
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Nov 2022 09:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UQPfVhMRXZEQgGhN/ELTm0I/Iufk8zrbsK/zXU7Smus=; b=V+uyNF4bwgSaKH6pffHDdCzvJE
	Hv6Oo0NTrvmzhRbQ7mxmz2zop68b+IdlVnLOEYhh5A+MugcKTobwYySMbEu9LB7LRMKuWlWeSejdF
	XkB/YCrnUmHqiSD0rfTC0cxXep3vZITyWadK6vAaewP+3JgfjNKCNrMPUsGRS27LgqvjIZQgEpwke
	hfdQpWAM7Y9vG0E0Cpl0TsoDDmJqko8YLU2SMZV3L3DK3+bcU8VIA2u5OWlzllAC0W/0ua+45GrGJ
	vn59zELk2CA71SFIqOfoZ6wycCNBxMEGBI4MzGfFzi9I37dDnryVHcsc5q/YvafgnHP6IsQ18C09R
	bCAuG49w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otn1U-004kGY-RP; Sat, 12 Nov 2022 09:42:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otn1S-004kFI-5n; Sat, 12 Nov 2022 09:41:59 +0000
X-UUID: d1ecc3927003497eb364bae7f4860127-20221112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=UQPfVhMRXZEQgGhN/ELTm0I/Iufk8zrbsK/zXU7Smus=;
	b=OJeD5TyEYYhOIZ3h0Mk40T4mxU1eHL3BDRi1h7X6+5mt7EmMZz2VsDH9FzZFYPBzFidQxtoTbLvdIWC1RSU4L/Kvb07sCr4fN5CeShzH+7tuC+VoKwM84jp3ng97cDTwlybEblAfwk0eLVlOx7TkDHcBDd4uIiqsi8AeoDm4JhI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:2619b311-e0b1-4895-8faf-33e3dee79c07,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.12,REQID:2619b311-e0b1-4895-8faf-33e3dee79c07,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:62cd327,CLOUDID:c1e71286-088c-4756-8f76-577be701e693,B
	ulkID:221112174151CPNIC4ZV,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d1ecc3927003497eb364bae7f4860127-20221112
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1851012817; Sat, 12 Nov 2022 02:41:49 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 12 Nov 2022 17:41:46 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sat, 12 Nov 2022 17:41:45 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, George Sun <george.sun@mediatek.com>, Xiaoyong Lu
	<xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
	<frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve Cho
	<stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 0/5] media: mediatek: vcodec: Fix decode random crash for PLT test
Date: Sat, 12 Nov 2022 17:41:39 +0800
Message-ID: <20221112094144.4256-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221112_014158_244875_435CD820 
X-CRM114-Status: UNSURE (   8.04  )
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

Decoder may decode timeout or error when PLT test, fix some error
condition not reasonable.

patch 1 fix getting dst buffer NULL.
patch 2 fix inner racing mode fail condition.
patch 3 fix h264 crash.
patch 4 fix vp9 crash.
patch 5 fix core thread empty list.
---
Yunfei Dong (5):
  media: mediatek: vcodec: Fix getting NULL pointer for dst buffer
  media: mediatek: vcodec: Can't set dst buffer to done when lat decode
    error
  media: mediatek: vcodec: Fix h264 set lat buffer error
  media: mediatek: vcodec: Setting lat buf to lat_list when lat decode
    error
  media: mediatek: vcodec: Core thread depends on core_list

 .../vcodec/mtk_vcodec_dec_stateless.c         | 13 +++++++----
 .../vcodec/vdec/vdec_h264_req_multi_if.c      | 23 ++++++++++++-------
 .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 15 ++++++++----
 .../platform/mediatek/vcodec/vdec_msg_queue.c |  2 +-
 4 files changed, 34 insertions(+), 19 deletions(-)

-- 
2.18.0


