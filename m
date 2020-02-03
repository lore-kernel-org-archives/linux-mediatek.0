Return-Path: <SRS0=RqDu=3X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C30C3524D
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Feb 2020 11:41:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4A9820658
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Feb 2020 11:41:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r9wGapAY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LFAfAOsD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4A9820658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jx2Yhm67sODim/G9DSoqvS8EdzIqkYw2W2DVfRU9dQM=; b=r9wGapAYggDBeY
	tGtKQHtsGmjD5K57PJXgyAc5TOIOsZ7MMIEsiOirUVHN4r/ZdnAf20dyXq+1cD3jRg1NmIW5hAKSO
	nwXKSg9wTSsodyO0DNOZNIsQ4/3Eu/qq23f6E40Hn/53n/tFbsLscNdeARXj7+gFrhiBP/QSim2aq
	AwyYdCNG3ZcqbzrXDrhZvKD9Bz9Hb5s9EyqtQ3JfSCFB4WrI7VeNDcuBTc+WC2RJzkGvj4gYClXuE
	JzWm3tVH9P8+zEhpBIn+dyliTZSs3BqsLvfBfdkg8K1tGZq+c+G+Ev00X50gP1PBc4O/qAJ8g/rrk
	b3ceJZTy/K77EhIj+38g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iya6E-0006SB-9T; Mon, 03 Feb 2020 11:41:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iya62-0006HT-VF; Mon, 03 Feb 2020 11:40:56 +0000
X-UUID: 9e2187aff4914012bfc96966be3e88bf-20200203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6UM/Fs5Z+evR9JsRYIgk3anO7LbuI8vYDKCEBnTyXCQ=; 
 b=LFAfAOsDMiU6RdVzNDM0HF5IAzljFpSP3Uz41FSe9aQ4MGUy5njI+K1fhhz0jHhKHF4x9cP5UVACcXGp5ZO7Jn6wJ5hINKTq3v+bKEvqI03D+F9xGoQKVmDj5XEURgW8QNohTeL8dfZADWjBaoJEUh27wmVosIqlPwnma6fBS6U=;
X-UUID: 9e2187aff4914012bfc96966be3e88bf-20200203
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 166155850; Mon, 03 Feb 2020 03:40:49 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 3 Feb 2020 03:41:10 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 3 Feb 2020 19:39:48 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 3 Feb 2020 19:40:29 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v8 0/5] Add Support for MediaTek PMIC MT6358
Date: Mon, 3 Feb 2020 19:40:39 +0800
Message-ID: <1580730044-30501-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_034055_015781_5768FF80 
X-CRM114-Status: UNSURE (   9.42  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro
 Zummo <a.zummo@towertech.it>, Josef Friedl <josef.friedl@speed.at>,
 srv_heupstream@mediatek.com, Frank Wunderlich <frank-w@public-files.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Richard Fontana <rfontana@redhat.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset including modifying suspend/resume behavior add support to MT6358 PMIC.
MT6358 is the primary PMIC for MT8183 platform.

changes since v7:
- refine for better code quality in mfd driver.
- update some error log in mfd driver.
- update the regulator-enable-ramp-delay property of vcamio/vcamd/vcama1/vcama2.
- modify the subject of rtc patch.

Hsin-Hsiung Wang (4):
  mfd: mt6397: modify suspend/resume behavior
  dt-bindings: mfd: Add compatible for the MediaTek MT6358 PMIC
  mfd: Add support for the MediaTek MT6358 PMIC
  arm64: dts: mt6358: add PMIC MT6358 related nodes

Ran Bi (1):
  rtc: mt6397: Add support for the MediaTek MT6358 RTC

 Documentation/devicetree/bindings/mfd/mt6397.txt |  14 +-
 arch/arm64/boot/dts/mediatek/mt6358.dtsi         | 361 +++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts      |   1 +
 drivers/mfd/Makefile                             |   2 +-
 drivers/mfd/mt6358-irq.c                         | 230 +++++++++++++++
 drivers/mfd/mt6397-core.c                        |  85 +++---
 drivers/mfd/mt6397-irq.c                         |  33 +++
 drivers/rtc/rtc-mt6397.c                         |  25 +-
 include/linux/mfd/mt6358/core.h                  | 158 ++++++++++
 include/linux/mfd/mt6358/registers.h             | 282 ++++++++++++++++++
 include/linux/mfd/mt6397/core.h                  |   5 +
 include/linux/mfd/mt6397/rtc.h                   |  16 +-
 12 files changed, 1164 insertions(+), 48 deletions(-)
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
