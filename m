Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EA3C4320A
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 06:38:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CE5C60F21
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 06:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CE5C60F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y28LDQXFfrHrUhyFNZNGKG3aOr4ix0Y/uf/TuDtfmh0=; b=vUTqvyUAVLtgoT
	C/AuoqGBogRoLrz1Q302uJIYFxA2GsuRVIfmxypCAVjUCI66pCQycJi+TbUS6xbnyLYykp8kI5Z/0
	ajfeHKqMDc3pMN5n5zXeT5nXxmK0UpjO38qSMaqvK0tYkpcIQDC3tEkx2T4MSqCWKnL8cgiMPhrVe
	ksfILQOFzVJb68//AI/0hYiX1r8F2Nz6xb3IhiIWatUW/DLQ6cRVArQSozLls6R8dZIpa2xbqMr6O
	tCEo9aub3txOZeSsHcQ+KGQujRpblpHK6LqnvuhWguwYb1YUYEUaukbLStYk5UQMDxWXL+14/OUcL
	T2aCQEoamJ9GJPDePbzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLgMN-008iSY-MK; Thu, 02 Sep 2021 06:38:03 +0000
Received: from mx20.baidu.com ([111.202.115.85] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLgLc-008iKl-S3; Thu, 02 Sep 2021 06:37:18 +0000
Received: from BJHW-Mail-Ex05.internal.baidu.com (unknown [10.127.64.15])
 by Forcepoint Email with ESMTPS id 78F6DC384F3776F3EF11;
 Thu,  2 Sep 2021 14:37:09 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex05.internal.baidu.com (10.127.64.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 2 Sep 2021 14:37:09 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 2 Sep 2021 14:37:08 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <patrice.chotard@foss.st.com>, <mchehab@kernel.org>,
 <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
 <lorenzo.pieralisi@arm.com>, <robh@kernel.org>, <kw@linux.com>,
 <bhelgaas@google.com>, <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-media@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH v2 0/3] drivers: Add the helper function
 devm_platform_get_and_ioremap_resource_byname()
Date: Thu, 2 Sep 2021 14:36:59 +0800
Message-ID: <20210902063702.32066-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex28.internal.baidu.com (172.31.51.22) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex05_2021-09-02 14:37:09:472
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_233717_256509_3A3C736D 
X-CRM114-Status: UNSURE (   5.66  )
X-CRM114-Notice: Please train this message.
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

Since provide the helper function devm_platform_ioremap_resource_byname()
which is wrap platform_get_resource_byname() and devm_ioremap_resource().
But sometimes, many drivers still need to use the resource variables obtained
by platform_get_resource(). In these case, provide this helper function
devm_platform_get_and_ioremap_resource_byname().

devm_platform_get_and_ioremap_resource_byname will be used:
 .../platform/sti/c8sectpfe/c8sectpfe-core.c   |  7 ++---
 drivers/pci/controller/pcie-mediatek-gen3.c   |  5 +---


Cai Huoqing (3):
  driver core: platform: Add the helper function
    devm_platform_get_and_ioremap_resource_byname()
  media: sti/c8sectpfe: Make use of the helper function
    devm_platform_get_and_ioremap_resource_byname()
  PCI: mediatek-gen3: Make use of the helper function
    devm_platform_get_and_ioremap_resource_byname()

 drivers/base/platform.c                       | 30 ++++++++++++++++---
 .../platform/sti/c8sectpfe/c8sectpfe-core.c   |  7 ++---
 drivers/pci/controller/pcie-mediatek-gen3.c   |  5 +---
 include/linux/platform_device.h               |  3 ++
 4 files changed, 32 insertions(+), 13 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
