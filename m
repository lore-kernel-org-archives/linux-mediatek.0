Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BA1C07E9C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 01:03:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B00C6100A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 01:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B00C6100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PaDZJ3VrIFGykhHI8aQroIo9ieefhwPsssqDxsiMd0g=; b=MvnNfgloiWoh/t
	dhFlWYEHXxQWBuNKKnkmNDfU2dWhGo8lJHUMP4sNKd1vJM+1z1Ni/a2oTdVHjEzjA81+AiG8ph+l3
	TjZ6qBVjDf9wtzikRoXnq5O4B1naWiiBUX35DL2fa10kY4KY8elAeYBMlYOAP762HzHYZzOoYG+Mc
	9GSqFXmO6CAhZww7cRykdePLh8xG/Lvz9zph1OLGenIT7jGu66O5l4iewsT/lko5Tmo9K1kA/jj/A
	hY17r815ZeJQze+jQdZiG09mIAfoYr/ix9EX5d2rcBEUSdBW0PgDUkyFpKE0jeeePX18a1de25ims
	b5P91nAfhT0DwDuNC7Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2kMA-005eBx-5u; Mon, 12 Jul 2021 01:03:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2kLj-005e5O-Qs; Mon, 12 Jul 2021 01:03:12 +0000
X-UUID: 6662790307fb4fbeb891b811fa388fcb-20210711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=OWSLIwrJE6lMFZ9Ohrbu8NKxZw1dMyxzNjkLWhlVxBo=; 
 b=lgxL+DJ0UYdl2G9/pJ+AurrN1w9vzS7zae0TsfADOQF1yaaIJbv/cqgRAsdw47oo5ZdGKVwA/HiHFYUhy8hXGrswYcvMFNaPCNdUcwpJI9GEG4CDiGnYVo96NoF/tFyGtiRSfknm2mQwdKgeIAlt/40op0ABT4Y2gxODEEaRdc8=;
X-UUID: 6662790307fb4fbeb891b811fa388fcb-20210711
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 354197400; Sun, 11 Jul 2021 18:03:04 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Jul 2021 18:03:02 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Jul 2021 09:03:00 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Jul 2021 09:03:00 +0800
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>
Subject: [PATCH v2, 0/3] drm/mediatek: Separate aal module
Date: Mon, 12 Jul 2021 09:02:55 +0800
Message-ID: <1626051778-13577-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210711_180307_924167_302C840F 
X-CRM114-Status: UNSURE (   9.62  )
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

Chnage since v1:
- seprate patch
- keep gamma register setting with cpu

Yongqiang Niu (3):
  drm/mediatek: Separate aal module
  drm/mediatek: add mt8183 aal support
  arm64: dts: mt8183: refine aal compatible name

 arch/arm64/boot/dts/mediatek/mt8183.dtsi    |   3 +-
 drivers/gpu/drm/mediatek/Makefile           |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c     | 167 ++++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   9 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  39 +------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   8 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 7 files changed, 188 insertions(+), 42 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_aal.c

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
