Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8A6C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 23:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Message-ID:Sender:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:Subject:Date:To:From:Resent-To:Resent-Message-ID:Resent-Date:
	Resent-From:Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Sender:Resent-Cc:References:List-Owner;
	bh=/vzjjUMvm1iD6dPYFRvooGGdAa5BvFtoRHD72sg2mYc=; b=awQYTm8XN4y0lIdeBJvkrJdyf6
	w6SPF+7fh+OaWlGQknlVvd6Tr4Miv2GQcILUZp0Zv0KHxwG4j9cH3TNhRAcYYdcLRpRW61BPN7OJ/
	anXar59/Rior78PJ82I0yB993phhtdBYzOwiPCLtFEwfJdjWpeAq+f/pPdzxA0HQTCtccBk6IlTRI
	JT+9ytTHa18vhU3UBiD13Akd09Ejkp67XSeM+h69KLKPkNIDLHFnCzTBQwh14Q5YW+NBtS9crwzX+
	Pf3gxG4c6nAWIPdTfITlAeljskiIF4VPjpU5mbr9Ei2cXMNe9NIyBb5zL3RetIWaw6djv22K9LdLa
	uocMAnNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oleom-002bhU-S5; Thu, 20 Oct 2022 23:19:16 +0000
Received: from tartarus.angband.pl ([51.83.246.204])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oleok-002bfD-Nt
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 23:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=angband.pl;
	s=tartarus; h=In-Reply-To:Subject:Date:To:From:Resent-To:Resent-Message-ID:
	Resent-Date:Resent-From:Sender:Reply-To:Message-ID:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Sender:Resent-Cc:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/vzjjUMvm1iD6dPYFRvooGGdAa5BvFtoRHD72sg2mYc=; b=CM07kka2mro8o2oKglgaan75+r
	ZlFQZm1cNyoEKErlot5Adc+GeENhxxov5kRMrsS7QOS3nJhGIHeqXeYwfM7KsHhKESZfOHx7X+HA+
	6HuM86nSgbf9Xxuhtb4dgumPkxmMuWZmhMLamehjRYIStO5RlouWuds+cJl1UZdg8tUI=;
Received: from kilobyte by tartarus.angband.pl with local (Exim 4.94.2)
	(envelope-from <kilobyte@angband.pl>)
	id 1oleGM-009OYu-SI; Fri, 21 Oct 2022 00:43:42 +0200
Resent-From: Adam Borowski <kilobyte@angband.pl>
Resent-Date: Fri, 21 Oct 2022 00:43:42 +0200
Resent-Message-ID: <Y1HPHojilsEi5oln@angband.pl>
Resent-To: Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
From: Adam Borowski <kilobyte@angband.pl>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Date: Wed, 14 Sep 2022 22:06:51 +0200
Subject: [PATCH 1/6] ASoC: mediatek: mt8186: fix an "unused" warning
In-Reply-To: <S229853AbiJTWkg/20221020224036Z+12888@vger.kernel.org>
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_161914_784058_47B96442 
X-CRM114-Status: GOOD (  11.43  )
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
Message-ID: <E1oleom-002bhU-S5@bombadil.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This, and a whole bunch of referenced functions are not needed without
CONFIG_OF.  The warning makes the build fail under CONFIG_WERROR.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c | 2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index cfca6bdee834..b15e97bd9d4d 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -1000,7 +1000,7 @@ mt8186_mt6366_da7219_max98357_controls[] = {
 	SOC_DAPM_PIN_SWITCH("HDMI1"),
 };
 
-static struct snd_soc_card mt8186_mt6366_da7219_max98357_soc_card = {
+static __maybe_unused struct snd_soc_card mt8186_mt6366_da7219_max98357_soc_card = {
 	.name = "mt8186_da7219_max98357",
 	.owner = THIS_MODULE,
 	.dai_link = mt8186_mt6366_da7219_max98357_dai_links,
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 2414c5b77233..22ce2f849909 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -976,7 +976,7 @@ mt8186_mt6366_rt1019_rt5682s_controls[] = {
 	SOC_DAPM_PIN_SWITCH("HDMI1"),
 };
 
-static struct snd_soc_card mt8186_mt6366_rt1019_rt5682s_soc_card = {
+static __maybe_unused struct snd_soc_card mt8186_mt6366_rt1019_rt5682s_soc_card = {
 	.name = "mt8186_rt1019_rt5682s",
 	.owner = THIS_MODULE,
 	.dai_link = mt8186_mt6366_rt1019_rt5682s_dai_links,
-- 
2.37.2.609.g9ff673ca1a


