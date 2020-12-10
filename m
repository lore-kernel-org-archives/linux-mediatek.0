Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1E0C0018C
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 09:22:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA1923DB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 09:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BA1923DB3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HZJQXBKFNgAlp/kxUjfXIvy6BwK2WfYgstbso7bnWsY=; b=zQf7EBZ3zvwzPuY6bITpnqmVes
	i8Te2fc3IYm3oCZi/UtLeL+ZHIuoRl5mUamPSaDVE8XqN3utOoj/ZoR6P0riabV8/252VFxAZtRVp
	rnqOx6RsVpdDXtg1U0OLB8DbPiOd+Km3/fZedHWOSwwwP8lvGW8BkvsQQYbM9fAUmk/lbIYO3a0oL
	tqFcZfbmiE8Wt6z2Qrws3llXOP29Zuk3u5pvET+A/MX/VVbVELF1i+hLxtPyH+DC+SLgD+3ijjDTS
	hIkYEcA/JytaFBEv+kvAIfWzFxr9lnpgF0CZtKSl8uAPy702XUWdKRc5+wT3rLD1gres3EmQpcFuD
	0+Ayg1eQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knI8v-0001LA-Vx; Thu, 10 Dec 2020 09:21:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knI3W-00070b-Ez; Thu, 10 Dec 2020 09:16:11 +0000
X-UUID: 58897e7846bf40df9fc3143b281520c8-20201210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=it4sAwFQolcQ3nOKVAFWlvVK9kqfm9QfMvW/10Uom/8=; 
 b=BxBFQ+A1vgmPXvW68Gsa2XVyf2cbpU9L8LqJX71Iamg6r5blZwMnAFBJBWVw24xMNd11ITSvzZ/K14w9yKTU7Fd9i+W9HcmvY+10xk/hc8y5NtvvXczpm3vvta/GftW44HmcU7QgbB9F6UGrGevvFYKtqrZzNL8lSk9QUFVw2gE=;
X-UUID: 58897e7846bf40df9fc3143b281520c8-20201210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1740695849; Thu, 10 Dec 2020 01:16:04 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Dec 2020 01:07:45 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Dec 2020 17:07:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Dec 2020 17:07:43 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v8, 0/6] drm/mediatek: add support for mediatek SOC MT8183
Date: Thu, 10 Dec 2020 17:07:36 +0800
Message-ID: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_041610_695704_A226933A 
X-CRM114-Status: GOOD (  15.86  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series are based on 5.10-rc1 and provide 6 patch
to support mediatek SOC MT8183

Change since v7
- add dt-binding for mt8183 display
- base mmsys patch
https://patchwork.kernel.org/project/linux-mediatek/cover/1607506379-10998-1-git-send-email-yongqiang.niu@mediatek.com/
- base dts patch
https://patchwork.kernel.org/project/linux-mediatek/cover/20201127104930.1981497-1-enric.balletbo@collabora.com/
- add mt8183 function call for setting the routing registers
- add RDMA fifo size error handle

Change since v6
- move ddp component define into mtk_mmsys.h
- add mmsys private data to support different ic path connection
- add mt8183-mmsys.c to support 8183 path connection
- fix reviewed issue in v6

Change since v5
- fix reviewed issue in v5
base https://patchwork.kernel.org/project/linux-mediatek/list/?series=213219

Change since v4
- fix reviewed issue in v4

Change since v3
- fix reviewed issue in v3
- fix type error in v3
- fix conflict with iommu patch

Change since v2
- fix reviewed issue in v2
- add mutex node into dts file

Changes since v1:
- fix reviewed issue in v1
- add dts for mt8183 display nodes
- adjust display clock control flow in patch 22
- add vmap support for mediatek drm in patch 23
- fix page offset issue for mmap function in patch 24
- enable allow_fb_modifiers for mediatek drm in patch 25

Yongqiang Niu (6):
  dt-bindings: mediatek: add rdma_fifo_size description for mt8183
    display
  dt-bindings: mediatek: add description for mt8183 display
  soc: mediatek: mmsys: add mt8183 function call for setting the routing
    registers
  drm/mediatek: add fifo_size into rdma private data
  drm/mediatek: add RDMA fifo size error handle
  drm/mediatek: add support for mediatek SOC MT8183

 .../bindings/display/mediatek/mediatek,disp.txt    | 18 ++++-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            | 18 +++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           | 29 ++++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c             | 47 +++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             | 43 +++++++++++
 drivers/soc/mediatek/mmsys/Makefile                |  1 +
 drivers/soc/mediatek/mmsys/mt8183-mmsys.c          | 90 ++++++++++++++++++++++
 drivers/soc/mediatek/mmsys/mtk-mmsys.c             |  1 +
 include/linux/soc/mediatek/mtk-mmsys.h             |  1 +
 9 files changed, 246 insertions(+), 2 deletions(-)
 create mode 100644 drivers/soc/mediatek/mmsys/mt8183-mmsys.c

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
