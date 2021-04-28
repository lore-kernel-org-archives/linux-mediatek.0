Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6507C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 16:42:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36B5F60E08
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 16:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36B5F60E08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7S2PKH8mZTsNi5pYdVmPb62d26pJI59gT+dr+f6/iAI=; b=GaCADpgEFCbt+NpA06TkGlDu7g
	Bc0URMO0T4Qnu6KyZsQphKV62tYhPuRnJ9sH4q4Yhp+AytVz5iZrISdu1vNUEsp7GPfjuMEhtEmzW
	KFe9Tr4+R3r+vSA4tNOHu/BuS7+To/hhQHPQm1v1WAynlNT1gVN4N5FaTHCcYM1uS89Q0fK82GrPQ
	smBFHaD4ZUTCQqx43V9IDWI/UA0C8KjLCM6n39tXDHcUBeJ2W9ZhF2kds5lU5expYCd/vRcOUCtgl
	5Nw6/AGhM40T6ibER88UbLD6rCuJwSR+r73J8KviPfBsHZHDQh3Z1Znrau0Xh3SERcF4Cq/YcYYla
	F3VjCqsA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbnGk-003rHE-Sc; Wed, 28 Apr 2021 16:42:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnGg-003rEv-Gk
 for linux-mediatek@desiato.infradead.org; Wed, 28 Apr 2021 16:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ubJ2BAniIRemLaU8X4uRVoCRnVru80P0B3QSFnUPvls=; b=DBgfs8rTABOvyPETFPylBM+QjS
 psmijuJbCzPUm9Tg8bp+mzLjnNCzgIsCvMd06OOjQv4oKMiTKS0ZgxP8xVEBF9ZrzP7auSSed7Vot
 IUaQIdi2dthfUG2qevGW4xOejh0fuQGoY0unAQcj/W4U3R/LDgNw26A/GDBnwWClP1QFqb8pzWwyY
 YEY6hj5D+EVYCE6OQaGHGGkoZZUoCDtbi3gxy8Lpgwk9cpFvio0DeWyaCVPQLSLHqWsqGtDN9SWOL
 QDiiohpa5w5zhqB2wesnh/klOYbXtej+8ljx/ahgvw3OAyDTdqoj6ZkiyKMlTcSEe/YP++0KWyuFn
 +zo6oobA==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnGd-0001dY-7D
 for linux-mediatek@lists.infradead.org; Wed, 28 Apr 2021 16:42:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id i129so7235359wma.3
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 09:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ubJ2BAniIRemLaU8X4uRVoCRnVru80P0B3QSFnUPvls=;
 b=sjDyBcAUw+niGrgBRYnAhJbDlNXf5UnkpIk9B5b7Ek864gmX4eEljIuwbsiJxc2j1l
 RGsBNC6RocmribujHlCv/kSIsL6TSL3sgaByMxBd7a/9iN4gaeU7fgk2kRrVgfP3ZTV8
 0hfgYGXNhYzyoLFcuwbEjo9oFaXmt6xmmhEG0zLNJqZyYMT7dYHlXdkp2nSlvbXN/pC3
 NCTlTB+NjXSELFcS9e4GxKy/yX6wc4wCCIwWoZtCeOJUzeIhfKX3URIvjndGug/YHid2
 uq1c/y57bJohulo4mPvn7DIyjMQnShoooRc8qu8poEmBv2YCQgp/+pMKLLdnie0J3cjV
 5fHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ubJ2BAniIRemLaU8X4uRVoCRnVru80P0B3QSFnUPvls=;
 b=MY6p+2qmlFtMG4Y4v+qOzRxe82F1ewPd6tNwn5yU+gcovO4ODF5CpgtMBIQrlJ7Dyw
 /K+a5IGxjQvhcJW4DYlfCmvh/Dg36gzbEGoBOdm/aa3nCmycrDYvSzqDI8lYuJ7Lyffy
 YDEVhNf9AwT7dO3bwBy2qswHynGsIkMfnSIPrgwTGsAaYwf4spGjG5qOdENXWmW2QK8Z
 5W7LaR2l5EaD/NcGdsS+HTVEIz+E5k4QyciqHO/jjhOG8eAFwPosUgUrTZ+QRD64oQfe
 vthibmp2AF2IhqEj4A7cuoo6YiX0nmdXisiaj3xvCOfzmBBh0YkhxCWRgHpukIu94R3y
 TlTQ==
X-Gm-Message-State: AOAM530ALJMM6VzPnrX6YoniyR4ds2IgoRYciEL2nQlvMmriOrlnLmM4
 dGUnLTcZdBs5WFH60+InArfNpg==
X-Google-Smtp-Source: ABdhPJxQNsq2WFwU6ZDYpb3o5UuepMwD+FY3DcW+VZ6viQMaS0p4LvlHVzcIPoKvaSVim9HbKcMvmQ==
X-Received: by 2002:a1c:4382:: with SMTP id q124mr24697367wma.63.1619628144853; 
 Wed, 28 Apr 2021 09:42:24 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:5864:ddd1:d623:f912])
 by smtp.gmail.com with ESMTPSA id o10sm351299wrx.35.2021.04.28.09.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 09:42:24 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: fparent@baylibre.com, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 0/7] Input: mtk-pmic-keys - add support for MT6358
Date: Wed, 28 Apr 2021 18:42:12 +0200
Message-Id: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_094227_265865_B950FD87 
X-CRM114-Status: GOOD (  12.50  )
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

The MediaTek MT6358 PMIC has support for two buttons: PWR and HOME.

The interrupt logic is a little different than other PMICs from the
same family:
* for MT6323 and MT6397, we have one interrupt source per button
* for MT6358, we have two interrupts lines per button: the press and
* release interrupts are distinct sources.

These series:
* Fix a NULL ptr error when we use mtk-pmic-keys without dts code
* Rework the mt6397 driver to prepare for this different interrupt logic
* Add support for the MT6358 power buttons

This has been functionally tested (using evtest) on
the mt8183-pumpkin board on linux/master

It has also been used for a couple of months in a downstream
tree based on v5.4.

Mattijs Korpershoek (7):
  Input: mtk-pmic-keys - check for NULL on of_match_device()
  mfd: mt6397: add mt6358 register definitions for power key
  mfd: mt6397: keys: use named IRQs instead of index
  dt-bindings: input: mtk-pmic-keys: add MT6358 binding definition
  Input: mtk-pmic-keys - add support for MT6358
  mfd: mt6397: Add PMIC keys for MT6358
  arm64: dts: mt6358: add mt6358-keys node

 .../bindings/input/mtk-pmic-keys.txt          |  5 +-
 arch/arm64/boot/dts/mediatek/mt6358.dtsi      | 12 ++++
 drivers/input/keyboard/mtk-pmic-keys.c        | 59 +++++++++++++++++--
 drivers/mfd/mt6397-core.c                     | 20 +++++--
 include/linux/mfd/mt6358/registers.h          |  2 +
 5 files changed, 89 insertions(+), 9 deletions(-)


base-commit: 4a0225c3d208cfa6e4550f2210ffd9114a952a81
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
