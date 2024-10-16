Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821A7D2068A
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 01:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+cSbu2W6mFnWCrqPvp1mLcsyiP30Ux9cQDkn1N90xME=; b=QE56ex9FEgkbQ5tlk5AY1SrbCc
	BInFZIk0kXFT5IbTeWSHVoYp7J9xNKoAZVNlRh4iD5rEVYoypJxGwbXmNGlvrZJIVuAf89DboFdCO
	IS+2E1aWLCMAMgTc94/JVcqasXGVZTqYkLfW8if4b6McZj+izBwxXvl+ns762Uv413v9OQvKXj8qR
	1nG10AXm94qmD3APUWPzwi/dUjOTc3mCWWCt/0obzYRgg74FaBzzUQ0UMB1scpHg4PLuRyij1lVwv
	xzQcg1J+2qoFi/cc7/IgRyTFsDvjmZf6oGZQ93+W2N6sp/E3dTSCFEWUK7p//bsg7Z6PYbY9zzqds
	Bz/Lyp2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0sic-0000000A7Es-2nHv;
	Wed, 16 Oct 2024 01:20:54 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139] helo=cmccmta1.chinamobile.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0shA-0000000A74J-37DL;
	Wed, 16 Oct 2024 01:19:27 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee1670f1492c5b-f7569;
	Wed, 16 Oct 2024 09:19:15 +0800 (CST)
X-RM-TRANSID: 2ee1670f1492c5b-f7569
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from leadsec.example.com.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee4670f14888e0-200ed;
	Wed, 16 Oct 2024 09:19:15 +0800 (CST)
X-RM-TRANSID: 2ee4670f14888e0-200ed
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] ASoC: mediatek: mt8188: remove unnecessary variable assignment
Date: Wed, 16 Oct 2024 09:18:51 +0800
Message-Id: <20241016011851.2023-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_181925_337770_42F79CDD 
X-CRM114-Status: UNSURE (   6.96  )
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

In the function mt8188_adda_mtkaif_init, 'val' to 0 is repeated,
thus delete one.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/mediatek/mt8188/mt8188-dai-adda.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-adda.c b/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
index 8a17d1935..436703166 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
@@ -63,7 +63,6 @@ static int mt8188_adda_mtkaif_init(struct mtk_base_afe *afe)
 			param->mtkaif_phase_cycle[MT8188_MTKAIF_MISO_0];
 	}
 
-	val = 0;
 	mask = (MTKAIF_RXIF_DELAY_DATA | MTKAIF_RXIF_DELAY_CYCLE_MASK);
 	val |= FIELD_PREP(MTKAIF_RXIF_DELAY_CYCLE_MASK, delay_cycle);
 	val |= FIELD_PREP(MTKAIF_RXIF_DELAY_DATA, delay_data);
-- 
2.33.0




