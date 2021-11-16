Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C02C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 09:49:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F8E863236
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 09:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F8E863236
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/MuKWoxOOc6AeKHfSfn5qvFGcyPHNCyBnpASga47kBU=; b=pOVWBOBvI6pfFl
	wRTYETDlOtrvq/2pQ9fosg2AL6FRpfNc+u0YDeq+rwtPJiNm85FudUu2Kd5wktLnWD3DsvDgYw7Kj
	6g/VVTg+wATWU8fYsANQVU7oz+pE3duCw/TwUkYbbHjw5O+b07PevIznFOrJITUGm2CNkdlOCAY66
	fGUi6Q84vLtH6G40m37vu1OSN8CSX3D8Y84iUxJp4xV2v6KGd4YJd3/jRHdVnlXmznjUw/U1hfkVc
	ZEYO8KiBd4A9dyeHB+FylRjWA9ThXuwYzUSJ9nA1E+XPD5EugCbmTAmyKT9+sXGQ20GjAklnWB70u
	7jiMn8P2Fs4iN8wZIRcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmv61-0010eK-2G; Tue, 16 Nov 2021 09:49:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmv5y-0010cM-7y
 for linux-mediatek@lists.infradead.org; Tue, 16 Nov 2021 09:49:43 +0000
X-UUID: 0999835c27044b75a005f560005f034f-20211116
X-UUID: 0999835c27044b75a005f560005f034f-20211116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1124916113; Tue, 16 Nov 2021 02:49:38 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Nov 2021 01:49:36 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 16 Nov 2021 17:49:34 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 16 Nov 2021 17:49:33 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <stonea168@163.com>,
 <huijuan.xie@mediatek.com>, <shuijing.li@mediatek.com>,
 <liangxu.xu@mediatek.com>, <xinlei.li@mediatek.com>, Jitao Shi
 <jitao.shi@mediatek.com>
Subject: [PATCH v3 0/2] seperate panel power control from panel
 prepare/unprepare
Date: Tue, 16 Nov 2021 17:49:28 +0800
Message-ID: <20211116094930.11470-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_014942_314175_BF7279F7 
X-CRM114-Status: UNSURE (   6.94  )
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

Changes since v2:
 - Panel driver panel-boe-tv101wum-nl6.c provides the power sequence apis.
 - The apis are called before dsi poweron and after dsi poweroff.

Changes since v1:
 - Fix null point when dsi next bridge isn't a panel.
 - "dsi mmsys reset" is implement by
   https://patchwork.kernel.org/project/linux-mediatek/list/?series=515355

Jitao Shi (2):
  drm/panel: panel-boe-tv101wum-nl6: tune the power sequence to avoid
    leakage
  drm/mediatek: control panel's power before MIPI LP11

 drivers/gpu/drm/mediatek/mtk_dsi.c             | 28 ++++++--
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 88 +++++++++++++++++++-------
 include/drm/panel_boe_tv101wum_nl6.h           | 28 ++++++++
 3 files changed, 116 insertions(+), 28 deletions(-)
 create mode 100644 include/drm/panel_boe_tv101wum_nl6.h

-- 
2.12.5


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
