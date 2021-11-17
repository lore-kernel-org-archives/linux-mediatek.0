Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904D2C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 06:52:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53A9361BF5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 06:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53A9361BF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OjopPQWfUEJv6QJAE7jU3ouMYAT9eCIa+yhxTLiHs+U=; b=iyOY9NP7kUg68S
	/33dkUU4U6KwfSsvQHwKXZP3eFMsN4Q7er8WWnvl50TpYUBQt1GzYvuOetXJJ+aLLuJYPXxnlkxoB
	ZdRauRztE3HEJMV39Py5JmxXrKqQNR5C866tjPsEHz/sjY1aQUaPHT/VZCXGjBRbbxXybVflorI0S
	D3NHzvQ3fT2pohUvUDA8TPz5cO4Dnz4D9+fLOdPt42bz9iyujdW33C375/Mf/divRpU8V+nV9JvIm
	ASr4opSwLvMQeimrq2AmhBIhlLkWHgxfmE7RohsQgDAOS9oO+ofsVEhD7JOWU1iY6iCDpgyU0EVWC
	DRuxguDOhF724tWLuegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnEnq-003ZHL-3k; Wed, 17 Nov 2021 06:52:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnEnP-003Z5f-Qk; Wed, 17 Nov 2021 06:51:53 +0000
X-UUID: e98fe3bbdbbe40029f75c341fc1c92d6-20211116
X-UUID: e98fe3bbdbbe40029f75c341fc1c92d6-20211116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1922615617; Tue, 16 Nov 2021 23:51:48 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Nov 2021 22:42:07 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 17 Nov 2021 14:41:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 17 Nov 2021 14:41:59 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Jassi
 Brar" <jassisinghbrar@gmail.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <tzungbi@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>, jason-jh.lin
 <jason-jh.lin@mediatek.com>
Subject: Fix drm suspend and resume issue
Date: Wed, 17 Nov 2021 14:41:55 +0800
Message-ID: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_225151_889779_35BA0D0B 
X-CRM114-Status: UNSURE (   8.64  )
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

Subject: [PATCH 0/3] Fix drm suspend and resume issue

1. When the hardwire components on crtc is using GCE to configure their
   register, cmdq_suspend may be called.
   So add cmdq_mbox_flush to clear all tasks and release GCE clocks
   before cmdq_suspend.

2. The suspend and resume order of components on crtc can be guaranteed
   by the same power-domain, but cmdq can not.
   So add devlink to cmdq dev make sure the order of suspend and resume:
   cmdq_suspend is latter than drm_suspend and
   cmdq_resume is earlier than drm_resume.

jason-jh.lin (3):
  mialbox: move cmdq suspend,resume and remove after cmdq_mbox_flush
  mailbox: add cmdq_mbox_flush to clear all task before suspend
  drm/mediatek: add devlink to cmdq dev

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 13 ++++
 drivers/mailbox/mtk-cmdq-mailbox.c      | 81 ++++++++++++-------------
 2 files changed, 52 insertions(+), 42 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
