Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB74C2D0B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 06:05:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4146520663
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 06:05:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iuArBGy5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4146520663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ite.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rf71OHMjBzI6L/NTRwahMzAktf/KjkYpZ8Et9PBrFYM=; b=iuArBGy5w9bO1c
	nBx+TzojdKEw/xHBAzfdiW0/oLx+Y/OFOLbCdGO7IDIhnZhcsxA1IuCOCRb5svnl1rlxzk440Xr5F
	YfR/YUyYd9HTWazI3/xtDDwJk6h3jOGFcVFE0WrhiklVQ0F2q6JaI262nPQJHPPm2z5WcqZA7NouX
	dgiY0MwaJPEThcTf7F2NakRgsZiSy3hwr0gv+1T44J2Tu52dDBUZAcUzt6fmm99JStz3bGcYVnj/G
	OULbG3VtTa/bJMXiJ4YdlZaO+bOPiAWPBuN+kySuj3C6adBCLBLYy0dwUsGH2JPZdyNPYm24e8FuC
	dv176O1SeFeV2w35XZUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieYeT-0001S5-H3; Tue, 10 Dec 2019 06:05:41 +0000
Received: from 60-251-196-230.hinet-ip.hinet.net ([60.251.196.230]
 helo=ironport.ite.com.tw)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieYeM-0001Qo-PT; Tue, 10 Dec 2019 06:05:40 +0000
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 10 Dec 2019 14:05:16 +0800
Received: from csbcas.internal.ite.com.tw (csbcas1.internal.ite.com.tw
 [192.168.65.46]) by mse.ite.com.tw with ESMTP id xBA65Cwi017541;
 Tue, 10 Dec 2019 14:05:12 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from allen-VirtualBox.internal.ite.com.tw (192.168.70.14) by
 csbcas1.internal.ite.com.tw (192.168.65.45) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Tue, 10 Dec 2019 14:05:12 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH v5 0/4] IT6505 cover letter
Date: Tue, 10 Dec 2019 13:53:38 +0800
Message-ID: <1575957299-12977-1-git-send-email-allen.chen@ite.com.tw>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.70.14]
X-MAIL: mse.ite.com.tw xBA65Cwi017541
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_220534_957497_EA904B10 
X-CRM114-Status: UNSURE (   6.92  )
X-CRM114-Notice: Please train this message.
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
Cc: Maxime Ripard <mripard@kernel.org>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Heiko Stuebner <heiko@sntech.de>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 Allen Chen <allen.chen@ite.com.tw>, Jonas Karlman <jonas@kwiboo.se>,
 open list <linux-kernel@vger.kernel.org>, "open list:DRM
 DRIVERS" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, "open list:DRM DRIVERS FOR NVIDIA
 TEGRA" <linux-tegra@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Rob Herring <robh@kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The IT6505 is a high-performance DisplayPort 1.1a transmitter, fully compliant
with DisplayPort 1.1a, HDCP 1.3 specifications. The IT6505 supports color depth
of up to 36 bits (12 bits/color) and ensures robust transmission of high-quality
uncompressed video content, along with uncompressed and compressed digital audio
content.

This series contains document bindings, revert commit, add vendor prefix,
Kconfig to control the function enable or not.

Allen Chen (1):
  WIP: drm/bridge: add it6505 driver

allen (3):
  dt-bindings: Add vendor prefix for ITE Tech. Inc.
  Revert "drm/tegra: Move drm_dp_link helpers to Tegra DRM"
  WIP: dt-bindings: Add binding for IT6505.

 .../bindings/display/bridge/ite,it6505.yaml        |   99 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 drivers/gpu/drm/bridge/Kconfig                     |    7 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/ite-it6505.c                | 2753 ++++++++++++++++++++
 drivers/gpu/drm/drm_dp_helper.c                    |  128 +
 drivers/gpu/drm/tegra/Makefile                     |    1 -
 drivers/gpu/drm/tegra/dp.c                         |  876 -------
 drivers/gpu/drm/tegra/dp.h                         |  177 --
 drivers/gpu/drm/tegra/dpaux.c                      |    1 -
 drivers/gpu/drm/tegra/sor.c                        |    1 -
 include/drm/drm_dp_helper.h                        |   16 +
 12 files changed, 3006 insertions(+), 1056 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
 create mode 100644 drivers/gpu/drm/bridge/ite-it6505.c
 delete mode 100644 drivers/gpu/drm/tegra/dp.c
 delete mode 100644 drivers/gpu/drm/tegra/dp.h

-- 
1.9.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
