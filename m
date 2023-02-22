Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01F6C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 10:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwWgsSoklI8nmLl74zs9Jv7m0cmNuqWf96p5UJ8qazY=; b=QoC65YnUimkCAH4lfQZGtot3dt
	VFyLzMWxPp53qaSZxJ2R2VaBb4gg6wqD0b0sratB9gxWGawlEtrhPKe2Ym1PYRiArXVLiaR6l7lkS
	a66vOQMLHpyCp4oe8kpaVXnV8hxiMNxPLszdMm6QbkgLumZ+LT77KyLs1EfIeMp026aLHP8o3FdaL
	2JLGlqHgWG3/t++XJ2O1cv2G0TSOGEr886rmj+cP19ov6Qg3htKlhriqxqgO5pQrJ5G2A/pSPtH3U
	RrQxOBGd3RxMf07JS8HRYYCpha4EDakM/9XtFdjQ7aub2DFqacakjSmyJI0k6N7zD5lXB1J1irKuI
	ZdgkqpKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlxJ-00BifZ-4F; Wed, 22 Feb 2023 10:02:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlOo-00BQHB-ND; Wed, 22 Feb 2023 09:26:57 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 248A166021E3;
	Wed, 22 Feb 2023 09:26:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677058013;
	bh=imns3KG82DPpClA/4Sp+ZeUEpTdWHVMKbPdKvfquv0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZbblwMO3ht9GGxHUimsfEXVrjXpqgKVJFKwfXt4Mp7ulNtf0HQrZFkgiQOSXdTkMh
	 eivflfr4VCxrK26b0GHFEWw1AggPb3Lha+65JJZkPDVQ5eGs1swYPi3RoF3HdHhrvE
	 tXsSJ+i5Ek9TO1RAR9lHwQ7Lc+cL0Acyr0G9BoDNgPqvoelXUxox5PoYkwmLLrW0fv
	 TDdyukMkv8gXKeBm/E4st+yRIpXtljxnfOW3I5POtVi+e2hNm3Hl+RphsgLunqnALM
	 QxzyQ+Hve/+LU080pOls2F+oNRwDjY9iUJv2d7VAHoDs1x2HWWQNF/h4UBBKcr4vBI
	 D6LbkABsajNUQ==
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
	linux-mediatek@lists.infradead.org
Subject: [PATCH v5 44/54] clk: mediatek: Allow building most MT6765 clock drivers as modules
Date: Wed, 22 Feb 2023 10:25:33 +0100
Message-Id: <20230222092543.19187-45-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
References: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_012655_070048_C287DAB6 
X-CRM114-Status: UNSURE (   7.97  )
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

Most of the MT6765 clock drivers can be built as modules: change them
to tristate to allow that.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index a8c2d4bace9a..a3260675cafc 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -133,79 +133,79 @@ config COMMON_CLK_MT6765
          This driver supports MediaTek MT6765 basic clocks.
 
 config COMMON_CLK_MT6765_AUDIOSYS
-       bool "Clock driver for MediaTek MT6765 audiosys"
+       tristate "Clock driver for MediaTek MT6765 audiosys"
        depends on COMMON_CLK_MT6765
        help
          This driver supports MediaTek MT6765 audiosys clocks.
 
 config COMMON_CLK_MT6765_CAMSYS
-       bool "Clock driver for MediaTek MT6765 camsys"
+       tristate "Clock driver for MediaTek MT6765 camsys"
        depends on COMMON_CLK_MT6765
        help
          This driver supports MediaTek MT6765 camsys clocks.
 
 config COMMON_CLK_MT6765_GCESYS
-       bool "Clock driver for MediaTek MT6765 gcesys"
+       tristate "Clock driver for MediaTek MT6765 gcesys"
        depends on COMMON_CLK_MT6765
        help
          This driver supports MediaTek MT6765 gcesys clocks.
 
 config COMMON_CLK_MT6765_MMSYS
-       bool "Clock driver for MediaTek MT6765 mmsys"
+       tristate "Clock driver for MediaTek MT6765 mmsys"
        depends on COMMON_CLK_MT6765
        help
          This driver supports MediaTek MT6765 mmsys clocks.
 
 config COMMON_CLK_MT6765_IMGSYS
-       bool "Clock driver for MediaTek MT6765 imgsys"
+       tristate "Clock driver for MediaTek MT6765 imgsys"
        depends on COMMON_CLK_MT6765
        help
          This driver supports MediaTek MT6765 imgsys clocks.
 
 config COMMON_CLK_MT6765_VCODECSYS
-       bool "Clock driver for MediaTek MT6765 vcodecsys"
+       tristate "Clock driver for MediaTek MT6765 vcodecsys"
        depends on COMMON_CLK_MT6765
        help
          This driver supports MediaTek MT6765 vcodecsys clocks.
 
 config COMMON_CLK_MT6765_MFGSYS
-       bool "Clock driver for MediaTek MT6765 mfgsys"
+       tristate "Clock driver for MediaTek MT6765 mfgsys"
        depends on COMMON_CLK_MT6765
        help
          This driver supports MediaTek MT6765 mfgsys clocks.
 
 config COMMON_CLK_MT6765_MIPI0ASYS
-       bool "Clock driver for MediaTek MT6765 mipi0asys"
+       tristate "Clock driver for MediaTek MT6765 mipi0asys"
        depends on COMMON_CLK_MT6765
        help
          This driver supports MediaTek MT6765 mipi0asys clocks.
 
 config COMMON_CLK_MT6765_MIPI0BSYS
-       bool "Clock driver for MediaTek MT6765 mipi0bsys"
+       tristate "Clock driver for MediaTek MT6765 mipi0bsys"
        depends on COMMON_CLK_MT6765
        help
          This driver supports MediaTek MT6765 mipi0bsys clocks.
 
 config COMMON_CLK_MT6765_MIPI1ASYS
-       bool "Clock driver for MediaTek MT6765 mipi1asys"
+       tristate "Clock driver for MediaTek MT6765 mipi1asys"
        depends on COMMON_CLK_MT6765
        help
          This driver supports MediaTek MT6765 mipi1asys clocks.
 
 config COMMON_CLK_MT6765_MIPI1BSYS
-       bool "Clock driver for MediaTek MT6765 mipi1bsys"
+       tristate "Clock driver for MediaTek MT6765 mipi1bsys"
        depends on COMMON_CLK_MT6765
        help
          This driver supports MediaTek MT6765 mipi1bsys clocks.
 
 config COMMON_CLK_MT6765_MIPI2ASYS
-       bool "Clock driver for MediaTek MT6765 mipi2asys"
+       tristate "Clock driver for MediaTek MT6765 mipi2asys"
        depends on COMMON_CLK_MT6765
       help
          This driver supports MediaTek MT6765 mipi2asys clocks.
 
 config COMMON_CLK_MT6765_MIPI2BSYS
-       bool "Clock driver for MediaTek MT6765 mipi2bsys"
+       tristate "Clock driver for MediaTek MT6765 mipi2bsys"
        depends on COMMON_CLK_MT6765
        help
          This driver supports MediaTek MT6765 mipi2bsys clocks.
-- 
2.39.2


