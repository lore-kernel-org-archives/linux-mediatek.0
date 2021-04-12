Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E646BC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 14:22:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 936D061287
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 14:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 936D061287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xjzo++BM7SoTAy1ZPSi0FinwWGuY689KYY5yg4cWiPc=; b=lgcApiAW+HEiSb1p7p2V5Bs4Wm
	GBZUyFEwVVnmICpTN0+uKbT1g86BWgtN06ejpRjH2TmPew5pjhfRkMqvbhKktbwv80tdpneBI/aOC
	lVweYs7Yhsjc0lvfRVZ/Awk+nMK8dZB7H+xrdzbkLx9/H01C1oE5rieHOvKUBlkmWAp7+9/HkHH7f
	1ZN5ygNPtfuB1V6vW5nbFbQF5K4hXFc0YQrAH3gj9uRpEJO35Eqow+qEjrXLEdYE6NnO1gbg6tBIL
	wsrBX9gqiIGw6q6Qc0Sh0BaJ9UT4xpVkISVq0MQOP8p3Lgxy+UIeUz1NR/yd8r5+jcd1GAKciIJnn
	B7z9OmEA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVxSP-006x7J-Va; Mon, 12 Apr 2021 14:22:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxRx-006x3c-Bx; Mon, 12 Apr 2021 14:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=6Yk/O5k7gd1GvzrJ5fCbyHsc9fuoiwTE+oQOavahCqY=; b=UBs4bFWIDiidXXxxyJmOHUkBlY
 u8weBC2t4hI6YAPz1444T3nxyNSBwWOdDtF0EuNQdxToyoJwGKBKfpb2kR8nygYh3FPv+CZTJS9/K
 jwoeOY4IIvTAG4ssTRLhuehCi4xX18aarbt7fhaRMTFMmKMXD0peQX1kbPtagG/nEq+LeZzHI7Vxl
 /wfDRoVBOL55K8JqPhm4yvZkkAF3kINRDE+sM2ShymCRQ7xQJgigP5s7j6H9YcAk+Mb4JGt3gz1IA
 KssbciWDVwVy3eHhMmhGs3NlFCQOf6YU2skPJARVkfUk3jbfc8+hr3MtV/KX73mEc9c75hMr72ojt
 +dum5Dig==;
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxRt-006Ij5-3u; Mon, 12 Apr 2021 14:21:59 +0000
X-UUID: 8ca17759551b44e48e00af351803bb9e-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6Yk/O5k7gd1GvzrJ5fCbyHsc9fuoiwTE+oQOavahCqY=; 
 b=BxRHUOazorlDWgjRy45Icr/L5Gux4fEzuNV5PKEn0+T/anXFLMuqsN7XPlISGi3QiWsmsvBoK1G3aiBBqF8RHDnioAyaka2Xp+7qcNxJax6P5ATEWIREmgHrIrCsYKO5tYF3HmGzQxqipJxb0QnJktC03EZbdsb6R7JAiXbLalo=;
X-UUID: 8ca17759551b44e48e00af351803bb9e-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1936243649; Mon, 12 Apr 2021 07:21:53 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 07:21:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 22:21:48 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 22:21:47 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7, 0/5] drm/mediatek: add support for mediatek SOC MT8192
Date: Mon, 12 Apr 2021 22:21:41 +0800
Message-ID: <1618237306-17670-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 37C06683C033A3B4145435D9CCEE5594E74145835920BF6B87F3639135F85B752000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_072157_199570_B5DD87F4 
X-CRM114-Status: UNSURE (   8.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series are based on Linux v5.12-rc2
and following patch:
https://patchwork.kernel.org/project/linux-mediatek/cover/1618236288-1617-1-git-send-email-yongqiang.niu@mediatek.com/

Change since v6:
- rebase


Yongqiang Niu (5):
  drm/mediatek: add component OVL_2L2
  drm/mediatek: add component POSTMASK
  drm/mediatek: add component RDMA4
  soc: mediatek: add mtk mutex support for MT8192
  drm/mediatek: add support for mediatek SOC MT8192

 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c   |   6 ++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  20 ++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |   6 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 102 ++++++++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  42 ++++++++++++
 drivers/soc/mediatek/mtk-mutex.c            |  35 ++++++++++
 7 files changed, 183 insertions(+), 29 deletions(-)

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
