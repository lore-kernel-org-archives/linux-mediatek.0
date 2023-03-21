Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CF5C6FD20
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 19:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sTFP7rFj7PoQYIQqVLl29eI1F69PKp3dt2RLflziUnU=; b=Q8yFaGI252uXwhpF0dHRDy7rrE
	PBpe69IaxIj9LQYKz5PohWIFbNoweJ6IfssQjmGZgKwJ169PxrftugDmCybS2/N5trYFNjSHCvlXz
	2Xr9x+CiP+7Xa1rtDkjyZTP/wiEUR20Eh9LnUPqz4OEODt6NIloC2a/3UO5RNVQHSfFXO5mPmjc1z
	w/Kse+d9Eitdz1ORVrTbb40jX82x+GG6iNDPaBr+IzEMkfpz77me1N9e7D1iauBqBTBhlbqYY1R6B
	fQcQIzgCzC+lT1ujSeIynE1UWaS0eK0UEXmW2zDYX4L36N1bN1Pi9eQyCxwkTSlUdYrynIfQOv30C
	2y4X0eqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pehlG-00DWBy-1V;
	Tue, 21 Mar 2023 19:35:10 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pehlC-00DW93-1u
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Mar 2023 19:35:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pehiZ-0008Dw-NB; Tue, 21 Mar 2023 20:32:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pehiT-005l5h-9t; Tue, 21 Mar 2023 20:32:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pehiS-006qxf-Je; Tue, 21 Mar 2023 20:32:16 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Joyce Ooi <joyce.ooi@intel.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tom Joseph <tjoseph@cadence.com>,
	Shawn Guo <shawn.guo@linaro.org>,
	Rahul Tanwar <rtanwar@maxlinear.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Vidya Sagar <vidyas@nvidia.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Miaoqian Lin <linmq006@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Toan Le <toan@os.amperecomputing.com>
Cc: Rob Herring <robh@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 00/15] PCI: Convert to platform remove callback returning void
Date: Tue, 21 Mar 2023 20:31:53 +0100
Message-Id: <20230321193208.366561-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3608; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=R+5LbNfI6fKiy6X0dtpgsEo+8R1pdW2pwTWUMnz3+QQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGgYLRsLzqyEbvu3VAJNJ+oXLpkkATksJ+mhRk m2Azv/YPFyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBoGCwAKCRCPgPtYfRL+ ThmBB/4usOcusxcKm8bzqeDny7jlfyp6JXzDfI5d0+YR6TSbJQflwlOnBkyQvAFNtJzQwgGNu2D BJlqgjGe3xEtIGOU2r4rKY7m+y9u41GugRRXvrsjdNtsPIkTWEw4cjJXoR/TSd2qZb8ZuOE3sjB uNQr8PE0KhtjpplR2zAlse3jtykoQxhN/qYXuZzOTWZFWyT8p0RORCGszYX5Z471/MdAqLXjkhv HoRLxiX1jiwJhmZZvqd03sOeXhk6rfiO5throSaEY8q4/q2UYdsLPsQhFmXbUjMuqBaoEMMqnsP wOUSbpoxpW4Bka12AJYEvNLE8GnI7lHsJPR3jpsh74MlG9iq
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_123506_701086_39277A8B 
X-CRM114-Status: GOOD (  11.91  )
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

this series adapts the platform drivers below drivers/pci to use the
.remove_new() callback. Compared to the traditional .remove() callback
.remove_new() returns no value. This is a good thing because the driver core
doesn't (and cannot) cope for errors during remove. The only effect of a
non-zero return value in .remove() is that the driver core emits a warning. The
device is removed anyhow and an early return from .remove() usually yields a
resource leak.

By changing the remove callback to return void driver authors cannot
reasonably assume any more that there is some kind of cleanup later.

All drivers were easy to convert as they all returned zero in their
remove callback. Only for iproc the conversion wasn't trivial, the other
were converted using coccinelle.

There are no interdependencies between these patches. So even if there
are some concerns for individual patches, I ask you to apply the
remaining set. Then I only have to care for the review feedback of the
refused patches. (Having said that I don't expect any serious objection,
just things like squashing or separating patches, or maybe I picked a
wrong subject prefix.)

Best regards
Uwe

Uwe Kleine-König (15):
  PCI: aardvark: Convert to platform remove callback returning void
  PCI: altera: Convert to platform remove callback returning void
  PCI: altera-msi: Convert to platform remove callback returning void
  PCI: brcmstb: Convert to platform remove callback returning void
  PCI: cadence/j721e: Convert to platform remove callback returning void
  PCI: dwc/*: Convert to platform remove callback returning void
  PCI: hisi-error: Convert to platform remove callback returning void
  PCI: iproc: Convert to platform remove callback returning void
  PCI: mediatek: Convert to platform remove callback returning void
  PCI: mediatek-gen3: Convert to platform remove callback returning void
  PCI: mt7621: Convert to platform remove callback returning void
  PCI: mvebu: Convert to platform remove callback returning void
  PCI: rockchip-host: Convert to platform remove callback returning void
  PCI: tegra: Convert to platform remove callback returning void
  PCI: xgene-msi: Convert to platform remove callback returning void

 drivers/pci/controller/cadence/pci-j721e.c   | 6 ++----
 drivers/pci/controller/dwc/pcie-bt1.c        | 6 ++----
 drivers/pci/controller/dwc/pcie-histb.c      | 6 ++----
 drivers/pci/controller/dwc/pcie-intel-gw.c   | 6 ++----
 drivers/pci/controller/dwc/pcie-qcom-ep.c    | 8 +++-----
 drivers/pci/controller/dwc/pcie-tegra194.c   | 8 +++-----
 drivers/pci/controller/pci-aardvark.c        | 6 ++----
 drivers/pci/controller/pci-mvebu.c           | 6 ++----
 drivers/pci/controller/pci-tegra.c           | 6 ++----
 drivers/pci/controller/pci-xgene-msi.c       | 6 ++----
 drivers/pci/controller/pcie-altera-msi.c     | 5 ++---
 drivers/pci/controller/pcie-altera.c         | 6 ++----
 drivers/pci/controller/pcie-brcmstb.c        | 6 ++----
 drivers/pci/controller/pcie-hisi-error.c     | 6 ++----
 drivers/pci/controller/pcie-iproc-platform.c | 6 +++---
 drivers/pci/controller/pcie-iproc.c          | 4 +---
 drivers/pci/controller/pcie-iproc.h          | 2 +-
 drivers/pci/controller/pcie-mediatek-gen3.c  | 6 ++----
 drivers/pci/controller/pcie-mediatek.c       | 6 ++----
 drivers/pci/controller/pcie-mt7621.c         | 6 ++----
 drivers/pci/controller/pcie-rockchip-host.c  | 6 ++----
 21 files changed, 43 insertions(+), 80 deletions(-)

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2


