Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B54DC11F66
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 23:50:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5EB06115A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 23:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5EB06115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eaYmF6V70GwXD9yrFH8F9Step6p2z+3Uj3oqTsMNehA=; b=TYEEuSxbhAFBpl
	eSrv5dqt4+Got66ldJiqAfSrz4Ko6qQPFCSa/FIexjb+rh5tt3ywY7T+3J1k33y78wGlfpbvkf3F6
	Xau5FYDPABvJQTFA6HGW6V3mfibQRXQjG9tplyokn9IL58/IWURcECw8kflBYr8jcHd75FtEHaOFb
	IGFbg9QJ5bpHMmnwyB1takd7ymrCarZS5YudHvqk7qwZF6A3zD2mifTaTcOCbYrn6ZPJmSX/PWTnr
	hV+1A19BeTVhOpEam6Y8Kukf5BVPgNg6BFFXAIq6qoB+TzMWBdyyYr+kUv9kdbSnUV47k0HrO5YXj
	/K0EojGdCjD4Rk+p5RbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m35gu-008lsq-ET; Mon, 12 Jul 2021 23:50:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m35gs-008ls7-2t
 for linux-mediatek@lists.infradead.org; Mon, 12 Jul 2021 23:50:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E145C608FE;
 Mon, 12 Jul 2021 23:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626133821;
 bh=gUy0PrVeHFh0s36T5G5fu9zOhj3dvn5O88uSQ8Cwfms=;
 h=From:To:Cc:Subject:Date:From;
 b=kFB57WzxZdy4YGTAxV/3HyESb49xCZ10kHuoG3SuMpkVUGNGb6lAfwrdUbZJVGZXX
 dyzfipvn2hWiwarV7BSDlUlSXLy2VCa0f7CxHAHk5v2O49ycJ6si31rtiXGmeu/AQQ
 aQCYEqcbH+tgyD6gwoh98aAyXD93NxplI+vL8rQINR3q6buNRengZc5Ig3eNDQXJSZ
 g42AQYNYTcBb9rUovdZUw0Ipkb9gpVw8TyblxKWTd3F1swJqKUSzn9cnRG0MrvzJfe
 hFnmyLbkd7PvkbAF54Jbgpe/6TuNY/80yKktc1by5nZAsOtzIR2e4aX+6LIg+jquE/
 i1QwN00n1NHuA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 0/4] CMDQ refinement of Mediatek DRM driver
Date: Tue, 13 Jul 2021 07:50:10 +0800
Message-Id: <20210712235014.42673-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_165022_185685_1D41F965 
X-CRM114-Status: UNSURE (   4.53  )
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

These refinements include using standard mailbox callback interface,
timeout detection, and a fixed cmdq_handle.

Chun-Kuang Hu (4):
  drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb
  drm/mediatek: Remove struct cmdq_client
  drm/mediatek: Detect CMDQ execution timeout
  drm/mediatek: Add cmdq_handle in mtk_crtc

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 110 ++++++++++++++++++++----
 1 file changed, 91 insertions(+), 19 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
