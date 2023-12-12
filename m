Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107D5C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 23:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+0Py1qpCFXD5DfwM+BDWStOAQ+1sIGVxJBrNo8nRb2g=; b=srKPq7phM9QGu6FoG57uaYYIdk
	1CVXrisIJI2WmSv5ZX4du66XQpQpf/1o5t3EhBIwei3zsXHyCKomnSTlXvfdQQgO8ouGZP8ah8Jrk
	GodAtJuHQzVFBHcpYHT8XLPAvJjJAueSK21mduq3nBB6oIrf9vIP8hJ+PuJ2KoEYyjOslZ6fIzU3s
	scCZyO0PkhMZmQKqX+OK9Ee7ub6FvnsjRGVrUD08yYRU1Rg3aPdJqz+Vu8/2jHBHWs8i1eJliDI+Y
	3xpl+ecv723NuTVcNxo+hj9nE+gjLTQfEu149BHsngi5jJeNq4vbZzzulChBUxGWKEMwyjV5p2qtR
	mbo9h//Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDBtg-00Czh3-0L;
	Tue, 12 Dec 2023 23:10:40 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDBtd-00Czft-0K;
	Tue, 12 Dec 2023 23:10:38 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rDBtB-0008Az-2l;
	Tue, 12 Dec 2023 23:10:11 +0000
Date: Tue, 12 Dec 2023 23:10:07 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Maso Huang <maso.huang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] ASoC: mediatek: mt7986: silence error in case of
 -EPROBE_DEFER
Message-ID: <b941a404d97c01ef3e30c49925927b9a7dafeb19.1702422544.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_151037_142236_82790A86 
X-CRM114-Status: GOOD (  10.70  )
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

If probe is defered no error should be printed. Use dev_err_probe() to
have it muted.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Maso Huang <maso.huang@mediatek.com>
---
v2: use dev_err_probe()

 sound/soc/mediatek/mt7986/mt7986-wm8960.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
index c1390b3734101..6982e833421d6 100644
--- a/sound/soc/mediatek/mt7986/mt7986-wm8960.c
+++ b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
@@ -144,7 +144,7 @@ static int mt7986_wm8960_machine_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-		dev_err(&pdev->dev, "%s snd_soc_register_card fail: %d\n", __func__, ret);
+		dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card fail\n", __func__);
 		goto err_of_node_put;
 	}
 
-- 
2.43.0

