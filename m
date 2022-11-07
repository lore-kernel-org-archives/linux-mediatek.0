Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE31C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 16:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wx8SWdbz+k5jb1277o6RFLvpCgCqwdE9UZAJHsYf44Y=; b=zVweqBVA5qRFvzWltB8zezpN3s
	i/FR2aTUvWxh9pVKzDCn9ArdKY4iYGTLfwjOHG/rAuZSBYGWKC1aXmcPpbkl+xFDH3mxuTLmBEdxH
	lX7KKIsOuQ6p/xh+OP7iciyXx6GiXZvfhVQiXUlTC3VmFnxXzNot421KloJ1GyPyGphCNu6h8Sfjh
	ESq7Pbrq7+m13LAVuabXkEblbIqt9NqkToSOlGntYz5quDwAOft8RkHmqNVYPTfTtP6iw4kqWdCCf
	67sUPe5UgEfvECy0iBncj7hRhugf900mZUtif58+qnwG5rT5Px1PU+Ce9urekj4MKcxtV6WiiWdGC
	+motFr0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4cN-00FzZ0-S0; Mon, 07 Nov 2022 16:04:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4cC-00FzVR-Mu; Mon, 07 Nov 2022 16:04:50 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4336466023A6;
	Mon,  7 Nov 2022 16:04:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667837086;
	bh=Oi0RHcTQN65JIvkiYPMhcF3SS42wYwO3Fdb2TrzpUD4=;
	h=From:To:Cc:Subject:Date:From;
	b=NTlGef0mw3ZejCKzC3iMLReUv53Q7SF3Y8bR0vKyLf6l78aB2ozL6gcg2jcXx+xF7
	 bu7ERg7xqnCGL58kW8yRU27x01mEnV/abUs5ikXzw8u+f8F3JrsRu70g2cXJIkkQ7v
	 sS71xRZrLSKin3gIsWEU5Amk8dgMA36qzp9PuuTMhDqGb+EwHBz95ZV8vpJdXc58MN
	 gulSazNAdzLPMn4vSPmjV1N0L4WM0Flip8UGGh0w/K1WElgMIkPqmGYC2RNi5Rcte1
	 vrPBqhAZMkCVnPw0GwoGYb5zHAnWo9XGfdcnmFssWktOghvII9o7vnD/8DXDLhBqfv
	 LPag6tKbpaDyw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	alsa-devel@alsa-project.org,
	"chunxu.li" <chunxu.li@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/9] ASoC: mediatek: Register machine drivers to module device table
Date: Mon,  7 Nov 2022 11:04:28 -0500
Message-Id: <20221107160437.740353-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_080448_975789_9CACC4E1 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
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


Some ASoC machine drivers for MediaTek platforms were not being
registered to the module device table, preventing them to be
automatically loaded when built as modules. This series adds the missing
registration to the drivers.


Nícolas F. R. A. Prado (9):
  ASoC: mediatek: mt2701-cs42448: Register to module device table
  ASoC: mediatek: mt2701-wm8960: Register to module device table
  ASoC: mediatek: mt6797-mt6351: Register to module device table
  ASoC: mediatek: mt8183-da7219: Register to module device table
  ASoC: mediatek: mt8183-mt6358: Register to module device table
  ASoC: mediatek: mt8186-da7219: Register to module device table
  ASoC: mediatek: mt8186-rt5682: Register to module device table
  ASoC: mediatek: mt8192-mt6359: Register to module device table
  ASoC: mediatek: mt8195-mt6359: Register to module device table

 sound/soc/mediatek/mt2701/mt2701-cs42448.c                 | 1 +
 sound/soc/mediatek/mt2701/mt2701-wm8960.c                  | 1 +
 sound/soc/mediatek/mt6797/mt6797-mt6351.c                  | 1 +
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c         | 1 +
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 1 +
 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c  | 1 +
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c   | 1 +
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c    | 1 +
 sound/soc/mediatek/mt8195/mt8195-mt6359.c                  | 1 +
 9 files changed, 9 insertions(+)

-- 
2.38.1


