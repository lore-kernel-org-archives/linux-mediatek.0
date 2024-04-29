Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D952C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 15:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OaLyXK0l/fWrV+01RWXzMrlWiGFe8kV9enQrPCC4CoA=; b=MZrKC/CPGUNr0ewHYL/SoORfVv
	m9kSJjy8QpoNXKo9ZDNKHj8/nJxlEvqF++2hE8JtlEe1kHPI9qlBcFWgepD+hFrgBr2oLTHRdXiK3
	0Y3Y1upDTV3GkuUWC6Yiw3nwM4ho4UuiIf5x3TUd3+I81qsXxn3EIg6HE6lH0P1CFzFLhRSW2TEnT
	8gHZxFNhtjeiEQO8WIOFZDSy9U4GfWW5oYu/f3/jfIhwFBCWhKXJcdAHNS9m45et6rMx5KspgYaEU
	4151EKGMJwABtjdOUshyBJy65NZTpTDeyXIovWNsAXTVXWAEQMyKiQrLsHv9/Gp73roSUM764xQ6d
	9Aknf66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Siz-00000003Lk3-06s8;
	Mon, 29 Apr 2024 15:15:25 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Rak-000000032dp-3E8u;
	Mon, 29 Apr 2024 14:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714399368;
	bh=X7IGfbGsT7uQlyjPuobKXUVEAqPWoHd5DZQUwqLMYxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p9Ze86BtQwfVuiWA3h/zaN/siAvRGSrjji4wkDfDr7563mvAdw1zVDbAOll3Zh0AY
	 JZ8oq/D6skwoHNJraTfsroVRToR1sNcvHF4LTRcVGBX0GZZ3O2FbRApVSZUvBLBQoI
	 TzD6vfD4G9CKX1gaa/xvyGdL91q/At/MvQYmjp+B5gqLg1EuMXq6j9ZiobMTPVZIO4
	 rnNJi5L4lUfY7NzeFmZGgHJyVD2WUvqRPC3z4rZjibe8OKstbiB+YmwC/HdAqRo9P0
	 JN2fvk8KCiyscXsZmEmdiYtcEibEFvHSQ5X2l9/Xduf8ZZUK9/0g55tsIO6bLvQt9J
	 nmPqh8lerO0VQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 228453781453;
	Mon, 29 Apr 2024 14:02:48 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/2] MediaTek driver updates for v6.10
Date: Mon, 29 Apr 2024 16:02:43 +0200
Message-ID: <20240429140245.238210-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429140245.238210-1-angelogioacchino.delregno@collabora.com>
References: <20240429140245.238210-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_070251_101103_AFFDC010 
X-CRM114-Status: UNSURE (   8.61  )
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

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-soc-for-v6.10

for you to fetch changes up to 8a87e1d21ef84fe68913aeba9838222422eef4d7:

  soc: mediatek: mtk-socinfo: Correct the marketing name for MT8188GV (2024-04-23 12:16:56 +0200)

----------------------------------------------------------------
MediaTek driver updates for v6.10

This adds a much needed cleanup for the MediaTek CMDQ helper driver and
also some more helper functions which will be used in drivers using the
MediaTek Global Command Engine (GCE) HW.

Also adds support for MT8188's VPPSYS mutex for MDP3 support, a new SoC
in the mtk-socinfo driver and changes the marketing name for the pre
existing MT8188 SoC.

----------------------------------------------------------------
AngeloGioacchino Del Regno (3):
      soc: mediatek: socinfo: Advertise about unknown MediaTek SoC
      soc: mediatek: mtk-mutex: Add support for MT8188 VPPSYS
      soc: mediatek: mtk-socinfo: Add entry for MT8395AV/ZA Genio 1200

Chun-Kuang Hu (7):
      soc: mediatek: cmdq: Fix typo of CMDQ_JUMP_RELATIVE
      soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()
      soc: mediatek: cmdq: Rename cmdq_pkt_jump() to cmdq_pkt_jump_abs()
      soc: mediatek: cmdq: Add cmdq_pkt_jump_rel() helper function
      soc: mediatek: cmdq: Add cmdq_pkt_eoc() helper function
      soc: mediatek: cmdq: Remove cmdq_pkt_flush_async() helper function
      soc: mediatek: cmdq: Refine cmdq_pkt_create() and cmdq_pkt_destroy()

Jason-JH.Lin (4):
      soc: mediatek: mtk-cmdq: Add specific purpose register definitions for GCE
      soc: mediatek: mtk-cmdq: Add cmdq_pkt_mem_move() function
      soc: mediatek: mtk-cmdq: Add cmdq_pkt_poll_addr() function
      soc: mediatek: mtk-cmdq: Add cmdq_pkt_acquire_event() function

Jason-ch Chen (1):
      soc: mediatek: mtk-socinfo: Correct the marketing name for MT8188GV

Nícolas F. R. A. Prado (1):
      soc: mediatek: cmdq: Don't log an error when gce-client-reg is not found

 drivers/soc/mediatek/mtk-cmdq-helper.c | 163 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------
 drivers/soc/mediatek/mtk-mutex.c       |  41 ++++++++++++++++++++++
 drivers/soc/mediatek/mtk-socinfo.c     |  14 ++++++--
 include/linux/soc/mediatek/mtk-cmdq.h  | 139 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------
 4 files changed, 292 insertions(+), 65 deletions(-)


