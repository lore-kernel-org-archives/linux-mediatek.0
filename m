Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519D0C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 09:03:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5FF860EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 09:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5FF860EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7VxqYV1zlpJ3ZaOKfzo81uBUNHI9aDMJIy5q4kWR6yc=; b=mpea1y2A1TAJZ/
	SqNnl0S7JEqQg2jBB/gg3CfPokTV+15A0FLVuK6/q42moSdChneMVcrOcEfVSEplf1Q/WRVI3KkCz
	qZzSu5QDEh9wJs5chK5nGMaLCX0YW1M1emQHWysGQedyNoNcTVbyY38arJLlCC4AM3oUZk4SML67l
	lGYQvpm5SFCGqW/En70KNghvu17l1fY7GKsIJF/McKcGr0ZWesnqX0/GA3TGeVnWwyLrqhK7uJ3mC
	30aQFVjsIIR28ncdcGW0OfSGiwRihEys4M8oIx/7+YGRmswHlw4bOIwP/OcSPWIyp0zwvZocgPzt7
	x7+y0FzvqbvQ8PCrAGzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6r57-00412K-Ao; Fri, 23 Jul 2021 09:02:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6r4r-0040vK-4m; Fri, 23 Jul 2021 09:02:43 +0000
X-UUID: 4a5a8198a0cf4cd284a38c4d7637d652-20210723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=I/VzUlofHL1S02TEnh88vCL/yO7tg8DHz1aWNBTzeF0=; 
 b=L1D+KejX5JhovWVqi24TlAUDQEvEmNsC2dKlWqYsExWPmLmlbB9qu4XLaDjXx3DeKjkIMmudTDha/+D0OlFJ1HSsnqudITJNpeqZkUQaGal0armOOW/21/zmPrDsLICie4ratSmRcVrfqB/7NyB1eVyB70JVAiric6+K/91GcCA=;
X-UUID: 4a5a8198a0cf4cd284a38c4d7637d652-20210723
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 944874748; Fri, 23 Jul 2021 02:02:38 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 02:02:36 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 17:02:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 23 Jul 2021 17:02:34 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <fshao@chromium.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, <hsinyi@chromium.org>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 0/6] Add Mediatek Soc DRM (vdosys0) support for mt8195
Date: Fri, 23 Jul 2021 17:02:27 +0800
Message-ID: <20210723090233.24007-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_020241_237848_ADF2E977 
X-CRM114-Status: GOOD (  12.99  )
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

The hardware path of vdosys0 with eDP panel output need to go through
by several modules, such as, OVL, RDMA, COLOR, CCORR, AAL, GAMMA,
DITHER, DSC and MERGE.

Change in v4:
- extract dt-binding patches to another patch series
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=519597
- squash DSC module into mtk_drm_ddp_comp.c
- add coment and simplify MERGE config function

Change in v3:
- change mmsys and display dt-bindings document from txt to yaml
- add MERGE additional description in display dt-bindings document
- fix mboxes-cells number of vdosys0 node in dts
- drop mutex eof convert define
- remove pm_runtime apis in DSC and MERGE
- change DSC and MERGE enum to alphabetic order

Change in v2:
- add DSC yaml file
- add mt8195 drm driver porting parts in to one patch
- remove useless define, variable, structure member and function
- simplify DSC and MERGE file and switch threre order

jason-jh.lin (6):
  arm64: dts: mt8195: add display node for vdosys0
  soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
  soc: mediatek: add mtk-mutex support for mt8195 vdosys0
  drm/mediatek: add mediatek-drm of vdosys0 support for mt8195
  drm/mediatek: add DSC support for mt8195
  drm/mediatek: add MERGE support for mt8195

 arch/arm64/boot/dts/mediatek/mt8195.dtsi    | 111 ++++++++
 drivers/gpu/drm/mediatek/Makefile           |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   8 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c   | 277 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  62 +++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  32 ++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 drivers/soc/mediatek/mt8195-mmsys.h         | 191 ++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c            |  11 +
 drivers/soc/mediatek/mtk-mutex.c            |  93 ++++++-
 include/linux/soc/mediatek/mtk-mmsys.h      |   9 +
 13 files changed, 800 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
 create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
