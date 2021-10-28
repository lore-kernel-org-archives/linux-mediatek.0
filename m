Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D35C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 10:19:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A04DE6112E
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 10:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A04DE6112E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7ja/T01ZjDsouqbe7QsNIdT57orPQuHd00EYKoaI1tA=; b=vjxGHwfPJAN2G0
	kwUkMpkCk/0gm8uHOkIPdRnMfZ/pcVwWrTn81MrgnKpkf2FvpHW2w6a64NejeD8MrPQKsNeeQTV6F
	3SSbD97dlO/IlVpQyKTW+qdeElvCNISGYsCm0FxUGXjPBLdO6JnaaJO6ObpfA26RbDEeIP5Z9L7VJ
	3Mx9rLQLPUdBiJipM49VfA/p95r/VfxMRmX2VLElnbYizjL0EOVcTDhwNHLYBZKhUYfm7ycqoR1n7
	/JTDzb0yD5AJI0XnQUxO86/Txdvic7Sx/9M0VUHc41OOUvRbE0CnQAYKHsMh+bcrYUHgWT6qbYb30
	8I3FomtMHp3OmvvXa59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg2VK-007V44-8e; Thu, 28 Oct 2021 10:19:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg2VF-007V1q-T9; Thu, 28 Oct 2021 10:19:24 +0000
X-UUID: ec80335cd5c142f2a5bca0f4a9ddc39e-20211028
X-UUID: ec80335cd5c142f2a5bca0f4a9ddc39e-20211028
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1518251113; Thu, 28 Oct 2021 03:19:16 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Oct 2021 03:19:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Oct 2021 18:19:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 28 Oct 2021 18:19:13 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Jassi
 Brar" <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 <fshao@chromium.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Subject: [PATCH v6 0/5] CMDQ refinement of Mediatek DRM driver
Date: Thu, 28 Oct 2021 18:19:06 +0800
Message-ID: <20211028101912.4624-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_031921_963942_B20410C8 
X-CRM114-Status: UNSURE (   8.19  )
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

Change in v6:
1. Drop the redundant checking of cmdq_vblank_cnt .
2. fix the indent.

Change in v5:
1. Move mbox_free_channel to a independent patch.

Change in v4:
1. Add cmdq_vblank_cnt initial value to 3.
2. Move mtk_drm_cmdq_pkt_create to the same define scope with
   mtk_drm_cmdq_pkt_destroy.

Change in v3:
1. Revert "drm/mediatek: clear pending flag when cmdq packet is done"
   and add it after the CMDQ refinement patches.
2. Change the remove of struct cmdq_client to remove the pointer of
   struct cmdq_client.
3. Fix pkt buf alloc once but free many times.

Changes in v2:
1. Define mtk_drm_cmdq_pkt_create() and mtk_drm_cmdq_pkt_destroy()
   when CONFIG_MTK_CMDQ is reachable.

Chun-Kuang Hu (4):
  drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb
  drm/mediatek: Remove the pointer of struct cmdq_client
  drm/mediatek: Detect CMDQ execution timeout
  drm/mediatek: Add cmdq_handle in mtk_crtc

Yongqiang Niu (1):
  drm/mediatek: Clear pending flag when cmdq packet is done

jason-jh.lin (1):
  drm/mediatek: Add mbox_free_channel in mtk_drm_crtc_destroy

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 175 ++++++++++++++++++++----
 1 file changed, 151 insertions(+), 24 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
