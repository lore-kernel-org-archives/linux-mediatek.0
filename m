Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069E7CC6B1A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 11:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9H3uMbxcj8IZv2bcwWfPBQqx6AQdPe8IXejTikxyd5Y=; b=KNWIpLfsF9CprITaXO67jketVC
	+TRNZ9SVFXqU3PUiEiFQM6MWMpz9Ua54d8UzHEPNIYxAtupaglxPIKWYHCOssaxteIKJpwl9NuuaA
	M+cJmyaKYnMgCPuInHahKGuT7RSwbZLwBTDpKj5ecxvLKhWWc3WiIYcc8RkizikMsR7FvpWMKAWN5
	JtXiIiJH1/aHmxnT1XHDPg8jY/AKkiY9IgRNjVjQPIggslc7WtUusqJAXf6FngAFOqKnuGRpbvoKD
	C5l1w+qtU63cJzg6C+cig6Zf8RTJfJWCSnLMxF90hLPXNkW0K9qU9Yv8tyuxomd9Jf+hD4E9uyoBM
	WwA4fnjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxA4-0000000FJlt-3ocs;
	Wed, 14 Oct 2026 11:28:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxA1-0000000FJhW-0xTW
	for linux-mediatek@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9H3uMbxcj8IZv2bcwWfPBQqx6AQdPe8IXejTikxyd5Y=; b=gsfDCGz6wTjgjMYcdUAcROpyHx
	7dHtFOlIIPqdsXn374bDi0nhlvyb9AUvitz4OcVEmXlyjj3LZOSeJoP4mJRqE1kKr7egJX4EqPlUw
	f/6kw7I5f+sAql8Ka/dY+KcP9vjHK/401Pqo1dldxEGiZwZcZ4EWykMzCUjEAdg1/Cci5YirYGNWJ
	6+wLwgAe31Tbc4W84c7LU9agpg/boPZuMAZqn1bcbwie3tt+nbz8K4oUWDloeJs0FdHJon0YjapIr
	DYYDNLgVYgk/eD/1TaShFtmVZBHmtNFBj8gHmlY+aTqD2cZsACegCkp8vNny0+FwTo0dNkjTLw19A
	O8pLm+MA==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGx9y-0000000Ggah-2DrC
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 11:28:40 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3ab4178ee33so2193214a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 04:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977316; x=1792582116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9H3uMbxcj8IZv2bcwWfPBQqx6AQdPe8IXejTikxyd5Y=;
        b=BUXDWqq9Uf6jel6WJFtksaQEg7v3rumLvfVtnmam+6QeuEx+ilPvDxryOkV11el26+
         BvCAvCxdNsRrAmR4wgO26whT9GL4OozbAWBFlfXYc39Blkegoz2rvdeOJ2uaQFrRtouF
         dLvGm0MBCzAcCG4AtgaqvWM3pD8DBYF9cdqNjHb1AGc/iuOaf4y8h8eFpK7h6d3EhajD
         HZDWSbCnfQoZHmOsweI2lyikE0YfmQbPVXwvwDH6yK1A+h7C+6RQZOuniLMnUPLmJg3W
         qy+qJTh6ce0p0hMho83RbYAQLBvaD+M2Q8s2BWh9r6qMtRQUAeHh85goOCT2cY0NMTc6
         4URg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977316; x=1792582116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9H3uMbxcj8IZv2bcwWfPBQqx6AQdPe8IXejTikxyd5Y=;
        b=PlVIbZHBekRMtzczOWTgimhL8P9c7nZ93gfm2tkf3e8QTj2nA8MqsjBuRJ7XBV696G
         v9RYRj3Nl0572K8ZVn5qmUzwn5AN75N7x/PQ2OdwiZw2lpKt0ESNjt7IoAXuJP3rkj1V
         uCi59Y0VLpxnJxyztJxkFtXimw+xIWpeq841Ysi0qFkux/onm9Bbmep1zGrBUczClEc2
         rS6iqt4oV/PL/C8rQ+YJx6S1bDEtIUcUB9KNttjouczeKEBbWQHz3iAd6XfREujgsCZS
         NRw2wlMvcFZFpXeJu56A2WGzDwpzjbc+VZ8HjTMriWCR3g4ECFveqN5P/qYhgws8QW7e
         lmMg==
X-Forwarded-Encrypted: i=1; AKwUvBx3JibvgoqV8s1NShWvyafOwfP6B5YjsPG64gzVa0gp1G6qS3YguPUmJ58wlryyw84Vp08I/k1U0gZbNTu5wA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJGEGEvOg9tURc6S3EnsJZiIKlYjT+9UZw/k/VPzkoB+nctQeZj
	s50qAjuw4YHYltlo8FlS4q/vaK5ID0Z6kv3EQqpV45I97WUNPo7eh2ZX
X-Gm-Gg: AYBFou0eSwzkGMfnabvZyojB+0Gq9QfENxTnxrMQAPIZJZoEgDC7hnrn4mi67BVvk8n
	zdnrTo0vHho6tMA2lpFptDwi/Svhao3RTzI2tgSYLgKmoM9Zz5MRTdwqbuV0pAEBnKwJ83W5kLX
	nVIwCJf0ty5LuLBOxCkRPosC05t2j2VYTEDj/ssDq7VvjZQ11yxDo7W7Jy+W4+YRhOUsQiDA781
	P/6xLhk/Q/3dsbg2pTV0490BMYQe3tAhRqPm/SzjubHUR1qshC2rOUKNf7D9VHLNQfq1U+ayHbc
	RqOUl9aJ1CZUUgUYCUDbbwLNpGgFr0FUbH2Cjd+If5EvTkopizKpRhiJBVKC5qUFb1ln4/o1yy3
	Yd/pwE49y6Qo8tqzGOxsqMcydUwagsf45scNKcbJ6zGM20rhWv1Q4BxjqbkP6RRHtCFSTYx8Y0P
	du577+XvzT5sC/uKhScF5PYeBj6tYTqRA5F93sM1t/fPZcYqoPY7GoqxeGZjJl+ut7p/Dl2qcOs
	LrlqL3wU4JI3byq/wxCDEhA1GX7Emjl9RQXGJA7hjCAKS1ppn1L3NmZZVyL+WL4FxOlM7aaluyr
	ZGEO2Lr0jPvwrw==
X-Received: by 2002:a17:90b:510a:b0:3a8:e2c:af52 with SMTP id 98e67ed59e1d1-3ab3a93eae8mr12248948a91.24.1791977316276;
        Wed, 14 Oct 2026 04:28:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 04/16] ASoC: mediatek: mt8195: Fix timing system clock error handling
Date: Wed, 14 Oct 2026 18:27:39 +0700
Message-ID: <20261014112752.683032-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122838_682072_CD729E3E 
X-CRM114-Status: GOOD (  14.82  )
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

Check the return value of mt8195_afe_enable_clk() when enabling the
timing system clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller. In
mt8195_afe_enable_main_clock(), return the error instead of continuing
with AFE clock enable.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 34c828fdea29..03d2c4fd1f85 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -662,7 +662,7 @@ static int mt8195_afe_disable_afe_on(struct mtk_base_afe *afe)
 static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_AUD_A1SYS,
 		MT8195_CLK_AUD_A2SYS,
@@ -673,13 +673,22 @@ static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 		MT8195_TOP_CG_26M_TIMING,
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(cg_array); i++)
 		mt8195_afe_enable_top_cg(afe, cg_array[i]);
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
-- 
2.43.0


