Return-Path: <SRS0=0SFh=HJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB254C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 06:24:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C6C364EA1
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 06:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C6C364EA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q7I7E4hV9Z9WTq8I6dryplhlBLc4l+ADhGYSkB8/Y7w=; b=MwbK8+RSwzIXVrPffcaZvxZh/L
	H3EkeA2XW1pdqstotoPd67usaiAmxpQif3toqsB+7RJWEER1JIgsPMS30Cs3m9DLz69bt6lqNsORy
	h2rT4teCh2AGnhvTjpIFUYITRn3RJs0+ohRsLAOg8ZY3fTGeGhINF7t16/ZLiWx4qxlpXB1DlzTij
	fdyaiBn8iQ8Na67iO3/84Lr5TJ6x6P3bt+soEvpiAXke0mRP6ZjfskWwiEFBanx+px56n7iXHsiNR
	Q43dOJ4+dbt2yGYkcfGXXOSU358bGaUggaozhvwp5CLMHMmSnPKpvn5N6JOR0mKzH85SyFBe24b+S
	mXaVfLSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8dUo-0000ha-2s; Sun, 07 Feb 2021 06:24:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8dUl-0000gO-8Y; Sun, 07 Feb 2021 06:24:32 +0000
X-UUID: 70675010b2914bd99ed008167e4c8060-20210206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=JvQwNacy4LhNcy/VG7z2eqjW859QSq74HwCLIeBMTSQ=; 
 b=fz4vChJOqSs+v6kDFuNHbLyEgGR9qq4qlTjjbHH4R9ZOAQX8dBF8ZMGDUcEa71tKBaEWkG8LEIrpWcwMwb/og7qYbkSUIQ8LYFTwc3j1lCG202AZPWjoe5tZom2AC+1hbr1V5HgNvno1p9+iAB7EdmqqrpfGXoWnI2Q7IfriIi0=;
X-UUID: 70675010b2914bd99ed008167e4c8060-20210206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 540964707; Sat, 06 Feb 2021 22:24:22 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 6 Feb 2021 22:14:20 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Feb 2021 14:14:18 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 7 Feb 2021 14:14:19 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 <drinkcat@chromium.org>
Subject: [PATCH v4 0/3] Add support for MT6315 regulator
Date: Sun, 7 Feb 2021 14:14:14 +0800
Message-ID: <1612678457-11548-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_012431_593896_D652E9BC 
X-CRM114-Status: GOOD (  12.72  )
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
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series adds support for MediaTek PMIC MT6315 regulator driver,
which adds MT6315 related buck voltage data to the driver.
This series is based on below patch[1].

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=429385

changes since v3:
- fix the error of binding document.
- refine the mt6315 regulator for better code quality.
- update mt6315 regulator node in the mt8192-evb.dts.

Hsin-Hsiung Wang (3):
  dt-bindings: regulator: document binding for MT6315 regulator
  regulator: mt6315: Add support for MT6315 regulator
  arm64: dts: mt8192: add mt6315 regulator nodes

 .../bindings/regulator/mt6315-regulator.yaml  |  69 ++++
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts   |  46 +++
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6315-regulator.c          | 299 ++++++++++++++++++
 include/linux/regulator/mt6315-regulator.h    |  44 +++
 6 files changed, 469 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
 create mode 100644 drivers/regulator/mt6315-regulator.c
 create mode 100644 include/linux/regulator/mt6315-regulator.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
