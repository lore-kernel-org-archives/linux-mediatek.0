Return-Path: <SRS0=wYRt=DE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F174C4346E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 23:04:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21707239EB
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 23:04:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e3uJ6MfP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndZDYTW7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21707239EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3LLlZzvD8VSK+4dAU4xEAvK1lGyx/frecbUc/XsafJo=; b=e3uJ6MfPKc1VOEKfQG4sPRVCQd
	4YOqMGX+yEmT42JvKJSNaugG3fzQsgIqMyILj7ODfR04yVg0FJEHtOkcvZqqctHAsZNv5SPtA4+fR
	XcX2SltHX1Ma15LrEavG5fAdJ0fFbptv5y4+rMd9cXE8me/vWk/zH3TMZuNrKS9UlC+0Jc4Q6moU1
	ZD0JNVrX/2yWtL8TFLFD0TqBDxsTK8MFKUUuVKMsC3qEhSuqEGA8vKvalda6alOFArk+mEUWG/Xhg
	qa9PZqqTH88nsT289UDGPnkHQbcXl9HGJFEQsIt+OBhNfqL+X3kyggbkUBtVDEoecz0UrWDBGEiAv
	CZ/0tNJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMfik-0006Vq-0X; Sun, 27 Sep 2020 23:04:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMfic-0006Sd-Jp; Sun, 27 Sep 2020 23:04:35 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15E892389F;
 Sun, 27 Sep 2020 23:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601247872;
 bh=aAPIXd4HbZWLcB/t5MLwJx0aHlftXlSoI/b18x4wXmY=;
 h=From:To:Cc:Subject:Date:From;
 b=ndZDYTW7uwm+b5VEZJM+eawxXa4y5QYAYo4wGjmjvSnnJmqtt2cl3WVPszlTiTB01
 NTrH6x8vf3Lcts9M42wh6RqIjYrNgi/Y2F9/8V4nbWFgiYClREbcgIZ2JjJjsoDgCS
 nvgwTirbKm/ILr+rIUIWMgIzCC0uTuQdbW+pNzuU=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 0/4] Mediatek DRM driver detect CMDQ execution timeout by
 vblank IRQ
Date: Mon, 28 Sep 2020 07:04:18 +0800
Message-Id: <20200927230422.11610-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_190434_798762_FEC5D87D 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CMDQ helper provide timer to detect execution timeout, but DRM driver
could have a better way to detect execution timeout by vblank IRQ.
For DRM, CMDQ command should execute in vblank, so if it fail to
execute in next 2 vblank, timeout happen. Even though we could
calculate time between 2 vblank and use timer to delect, this would
make things more complicated.

This introduce a series refinement for CMDQ mailbox controller and CMDQ
helper. Remove timer handler in helper function because different
client have different way to detect timeout. Use standard mailbox
callback instead of proprietary one to get the necessary data
in callback function. Remove struct cmdq_client to access client
instance data by struct mbox_client.

Chun-Kuang Hu (4):
  soc / drm: mediatek: cmdq: Remove timeout handler in helper function
  mailbox / soc / drm: mediatek: Use mailbox rx_callback instead of
    cmdq_task_cb
  mailbox / soc / drm: mediatek: Remove struct cmdq_client
  drm/mediatek: Detect CMDQ execution timeout

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |  54 ++++++---
 drivers/mailbox/mtk-cmdq-mailbox.c       |  24 ++--
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 146 ++---------------------
 include/linux/mailbox/mtk-cmdq-mailbox.h |  25 +---
 include/linux/soc/mediatek/mtk-cmdq.h    |  54 +--------
 5 files changed, 66 insertions(+), 237 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
