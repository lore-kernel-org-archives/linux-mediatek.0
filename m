Return-Path: <SRS0=9HTA=M7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35340C4320A
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 23:48:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D33BA60F0F
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 23:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D33BA60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YHDxns6W+0C9s0H/mVC2L6Lu5jzneUm7e5IrN8go4Zo=; b=eVCTzE1PAZgiRW
	KxfXzkRmhj9yPY9ske+x8AcUqL9gtASsOKNFB2dOfLGVJ1hiqTUalOAdzwxZ+Asvr5cHGVTY10Ebm
	qyGf/heHeduMd/HQdUV/bp+di85DkEqiDZ39k1JsNxNjOM1znVhkUaa+Oxvqkw4w01iaTKjRFMVGr
	DHw6P+HTIVr4kexV89PE5tx0103qShgO1jrzLjHWpqjNXJYQGrUXt+opXaiTtXN+U6S7EMm2Z+9Cn
	Wm6SwMzwPScJOAJIZBxMIVeoYwvm/jfEAF7QyHahj2jEzOWP1X/64TYlgKV+m3ZGp1V2gUGMLnsao
	V6KWsAnAvqByXh5vntcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCsWf-00GiLL-FH; Sun, 08 Aug 2021 23:48:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCsWE-00GiFN-LT
 for linux-mediatek@lists.infradead.org; Sun, 08 Aug 2021 23:47:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21A5560F0F;
 Sun,  8 Aug 2021 23:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628466468;
 bh=vAX7ct7i52crHEpDhW8a+hOoXWU7tRkGXmsRCoFh/F0=;
 h=From:To:Cc:Subject:Date:From;
 b=Zfh9SdjTpJXAXQZziq3FKDbPJgWbqPcZEsHdxHS4tv+OhIwlF4ywJMYdjXuaU75Om
 po/10SD6SPkBi93nV5sVohojN3i786MuuheAzWLYi2+jmoNEHnOyQjn9Dq5Xn35Mei
 +CQ0QawA3evvh7TSmLkGBIaK2Cdrbx5sIQmKPJQStWGV3Q7Rc+TRsLs6wEaXpYq1eQ
 2Os3Q8yj7xXwNFWNrQhoFzLTtoO6Me7Eh7oaGx5JWAKnK3tZVZcSv05mEEypmApt0q
 pTFjRJmdssNv37FHKA3UJGKGNSQlSmdflRovjhSICi7fLQhgaCbnZ+cag6L5jMThcC
 WEf9R1OdAKRww==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 0/4] CMDQ refinement of Mediatek DRM driver
Date: Mon,  9 Aug 2021 07:47:29 +0800
Message-Id: <20210808234733.14782-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_164750_755538_8AB3C097 
X-CRM114-Status: UNSURE (   4.76  )
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

Changes in v2:
1. Define mtk_drm_cmdq_pkt_create() and mtk_drm_cmdq_pkt_destroy()
   when CONFIG_MTK_CMDQ is reachable.

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
