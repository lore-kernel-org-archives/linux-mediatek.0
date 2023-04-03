Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A82C761A6
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 09:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qjgsSUfM5kUImgXG9EcvXPlVNXj4/8lwmoD3ueT4tZ4=; b=073bLMhlJsnh6Skqe0zisEMzcs
	djIsE5AuczN0ntaqaNz7ALWQAw/T1rN6Sh71U47dUZZmnJZJfxTw8cEZ4hZdSDLj/WNS6vB6N5/X/
	KVsrJ31nytVyMKneymmTznxEbsE+wLLMoFa2TMOsuATeSDdnnfNasW83fbfi8DU+Z/0RSwzWetN/t
	xOcVQ1WlL6kI5xADsEzB6ra69n/g2mDplR2ZZgyKuBPTr8O0sjJVYtGLTn91KPjhxpKZH5riGN4fM
	4rnmz9XchFR0HsznMgL0F54SzV6h5vrExujGg0M6jvykNy1IuCpLc4tZmovQKmKV3KPulH/cOQRcL
	1mC+qvbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGZ0-00EjQ4-2Y;
	Mon, 03 Apr 2023 09:33:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGYt-00EjNl-2e;
	Mon, 03 Apr 2023 09:33:19 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 01843660000F;
	Mon,  3 Apr 2023 10:33:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680514390;
	bh=sJIlxPcofMXE4g+TA9XuXQqChciFnVtsLhBgGsHH7X0=;
	h=From:To:Cc:Subject:Date:From;
	b=oG1QgpQkgYvEvNYOiS69/eroONBerZrbD/v3h9fHlqjcZ2CgeLTZX0Z4thWgbsMqL
	 QoTrmqqwt76a14FmeVGfoC3V5k/RgUf2uONVczJeWZsQHweVm/A2q7fNFYavS5qeat
	 5LfDpDNDtAIAu4+7amlj5dDECjZi1GL1QKlB3DNmmWShWQswPRfbNrqDWeBb+L1Hqz
	 pODs6DZEjSRQcDwPyyv+39EegIAX+sW+sxQLnOlrsQtTkt+1bxKwx+PY0sWmeB5YbJ
	 w73qSgNc/MCAB5Y4eXjw+DGuA7Rhsb9lFMqr2IhFBmU5twYi/S3D4HAGA6v5n6axJq
	 az1iV1na+0Nbw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] soc: mediatek: Kconfig: Add MTK_CMDQ dependency to MTK_MMSYS
Date: Mon,  3 Apr 2023 11:33:04 +0200
Message-Id: <20230403093304.276418-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_023316_010782_E832B097 
X-CRM114-Status: GOOD (  10.79  )
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

The mtk-mmsys and mutex drivers do have a dependency on MTK_CMDQ,
even though both can work with *or* without it: since CMDQ support
can be enabled either as module or as built-in, it is necessary to
add a depends rule in Kconfig, so that we disallow building both
mtk-mmsys and mtk-mutex as built-in if mtk-cmdq-helper is built as
a module, otherwise obvious linker issues appear.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

This has no Fixes tag because the commit that can produce the issue that gets
prevented in this commit is already in the maintainer's tree.

 drivers/soc/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index d6b83a5508ca..a88cf04fc803 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -76,6 +76,7 @@ config MTK_MMSYS
 	tristate "MediaTek MMSYS Support"
 	default ARCH_MEDIATEK
 	depends on HAS_IOMEM
+	depends on MTK_CMDQ || MTK_CMDQ=n
 	help
 	  Say yes here to add support for the MediaTek Multimedia
 	  Subsystem (MMSYS).
-- 
2.40.0


