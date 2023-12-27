Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A6DC46CD4
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Dec 2023 21:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8ucazntuoRNgnVSvJ3raA82ExnonuL+zH/wvYr1CwMc=; b=H6pyBxLIJ+lHAj06epLT+fEHmE
	VEPvYIH+niPtsoaOkykbgFxVRhK2nG4HG3d4bCb/qNXIWr/hoacuKeZ6xWqp9yYadpAz11I8gX+xZ
	jX3af/AaejmyUVIX8vPowoFb5/Pl/Qz+GlbB2Z6V1R6JpVRNPj5PojjmCA4kkasqEI8uLgVK6PVI4
	p3wUIq+YQ0LotKPnEsNtt8IAeCKfqhXl79NZkSQCfD742Z9M5cncmb6BsZ8OPyPwD+xFZQOg6tiTr
	RLptVOYQweK6HCOD2Nqteik2yT+PSn+eApOiG5FO7iM8bQMnGaeb8jOj1l+f8NI5ILKiapODQYuh8
	vNdVxB7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIb3U-00FUzg-0t;
	Wed, 27 Dec 2023 21:03:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIb3P-00FUwt-27
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Dec 2023 21:03:05 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rIb3M-0000le-3j; Wed, 27 Dec 2023 22:03:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rIb3H-001wEi-AR; Wed, 27 Dec 2023 22:02:56 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rIb3I-001ZVE-0o;
	Wed, 27 Dec 2023 22:02:56 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	kernel@pengutronix.de
Subject: [PATCH 00/12] mailbox: Convert to platform remove callback returning void
Date: Wed, 27 Dec 2023 22:02:28 +0100
Message-ID: <cover.1703710628.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=TnloZYpKIYRmaOM4Vyp6tR8nMUztNxQOKpyjV0rpvQ4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBljJDlF5RcQbsMo+jn9Hk4Fn0DGB3DTp1LZRoam 4uXEKKoj2GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZYyQ5QAKCRCPgPtYfRL+ TmefCACxCqozxo0GnqWmhu00tf7kElJNTysNznKKdidgf7fo9mcsJuA7Ck125Ja84llYdplJCvv Dsdgd+ignUqSSvOgP0rhHT1pxzc3t9CgKIvLUZMIwaiFUxnPuGs0iLILF0hhUoUb6JLwyAFJw/W pPtgJ/owxsaEcqXJEcIL+CMDaCWvE8mUTxuY4pmJCm6WMPBEM3f8affobB2FMtJ7qI2crJx7ojl xgvXdsuX9EtOecBbxd/N706v8sAbPO2cSehuoXojKHPV81zg+QhoTYPjdqW75nODS26hacjnboO xL/0decenMphAvdsq/GieTqJqbXlITNBQapQQbyLQwxG+KFY
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_130303_745120_A7E26B83 
X-CRM114-Status: UNSURE (   6.79  )
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

Hello,

this series converts all platform drivers below drivers/mailbox that
make use of .remove() to use .remove_new() instead.

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.
The TL;DR; is to make it harder for driver authors to leak resources
without noticing. The drivers here get it right though and so can be
converted trivially.

This is merge window material. All patches are pairwise independent, so
they can be applied individually.

Best regards
Uwe

Uwe Kleine-König (12):
  mailbox: bcm-flexrm: Convert to platform remove callback returning void
  mailbox: bcm-pdc: Convert to platform remove callback returning void
  mailbox: imx: Convert to platform remove callback returning void
  mailbox: mailbox-test: Convert to platform remove callback returning void
  mailbox: mtk-cmdq: Convert to platform remove callback returning void
  mailbox: omap: Convert to platform remove callback returning void
  mailbox: qcom-apcs-ipc: Convert to platform remove callback returning void
  mailbox: qcom-ipcc: Convert to platform remove callback returning void
  mailbox: stm32-ipcc: Convert to platform remove callback returning void
  mailbox: sun6i-msgbox: Convert to platform remove callback returning void
  mailbox: tegra-hsp: Convert to platform remove callback returning void
  mailbox: zynqmp-ipi: Convert to platform remove callback returning void

 drivers/mailbox/bcm-flexrm-mailbox.c    | 6 ++----
 drivers/mailbox/bcm-pdc-mailbox.c       | 5 ++---
 drivers/mailbox/imx-mailbox.c           | 6 ++----
 drivers/mailbox/mailbox-test.c          | 6 ++----
 drivers/mailbox/mtk-cmdq-mailbox.c      | 5 ++---
 drivers/mailbox/omap-mailbox.c          | 6 ++----
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 6 ++----
 drivers/mailbox/qcom-ipcc.c             | 6 ++----
 drivers/mailbox/stm32-ipcc.c            | 6 ++----
 drivers/mailbox/sun6i-msgbox.c          | 6 ++----
 drivers/mailbox/tegra-hsp.c             | 6 ++----
 drivers/mailbox/zynqmp-ipi-mailbox.c    | 6 ++----
 12 files changed, 24 insertions(+), 46 deletions(-)

base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
-- 
2.43.0


