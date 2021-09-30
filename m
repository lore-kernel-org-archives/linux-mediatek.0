Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE35C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 02:47:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5862A617E6
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 02:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5862A617E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3G5+o3W04oKTzhVBxmykgUSTfLuVCMpMmaHWTACjJNk=; b=cEX8zqeMS0S0Hg
	K0dQRHmwsYQv/TKenNR3GAvXjoL7A9qM6z6Byh4t5ANnNUgFrXQFVKCE4Z9AfMQJqpbyGPZ56X7fk
	9+mAiPpag9Y6wuPFGYFe5b5e3UQLhzaoIHHYPowZm9tWMsNHO2xyyzFq7okGT0QSQcEnkehsVpv4o
	821cMRn/1ncx32jese3NK8KyKc+94FWu9N0O/odqhwssBJlt6b3u48YsJ7SaFHD1brNkDZJY2wH2Q
	9nrgpk01PlGxVzMYVSNC9zCNZrlNFwGebXsLIktswFwSFNqF8qfV6U6hxsflBMd8848sbxY+v0PIo
	ca18B8F8KUrdPYiCW1Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVm6l-00Co8h-3x; Thu, 30 Sep 2021 02:47:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVm6L-00Co2B-4C; Thu, 30 Sep 2021 02:47:15 +0000
X-UUID: 521ab7b7397a46f98225bce7c6a394aa-20210929
X-UUID: 521ab7b7397a46f98225bce7c6a394aa-20210929
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1544124513; Wed, 29 Sep 2021 19:47:09 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Sep 2021 19:47:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 30 Sep 2021 10:47:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 30 Sep 2021 10:47:05 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <hsinyi@chromium.org>, <fshao@chromium.org>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [v2 PATCH 0/3] Fix the issues caused by CMDQ refinement of mtk-drm
Date: Thu, 30 Sep 2021 10:47:01 +0800
Message-ID: <20210930024704.6966-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_194713_192730_D45E6FDD 
X-CRM114-Status: UNSURE (   7.28  )
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
- cmdq_ddp_cb should use struct mbox_clinet to find struct cmdq_client,
  and then use struct cmdq_clint to find struct mtk_drm_crtc
- change data.sta checking condition to stadard error checking

jason-jh.lin (3):
  drm/mediatek: Fix crash at using pkt->cl->chan in cmdq_pkt_finalize
  drm/mediatek: Fix pkt buf alloc once but free many times
  drm/mediatek: Fix cursor plane is not config when primary is updating

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 95 ++++++++++++++-----------
 1 file changed, 54 insertions(+), 41 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
