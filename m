Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3611DC636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 13:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CRjwcVp2KkHJ4TKBmqzyz6CUARvf0C62jwUQyeagucE=; b=Cw2B/n8X1RX/qv4TUP5YLsU+PD
	Aq/iJP/hhZS6NqYlz5O4DLhae6cgXoatVzxr+gvv2eA01Q2fSA3aBUT3vGArSh+A9bAXkgvYMpLql
	zvmEuZe/3U5CahbEL+MuFbpkF8f9/sPQg5y+bO9yp+2/KIjKmUwo50kEk0CG4B8IfmxP6mmptEDYb
	IlNDMoetSuPh+q3B9hN0pz05xkxMcj2roAuife3U+vyKV3x7tbClMJ7+1FKSbYpSTw+eqh4RjSTkh
	lnxeovyAtnVYStE8Fpl0iVY+iLwuoZPqlcJat7NRmlTaKM8EJEgwOf+roAYYWEiCifXH95OqYShef
	DhjQiG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdsm-00AEHO-BT; Thu, 16 Feb 2023 13:01:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdsG-00AE31-Ln; Thu, 16 Feb 2023 13:00:35 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 614B06602065;
	Thu, 16 Feb 2023 13:00:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676552426;
	bh=6V0LBeMxyzmdIgkojbhJapEL9BumEDxNoGGGL1jLNno=;
	h=From:To:Cc:Subject:Date:From;
	b=VZIglA4hRWDHBMNDyLCl637wB/QAW4DwTwYcBf3O+j+xJ8ZqSEB/iPMbR4n4TLQol
	 3EOi5k05tJR1OtAxO0DrKwHgSuuCMouNmwZFLsrtbU4NRXQM6SHOB+jL4EBNdsPbSO
	 Z9zNO5qGmeriBDF961rIJ8UCWgxsYZwf5KSbq8XeAZknyi0pwOQoc0vCHzqTFoyUXB
	 8S6GK3O3u6c0EhfFGCQYSBlaeANQfswAnrWjogQmSj49cwJ6Ei28QXGbTcmrx8MkET
	 sZzuLyVlq5r8AEjMzFcXfuURPnvgn7ynJMDySbiHAGYg0qE/469OcQ/BHGpWEF9XMl
	 Y8Lgy+eI+26uQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 0/9] soc/mediatek: Cleanup mmsys, mutex, cmdq header
Date: Thu, 16 Feb 2023 14:00:12 +0100
Message-Id: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_050032_880891_AA8DB441 
X-CRM114-Status: UNSURE (   7.88  )
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

This series adds a proper remove callback for mtk-mmsys, adds light
cleanups on mtk-mutex and, more importantly, adds a cleanup for the
CMDQ helpers.

Special mention goes to the latter: this is just in preparation for
a larger cleanup that I plan to do as soon as possible on other cmdq
helpers users, being mediatek-drm and mtk-mdp3; that's not performed
right now because, in the case of drm/mdp3, the cleanup is not entirely
trivial.

AngeloGioacchino Del Regno (9):
  soc: mediatek: mtk-mmsys: Add .remove() callback
  soc: mediatek: mtk-mmsys: Use module_platform_driver() macro
  soc: mediatek: mtk-mmsys: Compress of_device_id array entries
  soc: mediatek: mtk-mmsys: Add MODULE_DEVICE_TABLE() to allow auto-load
  soc: mediatek: mtk-mutex: Compress of_device_id array entries
  soc: mediatek: mtk-mutex: Replace max handles number with definition
  soc: mediatek: mtk-mutex: Use module_platform_driver() macro
  soc: mediatek: cmdq: Add inline functions for !CONFIG_MTK_CMDQ
  soc: mediatek: Cleanup ifdefs for IS_REACHABLE(CONFIG_MTK_CMDQ)

 drivers/soc/mediatek/mtk-mmsys.c      | 135 +++++++++-----------------
 drivers/soc/mediatek/mtk-mutex.c      |  77 +++++----------
 include/linux/soc/mediatek/mtk-cmdq.h | 114 ++++++++++++++++++++++
 3 files changed, 181 insertions(+), 145 deletions(-)

-- 
2.39.1


