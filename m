Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2931DECAA25
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 18:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z4qoliKuPk7+O9oYkaTLlNxlnc9ATeZ6S3IJ7mNy0Zo=; b=hUvli+E/VaHXIkUoIKeBvp2kPr
	SlS9ZNywtW2kwfRZyyAADEcZp3jjoZXd4pzapjn19RqWoCyH2iD/swZtAweu/qi3KIenGC1UYfOcH
	1QFe+dH6MKznv/nf9HVONILILhIkwaRe05AzuLyRj6rHr3XBuN6wCMIwaftMsnB1u2mRZFia+OiDg
	pGQ+TtzSUUbJ8DZrXddMJVA8GY+kgLVbeFCT106GL5jSQvJuSM9Jk32chdag1VJMCnrtqdsQ+xIhp
	qAOl62eSbH85n31GPrZjh6fv6Ov4X9cbRSoLywJRReDEr1i7gNiTZaMoH/wN8Cvrluvb9MoxXq5wa
	RXy/2HBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRHsO-001c9r-7a; Thu, 25 Aug 2022 18:46:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRHs7-001aOX-Tu; Thu, 25 Aug 2022 18:46:33 +0000
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C11FC6601EAE;
	Thu, 25 Aug 2022 19:46:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661453180;
	bh=ka9fMNk12qWUmYRvUYmT0kwBU/Dlq4CaIy2p/uhHjm4=;
	h=From:To:Cc:Subject:Date:From;
	b=bmW/hgbWwVdazDtl8iMAUKjAGE/IrmLsObyiHyXQiAcK+GaNvVR3QbDRjxdDBiJCD
	 EX/VAKC1hZzfqjCLEosB5/ZzxFRoZ87Lc/71B8ejD/8WWIuQaW3Bq2TRdqcApLsOK9
	 bvAS37vJFOvoG+gkuyUzzCmfbEIOxRxBzQW6YjSrzw1chQxG+guGbI70znyqA3yDh0
	 DINAKsMqkqwAmLS4pD/gCLgvSr5ZsADin/HME3zhsyNH8fShjJX9F+fY45MRAf1/p/
	 RaVwsVHZ3IIfGzJ3bP7rfCJDpvvUOJeMv33h/7/Cnybh4uR6dB4wJmRK1hZnU2TsND
	 kVOZMipttieRg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: khilman@baylibre.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	roger.lu@mediatek.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] soc: mediatek: Cleanups for MediaTek SVS driver
Date: Thu, 25 Aug 2022 14:46:14 -0400
Message-Id: <20220825184616.2118870-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_114632_129107_C3092EC8 
X-CRM114-Status: UNSURE (   7.52  )
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


This is a cleanup-only series for the mtk-svs driver, enhancing the
usage of standard Linux macros for bitfields for better readability
and register set/get safety, switches to devm_ functions variants
where possible and other general cleanups, getting this driver in a
better overall shape.

v1: https://lore.kernel.org/all/20220726141653.177948-1-angelogioacchino.delregno@collabora.com

Changes in v2:
- Rebased to not rely on mt8195 and mt8186 support, as they haven't been
  merged yet

AngeloGioacchino Del Regno (2):
  soc: mediatek: mtk-svs: Commonize t-calibration-data fuse array read
  soc: mediatek: mtk-svs: Use bitfield access macros where possible

 drivers/soc/mediatek/mtk-svs.c | 260 ++++++++++++++++++++-------------
 1 file changed, 160 insertions(+), 100 deletions(-)

-- 
2.37.2


