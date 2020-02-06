Return-Path: <SRS0=Uacl=32=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A98FC35247
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 03:09:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C4AA20674
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 03:09:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D0isfvFi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qIsDj2+Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C4AA20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wr4pEuXeBzx8sYQxAU7DmQTQaMmOEg2GAObmyY5I+L0=; b=D0isfvFiIyJsfW
	sxzdeGIUJtXrmRrAbS2Af08BS1zX0CAA5k0zfCfPrLMoaOlJH0XoIHjrbI8QhFK0Lm3pb7jny6i1e
	sIkcSqME31++1biaZJHoj/0/CL4HCi/wNL79omygAsaVC0sqKU/DUeyIRWXgonT6Qqk6ZMK++uNLD
	6X6RcTCy2nJDiwTLWioTDL/KMWiY8qVWTt7aTFTqxPiUETHZhU6EfzNTgEW3pxnh7emV30YU6iYw8
	30dcGz4lHzgZz2gtTME/9gstMch3dvcbJrTrRKxiZ4UnSkBN0R8YjSY552oT/hj+9u/42/7tJgKtR
	9ccWow1s5TSwHDXN6D2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izXXQ-0000hF-Py; Thu, 06 Feb 2020 03:09:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izXWR-00084F-EI; Thu, 06 Feb 2020 03:08:08 +0000
X-UUID: 9fa91f64ac46481db9775202952155cf-20200205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=T7kvNsa0joGaKP0pe9UMwN6WD2P1Rppfsrt81EbaJM0=; 
 b=qIsDj2+Zlo8g2B0Z0HAR8zMyJwSeJrdQirHOiIwmTm1hGA/lezvJ8U0s2dGUiVkxTUMify3v8vTloKAaygKw6QW6jkzO7uH0mZ6IS7xjA2WZBcmTr6FoGD38gnOnPY2K43/NLpOkrypfO2+xIqtciYnpilhcq8iDK8ZE0HA4BNs=;
X-UUID: 9fa91f64ac46481db9775202952155cf-20200205
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <wen.su@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 831069842; Wed, 05 Feb 2020 19:08:03 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Feb 2020 19:06:59 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 6 Feb 2020 11:06:14 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 6 Feb 2020 11:07:18 +0800
From: Wen Su <Wen.Su@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Mark
 Brown" <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 0/4] Add Support for MediaTek PMIC MT6359 Regulator
Date: Thu, 6 Feb 2020 11:06:47 +0800
Message-ID: <1580958411-2478-1-git-send-email-Wen.Su@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_190807_540671_5AB59C3C 
X-CRM114-Status: UNSURE (   7.63  )
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
Cc: Mark
 Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, wen.su@mediatek.com,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset add support to MT6359 PMIC regulator. MT6359 is primary
PMIC for MT6779 platform.

Changes since v2:
- remove open coding in the mt6359 regulator for volt_table type regulators
- refine coding style in the mt6359 regulator to avoid using ternery operator
- remove unnecessary reject operation in mt6359 regulator set mode function


Wen Su (4):
  dt-bindings: regulator: Add document for MT6359 regulator
  mfd: Add for PMIC MT6359 registers definition
  regulator: mt6359: Add support for MT6359 regulator
  arm64: dts: mt6359: add PMIC MT6359 related nodes

 .../bindings/regulator/mt6359-regulator.txt        |  58 ++
 arch/arm64/boot/dts/mediatek/mt6359.dtsi           | 306 +++++++++
 drivers/regulator/Kconfig                          |   9 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/mt6359-regulator.c               | 738 +++++++++++++++++++++
 include/linux/mfd/mt6359/registers.h               | 531 +++++++++++++++
 include/linux/regulator/mt6359-regulator.h         |  58 ++
 7 files changed, 1701 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.txt
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6359.dtsi
 create mode 100644 drivers/regulator/mt6359-regulator.c
 create mode 100644 include/linux/mfd/mt6359/registers.h
 create mode 100644 include/linux/regulator/mt6359-regulator.h

-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
