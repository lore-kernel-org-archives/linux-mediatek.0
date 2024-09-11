Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E30EE499D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 12:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+e+eF+lZBrbrHlH5HB0DniuCeWtZvG3d4ENpfJP76ww=; b=iAJkMgsxryWX2CV4zCMNp40YSo
	uVkG6PiYJlFOIqwRYh+jvoMNEMiw7/yV10ZDD0u13ND9vUqOYXZqQb7TYXyPbMOfUVXLXmEScNiZN
	39qXhLKi8rMlZ1KBg1dgF9QK1et36dY+zsJhUQogg3xeJNrzusiBYe7eIiE8WfleR5hALmSrF6w/A
	zUyT71AKDdVPNdmountlBX9UjZTGYOiqcAP12R7tYVQwAccXYJVRrNyx9ifUJ6BA88UpT0o75gFrB
	F+df+EVaPmoJIBD6Gu4y1myAUJyg7WMfTfDTENizP9syXj6/2jwVsG+pY68nU6fMBzaGqRh6jLo95
	8Hemyj0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soMeE-00000009X0E-1sVv;
	Wed, 11 Sep 2024 12:40:38 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soMaa-00000009WA5-3tvk;
	Wed, 11 Sep 2024 12:36:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1726058207; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XKH01/pTkXVrkiamXwZB0QhAi9U9rKL7kIEy2NmWvEFXQHci1eXBhPTpOSARXgUcTyJ3c5zYP0gXD32cUix3fFW8i7XLnLIzQql4eETJBIaL07RHce8K/SMTEYDki0Fud9OTiYXgZGglRg6ES8KfnQaHly1Y1euBemae+gUuOMA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726058207; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+e+eF+lZBrbrHlH5HB0DniuCeWtZvG3d4ENpfJP76ww=; 
	b=LOPGTK2jBO3I9Xo/uyC+/9YHUmWpPPYZMAi6Ra8BIn/O/n2JJ5u/sgmGaspqt9cP8rtfzRljp4BS8txHafbYrGKCoYxUq2g1a1c62+JuduabvQ/y6EQ342kWdUFJrJzICK00d6foPtNi+hhi/a/y2wPXpxPpWrULnpuG/jchywk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726058207;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=+e+eF+lZBrbrHlH5HB0DniuCeWtZvG3d4ENpfJP76ww=;
	b=N4dDIJCjIMhiPJAMwY8d1kd84/jOh0zof3oJ+Zr6XcFdk8wC9e1m2JQCFGYkYRMs
	UBDzquwJWRbWDoCjTOQtNxuA9+MpNQ4pbNEzc+N5Ezqe4bitnWULYkog84l5kVXCQDf
	2BnoLUN6x8+t+9i/AHYo74zbI2DgGE+8EwJYIDvM=
Received: by mx.zohomail.com with SMTPS id 1726058206065221.86180204145148;
	Wed, 11 Sep 2024 05:36:46 -0700 (PDT)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Nicolas Belin <nbelin@baylibre.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: kernel@collabora.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] ASoc: mediatek: mt8365: Remove unneeded assignment
Date: Wed, 11 Sep 2024 17:36:22 +0500
Message-Id: <20240911123629.125686-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_053653_038255_CAC2E4E1 
X-CRM114-Status: GOOD (  11.95  )
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

The ret is being assigned, but not being used. Remove the assignment.
One of the reviewer mentioned that dev_warn should be replaced with
dev_info. Make this change as well.

Fixes: 1bf6dbd75f76 ("ASoc: mediatek: mt8365: Add a specific soundcard for EVK")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
Changes since v1:
- Remove assignment to ret and don't print it from dev_warn
- Change dev_warn to dev_info on request of reviewer
---
 sound/soc/mediatek/mt8365/mt8365-mt6357.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-mt6357.c b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
index fef76118f8010..577f3b1e20a18 100644
--- a/sound/soc/mediatek/mt8365/mt8365-mt6357.c
+++ b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
@@ -257,8 +257,7 @@ static int mt8365_mt6357_gpio_probe(struct snd_soc_card *card)
 		priv->pin_states[i] = pinctrl_lookup_state(priv->pinctrl,
 							   mt8365_mt6357_pin_str[i]);
 		if (IS_ERR(priv->pin_states[i])) {
-			ret = PTR_ERR(priv->pin_states[i]);
-			dev_warn(card->dev, "No pin state for %s\n",
+			dev_info(card->dev, "No pin state for %s\n",
 				 mt8365_mt6357_pin_str[i]);
 		} else {
 			ret = pinctrl_select_state(priv->pinctrl,
-- 
2.39.2


