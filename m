Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BDEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 09:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K66IhwI06I8VNNRjyicgtlsimNusMO1dSitgU4+So5s=; b=R3Da5TikDn0890EKHVgpLCVwHl
	Wace0iELPT2kksgjjeCGeW69I6OxQZcAzjEjx3A0PCpmhLcVfuCWYlcbYnaeQA69U4+E/8IKEDEOj
	kJopRVQAgrw4nbMD9bFsiXe19u5oECz+35KjHtsp/0o7VGt4065nLWMh9NZ9W3k1TVIkATsCFpYip
	Ya26mzDJfuK3XgfvzVbur3hMlTwSqYY6NEGYUp+Z/v/EcSaDzVGy3wAtEtDR08dicrhlo2LflqPEs
	hMXZ7u+xcI8U35f9WdERc3FWJdllVEXZxE+vt8z7N61+nCHvlE7XkOnROugI5XdDLBR7G9yxRtR63
	s4bBuiDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4fjW-001S8s-O2; Fri, 24 Jun 2022 09:36:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4fiv-001Rqa-Dk; Fri, 24 Jun 2022 09:35:35 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4089066017FA;
	Fri, 24 Jun 2022 10:35:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656063331;
	bh=A9xe/sGqzmkRfQhZtK9jRoIxN0wnfqZ56lwtoZGUlJc=;
	h=From:To:Cc:Subject:Date:From;
	b=Gd7ZBDvG6QevmoMb3wGI2/By8ED74CVS3Q354nLN+R9byrCt6Yfga7mRRq4SKcGQd
	 0sr4odCctpOAx4W03U9o+xW2f4oduV4xtE6QnxdR+DDNm97mK/PhI8GTc5Y23Vxwmb
	 Q+HyD6HJoKbRzHITHaDU5r90/Z0r5K4rIaliMGEQ/GaPstYBET0ZnDskvtPYQcQl2b
	 geDQRigu2B9TTIU4JEaDTIqoFAwNM948WqIeMOsf9j8hLUvMmuERMSPI7St8Lez3r1
	 4JNPw+QYKRB04VKLSh8FNF4+dYVK9JruWMDRrWdVwhf+gVrNoYGc2sXHmjGaBxj6+4
	 Zywmgd/prNigA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	y.oudjana@protonmail.com,
	angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com,
	ck.hu@mediatek.com,
	fparent@baylibre.com,
	rex-bc.chen@mediatek.com,
	tinghan.shen@mediatek.com,
	chun-jie.chen@mediatek.com,
	weiyi.lu@mediatek.com,
	ikjn@chromium.org,
	miles.chen@mediatek.com,
	sam.shih@mediatek.com,
	wenst@chromium.org,
	bgolaszewski@baylibre.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	paul.bouchara@somainline.org,
	kernel@collabora.com
Subject: [PATCH v3 0/7] MediaTek Helio X10 MT6795 - Clock drivers
Date: Fri, 24 Jun 2022 11:35:18 +0200
Message-Id: <20220624093525.243077-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_023533_817112_36406A51 
X-CRM114-Status: GOOD (  10.20  )
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

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This (very big) series introduces system clock, multimedia clock drivers
(including resets) for this SoC.

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.

This series depends on, and can be merged on top of:
[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=640122
[2]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=637849

Changes in v3:
 - Fixed typo in commit [4/7]

Changes in v2:
 - Fixed yaml clock bindings as per Rob's review
 - Added ability to compile all MT6795 clock drivers as modules
 - Added commits to export some symbols, required to compile as module

AngeloGioacchino Del Regno (7):
  dt-bindings: mediatek: Document MT6795 system controllers bindings
  dt-bindings: clock: Add MediaTek Helio X10 MT6795 clock bindings
  dt-bindings: reset: Add bindings for MT6795 Helio X10 reset
    controllers
  dt-bindings: clock: mediatek: Add clock driver bindings for MT6795
  clk: mediatek: clk-apmixed: Remove unneeded __init annotation
  clk: mediatek: Export required symbols to compile clk drivers as
    module
  clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers

 .../arm/mediatek/mediatek,infracfg.yaml       |   2 +
 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   1 +
 .../arm/mediatek/mediatek,pericfg.yaml        |   1 +
 .../bindings/clock/mediatek,apmixedsys.yaml   |   1 +
 .../bindings/clock/mediatek,mt6795-clock.yaml |  66 ++
 .../clock/mediatek,mt6795-sys-clock.yaml      |  74 +++
 .../bindings/clock/mediatek,topckgen.yaml     |   1 +
 drivers/clk/mediatek/Kconfig                  |  37 ++
 drivers/clk/mediatek/Makefile                 |   6 +
 drivers/clk/mediatek/clk-apmixed.c            |   3 +-
 drivers/clk/mediatek/clk-cpumux.c             |   2 +
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c  | 157 +++++
 drivers/clk/mediatek/clk-mt6795-infracfg.c    | 148 +++++
 drivers/clk/mediatek/clk-mt6795-mfg.c         |  50 ++
 drivers/clk/mediatek/clk-mt6795-mm.c          | 106 +++
 drivers/clk/mediatek/clk-mt6795-pericfg.c     | 160 +++++
 drivers/clk/mediatek/clk-mt6795-topckgen.c    | 610 ++++++++++++++++++
 drivers/clk/mediatek/clk-mt6795-vdecsys.c     |  55 ++
 drivers/clk/mediatek/clk-mt6795-vencsys.c     |  50 ++
 drivers/clk/mediatek/clk-mtk.c                |   2 +
 drivers/clk/mediatek/reset.c                  |   1 +
 include/dt-bindings/clock/mt6795-clk.h        | 275 ++++++++
 include/dt-bindings/reset/mt6795-resets.h     |  50 ++
 23 files changed, 1857 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt6795-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt6795-infracfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt6795-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt6795-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt6795-pericfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt6795-topckgen.c
 create mode 100644 drivers/clk/mediatek/clk-mt6795-vdecsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt6795-vencsys.c
 create mode 100644 include/dt-bindings/clock/mt6795-clk.h
 create mode 100644 include/dt-bindings/reset/mt6795-resets.h

-- 
2.35.1


