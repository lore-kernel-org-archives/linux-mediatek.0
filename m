Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B523EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 14:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JI1K8wOfvFWf5clY3nDLNqdAQR7tr/S16xajuRF4X0k=; b=Lar1JigQ+IrLv+
	w4O0pPllmuyLkao50haXIQtRYRJ/HG5oLFUTzPk8ren2nscAK79HW30/I0QTmgYuqOiLQNQ50ArQi
	VxA2K5EUyNre6fvgoIuJdfDfidLbXteA5QAl4BeaqrCtOpRijR5aUijNThpHtYLXTXS4Udw4J3yvQ
	aiHGg5gPku4JYOsDZknWi77KeB9kGdugml0NPXDqerMOh9jcN3SF9ApFB/wBeyO+52Zw6NP8erPoF
	Ic8TybJ1sB32S1erxsVA+0oWvh7kYrHuTywrgkmkqTRqcn7r+HFS74cC2NR08j7q/7ZpM5eMxkah6
	vhimwL4KV3qivqKMPFdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIX6O-007d1F-O3; Fri, 11 Feb 2022 14:40:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIX6B-007cy2-61; Fri, 11 Feb 2022 14:40:36 +0000
X-UUID: 94a890f615ab44ee956d590c3f0fd565-20220211
X-UUID: 94a890f615ab44ee956d590c3f0fd565-20220211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1666148234; Fri, 11 Feb 2022 07:40:31 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Feb 2022 06:30:29 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Feb 2022 22:30:26 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 11 Feb 2022 22:30:22 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <rex-bc.chen@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, xinlei lee
 <xinlei.lee@mediatek.com>
Subject: [0/3] Cooperate with DSI RX devices to modify dsi funcs and delay
 mipi high to cooperate with panel sequence
Date: Fri, 11 Feb 2022 22:30:14 +0800
Message-ID: <1644589818-13066-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_064035_236793_1F65CC56 
X-CRM114-Status: UNSURE (   4.84  )
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

From: xinlei lee <xinlei.lee@mediatek.com>

In order to match the changes of DSI RX devices (for example, anx7625), 
the poweron/poweroff of dsi is extracted from enable/disable and 
defined as new funcs (pre_enable/post_disable).

The delayed MIPI signal is pulled high from LP00 to LP11, 
in order to match the power-on sequence of the panel.

Jitao Shi (3):
  drm/mediatek: dsi fine tune the dsi poweron flow
  drm/mediatek: dsi bridge implement pre_enable and post_disable
  drm/mediatek: keep dsi as LP00 before dcs cmds transfer

 drivers/gpu/drm/mediatek/mtk_dsi.c | 73 +++++++++++++++++++++++++-------------
 1 file changed, 49 insertions(+), 24 deletions(-)

-- 
2.6.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
