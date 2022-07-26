Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2678C00144
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 14:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IxbQxh5f/1GhJPI29PwlpxHWOgiZYgWU0KgnIx24OZc=; b=e0A2laxlO2O+aZblwddhWMkeia
	Zc/GHLJKZOYIx616JuXSC5/HLXIQ3CfSrproU++K2mDqtlAU8imLPLRPIgjcOKKngeSLukoKmD/8j
	G91NupXcfmdscM/DTmnOHLELiT9n3HDLCcVNe3aDTzBRtU9LOwGvb3nVfpubkRsVNum11iqXwwv7E
	Urom82rCP1XE+30uuVdGJRTU0AasX8+qBtFBZmfHodRg+erdgoEJnA882YSF7Gi+gsN4GaiZ7c63s
	rDSJVznNuXd6IIfRK+BYqJjUr+H7TlCeaYdT9S8dYc3gSMxdp0hciYenwF1M5MvUuNC0rEY3FxTe7
	wVTFU8XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLNn-0007c0-1y; Tue, 26 Jul 2022 14:17:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLNR-0007Sh-3k; Tue, 26 Jul 2022 14:17:38 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E84216601B1A;
	Tue, 26 Jul 2022 15:17:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658845053;
	bh=0aFS34Xh0Sull4UkSdhR2eAZVT3nTjndEQc593bt6E4=;
	h=From:To:Cc:Subject:Date:From;
	b=cryEsxWEoVTVN9IOYvY7zhZrBYLIDkLH1Q3Xl4ekNdkcZp5IJGejThwJFO37JgS9H
	 exqCoMS9rkHg0WHmt73jz3w1kqAwZaACbbYd1vewwkno6P0FvfaTQErYCEgF7tO8Ow
	 7F6JalwWVSs0pF5IaaJ6sEQK2195fdu5nzhMB8CvqjXPzn0MPkSXnHKwD/Ob6PE7yB
	 bJWh6XyJk1zgFCbn5rTfLOVSbGE4yhhis3yZtjY8LKxHyVZTeYxZr73iTkQpY6U1xC
	 tnbzOIXbRnCqluzOAFyS5YfyXQkUx+FwG6rfHnW52TTBiBs4MoYRheyGftbuPmG4WV
	 pRbQZeNIhOM2Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: roger.lu@mediatek.com,
	khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nfraprado@collabora.com,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/6] soc: mediatek: Cleanups for MediaTek SVS driver
Date: Tue, 26 Jul 2022 16:16:47 +0200
Message-Id: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_071737_395488_D5B40A16 
X-CRM114-Status: UNSURE (   6.01  )
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

AngeloGioacchino Del Regno (6):
  soc: mediatek: mtk-svs: Commonize t-calibration-data fuse array read
  soc: mediatek: mtk-svs: Switch to platform_get_irq()
  soc: mediatek: mtk-svs: Remove hardcoded irqflags
  soc: mediatek: mtk-svs: Drop of_match_ptr() for of_match_table
  soc: mediatek: mtk-svs: Use devm variant for dev_pm_opp_of_add_table()
  soc: mediatek: mtk-svs: Use bitfield access macros where possible

 drivers/soc/mediatek/mtk-svs.c | 325 ++++++++++++++++++---------------
 1 file changed, 176 insertions(+), 149 deletions(-)

-- 
2.35.1


