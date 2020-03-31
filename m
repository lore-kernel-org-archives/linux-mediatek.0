Return-Path: <SRS0=zTQl=5Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2086FC43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 04:10:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0C1B20757
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 04:10:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DD97/Y3H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RkYymceH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0C1B20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w2Io7oqM7ErulVCaTM2Lqpi8N2Lw7Ev1VqYfSR2n3Xw=; b=DD97/Y3HAxBAKp
	4eXRjzEnDkdDqqCmCB8XteFPqUnRCXx+CNbCyuGgkaPbEimC/S7/HNYA1i54tyG5Es8I+EgnJlNYX
	rwwbEkHOcsyDbJN2xecNcVqCGl7s7l+0UvJnsCdrIKHjo55Xg2dzAnqO0Ytd1IwBTlRGrc8mscU2U
	iYFQvgmikKqnIn0+Tc3++kS+nwdG0Tn8D/QYJd4JEnt9bsxM0jsQZ0lD8SSE8gGMtje1RfY0VKg2V
	+OYP6YYiX9j2VSIs9u7loKP56k35o9B2QPukKNp4m0YFJKMSlz1TYKiXjUxfoG/gq9eSNVMG4fBTu
	iW6g3izcD3UBx2fAYpvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJ8EM-0007Jq-BA; Tue, 31 Mar 2020 04:10:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ8Bu-0003lo-Id; Tue, 31 Mar 2020 04:07:57 +0000
X-UUID: f61af26c5c994eaea6ee35fda5a8e254-20200330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6cH/NQKcPKqnVf6a6IZggs62m/KD6ANc8osyacauays=; 
 b=RkYymceH5y8wC9hochkfJHq0IFVxYoenjUvKysEHZVQRRWVUdmPxSLKt/gk5RMe7u4BrUxxpnjA916NFu27kf3eHRriCUe2SP5QwnOIwDABjBNbqMKXv8FwUncNX/98WyQ2wibPrl5j5bSPOCiUmZknmAAtZzPQHOC8VcRxk9pc=;
X-UUID: f61af26c5c994eaea6ee35fda5a8e254-20200330
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 791870598; Mon, 30 Mar 2020 20:07:36 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 21:07:46 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Mar 2020 12:07:34 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 31 Mar 2020 12:07:39 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: [PATCH v11 0/5] Add Support for MediaTek PMIC MT6358
Date: Tue, 31 Mar 2020 12:07:32 +0800
Message-ID: <1585627657-3265-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9478A9E60E7CEAB7CD3D185E20460CD264C9B82EE337357E728FF91007D8EDDE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_210754_680769_08592058 
X-CRM114-Status: GOOD (  11.30  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Josef Friedl <josef.friedl@speed.at>,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Frank Wunderlich <frank-w@public-files.de>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-rtc@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, Richard
 Fontana <rfontana@redhat.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, linux-pm@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset including modifying suspend/resume behavior add support to MT6358 PMIC.
MT6358 is the primary PMIC for MT8183 platform.

changes since v10:
- get match data without cast in the rtc driver.
- move MODULE_DEVICE_TABLE to the bottom of the file in the rtc driver.

Hsin-Hsiung Wang (4):
  mfd: mt6397: modify suspend/resume behavior
  dt-bindings: mfd: Add compatible for the MediaTek MT6358 PMIC
  mfd: Add support for the MediaTek MT6358 PMIC
  arm64: dts: mt6358: add PMIC MT6358 related nodes

Ran Bi (1):
  rtc: mt6397: Add support for the MediaTek MT6358 RTC

 Documentation/devicetree/bindings/mfd/mt6397.txt |  14 +-
 arch/arm64/boot/dts/mediatek/mt6358.dtsi         | 358 +++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts      |   1 +
 drivers/mfd/Makefile                             |   2 +-
 drivers/mfd/mt6358-irq.c                         | 236 +++++++++++++++
 drivers/mfd/mt6397-core.c                        |  85 +++---
 drivers/mfd/mt6397-irq.c                         |  33 +++
 drivers/power/reset/mt6323-poweroff.c            |   2 +-
 drivers/rtc/rtc-mt6397.c                         |  23 +-
 include/linux/mfd/mt6358/core.h                  | 158 ++++++++++
 include/linux/mfd/mt6358/registers.h             | 282 ++++++++++++++++++
 include/linux/mfd/mt6397/core.h                  |   5 +
 include/linux/mfd/mt6397/rtc.h                   |   9 +-
 13 files changed, 1163 insertions(+), 45 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6358.dtsi
 create mode 100644 drivers/mfd/mt6358-irq.c
 create mode 100644 include/linux/mfd/mt6358/core.h
 create mode 100644 include/linux/mfd/mt6358/registers.h

-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
