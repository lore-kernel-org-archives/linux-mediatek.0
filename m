Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C384C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 16:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaXy7ASsEDDlQPixtA9h8Vqb0JSzYSy8v098jeMIfeo=; b=BttVRo8h7/dOZMqCfDs/ZnssMM
	Z02VoMe6OC6bPYlJSMyyKYPLCLTwNi8BXz+DvrAeWR0aklnJ/MTXdLrEC0oF7e4Hpa1FQp9/DobvI
	eLIP2xDNARuiuqoYzk4/My+jQk1h3Q/mgPObxINhB9aRx04CoP6byPFQUzhuB0wXY07Zx0tiHSjvA
	eevD1NxnAzxZ8NG9UIqttnIw07YqL23vJ6SP/Hh4nLKCemsUMaZfOfllOXH101jCP5LMSQT7CWska
	RUaorUc41bfM31pf02mcpeoKk4NP3/uxAV29T8DOpTuSFDkpRtMuvhU7a162/R6dKZBzBqB7VWO10
	2xC6s+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4eN-00G0o6-BF; Mon, 07 Nov 2022 16:07:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4cY-00FzeG-JE; Mon, 07 Nov 2022 16:05:11 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8DC6E66028EA;
	Mon,  7 Nov 2022 16:05:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667837109;
	bh=oiakfK/KyQsyZ8dFT+n7UDDhSpuPj6+i0VVZ4ScGBTI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LM/BCzWmyL7gjkAmc0cyLFYZ1P0pS7/pjWtsKAY1HMsJpA6WgBVb+urgQitu/VU4u
	 omJw2s0ZEPP/E2KuLjbTGPAeyC4a1FifCx5JR8Thk3ysT6DDUG3uT5w9yIMKWqOKk7
	 4zqVYg/4kAB0wy3FHcDuPvnVnMV80l9YN1YIgRa0BhqBS1kg5vgsVltc0sAtcvCNc7
	 1dvfcngzV2ySfNd9xVB2bKbAYJ/7theAvhcAEmM4UeMarPjb0Kl8YDfW4vmvZd42Ps
	 UFTraaqOseeMJLMkS+r+jeerKMtOXvC1qNnQyAN/CQUV5BvOtDV88sXmOJ1FlmH8u6
	 VCzh5kLnklrlw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	"chunxu.li" <chunxu.li@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 7/9] ASoC: mediatek: mt8186-rt5682: Register to module device table
Date: Mon,  7 Nov 2022 11:04:35 -0500
Message-Id: <20221107160437.740353-8-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107160437.740353-1-nfraprado@collabora.com>
References: <20221107160437.740353-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_080510_791522_3B019157 
X-CRM114-Status: GOOD (  12.00  )
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

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 16d834f3153d..e59d92e2afa3 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -1237,6 +1237,7 @@ static const struct of_device_id mt8186_mt6366_rt1019_rt5682s_dt_match[] = {
 	},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mt8186_mt6366_rt1019_rt5682s_dt_match);
 #endif
 
 static struct platform_driver mt8186_mt6366_rt1019_rt5682s_driver = {
-- 
2.38.1


