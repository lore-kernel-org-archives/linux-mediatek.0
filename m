Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C85C55178
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 09:27:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D82F20770
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 09:27:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PDc151lS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cvcX2EDi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D82F20770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f0BaCC2bl5ebiY4JF/6w5ZWxYTeTlZNYcLzqPMZnPJU=; b=PDc151lSq0IkD4lauvh/KVtY9w
	qac+CYUx1m/b+k2gPA1x5HHq1qj1x5XDm7iUjAWEyKW8JnOQVuoXtJtvR8lvytPvnuqsSwTyyKK+I
	A5nPLGeMnGAMVEj+8j1nnGpawIh9c7w1uUiIvnVzoDY04eRFtcMlpxI9c9jnmxw/ObEDab/8lf+QN
	A5SwWxYq/tKCPc6KNvN9AonVjixfTLMbqtsPcG2bnKI5xzdiOjgNkrvVvdHH5a03084lx0X7AQRjq
	bsOG4wKikxV7uKp7rJYUWZFY/AjFs+tDpqC8ovdJCPtl9IBiwuR+IXaiZz8clzJERc4HesnFQlral
	NBVaHC+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVtME-0001hY-LE; Fri, 23 Oct 2020 09:27:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVtM1-0001bN-FH; Fri, 23 Oct 2020 09:27:22 +0000
X-UUID: e62a22d10194406a89f7a20269fe67ad-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=9O9vL8W8ftwpo5r9aL/7yLqe76HJJadkcFJaPM5zdZk=; 
 b=cvcX2EDiBuBfykrTmf4A2XgQvoHaPSKNaX8Tr4Kpgn9H511pmRkacpY/W1G6aQ0oV8hiBXt6OLS1+WlSQ0c72ErIXzMyXBpXefOi3V23frKdE5T8niJzNYwVOJchIl+75FIJPFobftSeJpWSuC4muEtzEKtCGj8lVD5QT3IZUY0=;
X-UUID: e62a22d10194406a89f7a20269fe67ad-20201023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 455890728; Fri, 23 Oct 2020 01:20:52 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 02:10:50 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 17:10:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Oct 2020 17:10:40 +0800
From: Irui Wang <irui.wang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: pull request: linux-firmware: mediatek: separate venc service thread 
Date: Fri, 23 Oct 2020 17:10:25 +0800
Message-ID: <20201023091026.32066-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 064E32424A37CD246CCD88A1AB796DE73C6A1480B4CF398B54EE122CF77318612000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_052721_743023_C70FE280 
X-CRM114-Status: UNSURE (   8.12  )
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
Cc: Andrew-CT.Chen@mediatek.com, Maoguang.Meng@mediatek.com,
 srv_heupstream@mediatek.com, irui.wang@mediatek.com, Yunfei.Dong@mediatek.com,
 erin.lo@mediatek.com, Longfei.Wang@mediatek.com,
 linux-mediatek@lists.infradead.org, PoChun.Lin@mediatek.com,
 tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi linux-firmware maintainers,

The following changes since commit 58d41d0facca2478d3e45f6321224361519aee96:

  ice: Add comms package file for Intel E800 series driver (2020-10-05 08:09:03 -0400)

are available in the Git repository at:

  https://github.com/irui-wang/linux_fw_vpu_v1.1.5.git v1.1.5

for you to fetch changes up to 76ceac823c3f5e867e8a22d6505993fe49f602d9:

  mediatek: separate venc service thread (2020-10-23 16:43:57 +0800)

----------------------------------------------------------------
Irui Wang (1):
      mediatek: separate venc service thread

 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131180 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
