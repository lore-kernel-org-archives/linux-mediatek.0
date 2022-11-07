Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29C7C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 16:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZySpqZ1rbBbhblRZZ99I0kVqZdL8EVbcx+qxL+H1TTw=; b=bq2Sij7NqVPIMFE5LrA4PlACgK
	p/k5bBcRHSIYU9EHd28h+t+l3W/SjDhzRDn9SkCWsIedM/7EwdEKod0sVB1/19as6xJovZMxqkq4m
	gm+r8+cYr2FDtHRXDZ6mvuxcdwNkIXgJMmAeOMY8x0cPCnHLPTNu7zc3B3WBL5jU9bhkVp2mdIisG
	yFp6M/jyvmlLoWWG0trhsKYM441bH8R+El67J4lkD2d4ZoZly6x2VIWR1+XG2zN+jSaEVURBz4HpW
	ivSIcaiVuyzx3AtrVshpcrsHK11qYxSMagEKjlgK8tZBbEHUuRUBOLPDlfmMXFIDDW49aKmj58beT
	xAJr5PtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4dX-00G0E3-E8; Mon, 07 Nov 2022 16:06:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4cS-00FzbG-8F; Mon, 07 Nov 2022 16:05:05 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 05E1D66023A6;
	Mon,  7 Nov 2022 16:04:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667837103;
	bh=dZK26kkOEZwwya4mrJgF5oR5LpfzoAchwXP6tiVxpXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P+xngZ7gqkSUL8lnYkXFWmM27FvrkSyDSWee3iBqB3wq0rnXAhpGr2pNDtY2+fESm
	 c9obgkrgytpvTyPC98KV/d7Whuxsgv2R0tYKF1/Rv1B/zmDPFx5QOws/WXCERisTbZ
	 vfOaMF32YLpV9vb7q+IFzB9eqPbuXuB8MTuB8Ya7U05NFOEz6Kf9ZF1tr+0oiBi+jS
	 QdA8NjcOvhgyWlVM+XQVDxfqKNJO3hfU4BeiWEFqUcxakG5k/qa2oKQiY2xQOK/C7I
	 Kbb2v79FcbIrqKOjSgSEAGzIcgfG3J7Ba0YVIJErz1QvJ/tGKwXqG9UCvNlx67sa+m
	 fr6O0vML6sePw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 5/9] ASoC: mediatek: mt8183-mt6358: Register to module device table
Date: Mon,  7 Nov 2022 11:04:33 -0500
Message-Id: <20221107160437.740353-6-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107160437.740353-1-nfraprado@collabora.com>
References: <20221107160437.740353-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_080504_449546_852FF628 
X-CRM114-Status: GOOD (  12.01  )
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

Register the compatibles for this module on the module device table so
it can be automatically loaded when a matching device is found on the
system.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index a86085223677..8fb473543cf9 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -835,6 +835,7 @@ static const struct of_device_id mt8183_mt6358_ts3a227_max98357_dt_match[] = {
 	},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mt8183_mt6358_ts3a227_max98357_dt_match);
 #endif
 
 static struct platform_driver mt8183_mt6358_ts3a227_max98357_driver = {
-- 
2.38.1


