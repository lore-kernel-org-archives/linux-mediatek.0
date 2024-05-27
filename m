Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B1DC25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 09:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=favHe4gwT19Vga8Q009I/NtR8rDsu5BVhwZh+2h48n8=; b=PeZrc5Nrt1BLtuMk7v4zGJ4lV3
	Fytyykr0gxu/fx9+S87zgLtPKrAtclwHGKa+1DNZcyv809O6DjquTp6aD5yszpcQ4qBCztmeO/I3s
	ugopZof6NphBXIX1cVQGq8i5eUjY9GKSO3h+7hpA/JcFunzCXu+/zS2PiXNa8KCtnNxccXL/wHMZY
	P8vxY60S21FmRkBYn1/LGdVzMRoQv+vQaPjTtu/A+dTlSVA12Q47NtHLK0P8VnR/+rm4Iqxah3syK
	NGyA40PdRs6FKssDMJ2p2mVhTWs+pPdG+LobnyKlDXnQOAkAgIOFrIVd6NLr1Lacd82niXdEIDESY
	O8oJxhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWp4-0000000ESdk-2fd7;
	Mon, 27 May 2024 09:39:18 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWoz-0000000ESZW-2gPu;
	Mon, 27 May 2024 09:39:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716802751;
	bh=phWrTw+karsjUzSg7kcqChr4IdJshL4HbQ9zmQkn4Qk=;
	h=From:To:Cc:Subject:Date:From;
	b=KmZI87EKdwsteVx5VwSdvILvBracIrFrCTLUXucUpWp5B8zeZOvElhuJ4qjMyXNbo
	 J0pozHh2KKNF93/orrsz9CapK9KRxsbKChlvWuD7rBsgvKkxTpNGwT3MSkQXLYLXWT
	 PIxb0hewTe6muqjZwQt5nULsisMGzK7LVqLKaF5dVVWaYHMLcf4+OLYk4UpArg9Ai0
	 TT2lB9gpFNWJ2gZF1LjFHuZOSkmqv8kHVuesPKJuHffEcwNY54h8snfcJa/IRrIORl
	 QjGBXNK9UO6yv3lZbag/0m37jiB8Ty4r0vJWFf7687uUxy70YloAXauKJASQ3/72+7
	 iI0j7MeYigTug==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B90B53782065;
	Mon, 27 May 2024 09:39:10 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	mandyjh.liu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	jpanis@baylibre.com
Subject: [PATCH 0/5] Support for MT8188 power domains, gpu, gce, vdo
Date: Mon, 27 May 2024 11:39:03 +0200
Message-ID: <20240527093908.97574-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_023913_857762_E9F50C5B 
X-CRM114-Status: UNSURE (   8.02  )
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

This series adds power domains, basic VDOSYS nodes and GCE Mailboxes
to finally be able to add the GPU node, which is needed to get the
thermal nodes complete, unblocking that series.

Please note that the IMG_VCORE power domains were omitted, as those
need some more (driver side) love to actually work... and adding them
right now would most likely break basic boot.

For the GPU, this series depends on [1].

Cheers!

[1]: https://lore.kernel.org/lkml/20240527092513.91385-1-angelogioacchino.delregno@collabora.com

AngeloGioacchino Del Regno (5):
  dt-bindings: mfd: mediatek,mt8195-scpsys: Add support for MT8188
  arm64: dts: mediatek: mt8188: Add Global Command Engine mailboxes
  arm64: dts: mediatek: mt8188: Add VDOSYS0/1 support for multimedia
  arm64: dts: mediatek: mt8188: Add support for SoC power domains
  arm64: dts: mediatek: mt8188: Add support for Mali GPU on Panfrost

 .../bindings/mfd/mediatek,mt8195-scpsys.yaml  |   1 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 480 ++++++++++++++++++
 2 files changed, 481 insertions(+)

-- 
2.45.1


