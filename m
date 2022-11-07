Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F91C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 16:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QP3OTi2dbSV3vbyRJGTDvDA/9zVMz4QISeysF+ih6q4=; b=nKaZo7ywBMaYdH8sNdbdqhbACo
	8vcOYxARb4fBAdr42W/DRtNCPZ3J3c3Opm9rfNkel+EDb0jm77/OHBCwpeI+hxnVLQtJQy74Sow/x
	xclmBNUduQj1PD74YxpMQQgFcPpnso3JAPHehW8uxacau3EjAltIZYr3zgdP4wwLuPYDDhZFXMI88
	Rf9GDwg+llQOzeLEsCsW9D+pLIH9rBUysi/1whWZzM2zd1Z5K7YCoJgfA01lWcBr8FZ8sNHwa+cui
	p/Q1zu0w8YVu7+hjUJSDLeNeVTLt8vd5gXKXOT8yvwyjSTbci6ptoqrqh/o5WP4xhq/y9x8FRBeLP
	+YtmgLYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4dF-00G02S-Tc; Mon, 07 Nov 2022 16:05:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4cO-00FzZ1-Ok; Mon, 07 Nov 2022 16:05:02 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 39E5666028CF;
	Mon,  7 Nov 2022 16:04:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667837099;
	bh=6e+FTGnofEIDKPnZbwTaHwcFF/WfbgxLV2zu73jrm6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ko8MDotxBxiWM5iLzn6IsAs0/irCdcBDSsmMnPto0h/bDRHLRk6kjIXjNZM4J2dPh
	 HhxNX/XTVSo4bB8c4H2LchIqFLyi1Hvz35vomiSJk6PYZwThBT1VVQsSxot0bQGfnw
	 L793bSeigogCitsw/HGmuK1OkWMfhp+vO+kIMkd21k0AkW73CN/SDcpoDwdzQsLERQ
	 /zbdYClYadgLzqjjYTVnwupaArcI8v9GlPql5eyyZam8hqeSLOc+FdZKSpoT4NmjcM
	 bZKP3ckLnGiuZSiPUzn9bJ6dFgzsNypnn97MyAAP2fLskY1Rw7NfGa8iyMhQ8vAGrV
	 idxXMVxkXdHMg==
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
	Miaoqian Lin <linmq006@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 4/9] ASoC: mediatek: mt8183-da7219: Register to module device table
Date: Mon,  7 Nov 2022 11:04:32 -0500
Message-Id: <20221107160437.740353-5-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107160437.740353-1-nfraprado@collabora.com>
References: <20221107160437.740353-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_080500_958443_EE095C55 
X-CRM114-Status: GOOD (  11.90  )
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

 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 9f22d3939818..0e572fe28c58 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -842,6 +842,7 @@ static const struct of_device_id mt8183_da7219_max98357_dt_match[] = {
 	},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mt8183_da7219_max98357_dt_match);
 #endif
 
 static struct platform_driver mt8183_da7219_max98357_driver = {
-- 
2.38.1


