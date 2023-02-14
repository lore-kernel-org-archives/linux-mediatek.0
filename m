Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2FEC61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 14:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qI5S0iisSO7IQVW9gKBFUmhdyZ0rG/mcsnnZs7bvbps=; b=iydYILKH3Pw7jMsY09tWAJr3DH
	CEV3BpFY8pTGT5pxXGVGNdF6XRh8Zb4JipdSYQRQx2WlwN6Zsr8ROdwa5NQm4+xmjAWWCWt7Odk+m
	5ko6CtiGQ7VG3CBIzDxJEuqTajagf9enSoPFaaGHYcBhv5sksdva9KBchiZI0uHqbc7qb57yX4MyB
	YfAshv+RHMfvxjVFGjCW2OfAlIpo9ReyhW6GXkYx7zJug9KRDnipttF04NUzXBi3PrdgA0bn4qIFa
	0AD2BV+BhnFU5+YnRkzzlopcuiPqVmaXUz7xVQ5qIHRs/bKsYoOmDC5Yb1U/yNK6y7YZJtN3bkmD4
	LBsJ0YGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvsc-001veT-Pq; Tue, 14 Feb 2023 14:01:58 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvZc-001lpl-An; Tue, 14 Feb 2023 13:42:21 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 02D7B6602179;
	Tue, 14 Feb 2023 13:42:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676382139;
	bh=FCq5Bo9iPa8AC39enueVwnHRq2BszhLUWyH5oJeg0OM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iWObgizQ3mW4VoHMOBodGUsb/YPqZ/4c2M82iEv8XCe0Bza9b6RayNyoyJ86Y6ReN
	 s//tj7QtVGe6C32uRTGA8HLoJEMpKAVFTRgi/yHooqzoKhILo0MyDtzIdjezfqE0ao
	 lbMUdPckU92DqoqPrqFN68kxHTvQD0K+0XUcAaAwGrgFB0FykHKkyA4eLc/cDsOHRW
	 Bj3iBxLFcy/+EC5uLkV47JDxVlVcQImbIIPg3tB6Y5pwd1vjz/57mQROHYNa9xwUda
	 Ao4eVqVCseQAZeN88eWt0OAUMaKD2PLYwS9TqluGYMlNVxMz1OIE4BEpiHqj6oo6DJ
	 J/L7mcmQ/ElXw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	daniel@makrotopia.org,
	fparent@baylibre.com,
	msp@baylibre.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	zhaojh329@gmail.com,
	sam.shih@mediatek.com,
	edward-jw.yang@mediatek.com,
	yangyingliang@huawei.com,
	granquet@baylibre.com,
	pablo.sun@mediatek.com,
	sean.wang@mediatek.com,
	chen.zhong@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 28/47] clk: mediatek: mt8516: Allow building clock drivers as modules
Date: Tue, 14 Feb 2023 14:41:08 +0100
Message-Id: <20230214134127.59273-29-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_054220_537448_C1CDC551 
X-CRM114-Status: GOOD (  10.15  )
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

Now that all MT8516 drivers have been converted to platform driver,
change the configuration options to tristate.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 2d14855dd37e..b9c0a9e21cf1 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -743,7 +743,7 @@ config COMMON_CLK_MT8365_VENC
 	  This driver supports MediaTek MT8365 venc clocks.
 
 config COMMON_CLK_MT8516
-	bool "Clock driver for MediaTek MT8516"
+	tristate "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK
@@ -751,7 +751,7 @@ config COMMON_CLK_MT8516
 	  This driver supports MediaTek MT8516 clocks.
 
 config COMMON_CLK_MT8516_AUDSYS
-	bool "Clock driver for MediaTek MT8516 audsys"
+	tristate "Clock driver for MediaTek MT8516 audsys"
 	depends on COMMON_CLK_MT8516
 	help
 	  This driver supports MediaTek MT8516 audsys clocks.
-- 
2.39.1


