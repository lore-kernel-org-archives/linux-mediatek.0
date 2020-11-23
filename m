Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7624C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 03:55:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B6992074B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 03:55:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cEYqPYoS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="F2kuunYl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B6992074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ETXYgTnEuIaFo3o+/bED0EE01hIrPGl2iKWtwRJbUMk=; b=cEYqPYoS4zXprBRLWLUo+nzwFQ
	sHWNaq+d6yAjSNXfwIjqCCq/KpWPX3jYuiRXLZcsBBwTGIyHVECVP/x2lYWuyQu+XaHi4bHuglVTK
	i+uM4NZSI1obBj6zGGJ62yPqAYi17tacHxN1yQXknoNfst8hKG7QH3lqEjZmKIHzJp6mlhkUdcVhK
	MIslndF3yVBIBZQHB2VDqUPwNbJjU6EYGLvWSAZ1UcbfdyNDKsrWV9e0zPeRee0vAYzNB4e5bwYh/
	uqvqaZ/bDxYHo5b7PUjuhMwpK23hnhlq5fVRlTBBrWWu6AV6l3swAEN0lE3Jk2L/+EBaLLBC50Wq3
	BG0LqMhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh2x0-0003TH-2U; Mon, 23 Nov 2020 03:55:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh2ww-0003S9-UG; Mon, 23 Nov 2020 03:55:36 +0000
X-UUID: e84a88ebfd1443b5aed3ad25acf6b7b3-20201122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=lek5VcI/S0RBdMguqGsOnCNeBzxS8lp5GU9Shp0SwF4=; 
 b=F2kuunYlPWwf8MKDsWcaWxg/PqEAap8Of/9lNqPPHMJ/ZuSiaNlLAPGKQZIKrfaqWytaO2g94ZD2QSJp1d/QUVX7qRWdK5ixZQ8x1jaq5qXoNBlCUvfcNTOyvBfsYc8oWtS81pVupy9pXTiwTYfcILAWRfdRE/7erYRXzJroJOw=;
X-UUID: e84a88ebfd1443b5aed3ad25acf6b7b3-20201122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 558308627; Sun, 22 Nov 2020 19:55:13 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 Nov 2020 19:48:26 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Nov 2020 11:48:22 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 Nov 2020 11:48:23 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 0/8] Add Support for MediaTek PMIC MT6359
Date: Mon, 23 Nov 2020 11:48:02 +0800
Message-ID: <1606103290-15034-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_225535_173542_7DEEC053 
X-CRM114-Status: GOOD (  13.83  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset includes refactoring interrupt and adding support to MT6359 PMIC.
This patchset includes refactoring interrupt and adding support to MT6359 PMIC.
MT6359 is the primary PMIC for MT6779 and probably other SOCs.
The series[1] sent by Wen will continue to upstream in this patchset afterwards.
The series[1] sent by Wen will continue to upstream in this patchset afterwards.

The series[1] sent by Wen will continue to upstream in this patchset afterwards.

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=306579

changes since v2:
- update binding document in DT schema format.
- remove unused compatible name.
- update correct registers for VBBCK and VA09.

Hsin-Hsiung Wang (6):
  mfd: mt6358: refine interrupt code
  dt-bindings: mfd: Add compatible for the MediaTek MT6359 PMIC
  dt-bindings: regulator: Add document for MT6359 regulator
  mfd: Add support for the MediaTek MT6359 PMIC
  regulator: mt6359: Set the enable time for LDOs
  regulator: mt6359: Add support for MT6359P regulator

Wen Su (2):
  regulator: mt6359: Add support for MT6359 regulator
  arm64: dts: mt6359: add PMIC MT6359 related nodes

 .../devicetree/bindings/mfd/mt6397.txt        |    8 +-
 .../bindings/regulator/mt6359-regulator.yaml  |  145 +++
 arch/arm64/boot/dts/mediatek/mt6359.dtsi      |  295 +++++
 drivers/mfd/mt6358-irq.c                      |   89 +-
 drivers/mfd/mt6397-core.c                     |   23 +
 drivers/regulator/Kconfig                     |    9 +
 drivers/regulator/Makefile                    |    1 +
 drivers/regulator/mt6359-regulator.c          | 1136 +++++++++++++++++
 include/linux/mfd/mt6358/core.h               |    8 +-
 include/linux/mfd/mt6358/core.h               |    8 +-
 include/linux/mfd/mt6359/core.h               |  133 ++
 include/linux/mfd/mt6359/registers.h          |  529 ++++++++
 include/linux/mfd/mt6359p/registers.h         |  249 ++++
 include/linux/mfd/mt6397/core.h               |    1 +
 include/linux/regulator/mt6359-regulator.h    |   59 +
 14 files changed, 2652 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6359.dtsi
 create mode 100644 drivers/regulator/mt6359-regulator.c
 create mode 100644 include/linux/mfd/mt6359/core.h
 create mode 100644 include/linux/mfd/mt6359/registers.h
 create mode 100644 include/linux/mfd/mt6359p/registers.h
 create mode 100644 include/linux/regulator/mt6359-regulator.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
