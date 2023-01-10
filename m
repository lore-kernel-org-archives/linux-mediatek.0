Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B24BC46467
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 05:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RSk7SNfalHVSEupWJvDsfOvqV9D94msX9RLPBIHSp2s=; b=xYhQOU4sgLQXDUofw5Svy1h6fZ
	Ovo9G2l4WkZLpjh/J5eaJzHb6xcPVunGNm+WhWL3Oqm1IvnYJ9r2ZKEdqeu1d+CTleCvLh012X0Lw
	i1l4nOQps238UNQYQkEOoSjSEgglBFlmSsgep15325VK2SBERprcryrN5PV924EF1MN74GuY8K6mj
	I4+bffc/htfX9tEk3xdBiGADOVgWOagvrOEVyZuNZKz8+8BDNYwqvL3PcaVXJRVwTpDAoWrg6uzaJ
	gabaQPh850K1i4ZkGBst/onUdhNK0pO1NoFMtum1nmi0qvuNiiLGVKd+V4Fw3QMIftgQBhudyomNI
	z5cNbiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF7bs-005OMA-87; Tue, 10 Jan 2023 05:55:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF7br-005OLm-0Q; Tue, 10 Jan 2023 05:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=RSk7SNfalHVSEupWJvDsfOvqV9D94msX9RLPBIHSp2s=; b=JEEjblWky5XfJvkLwc2IYSfs2S
	zYCZubac5TFu/uipiJonpIOYEItfYjx4L9/p/HgMAAwEQXfMeIWdMZybvBRlndfQSAmkYqCoWPXhr
	RL2l5WNyQJKltCW7Xdx1fyz20ME1v3oOT07YWf+I7e1ikyiqbSiKVBz1qch3XQ1GWLbvB74FCaAyc
	y+W5DaQTspXJ2cqTAiTV6ElQU3dDnwK5alhxZ6AqtmlGeakRkIvxL0OkPOf/kNOtE77rJBcN6Ob4G
	FqAgbsdf5YPpUUBqMgetYNGhuz9WXuzUiDR+HIt+Jfddd3SjVzMf+ZEsSdaf7BadPI/xkKxhS3WWz
	FUct2hOQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pF7bd-0031HD-12;
	Tue, 10 Jan 2023 05:55:33 +0000
X-UUID: 48af4cc123ce46cab35a7e0c316c621d-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=RSk7SNfalHVSEupWJvDsfOvqV9D94msX9RLPBIHSp2s=;
	b=VH4dflNyG/d3GN69VjvSO02bMH+VopTTlwcY/+2meMmZSJMqC919+DoTuYmqq+OU7/6FJh9YkfRJ100dTW+jwNZ3Vsmbs5M5dknfAiKrtFxvBY6CKy80Gp3xoNY20qUDCoBrDOE4qePzyerFyWx2EEweCjXJGfx8+U0auf4o3Nc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:66b53f2a-193d-46d5-9140-94791c4a1878,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:f7175bf5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 48af4cc123ce46cab35a7e0c316c621d-20230109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1578937428; Mon, 09 Jan 2023 22:55:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 10 Jan 2023 13:54:55 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 13:54:55 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
	<thierry.reding@gmail.com>, <sam@ravnborg.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH v2 0/3] Reduce lcm_reset to DSI LP11 send cmd time
Date: Tue, 10 Jan 2023 13:54:50 +0800
Message-ID: <1673330093-6771-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_055530_718997_53AFF5DC 
X-CRM114-Status: UNSURE (   8.46  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

The panel spec stipulates that after lcm_reset is pulled high, cmd
should be sent to initialize the panel. Within the allowable range of
the DSI spec, this time needs to be reduced to avoid panel exceptions.

Base on the branch of linus/master v6.2.

Change since v1:
1. Added fine-tuning panel power sequence modification.

Xinlei Lee (3):
  drm/mediatek: dsi: Reduce the time of dsi from LP11 to sending cmd
  drm/panel: boe-tv101wum-nl6: Reduce lcm_reset to send initial code
    time
  drm/panel: boe-tv101wum-nl6: Fine tune the panel power sequence

 drivers/gpu/drm/mediatek/mtk_dsi.c             | 2 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.18.0


