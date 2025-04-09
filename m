Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2FAC36002
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Apr 2025 13:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aBERTAzMF1XMaZHW215z2KUxBI7SZn/haMOaonYzOkc=; b=p6jvJHnonD2S4eMLmStGj0hFto
	G5jOQxHmmSwSSfm5xAsQh/RUAZoWzNlKyuPeT9oZR7ENRZYM90FM4GrzHBEZ3W8XmpJqoD2r92l0z
	W2OuE3m16hH8bAsMOBM1bzT7HpSULcYXuMA9zaFsztrJJ78Dpsa4ZuM54LjXBx5q+yEiINigP3Z1E
	ijrBVrTe3ASOtyMNZ6vLcGulPiAV6uoTTPur3GUej8/xFP+aIlKM8gXIkFiiqUvbCalo1K8+bXASf
	hfNvZG90kQUpik8pX9tbhFs6pvOrTLwJD9XBYKH4GmTszg0Zw6zj38OAZtF+40AWox2NjdjjrSnld
	9VJxNDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VKH-00000007GiZ-07yd;
	Wed, 09 Apr 2025 13:18:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VEx-00000007F0X-3cf7;
	Wed, 09 Apr 2025 13:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204392;
	bh=os6fwx/KmcGx48eeTShCfonZ2h/wBxh0gQYferMBJH4=;
	h=From:To:Cc:Subject:Date:From;
	b=pKLRkHXIRT0xA7HFsZp7jFX2hYyn8nVI/Rq44+AxaqOnEcaqH/LlPJVL9CLHXa2OP
	 +BAZsZ05lFd00wBuXehVrRL+Je/JKjglL8pvNafdrvjuvyBeSqlr742WhJPSam9NH9
	 cZrkbD8EXFDdPj48lOjWsCnRUuFcxkvsh/wV97F+U9eBISMrKLV9X/I2Lk2rWnVqgj
	 KxxNwcmVALF5DMPIsLyC9APpO3beWJNYlkbOz6o/hJ93Ps37PaXwZTwpy3xw/SFJTP
	 /Lal0LLdsCxoHgokw8z+jy1EBGLLFeqwDQfOOyvVvlvC81taR10sTnUiYFCjbTs91P
	 hCH0Cm03ZDcBg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D0B8E17E07F2;
	Wed,  9 Apr 2025 15:13:11 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v1 0/5] MediaTek DPI: Cleanups and add support for more formats
Date: Wed,  9 Apr 2025 15:13:01 +0200
Message-ID: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_061316_071132_CE7B5037 
X-CRM114-Status: UNSURE (   7.59  )
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

This series adds support to configure the MediaTek DPI IP to output
more formats, such as YUV422 8/10/12 bits, YUV444 8/10 bits, BGR 8bits,
and RGB 10 bits, and also performs some cleanups that improve the code
readability when those are added.

Even though some of those formats are also supported by MT8173, MT8183,
MT8186 and MT8192, I am enabling them only for MT8195/MT8188 as those
are the only two that I was able to test.

This was tested on:
 - MT8195 Tomato Chromebook
 - MT8395 Radxa NIO-12L
 - MT8390 MediaTek Genio 700 EVK

AngeloGioacchino Del Regno (5):
  drm/mediatek: mtk_dpi: Use switch in mtk_dpi_config_color_format()
  drm/mediatek: mtk_dpi: Add local helpers for bus format parameters
  drm/mediatek: mtk_dpi: Add support for additional output formats
  drm/mediatek: mtk_dpi: Allow additional output formats on MT8195/88
  drm/mediatek: mtk_dpi: Rename output fmts array for MT8195 DP_INTF

 drivers/gpu/drm/mediatek/mtk_dpi.c | 117 +++++++++++++++++++++++++----
 1 file changed, 102 insertions(+), 15 deletions(-)

-- 
2.49.0


