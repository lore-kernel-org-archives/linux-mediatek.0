Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B761C4742C
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 09:22:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A21E20663
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 09:22:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rpz7X7TA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cBX0BWv/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A21E20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d1tdnwlPMMe/jSQI/Mx5KOPhiWErgH7YxQVJ3bJbNO0=; b=rpz7X7TAYIaKA4uEyYHt3e/SwX
	fxj5x4SkDVfte6jGAahSxum2SQiD61wCVRs/hclKI5atV3a0ay+kUo6g5MFeisPmH/psuP9Opded1
	t/GqFleA9K2clgqxhn4vVtIeAQBHfLfYSo/JwmRwnri3vsWyN998iyNxh2bZBM7NMSN985sJRNUL8
	fFm2XesGjlGarOR3hTuQUQDPkS69qM9qKFZCNrbYndKi1YxH82/+W/B5ZNpF+gHOdvkIFRYS3FKWX
	keE9LNzyL7YeScR0ZooST4Euz6hdJME7wPu/1DB6BEguI3Juc77B1HHMv2tNGJipiWea9VF28hx3W
	rO6ZOI8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYQc5-0006vN-Qg; Fri, 30 Oct 2020 09:22:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYQc3-0006uV-Pr; Fri, 30 Oct 2020 09:22:24 +0000
X-UUID: ff81dac276a44bd18601dbf830b719b1-20201030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=K5V31xXaT/tsnSWsgwrn41aFfqWokiL6hIHcHbvcD1M=; 
 b=cBX0BWv/rKSIXBO/256zH2ssZc0MhalDgmejsftWSVZIZDI/WP73Lk1NuLmkW6NheGibFLtvJXQ6quZaBxvsR16zM72mx+WrVwv7fDx2FT4O1JEVU2+jRqyS4WwestC28OM9oY1K1FDJx6pSv2ygI2RF7pP+2BfRpYDu22qI1/U=;
X-UUID: ff81dac276a44bd18601dbf830b719b1-20201030
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2019987047; Fri, 30 Oct 2020 01:22:15 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Oct 2020 02:22:12 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Oct 2020 17:22:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 30 Oct 2020 17:22:12 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v6 0/1] Add basic node support for Mediatek MT8192 SoC
Date: Fri, 30 Oct 2020 17:22:06 +0800
Message-ID: <20201030092207.26488-1-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_052223_978609_6AFB7F35 
X-CRM114-Status: GOOD (  14.47  )
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
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


MT8192 is a SoC based on 64bit ARMv8 architecture.
It contains 4 CA55 and 4 CA76 cores.
MT8192 share many HW IP with MT65xx series.
This patchset was tested on MT8192 evaluation board to shell.

Based on v5.10-rc1

Change in v6:
1. Remove including mt8192-clk.h
2. Use clk26m for spi clock

Change in v5:
1. Remove watchdog and all syscon nodes
2. Use clk26m for uart clock
3. Remove the dependency list

Change in v4:
1. Remove scpsys, spmi and apu nodes
2. Add i2c nodes
3. Update watchdog binding
4. Update dependency list

Change in v3:
Fix typo in binding document of timer

Change in v2:
1. Remove mt8192-power.h from mt8192.dtsi which is not used yet
2. Add timer binding document and device tree node in mt8192.dtsi
3. Remove watchdog driver modification

Seiya Wang (1):
  arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and
    Makefile

 arch/arm64/boot/dts/mediatek/Makefile       |   1 +
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts |  29 ++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi    | 512 ++++++++++++++++++++++++++++
 3 files changed, 542 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192.dtsi

--
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
