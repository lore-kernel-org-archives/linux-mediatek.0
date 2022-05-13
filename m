Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0B4C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 16:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yigV51TmVAZxgBrIMWn48aTGV1cAABpCXwSdTpMGGoc=; b=2Qbqt4Gpj5XuTY
	jDFexTZPZ+bSImYHMwnbENhpjmHeQgQp55zp076afsXBL0vxpmsaAyuST5d35TL40QGFkrzLGJAcX
	hZdeqKoUwLFGdUAo5DlcTp2w83mpX8WLS/0eic8SfYKjFvAAVbXVp3aD0JGAfBwOMyGSL4G62KRQC
	3Ot2VgzKKPzjLwHPI4gKGI59sh4eksNbk5u4rEdPjqKiY//GwtwxAnIQMFaZeAP1fz2jZU3EZx5L1
	NraULruTfoxMxOWxsBqsovKZvMZOcD5t3wd4TG1Th5DXrt9yMaGsXpoYEK78W3wExY/y3vxEdDvrD
	P3z0R6d9RtDKDb/68tYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npYVe-00GuY3-Qh; Fri, 13 May 2022 16:51:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npYVI-00GuOP-9t; Fri, 13 May 2022 16:51:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C50451F42289
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652460656;
 bh=+xBBNGyIiNxlh6qLU8iRTsoeX33SDyUBO7XLJdSH9/M=;
 h=From:To:Cc:Subject:Date:From;
 b=Zx2VB73ycSD3mUzLcQJqWOApz3Bvr1a+l5B8r0QHnAL5qfwVcFaavfrux37fkmnyl
 7OumPCp6ZmD5caW0EBMEDKSMHkI7KijmqLHYAQfESCfDU5wsR461rBhNMljydmbhi8
 yx4ltQQ+2pB7x5KG+Rqa9fFi7GJVQnAib5mSQTqwBcCM3wwGUeP5Ts6TIsXSU2L/bt
 0N3y0UCx75DgvLF3pnJe8g+2TvHRHBP6j1yLuB6447fvkEyr2mm/pro9Gt7e7+iLGi
 WXG3tP3v92bxwGtRsCPOS8iGFtvMT8a/OUoOZAzHLA8hdglfx3RDCgaSsRJtHKZsbz
 OptOodXSQvmBA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 y.oudjana@protonmail.com, angelogioacchino.delregno@collabora.com,
 jason-jh.lin@mediatek.com, ck.hu@mediatek.com, fparent@baylibre.com,
 rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
 miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
Subject: [PATCH 0/5] MediaTek Helio X10 MT6795 - Clock drivers
Date: Fri, 13 May 2022 18:50:45 +0200
Message-Id: <20220513165050.500831-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_095100_615402_9A1FA2C9 
X-CRM114-Status: UNSURE (   8.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This (very big) series introduces system clock, multimedia clock drivers
(including resets) for this SoC.

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.


AngeloGioacchino Del Regno (5):
  dt-bindings: mediatek: Document MT6795 system controllers bindings
  dt-bindings: clock: Add MediaTek Helio X10 MT6795 clock bindings
  dt-bindings: reset: Add bindings for MT6795 Helio X10 reset
    controllers
  dt-bindings: arm: mediatek: Add clock driver bindings for MT6795
  clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers

 .../arm/mediatek/mediatek,infracfg.yaml       |   2 +
 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   1 +
 .../arm/mediatek/mediatek,mt6795-clock.yaml   |  67 ++
 .../mediatek/mediatek,mt6795-sys-clock.yaml   |  73 +++
 .../arm/mediatek/mediatek,pericfg.yaml        |   1 +
 .../bindings/clock/mediatek,apmixedsys.yaml   |   1 +
 .../bindings/clock/mediatek,topckgen.yaml     |   1 +
 drivers/clk/mediatek/Kconfig                  |  37 ++
 drivers/clk/mediatek/Makefile                 |   6 +
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c  | 154 +++++
 drivers/clk/mediatek/clk-mt6795-infracfg.c    | 145 +++++
 drivers/clk/mediatek/clk-mt6795-mfg.c         |  47 ++
 drivers/clk/mediatek/clk-mt6795-mm.c          | 103 +++
 drivers/clk/mediatek/clk-mt6795-pericfg.c     | 157 +++++
 drivers/clk/mediatek/clk-mt6795-topckgen.c    | 607 ++++++++++++++++++
 drivers/clk/mediatek/clk-mt6795-vdecsys.c     |  52 ++
 drivers/clk/mediatek/clk-mt6795-vencsys.c     |  46 ++
 include/dt-bindings/clock/mt6795-clk.h        | 275 ++++++++
 include/dt-bindings/reset/mt6795-resets.h     |  50 ++
 19 files changed, 1825 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-sys-clock.yaml
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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
