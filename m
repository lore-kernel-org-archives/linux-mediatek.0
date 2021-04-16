Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA13C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 09:48:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92A0D60238
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 09:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92A0D60238
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0zaj8pzFNtvIBIs5Uw+pkuBdcgqeE4/+120ElMU50AU=; b=WOLXKUdi4PqOT6XhtteW3vPLXk
	W9Ek0Inn0A/sZf3j9s8RJ02zQF4EmlPwV2bCsCeeaYFdlJSgNmfvSWROpVbefgzoAGR4NMyxeY+7x
	Ooju/5SoQZHXVVn8N9bKYtNMdrMaHP/mU2KhUFwDvrCwo1pB8accyy9jFS2LBAwjXn1qaW+Qd1WUf
	5KwDKtiNb5ftHciAuyHjQi7Es/DfWPw36aFW6nJckUaqX/yN+dw4eMnhnfvMCemidZEuTAyyxl14d
	CqBD0R7Z6Ygv00Hj5gyi5z9TKsUvqjigxr5AUDF/Dtg7x1tWmQH/G34gFQkNL1xHR2xZpU4hsGGTC
	cBTxHEwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXL53-001bhp-08; Fri, 16 Apr 2021 09:48:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXKpz-001YZB-0V
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 09:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=V4goLYZWbXnvSv9dTy9rWmmzfQmp4vxVAPqTnB8R0x4=; b=l+ORuOkobSxHcxVx2sE5TAs8tm
 G75CoDxT19VRXPP4Rka2n1YQn3OjvutZ3xjU7LMAO7SmO/WbX2zAE0PsUNIMjYVZXws4IPOKyIeST
 aRUt3oFqdnOUVf3Y6FyfczxzepSmiLCQh/0GvGlUQfxLub2dnFYUIdaYxZh6lACBSvu1HYPoXLa+x
 lXWzZEWJix5DfgxvvfZfZnPkux/5iRrcyyUCRa6ATjrt4socvkqXR1vGM7nWqy+z8PBQ5VCaShtqM
 PnsZsGvhmB+l4ZNco2xNKz+CaBHX6vcM3VgmEASeu+K08pDi6oEEn9UJWH1ige4hswXE7CmchAFVx
 Bog2Aqcg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXKpv-009FDT-FJ
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 09:32:28 +0000
X-UUID: 6185623292044e33b1fca41e2d575f4f-20210416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=V4goLYZWbXnvSv9dTy9rWmmzfQmp4vxVAPqTnB8R0x4=; 
 b=uwirltalEMUtdrZwBDU+YQ8Bhbd0LIuGgabzLwgKfp1D1m9ctyKDHz0wT9xJm1Np0828L67JpUq+xlLO86OJ1EjmgmCigzbzUEOgmN08LgMKt3oumZCJg5njf8+EQYhaevdXlyWsrj02EOpSMoeBy0mjBp6URVhe0IfJiX2tLgQ=;
X-UUID: 6185623292044e33b1fca41e2d575f4f-20210416
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <pk.chi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1302856781; Fri, 16 Apr 2021 02:32:23 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 02:32:22 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 17:32:19 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Apr 2021 17:32:19 +0800
From: Po-Kai Chi <pk.chi@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <wsd_upstream@mediatek.com>, CC Hwang
 <cc.hwang@mediatek.com>
Subject: [PATCH v2] memory: mediatek: add DRAM controller driver
Date: Fri, 16 Apr 2021 17:32:14 +0800
Message-ID: <1618565538-6972-1-git-send-email-pk.chi@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: A1A89FB72589495136EA6DE31C9FE8535C9EEF142A74311CD22CAF680AD76D292000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_023227_538820_3758D16D 
X-CRM114-Status: GOOD (  10.29  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These patch series introduces the MediaTek DRAM controller driver (DRAMC)
on MT6779 SoC, and enables to be built as a module by default for the
ARM64 builds.

MediaTek DRAMC driver provides cross-platform features as below:
  - API provided to other kernel modules for querying DRAM type,
    rank count, rank size, channel count and mode register settings.
  - Sysfs interface used to pass DRAM mode register settings and current
    DRAM data rate to user-space for MediaTek ecosystem.

The API user includes MediaTek External Memory Interface (EMI) and
DVFS Resource Control (DVFSRC), which will be sent to mainline later.

Changes since v1:
- add prefix to vendor properties in device tree, dt-binding and drivers
- fix dt-binding check fail

Po-Kai Chi (4):
  dt-bindings: memory: Add binding for MediaTek DRAM Controller
  memory: mediatek: add DRAM controller driver
  arm64: dts: add DRAMC node for MT6779
  arm64: defconfig: Enable MediaTek DRAMC common driver

 .../memory-controllers/mediatek,dramc.yaml    | 162 ++++
 arch/arm64/boot/dts/mediatek/mt6779-evb.dts   |   9 +
 arch/arm64/boot/dts/mediatek/mt6779.dtsi      |  18 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/memory/Kconfig                        |   1 +
 drivers/memory/Makefile                       |   1 +
 drivers/memory/mediatek/Kconfig               |   9 +
 drivers/memory/mediatek/Makefile              |   3 +
 drivers/memory/mediatek/mtk-dramc.c           | 711 ++++++++++++++++++
 include/memory/mediatek/dramc.h               |  18 +
 10 files changed, 933 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
 create mode 100644 drivers/memory/mediatek/Kconfig
 create mode 100644 drivers/memory/mediatek/Makefile
 create mode 100644 drivers/memory/mediatek/mtk-dramc.c
 create mode 100644 include/memory/mediatek/dramc.h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
