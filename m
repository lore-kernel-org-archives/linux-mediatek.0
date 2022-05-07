Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589CCC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 01:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F1R3z9fAAg1jBwXc10NyjxMrrumBKXvToIIqtkfXPec=; b=rolvikPzxvyxqW
	OBUXMcx7wAIT1F0CT7/AZG6m+2OEZiPP18oBkFs4BENNb92OeTrp0L16/mAgXsTyRWDpEt/LFfM6+
	N8wCuKq8JwJ6KT1kT7ZtUdER0fDlPda4ib20RQYSTgBgIsyE3eOMM2emyO7yE8x5WsVtIeOSLWfuf
	xJLXgP2p4gmPoro005a1MWkCAA5JSer6QLEZHayzFgWtRnGZaWVeMByOgKCS5zNtZdLF3rblrfz0I
	WvMe5eHXN+drUeGYy4ZqDT3YgBUjp4oQ0Bg29Q5GAUWbOYkaVdnfLcWaGv9pRtKwYiqXrB9LX/XUf
	yk3ieezAihFTVfNOFIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn9Wr-005fCv-8A; Sat, 07 May 2022 01:46:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn9Wd-005f5m-Mk; Sat, 07 May 2022 01:46:29 +0000
X-UUID: 16ba9a8d35334491a94ca43f7237e737-20220506
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:1c1607b1-c534-4b99-823d-7c4bf2686ca7, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:7c328516-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 16ba9a8d35334491a94ca43f7237e737-20220506
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 593912240; Fri, 06 May 2022 18:46:24 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 18:46:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Sat, 7 May 2022 09:46:20 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Sat, 7 May 2022 09:46:18 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5, 0/7] support mt8195 decoder
Date: Sat, 7 May 2022 09:46:11 +0800
Message-ID: <20220507014618.29412-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_184627_785474_4754FD45 
X-CRM114-Status: GOOD (  10.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Firstly, add mt8195 soc lat hardware and compatible, then add documents.
For vp8 only support MM21 mode, H264/vp9 support MT21C, need to separate
them. Lastly, enable H264 inner racing mode to reduce hardware latency.

Patch 1~4 add mt8195 soc lat hardware and compatible, then add documents.
Patch 5 using different format for different codecs.
Patch 6 prevent kernel crash when scp reboot.
Patch 7 enable H264 inner racing mode to reduce hardware latency.
---
This patch depends on "add h264 decoder driver for mt8186"[1]

[1]  https://patchwork.kernel.org/project/linux-mediatek/cover/20220507013625.29020-1-yunfei.dong@mediatek.com/
---
changed with v4:
- fix sparse and smatch check fail for patch 7.
changed with v3:
- rebase driver to the latest media_stage.
changed with v2:
- add detail explanation for lat soc hardware for patch 1.
changed with v1:
- separate "Init VP9 stateless decode params" patch and remove it to another one.
- add reviewed-by in patch v3/v4/v6
---
Yunfei Dong (7):
  dt-bindings: media: mediatek: vcodec: Adds decoder dt-bindings for lat
    soc
  media: mediatek: vcodec: Add to support lat soc hardware
  dt-bindings: media: mediatek: vcodec: Adds decoder dt-bindings for
    mt8195
  media: mediatek: vcodec: Adds compatible for mt8195
  media: mediatek: vcodec: Different codec using different capture
    format
  media: mediatek: vcodec: prevent kernel crash when scp ipi timeout
  media: mediatek: vcodec: Add to support H264 inner racing mode

 .../media/mediatek,vcodec-subdev-decoder.yaml | 52 +++++++++++++------
 .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 41 +++++++++++++++
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |  8 +++
 .../mediatek/vcodec/mtk_vcodec_dec_hw.c       | 12 +++--
 .../mediatek/vcodec/mtk_vcodec_dec_hw.h       |  2 +
 .../mediatek/vcodec/mtk_vcodec_dec_pm.c       | 50 ++++++++++++++++++
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h | 11 ++++
 .../vcodec/vdec/vdec_h264_req_multi_if.c      | 29 ++++++++---
 .../platform/mediatek/vcodec/vdec_vpu_if.c    |  5 ++
 9 files changed, 183 insertions(+), 27 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
