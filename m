Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE40C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Aug 2024 09:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3IehLFJo5m/EiV2XWqjmCRxJkwea/YTPE2U7q/+Bj5Q=; b=K3uvGlOcBXOIJfHhqzggaUn3mc
	ox0gOD1Xo0DWq8Q7YDjO76m+sQ10vvuKOXdj852htX2fnM4vjrjC+oVBpDftHIbwsTF8YXbH8j8GX
	hSUarwE/XgGEWYaY2p3eO2pTX48VQCD6ZfYo4h5PF4ZvSYngjpbsDIMmp2TsGpDohrwVhjTKHALii
	i8VCIfMHA27pLgvDpcSPi3bu8NFeFQWHd4tO/nCd7r1C+x9AmW+Aqg7EBZrlUO+BYjeCrw+1mzFE1
	PnYKZUgdOsYfFqMN9lir7bOeeNYIWZ6xYjzkCaUB70e82TxqSKxWq/fckeJP+enPE3fDRDMjvSt6T
	aLZvHtTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sci6z-0000000DmYC-1d8t;
	Sat, 10 Aug 2024 09:10:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sci6L-0000000DmCD-14oX;
	Sat, 10 Aug 2024 09:09:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8818FCE172F;
	Sat, 10 Aug 2024 09:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E3BC32781;
	Sat, 10 Aug 2024 09:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723280966;
	bh=oJdNYm3xIb8SsemhyEVCYW+SiamiZrrV94Dn2d41vVg=;
	h=From:To:Cc:Subject:Date:From;
	b=ZUKNgHfbqNBa0epCG9+OXiYSfkXmHIBWD9RzeONcxlpSzIVlrigAOW/XyP6PTAmBi
	 uGYISosHyzVsQ9bzQNz1fjEE5JMZz8Xu7h/BXC7V2aASNB1Aevk0Rk9hqr5STf+dDa
	 N4RBj2S3g7BZZh2+7EWctZV4UoEKFGFhEGXdkon2xaEOd6lruVKMAovluBjzBST4oM
	 KK0dQ+L7uaNK40VGMWMt/ZbK1wneRQsnxnRj6TZ99/XA+DH+6cDVPHUHzdsJm5BwTU
	 e/AJbMCx/mqduWfIYovFeJajp1Wnz7GZVEwOAk1P2PNVkhwBus/PDzCJcUN/AYKK3O
	 k6PeMMOit2sQQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Moudy Ho <moudy.ho@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v3 0/5] Remove cl in struct cmdq_pkt
Date: Sat, 10 Aug 2024 09:09:13 +0000
Message-Id: <20240810090918.7457-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240810_020929_491838_D9C6D553 
X-CRM114-Status: UNSURE (   8.34  )
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

cl in struct cmdq_pkt is used to store struct cmdq_client, but every client
driver has the struct cmdq_client information, so it's not necessary to
store struct cmdq_client in struct cmdq_pkt. Because mailbox maintainer
do not like to mix mailbox patch with other patches in a series, so
mailbox patch [1] would be sent independently.

Changes in v3:
1. Rebase onto Linux 6.11-rc1 and fix conflicts.
Changes in v2:
1. Fix typo of CMDQ_JUMP_RELATIVE
2. Refine cmdq_pkt_create() and cmdq_pkt_destroy()
3. Rename cmdq_pkt_jump() to cmdq_pkt_jump_abs()
4. Add cmdq_pkt_jump_rel() helper function
5. drm/mediatek: Use cmdq_pkt_create() and cmdq_pkt_destroy()
6. mtk-mdp3: Get fine-grain control of cmdq_pkt_finalize()
7. mtk-mdp3: Use cmdq_pkt_create() and cmdq_pkt_destroy()

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-cmdq8&id=a1b2f7a7488285975c1f439086f1c4cc51a13bb9

Chun-Kuang Hu (5):
  drm/mediatek: Use cmdq_pkt_eoc() instead of cmdq_pkt_finalize()
  drm/mediatek: Use cmdq_pkt_create() and cmdq_pkt_destroy()
  media: platform: mtk-mdp3: Get fine-grain control of
    cmdq_pkt_finalize()
  media: platform: mtk-mdp3: Use cmdq_pkt_create() and
    cmdq_pkt_destroy()
  soc: mediatek: cmdq: Remove cmdq_pkt_finalize() helper function

 drivers/gpu/drm/mediatek/mtk_crtc.c           | 48 ++-----------------
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 48 +++----------------
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  2 +
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  1 +
 drivers/soc/mediatek/mtk-cmdq-helper.c        | 22 ---------
 include/linux/soc/mediatek/mtk-cmdq.h         | 13 -----
 6 files changed, 14 insertions(+), 120 deletions(-)

-- 
2.34.1


