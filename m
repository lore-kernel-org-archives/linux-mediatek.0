Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43581C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 08:57:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E46E2070A
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 08:57:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JsXXNMi9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oWC/ALzo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E46E2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kKLAVbMbQgzp2bdG8YGdB/HRn1BCyfAfR6rdkF8qJhI=; b=JsXXNMi9nUYJ31tCfG0tl30wIm
	tvq1Up3iAHI8nxC8vswAhzf2Aj2Vz9l/RfGOw9BKz/upt/3QQPiPrRxSxORPfjEtCwVdX1EacIycA
	GUGEji3Fdqih6fmqKDFssu8f7u1slGau2qB+4Ztxp05G6YBlDh63JnSWy6NMeHtWHXEfuNIhhi7AN
	mHpT/ogQObpPAsF9ltsvC6ICAhb3wVPkG3kB5hSH1yAmcrNJKKM27cs9JoXPOP9Bhr+IUYVCYT5jc
	ksGAiScvXRNfZ1xY750gcf4kemd10duVjpx/SSy9hzb5bnUuKrMyv9Gu0yAX0bxFhcDIzWkmaXpAs
	bVOFcsfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2WI0-0003KG-JN; Mon, 03 Aug 2020 08:57:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2WHx-0003II-Gp; Mon, 03 Aug 2020 08:57:46 +0000
X-UUID: 0095d661755644f5ad4c6f043ee64f72-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=vVxk1mPm0UvUElUUsRqFd2ieDTCtTuX+2gn/JyVMCiU=; 
 b=oWC/ALzobzkxun/Oj6gLmEkTd7BTAGZlJaJqRyZUEBhZjSZIJ0EJ/4Cii+gkgakt4VlOkZSZmRwAYyKLVXJBX4pD20URfhj5R6QdePQ7MdJJa/LrQKYpf3nZcIU5zrqvAHXvawzb45DZ6ClF3PhOSKuVhSd5qciLCtSySIu85+0=;
X-UUID: 0095d661755644f5ad4c6f043ee64f72-20200803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 83376054; Mon, 03 Aug 2020 00:57:33 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 01:57:38 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 16:57:35 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 3 Aug 2020 16:57:35 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 0/3] Add support for MT6315 regulator
Date: Mon, 3 Aug 2020 16:57:24 +0800
Message-ID: <1596445047-2975-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_045745_733575_1CB86E7E 
X-CRM114-Status: GOOD (  13.44  )
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
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series add support for MediaTek PMIC MT6315 regulator driver,
which adds MT6315 related buck voltage data to the driver.

Hsin-Hsiung Wang (3):
  spmi: Add driver shutdown support
  regulator: bindings: Add document for MT6315 regulator
  regulator: mt6315: Add support for MT6315 regulator

 .../bindings/regulator/mt6315-regulator.txt        |  45 +++
 drivers/regulator/Kconfig                          |  10 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/mt6315-regulator.c               | 367 +++++++++++++++++++++
 drivers/spmi/spmi.c                                |  12 +
 include/linux/regulator/mt6315-regulator.h         |  45 +++
 include/linux/spmi.h                               |   1 +
 7 files changed, 481 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6315-regulator.txt
 create mode 100644 drivers/regulator/mt6315-regulator.c
 create mode 100644 include/linux/regulator/mt6315-regulator.h

-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
