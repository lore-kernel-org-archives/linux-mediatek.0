Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E902BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 06:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nTYERK5llYI9gTcWVlppYrnNN7/0TstSjTQ+zshK+KA=; b=lSoZ1VH9ad9lM7
	q5GDtEKdGtNBNsjSehok5tzl9vH1nNtUwkFM4bSbvD+JHHmnT7AZN4yLlP6WMqTIFoj6J4u+ELabT
	HlXicbRH8hezPvx8Pa5MtcsLWNPZxpeZs+REoBg9a16vM29K8sO057xyXZCaBIqkbZjU2mW2a3d7F
	XW8Qkz7z7A7leG9gZQwF0XPSDLT6FGBufKbZMcLEVc+9CD/AMO9MbBVmvSV1/G9MbiBJrab2GXFDp
	7PXQHeyEL/h5uVmVWd4/epCwlO5kWRwU/BDR1ywTQa7zdUZb2mOjAIkpArot8VzmWJnxNX3X9N2B8
	O6hVak1AEf3eDCfLwHlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msfmd-00B7QW-Nt; Thu, 02 Dec 2021 06:41:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msfmE-00B7Hk-AD; Thu, 02 Dec 2021 06:41:07 +0000
X-UUID: b8c44a86088946588d8e90bad987a75e-20211201
X-UUID: b8c44a86088946588d8e90bad987a75e-20211201
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 876834481; Wed, 01 Dec 2021 23:41:01 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Dec 2021 22:41:00 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 2 Dec 2021 14:40:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Dec 2021 14:40:58 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <tzungbi@google.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, jason-jh.lin <jason-jh.lin@mediatek.com>
Subject: [PATCH v4 0/2] Fix mediatek-drm suspend and resume issue
Date: Thu, 2 Dec 2021 14:40:37 +0800
Message-ID: <20211202064039.20797-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_224106_380312_908E140B 
X-CRM114-Status: UNSURE (   7.95  )
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

Change in v4:
- change completment function to wait_for_event.
- release the mbox channel when device_link_add fail with cmdq
  and still return 0 because drm can configure register by cpu.

Change in v3:
- fix return typo: modify -NOEDV to -ENODEV.
- add missing complete function in ddp_cmdq_cb.

Change in v2:
- rollback adding cmdq_mbox_flush in cmdq_suspend and add
  blocking config mode for mtk_drm_crtc_atomic_disable.
- add return error when device_link_add fail.
- change the first parameter of device_link_add from dev
  to priv->dev.

jason-jh.lin (2):
  drm/mediatek: add wait_for_event for crtc disable by cmdq
  drm/mediatek: add devlink to cmdq dev

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 51 ++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 10 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
