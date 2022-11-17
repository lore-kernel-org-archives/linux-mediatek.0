Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C4BC43217
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 09:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JAFS2SBfo8VzxEGJ0pjZndI5mpC53oii67xvJ1Ckkts=; b=G8sPPyB+8r8RuEd1jGiA9fe5u+
	PjdKeip17SNMdtdECleWI+Xr1GbKpxHGFa8GXH03NTssbOWz5p8fv+6HECu2FxdGtl2YV4wIIxSZw
	DgVqQ3hg+IsOJaT8j+yPBJMAXcJZqEdaPsKqwBJE7ROdyWfcQ3tBzkE+5iQCjlLjVkQq7RF3iZOoy
	yP52H8ntodVcATFbAQLbbM2eDWrVGBlaUl3Q6nA6bFgq3gTX3Htzd0dGBlgLQIwvENA5qD2WnOdbu
	jB2RCPadmNU0JbDEVHol2X/Jnhb22i92HZeqi28wpUuLCZvXDs6HgJSjYX4jg3p9ZC76X7PRA9ULX
	gzAHWL8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovb9a-00C4Hi-MB; Thu, 17 Nov 2022 09:25:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovb9Y-00C4Eq-Ay; Thu, 17 Nov 2022 09:25:49 +0000
X-UUID: 71dad503d0e74dc0b8fece160f86400a-20221117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=JAFS2SBfo8VzxEGJ0pjZndI5mpC53oii67xvJ1Ckkts=;
	b=YCESVN2LnQxhnjyaz+Q8WDAdJIeCS3HYH/zQsAQCKgq8rnCK5wcsbdonzWlwmIn5KQyXrLKLH3iD81XXQZ8LWJoneCRk8wNOUkiqNEmfHB1AaEfP6SKxdK7qBGNx2ij0CEptajqxdAJCYXfuGYPtp4Uho0x0GtS0jkd/DImdJQg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:ee47cf95-02df-40ed-9eba-5a1b841472ab,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:-32768,SF:-32768,FILE:0,BULK:-32768,RULE:Rel
	ease_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:8b6f88f8-3a34-4838-abcf-dfedf9dd068e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 71dad503d0e74dc0b8fece160f86400a-20221117
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1656963322; Thu, 17 Nov 2022 02:25:29 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 17 Nov 2022 17:24:55 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 17 Nov 2022 17:24:54 +0800
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
Subject: [PATCH v2,0/5] media: mediatek: vcodec: Fix decode random crash for PLT test
Date: Thu, 17 Nov 2022 17:24:48 +0800
Message-ID: <20221117092453.31366-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_012548_394706_15F8A11A 
X-CRM114-Status: UNSURE (   8.90  )
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
changed with v1:
- add Fix tag for patch 1.
- fix comments for patch 3.
---
Yunfei Dong (5):
  media: mediatek: vcodec: Fix getting NULL pointer for dst buffer
  media: mediatek: vcodec: Can't set dst buffer to done when lat decode
    error
  media: mediatek: vcodec: Fix h264 set lat buffer error
  media: mediatek: vcodec: Setting lat buf to lat_list when lat decode
    error
  media: mediatek: vcodec: Core thread depends on core_list

 .../vcodec/mtk_vcodec_dec_stateless.c         | 13 +++++----
 .../vcodec/vdec/vdec_h264_req_multi_if.c      | 28 +++++++++++--------
 .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 15 ++++++----
 .../platform/mediatek/vcodec/vdec_msg_queue.c |  2 +-
 4 files changed, 36 insertions(+), 22 deletions(-)

-- 
2.18.0


