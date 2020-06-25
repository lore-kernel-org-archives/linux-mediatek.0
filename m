Return-Path: <SRS0=1s7f=AG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEA7C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2020 10:18:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EFB42076E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2020 10:18:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2ss53m1+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EFB42076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hjka2Ck0eX0lacfilZFBwDDFKR7ozQNtTQ1LILfS13o=; b=2ss53m1+zkVWM3qCvJd9hIvWFY
	QRDUddVcY1ST5MBdyncM30gqu2qlbMUnxj9VR+pQeTAkDWPmn6tg8FMV24lPCWAQv6wdr8T9UC+FB
	xiqhNv8TPPFuVVXFxZXkXQKwVFR3A0JEFosAO3tGhIqss9hHxBEHjIpp9sTT3Oq87pTlJetBbd/k6
	b2j3IXr4i2My818w6pukGMHB6X3zbtrRd/6b+kdHpOKMCrSgu31qholaKKwp9CRLnim8PnSSjCYCa
	IoN6+urI2YBnvSZbQ1+f61k8HI3Buc0z3CLRhwTEriGR5sRXVd5DsnkdFcvoWJMX3WLsb6lYqBPPg
	Psz8qC4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joOxO-0000jL-UP; Thu, 25 Jun 2020 10:18:11 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joOxK-0000iO-Al; Thu, 25 Jun 2020 10:18:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 041812A39A1
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] arm64: dts: mediatek: Add support for Lenovo IdeaPad
 Duet Chromebook
Date: Thu, 25 Jun 2020 12:17:50 +0200
Message-Id: <20200625101757.101775-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: erwanaliasr1@gmail.com, drinkcat@chromium.org, devicetree@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Mars Cheng <mars.cheng@mediatek.com>, hsinyi@chromium.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These series adds basic support for the Lenovo IdeaPad Duet Chromebook, a
2-in-1 detachable devices using the MediaTek MT8183 SoC. The first patch
only adds the new compatible names in the mediatek binding. The second
patch, adds the missing compatible to instantiate the PMIC regulators.
The next patch adds missing devices to support better the board and fixes
some warnings found running dtbs_check. And finally, the latest
introduces support for the board itself.

All the patches has been tested on Lenovo IdeaPad Duet Chromebook with
the patches applied on top of 5.8-rc1 and with serial console, booting
without problems and being able to go to the login prompt.

Best regards,
  Enric

Changes in v2:
- Replace cluster-sleepX for cluster-sleep-x (Matthias Brugger)
- [6/7] Move adding #phy-cells to this patch. (Matthias Brugger)
- [7/7] Move adding #phy-cells out of this patch. (Matthias Brugger)

Enric Balletbo i Serra (7):
  dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-krane-sku176
  arm64: dts: mt6358: Add the compatible for the regulators
  arm64: dts: mt8183: Add MediaTek's peripheral configuration controller
  arm64: dts: mt8183: Fix unit name warnings
  arm64: dts: mt8183-evb: Fix unit name warnings
  arm64: dts: mt8183: Add USB3.0 support
  arm64: dts: mt8183: Add krane-sku176 board

 .../devicetree/bindings/arm/mediatek.yaml     |   5 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt6358.dtsi      |   2 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   4 +-
 .../mediatek/mt8183-kukui-krane-sku176.dts    |  18 +
 .../boot/dts/mediatek/mt8183-kukui-krane.dtsi | 343 ++++++++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 788 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  68 +-
 8 files changed, 1225 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi

-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
