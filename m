Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7905FC46467
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jan 2023 14:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E2FV843RJS0UCRD2yIJqRWOIrHN8+WfvNGrfuZ0Mk2g=; b=LTpoqxhyJJdveazR828zHbV5XM
	5DDAPpqm+azRrSI28DV2WaDmFzGHPaQPCHTulKsosRXmELQtzuaMWalaNQVubpyhcHdAktGAx/Zrm
	lAJ8gHIIh9kC255RCatSIBE1XqCN/EFbMdMOad1RsQ87qBNFQyq96bCNVuJJMGHk6ZXb7yLPaW88s
	OsZlVaRVYx/Nf0dLseo2lVKjbKy5eB0oveEZ7Jdfes/2d12ZbKpjbhNSSwXWTo03RjAjqVjwgOBc7
	twWPv+Npo43HE3EmITcPpnDBcO6PfB8jJuHTLPlrpFrMLEdc6NVhAl+jNdI+nFY5bbihw2vWMsiCz
	caj6TnCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD4R7-009aGE-0O; Wed, 04 Jan 2023 14:08:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD2LB-008uZ4-VO; Wed, 04 Jan 2023 11:53:55 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3EFF26602D0C;
	Wed,  4 Jan 2023 11:53:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672833230;
	bh=vGIrNPLCcr65JC/O+0PWf40qVae7K+5q7WHDW1Hum3I=;
	h=From:To:Cc:Subject:Date:From;
	b=b2FCOK98a4NnyLgDjVuYNeWlwidB/dngUfZHKU7IG4U96Pw11t475t5qr7V7bY7Vh
	 74ELdP0Oo82eudalTqnb6E8nzEZ/Pxcd5uoxqwvZOEIsthD6P67YKML3LJ59KdueK6
	 eSLumbEPXBBNKeZvmxLsgYQZO3BiCfXA3wju5y8i9///nDvpKJ//lCkPXqMpPgTgaS
	 xX5gR06MUqxDQLpTE2Alxb1QA2+uTr4OXljkn5CdrPWIzcBaY7ndfVrXTStu5H2JGZ
	 eNWPxiEGWjkQGlA9vQr6aB25YOOUypkxEW60C+5dMC/y8zQGIB4K7/ved00ypkSN4Z
	 4aqK7g0hPQg6g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: andersson@kernel.org
Cc: mathieu.poirier@linaro.org,
	matthias.bgg@gmail.com,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/2] MediaTek SCP IPI cleanups
Date: Wed,  4 Jan 2023 12:53:39 +0100
Message-Id: <20230104115341.320951-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_035354_263409_13BDD91C 
X-CRM114-Status: UNSURE (   6.30  )
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

Cleanups bringing no functional changes.
Tested on MT8173 Elm, MT8192 Asurada, MT8195 Tomato.

This series applies only on top of [1].

[1]: https://lore.kernel.org/lkml/20230104083110.736377-1-wenst@chromium.org/

AngeloGioacchino Del Regno (2):
  remoteproc/mtk_scp: Use readl_poll_timeout_atomic() for polling
  remoteproc/mtk_scp: Remove timeout variable from scp_ipi_send()

 drivers/remoteproc/mtk_scp_ipi.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

-- 
2.39.0


