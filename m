Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFA2CCD192
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Sep 2024 10:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W3j703kzb7yk6L2QOMY/pzx/c85iMi3EJ9PiCmrcG7E=; b=XWgtW56O2pc+lq8Mu8TT3kJTaR
	WASJvtbOE2vjeCDxZTrEXO6nrhwxctAnGI3JaHshhlg3BF0DTEjdeQ+ZF7z8XQSuaDvqSTt+o1uPv
	VL/z4fMmlGpqrEGllGGn/WW/94gubFE/zE8cL3PVEbS4EbaTDgSw5E5jhW01NJ0s68j+d+RrC5D7F
	AuHLflHd972x60XY03RUwc+HjpW8DZZ71bViAxN2PrJSWwcKnwl9RqDGMT7NsJ65ogHv4EMAxrCCG
	z2Sx9vlqScSriOPKp1PTzH4im+qhn2fRd+Ny5YpZJANlhiGsmobiFVDHqzcJZcgdzI28wU5Uvqy6u
	vJv5anBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqrcA-00000007zYQ-2k3l;
	Wed, 18 Sep 2024 10:08:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqrZz-00000007z8S-2hBY;
	Wed, 18 Sep 2024 10:06:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726653992;
	bh=ks/I8Rft33hUuiHWwdweAz1/NAcXILGYy4txuTbhcBw=;
	h=From:To:Cc:Subject:Date:From;
	b=WPPeRgyHQ5qEqoiD9QZHz4FyvmYBM98QY9ys4ZWshHtJMJeatPcokKbtjC8kF9P/G
	 Z9iTOQsR9C0PcDEkPrl5hRWljwjR8icYagEVqTTf7Vh3j2fNBcslIZJJF4JcMEJPRe
	 xW8rTo7496RGtJ7J0xzmx6wR7Joc25VuwVjiqwNR0JlxzJ+kcBKzLBlZttGthPRoT4
	 ppY+NzUajxGqD4EI3fs68XY4tCUsgtDaqyHsZt/JY2VjK32TgPsG6hHnK5RKffYyQ7
	 VjcJNFMQL5RapLiBf1/ZDto2VpuQ1/1BkyEF7+5uWNoPFscVPn/azWgYY0Rr+UXtQJ
	 cnl87owaem+zw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 482B517E1097;
	Wed, 18 Sep 2024 12:06:32 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/3] soc: mediatek: mtk-cmdq-helper: Various cleanups
Date: Wed, 18 Sep 2024 12:06:17 +0200
Message-ID: <20240918100620.103536-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_030635_866264_AE40F5B9 
X-CRM114-Status: UNSURE (   6.75  )
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

This series performs various cleanups to the MediaTek CMDQ Helper lib,
reducing code duplication and enhancing human readability.

This also avoids double initialization struct cmdq_instruction as,
in some cases, it was stack-initialized to zero and then overwritten
completely anyway a bit later.
I'd expect compilers to be somehow smart about that, but still, while
at it ... why not :-)

Tested on MT8192 Asurada, MT8195 Tomato Chromebooks.

AngeloGioacchino Del Regno (3):
  soc: mediatek: mtk-cmdq: Move mask build and append to function
  soc: mediatek: mtk-cmdq: Mark very unlikely branches as such
  soc: mediatek: mtk-cmdq: Move cmdq_instruction init to declaration

 drivers/soc/mediatek/mtk-cmdq-helper.c | 241 ++++++++++++-------------
 1 file changed, 112 insertions(+), 129 deletions(-)

-- 
2.46.0


