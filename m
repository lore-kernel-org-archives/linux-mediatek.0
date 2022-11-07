Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0832C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 16:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlBBM8gGG/txXqjsj4jL9uLLD6kKO7JeAlqhR+5QVFI=; b=Mxs2CYnFVyJQo7WrfPyRVRtLDB
	QAZKNJlQ+SnUl4ws62Q41fiCkEJAOmEe8jZzajNSosV9NfSRb1f2o9B0XmL9BXCF7D67AJw5ptDwS
	ei+T4nc28uO1SZHOn4Qhb0bmwYibM2egxd99H/XMj1o9rVsxnLElXl76pNJCig7UV12EAoslU8flF
	vkpjHOI9PsFhKVQ+GwsidUM6kiUEminnaB3os4ZfEQImZhOAQcOdBhojnpSJ36poz2OJAq1fViV7r
	uv5lx9UVJBaHczEV4EttMn0Xytwb+2XUuPNj0MIjgu+L7sv/RAFsU9hBZpru7vu1mqjjoRFS+gYt0
	8ksQTOHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4cl-00Fzkn-FZ; Mon, 07 Nov 2022 16:05:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4cH-00FzX6-H4; Mon, 07 Nov 2022 16:04:54 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C024C66028EA;
	Mon,  7 Nov 2022 16:04:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667837092;
	bh=xD95zUNAQgJy90NkPhVmGd7rPUx4jnJPotUs0/QHgXs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rx8u/wqsxB2UekVdI46dYFJ3WyqS+vqn/6gljNuxlENp5KBaK0wPPqyp49CCDeFIR
	 5H120fxAWVOksFogb6bE+BBSGh0sI5FbZJc5MgFo241bJV/T37E5js25UW9d3T+fze
	 6h6U4ocXMaZ9Nm5Zs9af+T+oR62W4C2JCZLPA7p2AzV5dQUqO2xC8SuYKAwYW0hvAp
	 eQtKUTalBOXgvAAasuI0uwpqBd4Ud6GFptoK2h0ms/JI0vRsc7P7f/7bVAPoD0v66T
	 MO4lCwj7TB9G7rs1esYd0uYovddJ1g2ueO5i+gyj6VJaVxvz2QKXiChxs6R2kOGQZC
	 jFwk+hcQOB6tA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/9] ASoC: mediatek: mt2701-wm8960: Register to module device table
Date: Mon,  7 Nov 2022 11:04:30 -0500
Message-Id: <20221107160437.740353-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107160437.740353-1-nfraprado@collabora.com>
References: <20221107160437.740353-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_080453_723474_DF12D945 
X-CRM114-Status: GOOD (  12.15  )
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

 sound/soc/mediatek/mt2701/mt2701-wm8960.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt2701/mt2701-wm8960.c b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
index 0cdf2ae36243..a184032c15b6 100644
--- a/sound/soc/mediatek/mt2701/mt2701-wm8960.c
+++ b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
@@ -161,6 +161,7 @@ static const struct of_device_id mt2701_wm8960_machine_dt_match[] = {
 	{.compatible = "mediatek,mt2701-wm8960-machine",},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mt2701_wm8960_machine_dt_match);
 #endif
 
 static struct platform_driver mt2701_wm8960_machine = {
-- 
2.38.1


