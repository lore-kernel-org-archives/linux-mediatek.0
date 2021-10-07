Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D47C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 23:53:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59F2A60E53
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 23:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59F2A60E53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7J6Y7rN6fixQXjqztKsFiEBSUFIQWW6CiQlsGNmfNxY=; b=F+TxDB3NRiF8rv
	4I2sjl4la/aPlDtrGwn7BDDAauOihBDmyMsNeoVxwledbsAr2LdhdPCLpowGmS0IjhyRSK2XdQ6me
	Dg1145m44rf0a8sc+BOq4HkpgHeznafs4hjM48GS1edXMmHxHdk5uLYsEkrkXK1j1DRsKjmKfpzop
	/U+HrMYKkdUjB15hPDq9R0BviXVg60QSSnUv/FPQnsk7XIZaUxfVfnMDQFqV01EDYd5lRadffN9uh
	JSNlgFb8gXv19I/eiZcfCZAaeSbd2UVN8qbyJDrcIkcA703Zu2i8GLYaxlrLxVLp/l68sLTx5hHDW
	FFBd5mpdQ/v46atINknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYdCT-0015Ct-Er; Thu, 07 Oct 2021 23:53:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYdCQ-0015B4-OR
 for linux-mediatek@lists.infradead.org; Thu, 07 Oct 2021 23:53:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1254360F46;
 Thu,  7 Oct 2021 23:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633650797;
 bh=y0qzneFXNeP9iCdOlPbYWTtbepyVfClijM/4p7T8XlA=;
 h=From:To:Cc:Subject:Date:From;
 b=W2kBPG+HleHUlHNFB3OZK0Y3M2Io8JMGKILpQdHpQgTdqWPucHcEt8k2RVIpPZ13t
 aMPsX1nQtJ03z877pN86lqk5AhA3k1n+5laIm6GnHUFMoiuNtOht7Gf97eP8Hn+uf0
 M53wCttwkvYru0DamLxOqJCWOffruMNdDpGIfgp5TlZcghmgPW+wHYpWFWobyhP+0R
 ThGZEH5hnnft47AAQ38F+98mCWkLy/c4lU1MQCcJgvXE+Q9PXugzKQTqYmShGjvBLT
 hf3CdD038lKs4Is7J97D1jdiYzrGFGx8LfIwXDjeoYKP/fEXQLzGeQsvitYsudc+tw
 LEXGCQPVgiGwA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Enric Balletbo Serra <eballetbo@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 0/5] Revert series "CMDQ refinement of Mediatek DRM driver"
Date: Fri,  8 Oct 2021 07:53:05 +0800
Message-Id: <20211007235310.14626-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_165318_837450_99C49BB5 
X-CRM114-Status: UNSURE (   5.36  )
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

Commit c1ec54b7b5af
("drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb")
would cause numerous mtk cmdq mailbox driver warning:

WARNING: CPU: 0 PID: 0 at drivers/mailbox/mtk-cmdq-mailbox.c:198
cmdq_task_exec_done+0xb8/0xe0

So revert that patch and all the patches depend on that patch.

Chun-Kuang Hu (5):
  Revert "drm/mediatek: Clear pending flag when cmdq packet is done"
  Revert "drm/mediatek: Add cmdq_handle in mtk_crtc"
  Revert "drm/mediatek: Detect CMDQ execution timeout"
  Revert "drm/mediatek: Remove struct cmdq_client"
  Revert "drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb"

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 157 ++++--------------------
 1 file changed, 24 insertions(+), 133 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
