Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69DEC5479F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 15:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8ZJXXIO/Z27DdKF+R5z0BjskZvjom9IOxtjPx4sT9Wo=; b=QlDpGViFM6t3PF3whjnbJsj95D
	MX9C9+HonDX2JqTiLhbJQiZe4cFM+5ZTN2WjpNa7NqX/0/vSlUKWzCWXoO39ZZ0pMLPbfKtSCBhog
	Weh8lt4U5FGdSx7PctP/AkvMv7pKCPi9coc7oqrMdmUQN4XlRwl5DV8pchgTDCN0G3ysd/e8Q6/6c
	70d+SoZZ0EWmrTItNsunljWg94qPbH4+sJFvO+f3PcegF8bsA8NTmnUnUFhsm2gopnfyAwX0izClE
	UHkpKeZe7GcTg4+Ozc4Lgk7F/VGpRMxoo0a52j/o5ZcdIvhRrjLvBVTqyks4HyE5mmNBrvyhyYJV6
	4ZUCjBDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBD0-00000005Rpr-0oma;
	Thu, 22 Feb 2024 15:42:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBCY-00000005RQc-0ixB;
	Thu, 22 Feb 2024 15:41:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E899ECE21A0;
	Thu, 22 Feb 2024 15:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35792C433F1;
	Thu, 22 Feb 2024 15:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708616489;
	bh=pjixf3oXo63dg7qf7lXjwZCTLnX0p47lkDin0H4I8LU=;
	h=From:To:Cc:Subject:Date:From;
	b=jTvQ8XMWDulUTguO1lrSEX+LInOIjmnQhNbrGk7y8o2w699XXvhWZcAgJYmiY2KON
	 0sUvlq7/4FDFHEw8Lvn78gWeubpi7fVJjcaZjgo/G4hGOoROEwq2pdFXbSkyvp2ae+
	 did0penN8Xd26Y30/5mxSFS6CecVq7wdM3tmRn/SWunNkeqziWhj4ifCN6MH8kQSn2
	 D577EuZiKtmQf4eXSgqWqV8AbzBJILrLIX+L9/RF5T//HavbM3WEHnEOhSczsLy9Ax
	 xunLJqrFaYar7GJrBEGLTpu0AFUnbHdGp7c40xhoWAqs9NGuOM4uh6NgCL2fudjoPQ
	 2fi/Mp1krDFVA==
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
Subject: [PATCH v2 00/12] Remove cl in struct cmdq_pkt
Date: Thu, 22 Feb 2024 15:41:08 +0000
Message-Id: <20240222154120.16959-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_074134_421403_067B0067 
X-CRM114-Status: UNSURE (   8.33  )
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

Changes in v2:
1. Fix typo of CMDQ_JUMP_RELATIVE
2. Refine cmdq_pkt_create() and cmdq_pkt_destroy()
3. Rename cmdq_pkt_jump() to cmdq_pkt_jump_abs()
4. Add cmdq_pkt_jump_rel() helper function
5. drm/mediatek: Use cmdq_pkt_create() and cmdq_pkt_destroy()
6. mtk-mdp3: Get fine-grain control of cmdq_pkt_finalize()
7. mtk-mdp3: Use cmdq_pkt_create() and cmdq_pkt_destroy()

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-cmdq8&id=a1b2f7a7488285975c1f439086f1c4cc51a13bb9

Chun-Kuang Hu (12):
  soc: mediatek: cmdq: Fix typo of CMDQ_JUMP_RELATIVE
  soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()
  soc: mediatek: cmdq: Rename cmdq_pkt_jump() to cmdq_pkt_jump_abs()
  soc: mediatek: cmdq: Add cmdq_pkt_jump_rel() helper function
  soc: mediatek: cmdq: Add cmdq_pkt_eoc() helper function
  soc: mediatek: cmdq: Remove cmdq_pkt_flush_async() helper function
  soc: mediatek: cmdq: Refine cmdq_pkt_create() and cmdq_pkt_destroy()
  drm/mediatek: Use cmdq_pkt_eoc() instead of cmdq_pkt_finalize()
  drm/mediatek: Use cmdq_pkt_create() and cmdq_pkt_destroy()
  media: platform: mtk-mdp3: Get fine-grain control of
    cmdq_pkt_finalize()
  media: platform: mtk-mdp3: Use cmdq_pkt_create() and
    cmdq_pkt_destroy()
  soc: mediatek: cmdq: Remove cmdq_pkt_finalize() helper function

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 48 ++----------
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 48 ++----------
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  2 +
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  1 +
 drivers/soc/mediatek/mtk-cmdq-helper.c        | 73 ++++++-------------
 include/linux/soc/mediatek/mtk-cmdq.h         | 60 +++++++++------
 6 files changed, 73 insertions(+), 159 deletions(-)

-- 
2.34.1


