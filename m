Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7199C48BC3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 00:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=teAO/z1wRkmRFTetpL0BlyZl9LGlao23cKF9pVPbHs0=; b=UXFnakCT84r979J2+bWsDrjUa+
	U08BDDhCSNdRgXUhZ0RwTZI78NWcllInBRDnV8ltE3E44pbVvfuqH0Yx1OREV2zYXkIKd3JryKhYc
	rgx2E+YXg3qhXb9FF4p0HmvBnqY5uE566TTeDiA26ee691DiP5xqHYkTNByd+GxyF4nnXhtYVlQ0J
	eOAt+3Qr0rAxG+pWrWX9F7+drnaF106yEebWGDRYRKY1+9n1947j4a4m46rX66MwNJy/c7a2xkin6
	FGrgVPG/wGidEUGQ+e692NU+i4pF4Gfv2z2UZAJAnSJTrgmtLnjFQlvO6He/22qWSdRpzr9E71V2M
	iy8kWnDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPxF-0000000EhBE-0Rdk;
	Thu, 15 Feb 2024 00:50:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPx0-0000000Eh1L-41IM;
	Thu, 15 Feb 2024 00:50:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 34FB0CE2448;
	Thu, 15 Feb 2024 00:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A98C433F1;
	Thu, 15 Feb 2024 00:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707958201;
	bh=IMXlz+K+vPt7moPsPtyRvbcUlG72JSuixPQZI0qMeLY=;
	h=From:To:Cc:Subject:Date:From;
	b=j8SoANEaHx7kyPgIzpO6tg0EZvR3ELnnl4+G7fyU8zcygw98P8pl5Kd/KFvXxZ9NC
	 fs9OxOGNxFsxZY4IckiKG8Cz10UhA00lr5/MpQIg+oNn2SN8TLk3IObpAjsBwErRvu
	 oqFudwiDf75/+NUUQ5QZlW/CVDYxX8wpQWWYvs0soJnf//bnHBpVPpivQCy7jh5Ack
	 4XM4cGxDNKaElSGw51QMD0mFLjdD+yz05CmgGBZeOLL4A7DNJ3K7jXV0jYO53cyuek
	 T96GybEFfgb0ijQADnEDbJWd1oYCwm9iq17jkeR5A5i2Q4depdspDqiJFPWDtDcDce
	 IC5OLPUe8E0xQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 0/9] Remove cl in struct cmdq_pkt
Date: Thu, 15 Feb 2024 00:49:22 +0000
Message-Id: <20240215004931.3808-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_165007_230836_1FF5875D 
X-CRM114-Status: UNSURE (   7.58  )
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

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-cmdq8&id=a1b2f7a7488285975c1f439086f1c4cc51a13bb9

Chun-Kuang Hu (9):
  soc: mediatek: cmdq: Remove unused helper funciton
  soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()
  soc: mediatek: cmdq: Add cmdq_pkt_eoc() helper function
  soc: mediatek: cmdq: Add cmdq_pkt_nop() helper function
  drm/mediatek: Drop calling cmdq_pkt_finalize()
  media: platform: mtk-mdp3: drop calling cmdq_pkt_finalize()
  soc: mediatek: cmdq: Remove cmdq_pkt_finalize() helper function
  drm/mediatek: Do not store struct cmdq_client in struct cmdq_pkt
  media: platform: mtk-mdp3: do not store struct cmdq_client in struct
    cmdq_pkt

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  9 +-
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 14 ++-
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  2 +
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  1 +
 drivers/soc/mediatek/mtk-cmdq-helper.c        | 85 +++----------------
 include/linux/soc/mediatek/mtk-cmdq.h         | 50 ++++-------
 6 files changed, 39 insertions(+), 122 deletions(-)

-- 
2.34.1


