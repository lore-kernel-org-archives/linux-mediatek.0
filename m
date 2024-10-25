Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37113D0C5EE
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 09:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0OFw5/vW+q+fbP5gIo5SEpJ9x8soqdU7yg4/CUbaxHs=; b=3jKYAGwqwj79A0vmLC4pAHShIb
	GCv05btuG7i//i1JN8tI+bPZ1ilefmyScVIoOmc6vic+z294K4xrg6Qt2lnUYZiy8tXtNo5oD7rWf
	ksJPYk33mUzSjkK15lSiqFt3mWqlmBb+lzxWDXM/kXyCyc2jik4LQoUYtIYfU9lUzwfhXN984h0VO
	cGphg1LIpvtHMB6fneKvOsksKV/w5TuUgK195eV2keWBBRczBk2DbecST3WUQukWcQrLUjHDp9E1I
	SWyPwqUiENNl8uHHQHlAfbeE8jw2V/Oj1phfiqYpIltHq8trrWK3N/ru3BSzbPzGeLRJR1KaOg3QB
	Niq3mi/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GLD-000000037OG-13bU;
	Fri, 25 Oct 2024 09:10:43 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151] helo=cmccmta1.chinamobile.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GKZ-000000037Iv-1r00;
	Fri, 25 Oct 2024 09:10:06 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee2671b60642fa-b2311;
	Fri, 25 Oct 2024 17:09:56 +0800 (CST)
X-RM-TRANSID: 2ee2671b60642fa-b2311
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from leadsec.example.com.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee1671b6061663-30edb;
	Fri, 25 Oct 2024 17:09:56 +0800 (CST)
X-RM-TRANSID: 2ee1671b6061663-30edb
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
Subject: [PATCH] ASoC: mediatek: mt8183: Remove unnecessary variable assignments
Date: Fri, 25 Oct 2024 17:09:38 +0800
Message-Id: <20241025090938.3480-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_021004_192642_787DC473 
X-CRM114-Status: UNSURE (   8.06  )
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

In the function mt8183_dai_i2s_register, the variable
'ret' is redundant, thus remove it.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
index 65e46ebe7..5cf559233 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
@@ -1036,7 +1036,6 @@ static int mt8183_dai_i2s_set_priv(struct mtk_base_afe *afe)
 int mt8183_dai_i2s_register(struct mtk_base_afe *afe)
 {
 	struct mtk_base_afe_dai *dai;
-	int ret;
 
 	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
 	if (!dai)
@@ -1055,9 +1054,5 @@ int mt8183_dai_i2s_register(struct mtk_base_afe *afe)
 	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_i2s_routes);
 
 	/* set all dai i2s private data */
-	ret = mt8183_dai_i2s_set_priv(afe);
-	if (ret)
-		return ret;
-
-	return 0;
+	return mt8183_dai_i2s_set_priv(afe);
 }
-- 
2.33.0




