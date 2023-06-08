Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9AAC7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WasakgFYGOLbX2Qu0yCeuA6tv6X+DAASxMvVKVDJF54=; b=CoXVA1QMGyChDg8+sxG7TmUMj3
	UbQVVECHdXn/+Ohopf5bPyDEmHGrsE0JVujzYBu2eFUGZ3F91gdtgdyDAC4pvOo261xMIFnRO99a0
	48YjNGP6lhskE/EnY0/WcOemHWhJBEsANhbO75uqfsMGSxpZEQKCL4SNDotg4sdrtW0ErYek6y9/d
	9y0eVqbDhIOXcWM01UjO5aFQ9ou/t8W5c535Rv6VAhEIC2dk6IKHxLlkFHlOL/KA0TB/wOZpqX4oi
	5zYVPM4doZPQQouts31mvGmsGRPduqNrIO58jYvJoUopx6aitEdhGwE3Oq/AeFeGS6pC4DMWHRk07
	L6U8tnuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7BJ3-008a2D-2f;
	Thu, 08 Jun 2023 08:47:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7BIy-008Zv1-3B;
	Thu, 08 Jun 2023 08:47:42 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5548A66058B2;
	Thu,  8 Jun 2023 09:47:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686214056;
	bh=/eSnfxogbScGlNOOjeGiLsCkqg34znU4OI0UheFc0FI=;
	h=From:To:Cc:Subject:Date:From;
	b=JZVCfEXagXlNeJVB5syTmC2EN4+t98xcDijANVzj/YBw8siGAZ1IY9sHCDYfqBQLQ
	 onm1CV/QH2vC8VYFasLlfK9UUGYCkDLw7gTsKUNEVP2pa51/q4mTa+1Dajk7UvLU6+
	 s2TSj6I6LbY8POa1PKywP57ol/mWO3T+YDtypzdjGhMg7ytJmWV5jQfW1yOWYK9ZSf
	 ABp4ym3RTVWSzre1o8uNiQVxX6rJQ7ctE606ISvTSRvp2BAP+GrFoMmSE87o17qQgS
	 zUnhtW2umIK1+2ZK7sZa/OEFeUnwcxwgx9414TPXOBoFwkcgXdTWPnQQmUAchmlwuM
	 JyxuANLoP+Tlg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	trevor.wu@mediatek.com,
	amergnat@baylibre.com,
	dan.carpenter@linaro.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 0/5] ASoC: mt8188-mt6359: Cleanups
Date: Thu,  8 Jun 2023 10:47:22 +0200
Message-Id: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_014741_172217_ED834021 
X-CRM114-Status: UNSURE (   5.69  )
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

This series performs some cleanups to the mt8188-mt6359 driver,
including usage of bitfield macros, adding definitions of register
fields and some others for readability and consistency.

AngeloGioacchino Del Regno (4):
  ASoC: mediatek: mt8188-mt6359: Compress of_device_id entries
  ASoC: mediatek: mt8188-mt6359: Cleanup return 0 disguised as return
    ret
  ASoC: mediatek: mt8188-mt6359: Clean up log levels
  ASoC: mediatek: mt8188-mt6359: Use bitfield macros for registers

Dan Carpenter (1):
  ASoC: mediatek: mt8188-mt6359: clean up a return in codec_init

 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 87 ++++++++++++-----------
 1 file changed, 45 insertions(+), 42 deletions(-)

-- 
2.40.1


