Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DB1C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 16:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inDWf4aVWfqLXa/6RM0Qbq/x3xftSmJHQSSuFLoWOoE=; b=D4p00Chp+/qevs+cv9sSV56RJ9
	D+1ePnDLr6rxKDJCSYuHm2fmlVQmzXcE05xsabhCkjRtWVCGIAu+LzwKsXThI5L/33bl3BQt47AHj
	kciV5xOO+ozUSIR+f7FZ5/9mcU7EDHjJoaZGe/ZPoHbRfDIgvubYNMmEQEkk5xM+7Asr2ZOBzkW0z
	MgwCzzcXYQSUW5Xid/rJBDontQChMnnN4vuFtGo9igA2TslnYD/4FNP+1Pg5cnLHTcLG9cgwW3Rj6
	STPOK/rQoO4b8AFMYRlVrtWP1xJSs0jbWE2BHl+WRp+mEen6FMSHM9lY7aXPz26TmJQZwmg0EOhk8
	SqgNAVNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4cx-00Fzqs-19; Mon, 07 Nov 2022 16:05:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4cK-00FzY9-SC; Mon, 07 Nov 2022 16:04:58 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BF4CD66028B1;
	Mon,  7 Nov 2022 16:04:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667837095;
	bh=kyJUl4AIfO/bUHE12xVqYeJlBk+GtcwnhEWyl6Ffr50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IOE585/bBs1Urpz+7wizZVDFh28yo+XQgY1LV95IGy7snk4vB2ayP4Kr9Qgip953p
	 1x7+QGeKcKehO/RwmLvWCDGRyfXAhP4RWK0oNu19trya1DW8OXRZTfRn+10yEhd+d0
	 ePdN1Zh74GiBYHnBcHACyueDl5acGdC7SgE4yMfc0k3kJgWmqfdfqbdpyXout9aWxu
	 ZGJMjfGkvvoIZ7FNxcvQ9Q36MseW9Mo4pHfTrKeuQaL69darwdw/27znC0zRJBMvIc
	 Pny7MhxqMz4oV3uBz7U+9VqdKgcrVxCbtTYEtwh+zXeH+JUHRogTzXCXkwcnIPOtF2
	 mR5GPYij1YTgA==
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
Subject: [PATCH 3/9] ASoC: mediatek: mt6797-mt6351: Register to module device table
Date: Mon,  7 Nov 2022 11:04:31 -0500
Message-Id: <20221107160437.740353-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107160437.740353-1-nfraprado@collabora.com>
References: <20221107160437.740353-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_080457_062424_BBFFE949 
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

 sound/soc/mediatek/mt6797/mt6797-mt6351.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt6797/mt6797-mt6351.c b/sound/soc/mediatek/mt6797/mt6797-mt6351.c
index d2f6213a6bfc..784c201b8fd4 100644
--- a/sound/soc/mediatek/mt6797/mt6797-mt6351.c
+++ b/sound/soc/mediatek/mt6797/mt6797-mt6351.c
@@ -242,6 +242,7 @@ static const struct of_device_id mt6797_mt6351_dt_match[] = {
 	{.compatible = "mediatek,mt6797-mt6351-sound",},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mt6797_mt6351_dt_match);
 #endif
 
 static struct platform_driver mt6797_mt6351_driver = {
-- 
2.38.1


