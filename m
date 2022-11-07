Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F254C43217
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 16:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxwfPTvU4n0QlDly0pijU60eUsBMY+yvcTnqHl4V8mo=; b=q32FYL6LdGvZBHKeHK8foVzLSv
	PxIz0Go092cfXMHkh5cLbVwhop1E6296NU55aaStIfyDJcvHLeKJEbU2+fr2QVogNmNkyGLlzcbfV
	G1W/pBOGHHBpARW124MQI5u+vMmPdo2M59wadwWOeN8WHSuC1U2+lx9TDeYROsvJaWaDOimRdGK39
	TsOvNndYoUUxV9wVBAQ0n+JL1R62gcX0EfI36lPG1D3G/jGCCjIUKiLmiZ8eWX+nJ1YEGvwBrS4tp
	v8+df1z/WB32NJF/FAHUuZbepPZBEyMfdIzVfdtSYiMEJ0WWnaD68YA9ImmOFw+YLhSbu1kDiTkj9
	+b4Gs0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4cY-00FzeM-0G; Mon, 07 Nov 2022 16:05:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4cF-00FzWA-N4; Mon, 07 Nov 2022 16:04:53 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 953D766028B0;
	Mon,  7 Nov 2022 16:04:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667837089;
	bh=BnJV/zpf8sAsYJ9izvBwPrAYIuUiDNkZee48XmMB8NY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XqtPPYQtxUeFGbsC/JrwA97aiXK6FhABz+jakbp/MvfSH31oowu7Fu7CYpyS6oJJ8
	 BXRZHDdrHLZo8ZASnHGdWp7/FZaATbN3obPj5aZApeZF3fIdY+aMyWom3FzeYRWXtR
	 8NL8+UWH8zlrIuVeMlxWl6L0J3iJMwXyzgKRazZrKyT0X5Xz4R6/T0zKchVB1LqJPi
	 jesrSPkARouAVQiljoj9HUx6pIYclizHpyBF1GHLQAHey/rgJhRPBoLvKd3yF/24mZ
	 5oamUclMiWAK8CxGjuft1cwu4P9C4shSdsKiRd+v75vTbEfQv8IRkoN/oGr3lePvkF
	 KToYs9gPzqK4Q==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/9] ASoC: mediatek: mt2701-cs42448: Register to module device table
Date: Mon,  7 Nov 2022 11:04:29 -0500
Message-Id: <20221107160437.740353-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107160437.740353-1-nfraprado@collabora.com>
References: <20221107160437.740353-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_080451_903049_C2A6A2C1 
X-CRM114-Status: GOOD (  12.23  )
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

 sound/soc/mediatek/mt2701/mt2701-cs42448.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index d9fd6eb786aa..08ef109744c7 100644
--- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
+++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
@@ -418,6 +418,7 @@ static const struct of_device_id mt2701_cs42448_machine_dt_match[] = {
 	{.compatible = "mediatek,mt2701-cs42448-machine",},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mt2701_cs42448_machine_dt_match);
 #endif
 
 static struct platform_driver mt2701_cs42448_machine = {
-- 
2.38.1


