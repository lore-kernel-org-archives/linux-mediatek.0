Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C512EEE4995
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4MMnUNTpU/jZwAUKT3bq/cNuDEDn9rEShm45TOlyucU=; b=C21Liiw0H8Fxi+2r2UruAYqeSn
	IPHPBlQ5R4C7BAnRuY/ZYZIwOSKAWa6hQmKUyGIu0fUXGRaPiG+eNhzkxI2w3jSr0VPgIk1bCGOSx
	C6PBV61N/tLxkdNM5+VkEwMYAQS2oHuH/y+n3tUQuxKhE4qLK/NtLXof9kG/+C9V3YIs8G7iUpMYg
	QxKFj6Q9YuFGdW/kkgBlOSaY3h7khK7fArqEkocCyILtKWCCbbrtXNNGrNLiV34LiLFDhu3DfRKrg
	K0Rvw1hH6IwMdscTZOd2uh0RPio02/iVQtJwdX0PHTzStfCpWyJ5rKdlScndWoCzUQhWWUTxIEiJG
	AG8EHr4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLOE-00000009Gol-1ROp;
	Wed, 11 Sep 2024 11:20:02 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLO0-00000009Glj-2Hn7;
	Wed, 11 Sep 2024 11:19:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1726053582; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gtHCduAs0xH/UsmlvJTZxWSwcDh7rvNe8NLgCwDIT0HGhB4ElFNDTM1KXskMXPiSsI/pIOMcw8zuh4zTQNO17QbvugHwIZBXrg5YQO1ZEH2jszG/4GheGr6ULF2Ozq79eD95YBO4VxoxBDXuqnRrQ7aXEwUNAEw86GooK6VIhDk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726053582; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4MMnUNTpU/jZwAUKT3bq/cNuDEDn9rEShm45TOlyucU=; 
	b=YuS3YpBAuK1iBJck3lxKKLPXS0CFUMRN2pNGxnRdImR0ShEMe8fXqOglUBysF0CRHGnRblqAHtvGuWwMnRRxCyYFHZZnPhLXQYhIK6AXaiftRusxlPPhz7LR8etHwh8GpYaa9/JGbnfWy5G6XJooIXhAtdOp1ieNj6rVY1YG0/0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726053582;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=4MMnUNTpU/jZwAUKT3bq/cNuDEDn9rEShm45TOlyucU=;
	b=BV1MDXxPk0aQrE6zjowsc+fpQiJVfBR4Mc0mEc+d0mXyfCaoaUD22CuD1W2BTGN3
	bNj7r6OWWjTpo3Ox9Yi0GcdQni/NqJ8hDKxYaXeDKhjtGLUfGlDTpiPncGlV6EuttoQ
	H42PWjKb37oBNV48M4fsmvYPWz4yviPc4DkGetko=
Received: by mx.zohomail.com with SMTPS id 1726053580250115.83142773790291;
	Wed, 11 Sep 2024 04:19:40 -0700 (PDT)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Nicolas Belin <nbelin@baylibre.com>
Cc: kernel@collabora.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoc: mediatek: mt8365: Print the ret value
Date: Wed, 11 Sep 2024 16:19:09 +0500
Message-Id: <20240911111917.4091809-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_041948_657777_3CA7917B 
X-CRM114-Status: GOOD (  11.98  )
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

Print the ret value otherwise it is just being set without ever getting
used. The author may have missed printing it.

Fixes: 1bf6dbd75f76 ("ASoc: mediatek: mt8365: Add a specific soundcard for EVK")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
If it isn't useful, the ret value assignment statement can be removed.
---
 sound/soc/mediatek/mt8365/mt8365-mt6357.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-mt6357.c b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
index fef76118f8010..412f5fdd8fc52 100644
--- a/sound/soc/mediatek/mt8365/mt8365-mt6357.c
+++ b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
@@ -258,8 +258,8 @@ static int mt8365_mt6357_gpio_probe(struct snd_soc_card *card)
 							   mt8365_mt6357_pin_str[i]);
 		if (IS_ERR(priv->pin_states[i])) {
 			ret = PTR_ERR(priv->pin_states[i]);
-			dev_warn(card->dev, "No pin state for %s\n",
-				 mt8365_mt6357_pin_str[i]);
+			dev_warn(card->dev, "No pin state(%d) for %s\n",
+				 ret, mt8365_mt6357_pin_str[i]);
 		} else {
 			ret = pinctrl_select_state(priv->pinctrl,
 						   priv->pin_states[i]);
-- 
2.39.2


