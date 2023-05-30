Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40C3C7EE2E
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 07:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QisaqGLclUvzvIsp33u5ki5RZnH3BjrRDEkWgujAE3Q=; b=g+SWwwQrmJgd5YFSJEtkearrb2
	iiHgpz1KWZcYeehv5WDYd2uSJEzDEmBNLrXWqsJmWUUYJjxg0dE91aAKC1f205+hUUWAnVxScFIcL
	RhL8vWnrV2F9Tt5wcmhY44qEZhj8fS33LEvDpqWqVRAA6Lbz93ERgp1zIgUadSe945MdQN+fsTtV4
	BqadpgLIhgjfsWlVk071iPAyeZ/Ptc4/hDQJ7qi2UsR1/Wjr2vyFjKY6aVPkLeKT4Xc6vrdUMF1i0
	twaIBGBX7WlpJFC+rTSlOCByqmUbQ1WiqPnP4lkIyW8jMpQpMn2nGL1SiKNGRw0J10I9YVnRzBXio
	OKSgtnDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tdo-00ChYj-30;
	Tue, 30 May 2023 07:19:36 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tdl-00ChVc-10
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 07:19:35 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3tda-0006UN-Vz; Tue, 30 May 2023 09:19:23 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3tdX-003or8-As; Tue, 30 May 2023 09:19:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3tdW-009OQh-H3; Tue, 30 May 2023 09:19:18 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Minas Harutyunyan <hminas@synopsys.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-arm-msm@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH v2 0/6] usb: Convert to platform remove callback returning void (remaining bits)
Date: Tue, 30 May 2023 09:19:07 +0200
Message-Id: <20230530071913.2192214-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2124; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=w8VLr5gg9MpKTC9YCycRET36XrXSH3CwM63P78lVMiE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkdaNn0SwQSjxYtJxfeHrEoXtLMeSFDUcwcASJz Q5sxk0JeI2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHWjZwAKCRCPgPtYfRL+ TiwYB/902+th/wxDM1fEHoElL6MAPbVZDAHoWnj2tTAcukNFQj2wdNxOzuqXAw8X7XcPvUx+N5T NtZU3QvkNFmLka+QTh0+Ud++cxkvPglHW09q5aFkhqZ7otsgjkglp0pduorbBZmxIqNDX9cZ18h cVn12h3+FiKxsvu4MLWi0JS+HjgNm9+d/QE7Avej5dMFfzbZb8iS0m34n9IV5SgDs7CaTHvhu1m dDzocHYMdhF0FsHxa3v5H1WbxNKEOmCCVTFoyrtPIuAqntA/C89UQKIcALzx9v9DTResYLSy/dT h8Jol0qSLffUwoGpr8jF9D0V4Zh0EcPTdeXpXI/K08ATTuF5
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_001933_350265_AC45F500 
X-CRM114-Status: GOOD (  10.67  )
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

Hello Greg,

Greg applied a big part of the v1 series (which had 97 patches). There
was some fallout however and so this v2 only contains the remaining bits
on top of Greg's tree that has most of v1 already.

I fscked up the xhci-plat patch. So Greg dropped all xhci patches. The
xhci-plat patch included now is obviously a bit different, touching more
files, but in return compiles fine.

Also there were some conflicts with other pending changes in the usb
tree:

 - The dwc2 patch conflicted with commit ada050c69108 ("usb: dwc2: Fix
   some error handling paths"). My v1 submission got an Ack by Minas
   Harutyunyan, I applied it to this serie's v2, too.

 - The xhci-mtk patch is unchanged but gained a Review by
   AngeloGioacchino Del Regno.

 - The qcom-pmic-typec patch confliced with commit a4422ff22142 ("usb:
   typec: qcom: Add Qualcomm PMIC Type-C driver"). I applied the
   received acks/reviews by Konrad Dybcio, Bryan O'Donoghue, and Heikki
   Krogerus anyhow.

Thanks for all the feedback on v1.

Best regards
Uwe

Uwe Kleine-König (6):
  usb: dwc2/platform: Convert to platform remove callback returning void
  usb: xhci-histb: Convert to platform remove callback returning void
  usb: xhci-mtk: Convert to platform remove callback returning void
  usb: xhci-plat: Convert to platform remove callback returning void
  usb: xhci-tegra: Convert to platform remove callback returning void
  usb: typec: qcom-pmic-typec: Convert to platform remove callback
    returning void

 drivers/usb/dwc2/platform.c                   | 6 ++----
 drivers/usb/host/xhci-histb.c                 | 6 ++----
 drivers/usb/host/xhci-mtk.c                   | 6 ++----
 drivers/usb/host/xhci-plat.c                  | 6 ++----
 drivers/usb/host/xhci-plat.h                  | 2 +-
 drivers/usb/host/xhci-rcar.c                  | 6 +++---
 drivers/usb/host/xhci-tegra.c                 | 6 ++----
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 6 ++----
 8 files changed, 16 insertions(+), 28 deletions(-)

base-commit: b4a4be8471846d96b0ac52a0e9e7d48005cc97e2
-- 
2.39.2


