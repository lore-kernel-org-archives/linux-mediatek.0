Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E577EC6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 21:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4D+tMKdcVIEb62pHq5xKUDIFDwhn6N7+ir79WdjBWmA=; b=K0WKHddc/ZLdxv+SfKLi49+V6Q
	6Et68au6E1bidOvScQdyYo75BGZdzzPioS/OWlW5c1MTuUiaOikd1WHzNbgrGzkdTJIX/NbMgAs9S
	yMwjCTpVJXYRb1yPDRTZr8UHQnFxuc5Ny/tNISqgTCHH7AWwUJwXjBGkRK7hd0z1zoGP2l1n0D26M
	sLt/tUr8H2fmKAYAuboJLnnVP2wFCqK5McU2Jdliwi0lRjsQxQFVCLuksHxTg4/CT5m05dXXw1GPL
	BthxinyvwWiiaa+zp0uFYbW+lTW5zZLagv/2qy/w0Y/ZySidp731/+lfPIqinei4Ix31vcLZwNjT2
	3RrS0yOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpjg-007vGY-3M; Mon, 13 Mar 2023 21:29:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpjV-007vDY-Bo; Mon, 13 Mar 2023 21:29:30 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 917866603082;
	Mon, 13 Mar 2023 21:29:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678742965;
	bh=/a+ZftsO/uQuk3g4rAVV0hz862INekzwBz589RiqAYU=;
	h=From:To:Cc:Subject:Date:From;
	b=Bg+ly/rqbIhNQsfLNi6+7kQy/GXCaMSVdZoLTpHYmcUVKpELzB7N+LYqFEYfEViJC
	 xdGZurpZk6YoME0FuotfUusEUh50NQdjJWDClBVUSzURsqeMooPzuXR1teEX8WzKjm
	 R8xG3ovFTDgdy0hiMzGQcZYfLdx7lrejSHKkOAeVX400w3/wbIQ4OGeKtK8x9JRMez
	 Ak4vQHsX6CgCGBPzXhLhX+tstZl+88j+T4VXGIab1bcE4At/5WAgLAm3cXv14Rpqmw
	 oU9c+hBQGSfIR47MV3b53xQihkBpLuN0RsiCvENQsEZvZBW50ssHYjRhqUbwL3I7R8
	 0+oqQuM6h11Ew==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] ASoC: mt8192: Address spammy log messages
Date: Mon, 13 Mar 2023 17:29:05 -0400
Message-Id: <20230313212908.2282961-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_142929_638550_DCBF5B78 
X-CRM114-Status: UNSURE (   6.68  )
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


A couple commits to make the mt8192 sound driver not spam the console.


Nícolas F. R. A. Prado (2):
  ASoC: mt8192: Remove function name log messages
  ASoC: mt8192: Move spammy messages to debug level

 sound/soc/mediatek/mt8192/mt8192-afe-clk.c    |  4 ---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    |  6 +---
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c    | 28 +++++++++----------
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 12 ++++----
 4 files changed, 19 insertions(+), 31 deletions(-)

-- 
2.39.2


