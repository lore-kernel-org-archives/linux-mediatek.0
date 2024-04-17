Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3285C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 09:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0VE3u2UFoQtglqqgZiUqxS+yJdVkBFYkduWC47S5xaU=; b=DccrA1oukB05D4t1lV9gEipXAl
	uxC1vUo0LUwZYRwX2XXBHqNK5sZ3qNXT/iGgzqif347CT2StHPq4y2IzHgzbneNQQeE3YT0byOAAi
	KRrePq+t1cnykwqB4Qvr6esAY69uJnIWXNTQ5bCoLGvTeAIwDBFZuwB78Q1yEUNd6VAnMfk4vZHGL
	bOF5vWm7NKe8ed9l9NMV0DpeabJKQonmmxPdRP06gKKLBr+G8dqVAvPCYXrOWRPVw0GdXWBGjepuD
	Kws7L76Af9+m2geGKL5ft9E7oQHBnhC3NLbXA9K9C/g82PXP3OApyuUgde/LIRWUB1vJb5a8EtXDi
	0qPMRVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx1NV-0000000FMae-2pla;
	Wed, 17 Apr 2024 09:14:53 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx1NQ-0000000FMY3-1UxG;
	Wed, 17 Apr 2024 09:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713345286;
	bh=eqBJott6hPgctc1oZBVbJh/Mq8Jhu8Pex58Mgk17ASY=;
	h=From:To:Cc:Subject:Date:From;
	b=Pv5vHMeEtF9qv4COQBqeTEHG7nzSOEmsFrN8yhdEkSNClUZeVTvJCrfEBxLR4mgDx
	 7popDit7WVv5CadsNqBX9QTvfn6KrHY2sToFp3IIZhV7V2jNTpOip1s6kooUcXGvNa
	 wubLvSr4oZ8RPdWjOuoyfSdSDqRKu3Lu3GS5405ScSEniqTq+MSlOCw8LCrmmz6axR
	 gl7P5UixbVUKyPa9hBGPosNvy9zDCa6DqQl2kyNOIv8gl+JdaA+okq5dQkGfNbHgBd
	 l8C1ZoeMfoqJIfwDdBqaUmGPsrasplkp2lcWPKPCqP8sLs8n7buleQSCfG0RhkiUPQ
	 hCXupJnl9DwJw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0E94037813C4;
	Wed, 17 Apr 2024 09:14:45 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: djakov@kernel.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	keescook@chromium.org,
	gustavoars@kernel.org,
	henryc.chen@mediatek.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	amergnat@baylibre.com
Subject: [PATCH v2 0/7] MediaTek DVFSRC Bus Bandwidth and Regulator knobs
Date: Wed, 17 Apr 2024 11:14:35 +0200
Message-ID: <20240417091442.170505-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_021448_582603_36C84136 
X-CRM114-Status: GOOD (  17.85  )
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

Changes in v2:
 - Fixed issues with regulator binding about useless quotes and
   wrong binding path (oops)
 - Removed useless 'items' from DVFSRC main binding
 - Allowed address/size cells to DVFSRC main binding to resolve
   validation issues on the regulator and interconnect bindings
 - Changed dvfsrc node name to `system-controller`, as the DVFSRC
   is actually able to control multiple system components.
 - Added a commit to remove mtk-dvfs-regulator.c before adding the
   new, refactored regulator driver


This series adds support for the MediaTek Dynamic Voltage and Frequency
Scaling Resource Controller (DVFSRC), found on many MediaTek SoCs.

This hardware collects requests from both software and the various remote
processors embededd into the SoC, and decides about a minimum operating
voltage and a minimum DRAM frequency to fulfill those requests, in an
effort to provide the best achievable performance per watt.

Such hardware IP is capable of transparently performing direct register
R/W on all of the DVFSRC-controlled regulators and SoC bandwidth knobs.

Summarizing how the DVFSRC works for Interconnect:

             ICC provider         ICC Nodes
                              ----          ----
             _________       |CPU |   |--- |VPU |
    _____   |         |-----  ----    |     ----
   |     |->|  DRAM   |       ----    |     ----
   |DRAM |->|scheduler|----- |GPU |   |--- |DISP|
   |     |->|  (EMI)  |       ----    |     ----
   |_____|->|_________|---.   -----   |     ----
               /|\         `-|MMSYS|--|--- |VDEC|
                |             -----   |     ----
                |                     |     ----
                | change DRAM freq    |--- |VENC|
             --------                 |     ----
    SMC --> | DVFSRC |                |     ----
             --------                 |--- |IMG |
                                      |     ----
                                      |     ----
                                      |--- |CAM |
                                            ----

...and for regulators, it's simply...
   SMC -> DVFSRC -> Regulator voltage decider -> (vreg) Registers R/W

Please note that this series is based on an old (abandoned) series from
MediaTek [1], and reuses some parts of the code found in that.

Besides, included in this series, there's also a refactoring of the
mtk-dvfsrc-regulator driver, which never got compiled at all, and would
not build anyway because of missing headers and typos: that commit did
not get any Fixes tag because, well, backporting makes no sense at all
as the DVFSRC support - which is critical for that driver to work - is
introduced with *this series*! :-)

P.S.: The DVFSRC regulator is a requirement for the MediaTek UFSHCI
      controller's crypto boost feature, which is already upstream but
      lacking the actual regulator to work....... :-)

[1]: https://lore.kernel.org/all/20210812085846.2628-1-dawei.chien@mediatek.com/

Cheers!
AngeloGioacchino Del Regno (7):
  dt-bindings: regulator: Add bindings for MediaTek DVFSRC Regulators
  dt-bindings: interconnect: Add MediaTek EMI Interconnect bindings
  dt-bindings: soc: mediatek: Add DVFSRC bindings for MT8183 and MT8195
  soc: mediatek: Add MediaTek DVFS Resource Collector (DVFSRC) driver
  regulator: Remove mtk-dvfsrc-regulator.c
  regulator: Add refactored mtk-dvfsrc-regulator driver
  interconnect: mediatek: Add MediaTek MT8183/8195 EMI Interconnect
    driver

 .../interconnect/mediatek,mt8183-emi.yaml     |  76 +++
 .../mediatek,mt6873-dvfsrc-regulator.yaml     |  71 +++
 .../soc/mediatek/mediatek,mt8183-dvfsrc.yaml  |  94 +++
 drivers/interconnect/Kconfig                  |   1 +
 drivers/interconnect/Makefile                 |   1 +
 drivers/interconnect/mediatek/Kconfig         |  32 +
 drivers/interconnect/mediatek/Makefile        |   5 +
 drivers/interconnect/mediatek/icc-emi.c       | 153 +++++
 drivers/interconnect/mediatek/icc-emi.h       |  40 ++
 drivers/interconnect/mediatek/mt8183.c        | 143 +++++
 drivers/interconnect/mediatek/mt8195.c        | 339 +++++++++++
 drivers/regulator/mtk-dvfsrc-regulator.c      | 242 ++++----
 drivers/soc/mediatek/Kconfig                  |  11 +
 drivers/soc/mediatek/Makefile                 |   1 +
 drivers/soc/mediatek/mtk-dvfsrc.c             | 551 ++++++++++++++++++
 .../interconnect/mediatek,mt8183.h            |  23 +
 .../interconnect/mediatek,mt8195.h            |  44 ++
 include/linux/soc/mediatek/dvfsrc.h           |  36 ++
 include/linux/soc/mediatek/mtk_sip_svc.h      |   3 +
 19 files changed, 1736 insertions(+), 130 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
 create mode 100644 drivers/interconnect/mediatek/Kconfig
 create mode 100644 drivers/interconnect/mediatek/Makefile
 create mode 100644 drivers/interconnect/mediatek/icc-emi.c
 create mode 100644 drivers/interconnect/mediatek/icc-emi.h
 create mode 100644 drivers/interconnect/mediatek/mt8183.c
 create mode 100644 drivers/interconnect/mediatek/mt8195.c
 create mode 100644 drivers/soc/mediatek/mtk-dvfsrc.c
 create mode 100644 include/dt-bindings/interconnect/mediatek,mt8183.h
 create mode 100644 include/dt-bindings/interconnect/mediatek,mt8195.h
 create mode 100644 include/linux/soc/mediatek/dvfsrc.h

-- 
2.44.0


