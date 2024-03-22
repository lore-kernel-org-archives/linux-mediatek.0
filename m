Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D11C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 09:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KkZ3Z99i6MM1qNf1MY18ozx4vqvwPFSl+xf6wWVqJ10=; b=Juz3nk29iFiy6uyJphHEDwiJJ4
	7K9rjjaA/7MR/TnvG+jF2axYzzwO5tvQPGBD0E/b0LCWZUtV3sFG0KM6Fcu6Ni5kChjfKxynx8DyN
	d2wNKpXH9NMs4eANPC+HQOaPxyC4l87gnrIqVmev5KoPyPZ17tu40n0R1b1gvtuIGk5OZw/gIhtQf
	PzMp7LAPueMSvCdnidirb9X9mXyrUJuoto2OaUhTG5ldHMM1omi7EZIGIaUA2pHVPzIQ/15/h1wEo
	osDs2M36Zqmu1IM2reNXz8tkwZa834Mqf36IZzYh7n5IlOWmoSub/FS+FAcKUA7n2S8yqO05qeJNh
	rMqagPNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnbD6-00000006Zxu-4AiQ;
	Fri, 22 Mar 2024 09:29:12 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnbCz-00000006Zu6-3et6;
	Fri, 22 Mar 2024 09:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711099744;
	bh=0NfFN1FxYYtX3onU0k0PdRUebLFtOBg0d8UxrwfqgXU=;
	h=From:To:Cc:Subject:Date:From;
	b=0p9FIKdaxjrot2UBo5UNH+oPfbe9HJC8nSlTqi4OGlA9FURnNiQbFRxrbO9oD2b6r
	 Dr+9oqI2jbDuVTlOxcf9ozXJqczioMWgLwlJhOaEkHdRszN9UfblUoVkswAQB8YdeY
	 KDFY9EtEpsdbN/K9SjU1OaJGQ1E8yTiPvJidwTMg7lB6Q1LNVtt2cshSMJv9pkGkNR
	 iNS7Mrza4KkjavrzK63IGDnQcSPtzaX+BPMKHK/Vr7zwX9ikD8/P8zFhx0Dpd+VTPR
	 tMPnamxb7yKPQ2Zk3SNucyXWHfD0hJ0168orFt5D5sN36CvQKBUsuxCQ/JMO9Q4e1r
	 h600t/+svT0VQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E893437820AC;
	Fri, 22 Mar 2024 09:29:02 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	amergnat@baylibre.com,
	moudy.ho@mediatek.com,
	hverkuil-cisco@xs4all.nl,
	sebastian.fricke@collabora.com,
	u.kleine-koenig@pengutronix.de,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 0/4] Support MediaTek MT8188 Media Data Path 3 (MDP3)
Date: Fri, 22 Mar 2024 10:28:41 +0100
Message-ID: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_022906_239400_8A981EF6 
X-CRM114-Status: UNSURE (   8.31  )
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

This series adds code to support for the MDP3 block found in the
MediaTek MT8188 SoC, including the necessary bits for mtk-mutex
and platform data for the MDP3 driver.

This is mostly compatible with MT8195, with a few differences
"here and there", with the former having less instances of some
of the MDP3 IPs compared to the latter.


AngeloGioacchino Del Regno (4):
  dt-bindings: soc: mediatek: Add support for MT8188 VPPSYS
  soc: mediatek: mtk-mutex: Add support for MT8188 VPPSYS
  dt-bindings: media: mediatek: mdp3: Add support for MT8188 RDMA
  media: platform: mtk-mdp3: Add support for MT8188 MDP3 components

 .../bindings/media/mediatek,mdp3-rdma.yaml    |   1 +
 .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
 .../platform/mediatek/mdp3/mdp_cfg_data.c     | 280 ++++++++++++++++++
 .../platform/mediatek/mdp3/mtk-img-ipi.h      |   1 +
 .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |   1 +
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |   3 +
 drivers/soc/mediatek/mtk-mutex.c              |  41 +++
 7 files changed, 328 insertions(+)

-- 
2.44.0


