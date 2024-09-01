Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5BBC54FC6
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Sep 2024 14:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=asCcdoNfeoDoMME8+WTvYy9ABUzv19l7QaW5+59YtmU=; b=5BcuR1xxfivBCeJrBMGzvk9gY5
	bwvJw2wGPoty8vL1LCXk72wrHI9V3B49ZKq+FZJ8MOP+eUN2ZHdNuwYPYJN1jjCtL7iI33l1lKKpg
	xMmUs9H15uEOUvjbwuHThC/y4eo6U2ndduveYFsTRcBaVQNcax++OKHW5mu6X8ElyJdX8D083yOrw
	SbIa3GbizVxVknhaoGmQi/a3aLod6jfZYjPBKdE7CXs+hEkaf4PD63klPdBU19gGBd+wUzIv4fs+z
	EwIKIuxjwNWrU89knaix/em3gGiDjkfeKTho6sVraZfKpvCcauo4iSZJdqtzAx8HWKlYdrZAH76XR
	bRTMZyCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skleb-0000000Bn7B-3Ptz;
	Sun, 01 Sep 2024 14:34:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skldc-0000000Bmlr-3T7f;
	Sun, 01 Sep 2024 14:33:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 72A415C56BC;
	Sun,  1 Sep 2024 14:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83635C4CEC3;
	Sun,  1 Sep 2024 14:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725201187;
	bh=kwPiH44pV1ANFJhkdOlQ2NoEBgwHo7h8ejpepwo1EGg=;
	h=From:To:Cc:Subject:Date:From;
	b=WXkoa9zK+zwyHz3IGIZIBI49Cak3R/xK0dOG42JMjUdpekcS9VOsXzkkAj37LChqv
	 12/aGUKYtkBI/aLxQdYq9pG0dWmFRYL05d4yGOKcgm3SYMhhhib+YruMcc6pSWt2u4
	 RWxmHE+d7QEe/Go6VfP+1ipw6eufotuX7wutA0tfE1tJ3ScPfg61GnzskzBTbTWF02
	 3mKTBYRCp8M9n10iZRsPPuBkhMpaXMKhbO+XCEFcNEJ4eVPo9/RgUq4ALHvtHAXLQN
	 xS+bZxQp/ojwtOI22cq6rjTdjRhynrZPAk2Yyz4W7dJiemdBR7f9gPVSyzOxBCjh8e
	 cV7cuBMUi+BQQ==
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
Subject: [PATCH v4 0/3] Remove cl in struct cmdq_pkt
Date: Sun,  1 Sep 2024 14:32:56 +0000
Message-Id: <20240901143259.16849-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240901_073308_957086_2E52B562 
X-CRM114-Status: UNSURE (   9.02  )
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

Changes in v4:
1. Rebase onto mediatek-drm-next-6.12
2. Fix build error in mpd3 driver
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


Chun-Kuang Hu (3):
  media: platform: mtk-mdp3: Get fine-grain control of
    cmdq_pkt_finalize()
  media: platform: mtk-mdp3: Use cmdq_pkt_create() and
    cmdq_pkt_destroy()
  soc: mediatek: cmdq: Remove cmdq_pkt_finalize() helper function

 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 49 +++----------------
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |  1 +
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  2 +
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  1 +
 drivers/soc/mediatek/mtk-cmdq-helper.c        | 22 ---------
 include/linux/soc/mediatek/mtk-cmdq.h         | 13 -----
 6 files changed, 11 insertions(+), 77 deletions(-)

-- 
2.34.1


