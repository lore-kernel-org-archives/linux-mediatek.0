Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B927C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Dec 2022 11:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uLwMw4epyrb3bzZyb5+8pjUhv+yHD++6G25hkeYYrj0=; b=Gn6rPpTL4Kk8Fwfj90IPqmuD1j
	NJZ3d5ODlFJSB5ZjHB83qBVPWPTCW/wrmUUJvnhm/aYfqYhRkujX31OvLImwgVfPCMoLzrq7OQmL8
	/VhGcfVg0EkSKtERIczbNnODB8V+mP+OldPkMMMv+5O0ny3lkK+HeivzewNFoTxPvOaDFUxAsufWY
	jy+jul7oJsN4hG/yIUaCWB/AzNRpk5oeLMs0qZ9TnFgJSTDsp00VwPSd5QPdRngy7nVrN9Uu8Jj7M
	AD8YuCaU129HxgL6O/ZNe4syUpVCPgxEnrEpJdWolE13m0xEvGtVd1yrFutSBLiTIXOCf47tGxUsW
	9/v3k4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAV5U-004bUC-6p; Wed, 28 Dec 2022 11:59:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAV5O-004bLR-KH; Wed, 28 Dec 2022 11:59:08 +0000
X-UUID: 77b19706064a4e1689a73b25577ee7a6-20221228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=uLwMw4epyrb3bzZyb5+8pjUhv+yHD++6G25hkeYYrj0=;
	b=NCZt4ihup3c3Jw9yWV8K8KB4/xVGG+H2g1bFZukiyLX68sUD6qq/jqOgzhhltrVVq2oRniLgsQ6w3bIGY23qT5ClDeYSBL3Ri8AEo/jf6WbTPYIyd1ZVsy7bR5Sce4VCaw9vs0V1K+nCdD6oUSzicvhvmZPbnYtxg+297L9hn90=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:b083b992-1238-42ab-9795-0728639f68ad,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:27d0a38a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 77b19706064a4e1689a73b25577ee7a6-20221228
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1867501258; Wed, 28 Dec 2022 04:58:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Dec 2022 19:58:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 28 Dec 2022 19:58:01 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	"Takashi Iwai" <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jiaxin Yu
	<jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>
Subject: [PATCH] ASoC: mediatek: mt8186: Add machine support for max98357a
Date: Wed, 28 Dec 2022 19:57:56 +0800
Message-ID: <20221228115756.28014-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_035906_810502_7FD4EB04 
X-CRM114-Status: UNSURE (   9.88  )
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

Add support for mt8186 with mt6366 and max98357a.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 sound/soc/mediatek/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 363fa4d47680..7bdb0ded831c 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -182,9 +182,10 @@ config SND_SOC_MT8186_MT6366_DA7219_MAX98357
 	  If unsure select "N".
 
 config SND_SOC_MT8186_MT6366_RT1019_RT5682S
-	tristate "ASoC Audio driver for MT8186 with RT1019 RT5682S codec"
+	tristate "ASoC Audio driver for MT8186 with RT1019 RT5682S MAX98357A/MAX98360 codec"
 	depends on I2C && GPIOLIB
 	depends on SND_SOC_MT8186 && MTK_PMIC_WRAP
+	select SND_SOC_MAX98357A
 	select SND_SOC_MT6358
 	select SND_SOC_RT1015P
 	select SND_SOC_RT5682S
-- 
2.18.0


