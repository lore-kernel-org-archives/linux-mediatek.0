Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755FFC982DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 13:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21pMHDsV/Fd9QFDutbYYXowTkN17HxIRjn27KJEcxhQ=; b=Wap/147Ug3XeCrryRXJXsu3tDu
	7Y92KE+Ul7KLggoXgaHM405YQ7YOkcqFnPIff0xVa0TZWz63+l0zjKEJjDbqUhuNR8i6jz/fuIwNu
	LkeiCQ0gp1B7eZfMca+0wzNrXmQycenu9dJ6MgL01kVFkBQu2zNK0DDmJxlVy8Zbz3BdGUylQ9pxl
	timjd0paBlMfHTG/gR8F6U+R+55azjmnfIOA1siMhAApfTE5UdPuavIaXRctkfND5pwy05nsYSEU8
	URWPt++OJR5LvmxWIRwVsAsrBAE7K2Gb6zWZ/puaGcgvKJun42x1NEpO3rcaccR+zPDdrroSl8hfg
	vh2qJx9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ypn-0000000EbQt-3z1T;
	Fri, 18 Sep 2026 13:40:59 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpV-0000000Eb7K-1nIN
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:43 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so732698a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 06:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738841; x=1790343641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21pMHDsV/Fd9QFDutbYYXowTkN17HxIRjn27KJEcxhQ=;
        b=aN0yZIG5eeNo4hDKM7cHFrGndiQ0R0tzdNcR+/OR/J8H0XQO+M1r30Opef5jwa5qWS
         dQGcBuL5MbFNJKuRhda254lGesdZa4KUv5C4nv3WkWkHYNL0+ncrVpwywvLe3cUPsQQ4
         L93jFaKQPKGImn2+HgmLsP3UUo7Quh6D+pYuBbau+AWncbnZNwZ2xn8CttnJ6Ygmh848
         QLw6zXONw6pvuWOSqzK4DbovFEZcghBfGBTS94PpbdW/0KqeIDX+m6Owwp67laXgprZ8
         0boBDZbqxgK6F3iewScwabG7TUpXBnkiue+Z1jXoj4NSFhMFIhox5dYaZ64kBAH5Gr/C
         YWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738841; x=1790343641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=21pMHDsV/Fd9QFDutbYYXowTkN17HxIRjn27KJEcxhQ=;
        b=UQsl+LY0Uxncm9tkyn5PjxG3MrA5HcB/ar+scxNJFAeb23pVsOrpZVEHStmv0hb0ZA
         hoNT8DDiQRjrS6a7e9zjJ+sx2p8NkbiDypDGEI5JVxwq1k/CzvIyxelBVA7RQKVtkMFr
         Jsr+x3zx170z7NH78vIyRJhgOpASomWFMK/nIYNaIxXCZFOdalk0d9xbgrqhbmufgGXl
         hE72CQSN/l8Nro7sKlPApkJ3ynuKpdzrlgFg5OksipohIGo3qCaidwFL6A3Q6tYIqTO7
         tR6JxXfpDmWIHTzwVcOeyuBwERrVho/WYdH2uSNBSHAK9z2IpLXU9h1lTFF2dt2ZoM2d
         kjhw==
X-Forwarded-Encrypted: i=1; AKwUvBxUIQpba+G9JCv8JWk9VIjjuhJzyYOUmXFX5bY+wYwtHEJ3thl1Eq7fZXMFqyKxlKtqEQXFOz6ZBA7FQbvMKQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kPLBxYdE/aChNMtKDFgvhL93bE+shA82qAtiuco1gLBXu96Aww
	eX9RPBwJXDsYWAV3xPkduPMI95LG8KO5aTMCElbL1sbDWtwLskndsMfd
X-Gm-Gg: AYBFou1fDY0FvBuZQE8iTJR1Cfydmb2hIudi7PhPiQtYJNHs4ntHJOvJnphYGsab07t
	2XjJlT5gMul41twK5kldZbSqZQoX5QfEBUUVKkhycidsteX2Adn9uT6wcMvohOYoj+BtjM3XNMw
	pwLkvqNWTp3RCu2/APBscpv5SrO/utyI4WZjtNVqK9I5t+DmEgTeGrSqf0MVMi1lrEqYQS2gXpJ
	4b+zNDUYferLTLtaiu2M9FtU8bW21EL6jTlQ1W8K+W/CuA1exgAbHTagkgGTUui6e6In0HXiBxd
	O2eun2so7lHuHtz8OzidAetvQoixckHm9uWWI/15zmF1ESEY5JaYf+V45XBbJre7whr0Adsd6Do
	KvCNr11a6HzQn+4rdPjub9HRQtBgxRsUyKjypq0leJmyWJXq2nUB6NZAUvGD4XbygCOn5EDtCHT
	b+wdUiqXItaBRdWUjp1TW24UJ3py/NAMO4gGuYJMT9Ro6kLp3e3yvFbUZatt2hzs4vQe7NfmyRQ
	mf/M3GULBOZDiNceW2LYMLAtyCk8vXCXfvlnt2BHEnkQMgWhrl6K1BW4hBZ4g9R2OgjazV9Tq9T
	GICHX1Nkxkrn7A==
X-Received: by 2002:a17:90b:48d0:b0:39d:ec24:5ffe with SMTP id 98e67ed59e1d1-39e54d1115amr6173759a91.9.1789738840001;
        Fri, 18 Sep 2026 06:40:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:39 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 12/15] ASoC: mediatek: mt8192: Propagate mt8192_afe_gpio_request() errors in ADDA DAI
Date: Fri, 18 Sep 2026 20:39:08 +0700
Message-ID: <20260918133912.133799-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064041_801412_F59F1058 
X-CRM114-Status: GOOD (  11.59  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, DAPM event handlers in mt8192-dai-adda.c ignore the return
value of mt8192_afe_gpio_request(). If GPIO configuration fails during
PRE_PMU or POST_PMD events, the error is silently ignored.

Fix this by checking and propagating error codes from
mt8192_afe_gpio_request() in all ADDA DAPM event handlers.

Fixes: 607ac4859564 ("ASoC: mediatek: mt8192: support adda in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c | 44 +++++++++++++++------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
index f8cb84621d38..c5c726a6e423 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
@@ -218,10 +218,13 @@ static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int mtkaif_dmic = afe_priv->mtkaif_dmic;
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 1);
+		ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 1);
+		if (ret)
+			return ret;
 
 		/* update setting to dmic */
 		if (mtkaif_dmic) {
@@ -239,7 +242,9 @@ static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMD:
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
-		mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 1);
+		ret = mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 1);
+		if (ret)
+			return ret;
 		break;
 	default:
 		break;
@@ -257,11 +262,14 @@ static int mtk_adda_ch34_ul_event(struct snd_soc_dapm_widget *w,
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int mtkaif_dmic = afe_priv->mtkaif_dmic_ch34;
 	int mtkaif_adda6_only = afe_priv->mtkaif_adda6_only;
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34,
-					1);
+		ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34,
+					      1);
+		if (ret)
+			return ret;
 
 		/* update setting to dmic */
 		if (mtkaif_dmic) {
@@ -291,8 +299,10 @@ static int mtk_adda_ch34_ul_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMD:
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
-		mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34,
-					1);
+		ret = mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34,
+					      1);
+		if (ret)
+			return ret;
 
 		/* reset dmic */
 		afe_priv->mtkaif_dmic_ch34 = 0;
@@ -446,15 +456,20 @@ static int mtk_adda_dl_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 0);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
-		mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 0);
+		if (ret)
+			return ret;
 		break;
 	default:
 		break;
@@ -469,17 +484,22 @@ static int mtk_adda_ch34_dl_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34,
-					0);
+		ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34,
+					      0);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
-		mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34,
-					0);
+		ret = mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34,
+					      0);
+		if (ret)
+			return ret;
 		break;
 	default:
 		break;
-- 
2.43.0


