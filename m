Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FE6CF2566
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Oct 2024 14:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UaDhF10SS6RhxqXi+RrAJwgaKwDFw9LZ+vBZFwz0rD4=; b=m95ZPNrSo5jII3
	KucRghxvjSRV4i/8m07x9CJf2FpaVRASlSk9c7K54Fgppkzo2+ROy6r7FNvgZZ1dtfDo8aSherVnj
	LLIxYYDaeOJz47KVb+LGE/AcGp0EC5zYPNJWuUkfrgWK9NopCdtvbe1DJ+8hr6EcozDM6x6nyH1Yu
	uDKodfG01CS2H4I1bHNmengRUZ8X0Iou5FxUpXPpO5eJie9SrQw1vveDNU8XFoN5soYw1rMHyH5s7
	epEib72D3lVjaDYBaZqSQapQ9HZCl5d4eprvZ5mpLaSGNtQg3oazMXmXGo1156ZDXMDSwYcHj15Wd
	yeS6wviF8Z6aFQf99F3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szdJE-00000001M1n-3Yed;
	Sat, 12 Oct 2024 14:41:32 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szdGT-00000001LWI-2299;
	Sat, 12 Oct 2024 14:38:43 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout4.routing.net (Postfix) with ESMTP id BC341100305;
	Sat, 12 Oct 2024 14:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728743917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UaDhF10SS6RhxqXi+RrAJwgaKwDFw9LZ+vBZFwz0rD4=;
	b=UNyd+OKN5i7UKNGbpU5QvhGkG18ZWX2nM+oOivTQx7bcmYRwy6Q93B6qiP6dVetPy3ekIp
	T87veGPabnrMqRlpgOec2XuPiYnHGbZE9ZX3YCi2EE51bIqvdLZn0EyP4Yz4HBG/Pbjf0x
	szfuxTKoVEpMLkZembHabWCSYsfotcA=
Received: from frank-u24.. (fttx-pool-217.61.155.16.bambit.de [217.61.155.16])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id C790940192;
	Sat, 12 Oct 2024 14:38:36 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH v4 2/2] mmc: mtk-sd: add support for mt7988
Date: Sat, 12 Oct 2024 16:38:23 +0200
Message-ID: <20241012143826.7690-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241012143826.7690-1-linux@fw-web.de>
References: <20241012143826.7690-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 81c63b52-cdcf-46c0-90ed-8ce7b26ea792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241012_073841_691779_F14F8E98 
X-CRM114-Status: UNSURE (   9.54  )
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
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, linux-mediatek@lists.infradead.org, john@phrozen.org, eladwf@gmail.com, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add support for mmc on MT7988 SoC.

We can use mt7986 platform data in driver, but mt7988 needs different
clocks so for binding we need own compatible.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
changes:
v4:
- explain mt7988 compatible with mt7986 platform data in commit description
v3:
- reuse mt7986 platform data instead of copy
---
 drivers/mmc/host/mtk-sd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 89018b6c97b9..aaf27fd211c1 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -629,6 +629,7 @@ static const struct of_device_id msdc_of_ids[] = {
 	{ .compatible = "mediatek,mt7620-mmc", .data = &mt7620_compat},
 	{ .compatible = "mediatek,mt7622-mmc", .data = &mt7622_compat},
 	{ .compatible = "mediatek,mt7986-mmc", .data = &mt7986_compat},
+	{ .compatible = "mediatek,mt7988-mmc", .data = &mt7986_compat},
 	{ .compatible = "mediatek,mt8135-mmc", .data = &mt8135_compat},
 	{ .compatible = "mediatek,mt8173-mmc", .data = &mt8173_compat},
 	{ .compatible = "mediatek,mt8183-mmc", .data = &mt8183_compat},
-- 
2.43.0


