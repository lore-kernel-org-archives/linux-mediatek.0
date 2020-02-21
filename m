Return-Path: <SRS0=GSZf=4J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A097C11D00
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Feb 2020 02:39:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 290F8207FD
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Feb 2020 02:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k/2tXZRT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Q/dTVQ8g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 290F8207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i4L+lOAPDfbkw901SG0rtRurBnPq8m8WVHnEt2mc7P8=; b=k/2tXZRT32cV9o
	qtd95winocILtlQRe7IPozM+BBSwfOzbcEFqtBkrjzZLwt/1YMEFSgJ9hZEllt43j5k/6HH/73H2g
	5jk1Zu3nYR65DVrFG/Jn7v1cwnstq/m0KxtR6BrLUWMt4ccjThrTkXyAF35IakxepSPbDAYmg7TI9
	ZVUAQRVvU6KFPvV2NaeQLQsapAHyx/nPqMAzntGIcrImQeEqVg049ois2XOJTcLEYVcbz1dXcth8q
	W0fi5DKfsU3jhW7PsmJVzQs2V6qFLJPP0qdSnZEzDwOwM1TK5UrUqLTXfmd2kXlu1KgYqeuBpbtal
	jbv0CcScgDUETEtPOQ3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4yEF-0000wa-4w; Fri, 21 Feb 2020 02:39:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4yDk-0008Qw-Lt; Fri, 21 Feb 2020 02:39:19 +0000
X-UUID: 24bc853c2f614c5ab2810f1bd627dba5-20200220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=RpulXJAZR+NqeOVzsHlHAJYWbww70aOP1WMWbMK1iwg=; 
 b=Q/dTVQ8gci+4AXREWBVM+97+TDTE6Umn7zFhBxUS5Jmb1n83FvUsv+XOlB/SL+qVO395w5NN2U/X6wDOkPjwP4J8iWzWO/xu2e75up/9dTT1NBrIuaBYa+8xfSHL20DWy0ElYiiECqWC6Vgyd7qtjQqHNOanG1VjckLE2CsOL3w=;
X-UUID: 24bc853c2f614c5ab2810f1bd627dba5-20200220
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <wen.su@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1088326686; Thu, 20 Feb 2020 18:39:10 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 20 Feb 2020 18:39:08 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 21 Feb 2020 10:38:17 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 21 Feb 2020 10:38:48 +0800
From: Wen Su <Wen.Su@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Mark
 Brown" <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [RESEND v2 0/4] Add Support for MediaTek PMIC MT6359 Regulator
Date: Fri, 21 Feb 2020 10:39:02 +0800
Message-ID: <1582252746-8149-1-git-send-email-Wen.Su@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_183916_732777_66D98FAB 
X-CRM114-Status: UNSURE (   8.02  )
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


wen.su (4):
  dt-bindings: regulator: Add document for MT6359 regulator
  mfd: Add for PMIC MT6359 registers definition
  regulator: mt6359: Add support for MT6359 regulator
  arm64: dts: mt6359: add PMIC MT6359 related nodes

 .../bindings/regulator/mt6359-regulator.txt        |  59 ++
 arch/arm64/boot/dts/mediatek/mt6359.dtsi           | 312 ++++++++
 drivers/regulator/Kconfig                          |   9 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/mt6359-regulator.c               | 859 +++++++++++++++++++++
 include/linux/mfd/mt6359/registers.h               | 531 +++++++++++++
 include/linux/regulator/mt6359-regulator.h         |  58 ++
 7 files changed, 1829 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.txt
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6359.dtsi
 create mode 100644 drivers/regulator/mt6359-regulator.c
 create mode 100644 include/linux/mfd/mt6359/registers.h
 create mode 100644 include/linux/regulator/mt6359-regulator.h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
