Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAF2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 17:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5+gY0nugj0yDXxOO112LTFTN2Fvi9Goynr1UKK+usZM=; b=YO2xo4/I6Y7Bkc
	DgKMxH7wKjx9jy04bwK+kza+skNpXwNtVW0DNbiyVNQUAnN0DKSSRLZNkXeQeWCMiLVEhoyaW+eHG
	WHzork1oj7Kze+suu3ZukBZPVm9fNQwKMQ22DFlfaOXTuXj4uVoK02IGnyMUEwC+1YjSPTEbIv3yC
	JQXYS4ojJdlB2eyGt1S8eGi/UnEz2nvvpcjAJjryD3fb2puh4yS3YhZzYO12302LrjDoE0Zcvg3P5
	l7xXygTCm6HyxLpxmQEJPGQbswP9WZ4lCJpoeDG6r/u3MztAtsVfIFNQQd3SgDWTRCfLBp1RhjoYY
	JBrvUibVdIzHXpmVGxBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms6uY-006J5g-PA; Tue, 30 Nov 2021 17:27:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms6uV-006J17-Vf; Tue, 30 Nov 2021 17:27:21 +0000
X-UUID: 047b65fffd8d482cbe160519ee7ebae8-20211130
X-UUID: 047b65fffd8d482cbe160519ee7ebae8-20211130
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1353139877; Tue, 30 Nov 2021 10:27:08 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Nov 2021 09:26:19 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 1 Dec 2021 01:26:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 1 Dec 2021 01:26:17 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <tzungbi@google.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, jason-jh.lin <jason-jh.lin@mediatek.com>
Subject: [PATCH v2 0/2] Fix mediatek-drm suspend and resume issue
Date: Wed, 1 Dec 2021 01:26:14 +0800
Message-ID: <20211130172616.9127-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_092720_044441_068CA5A3 
X-CRM114-Status: UNSURE (   8.72  )
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

Change in v2:
- rollback adding cmdq_mbox_flush in cmdq_suspend and add
  blocking config mode for mtk_drm_crtc_atomic_disable.
- add return error when device_link_add fail.
- change the first parameter of device_link_add from dev
  to priv->dev.

jason-jh.lin (2):
  drm/mediatek: add blocking config mode for crtc disable flow
  drm/mediatek: add devlink to cmdq dev

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 28 ++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
