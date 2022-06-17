Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D04C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+5Tna4kHNhvTKsw37yxmu6YP+TkmLrvk3Mw/i/gs/Vo=; b=J2aHPboS8Q3XU9566IEZqndrul
	MgJXmJlaxrJOrBjak/s8pzZLnBzBSnx7xAmX+ZUHSqRpyWzlkfoS9H9E5zxYqfArqdsd2DP3iqoJd
	EgDxYUjSWiwon62ou3DIIMHXcNWM2aUXEm2Td7FmZM0q/h9I/AgAHshdbZPnWJ5Fv4J/NfjudBSgo
	HzuhZmr2n9zolcSFwVWTPiGbzv1d+nZYMV/IVoYr9gCWYx1H98A4V4AmZcaXuP4PV6I1IHksfkRZj
	tFaYiFQhg2TkadDiN53p9Mt61D/MrG3mGKKHCXCdpp2zglEeViBJGQ8iSXlxEo6tih/+ipoEglqZn
	uNsooAzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28NU-006i0W-Pc; Fri, 17 Jun 2022 09:34:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28N5-006hnk-IU; Fri, 17 Jun 2022 09:34:33 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3F027660179B;
	Fri, 17 Jun 2022 10:34:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655458469;
	bh=qNXMzT2jD6Hu7vIEmFarbDuyoK/cbMytCaqq9CTTLMw=;
	h=From:To:Cc:Subject:Date:From;
	b=Ip5v8GWPyv6LpjgOCKtwoBTlu9lna799wxt6GSE76YD1KQlS2QRBYwmiKjUI4N7hg
	 4oBZBHkAK7kaXaYo6GpG2xcMKPWyKRERNjO7Nd1PdsJkqb8JQx4mNcKL9FX7OJHrzn
	 FnOkIt9Quc0wyfhXylWYhO5tRUEr8KgTqsm1LRJgQyAhfpo0z6uy2BCB+LM1PFA1jG
	 t/7NQIbZcYq4O/o7zAOYnuLlbNsGMEGK+djRIz2mnBEd3LiI4dcjaLaVpV5GZfia0u
	 Gr4tJ+brHdnTdPeqd0iqZspEipLE3n2RFj2iRseG90BGp4SP1/KU5c1A4nnfTnEQ6p
	 38GhCGc1mCbkQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	wenst@chromium.org,
	angelogioacchino.delregno@collabora.com,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] MediaTek Kompanio 1200 MT8195 - DisplayPort clocks fixes
Date: Fri, 17 Jun 2022 11:34:22 +0200
Message-Id: <20220617093424.75589-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_023431_825878_E8F32818 
X-CRM114-Status: UNSURE (   7.35  )
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

This series fixes the two DPINTF clocks to propagate rate change
requests to their own parent (and also fixes vdo1_dpintf's parent name).

This is needed in order to stay clean in the DisplayPort driver and
avoid adding (now useless) custom handling of clocks reparenting based
on the wanted final clock rate.

AngeloGioacchino Del Regno (2):
  clk: mediatek: clk-mt8195-vdo0: Set rate on vdo0_dp_intf0_dp_intf's
    parent
  clk: mediatek: clk-mt8195-vdo1: Reparent and set rate on vdo1_dpintf's
    parent

 drivers/clk/mediatek/clk-mt8195-vdo0.c | 7 ++++++-
 drivers/clk/mediatek/clk-mt8195-vdo1.c | 6 +++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.35.1


