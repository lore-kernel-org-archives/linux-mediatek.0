Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F18C4707B
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 10:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2BblJqIytmhhEKYQepmBR2NdT2iQ7zRx4WffuwF4LWM=; b=1XE/vingm4T5cYGnlMiG0mWIEJ
	wH99tqZ6le2eLpkWkvMZg2n1WCaYfBwzZp2BTi7gPzLragkys9h04z7ubmAlYC66gqTLfP7VRzaKi
	Kcg4s+g8Ndo6ThT26pI3OkfwhV0e0sdIj6FHEghUe4Un9mqxA73dBsYH2YhmSjN0HrXWP1r5OA4eO
	IvP5g/wXAs7HdMhzXpERolVfWAVtKrMKOYPCAzBKVjgia++O3KrH7t+R/yMH2nkPpI6PpRD6+bLdC
	l1fUhfjb+pQ5wOOp5gXdcmOitmCt2Jbu8D6tl3jju54Q+LI96eiLTqlcHCPWNF+tkaGV0WKCbKvnJ
	U9fimPjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsgC-00H5rz-0O;
	Thu, 11 Jan 2024 10:52:56 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsg8-00H5oC-0K;
	Thu, 11 Jan 2024 10:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704970370;
	bh=fshr/55h3wT+fevwdGwbnLEUOYH9vCJUJk2ISAPoJYk=;
	h=From:To:Cc:Subject:Date:From;
	b=Xhe1Vp8nV66TBCawvwAjnPaTLzQaQRdebTDUFoyaDaEdR+w7Q6enrQzLbXkJOxWa7
	 1VIqSTYMwjMLwjDtvnYwVkcUwI1l6LTGmCn5Iuy+3shh+mnUV05U1fiImxbTAoJ7px
	 GuuQKFn9e37GJeFxCTusXKaQ8Cw1uOqaDBBBFKtPcKvUqwRqF144BMDZToKUGwTGX3
	 dX9k4KqF+nAWHyqDnDqvpcMYpPBL5SH/3Osznm5XiaC8H929IbbCrlO5UzgpySdOST
	 F57IRWOqWplN9TmWYzEBEHQ5X/y1XBjepO72lrlQwqdPBrjvu8C/JEKP3YK6TGicUS
	 I3XClm5Z+cASA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CDD2237811D1;
	Thu, 11 Jan 2024 10:52:49 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ribalda@chromium.org,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	kuninori.morimoto.gx@renesas.com,
	nfraprado@collabora.com,
	alsa-devel@alsa-project.org,
	trevor.wu@mediatek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/7] ASoC: mediatek: AFE drivers cleanups
Date: Thu, 11 Jan 2024 11:52:40 +0100
Message-ID: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_025252_292953_9CF1900D 
X-CRM114-Status: UNSURE (   5.78  )
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

This series converts MediaTek AFE drivers' probe functions to use
dev_err_probe() and devm functions where possible and, in some
cases, dropping the .remove_new() callback, reducing the size.

Cheers!

AngeloGioacchino Del Regno (7):
  ASoC: mediatek: mt8173-afe-pcm: Convert to devm_pm_runtime_enable()
  ASoC: mediatek: mt8173-afe-pcm: Use devm_snd_soc_register_component()
  ASoC: mediatek: mt8183-afe-pcm: Convert to devm_pm_runtime_enable()
  ASoC: mediatek: mt8183-afe-pcm: Simplify with dev_err_probe()
  ASoC: mediatek: mt8192-afe-pcm: Convert to devm_pm_runtime_enable()
  ASoC: mediatek: mt8192-afe-pcm: Simplify with dev_err_probe()
  ASoC: mediatek: mt8195-afe-pcm: Drop .remove_new() callback

 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c |  78 +++------------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 108 +++++++--------------
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c |  95 ++++++------------
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c |  12 +--
 4 files changed, 81 insertions(+), 212 deletions(-)

-- 
2.43.0


