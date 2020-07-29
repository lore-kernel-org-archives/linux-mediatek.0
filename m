Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A58BC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:40:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A55921883
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zmJSFPoP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FPlMU8kT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A55921883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YEZZqDJjixmxjyu8JTSonNXX6EcWYgiaCdQ5VobBXoE=; b=zmJSFPoPM8DTUni+ACoJ3ZEPDX
	P4rrbDzwyeA0oJDRkIhM7+FRRzwsF/5eqxabiRLqAGffY3CUce5/tR2vctnNWAwfHi/kXk3mxmhp8
	2O3YIncusDtJgBrh5EZW5RCCaUOefaAhpw+HX9fNzVemg07RVcq0mYyYbRgWopVQtf/g+lefMTT0R
	0xZ/XZc3PcppVm9y/bIzrvDqyFvVliS5Bzi7gl3GQGPGOZqjEnMOzaQsA+iLmsgiY+ObPYc/W9UbT
	Kx4aSumwQQhxPj+vojCuCD9wX1P4o0cw6QbBT/c0v+PMJExYfalqop1hEgENbJFuhtOmcydi4KLcG
	oO0Fr05w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0ggx-0001Pk-Fa; Wed, 29 Jul 2020 07:39:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0ggp-0001N2-BJ; Wed, 29 Jul 2020 07:39:53 +0000
X-UUID: 32fc34cc820e407abcb429f5d8123a3a-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Ziu9RVkLC78aEOY1MEgT8/CO2GXVUt9odl7fiCsyBTo=; 
 b=FPlMU8kTfLhxjtjievhmrVgqOJyCwxrUx1NxjyIbYOSi8b1tJDp/1fT6s1o/FzxhLA6VixgV0nFsf4bbtxYRGo9I2hJ6peSaU7GOlXhs12zscbqT7KQAhWBW9R2oroe8Q6PPmAITYqXsDOecPw/hbv8ARCp2JADEm9WN3MHRDNI=;
X-UUID: 32fc34cc820e407abcb429f5d8123a3a-20200728
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 38380577; Tue, 28 Jul 2020 23:39:47 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 00:39:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 15:39:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 15:39:45 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [PATCH 0/2] adjust the reset assert and deassert interface 
Date: Wed, 29 Jul 2020 15:39:15 +0800
Message-ID: <1596008357-11213-1-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_033951_553446_7DA994C9 
X-CRM114-Status: UNSURE (   9.69  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

1. adjust the reset assert and deassert interface
to make it more compatible.
2. add infracfg_rst device node.

Crystal Guo (2):
  reset-controller: ti: adjust the reset assert and deassert interface
  arm64: dts: mt8192: add infracfg_rst node

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 10 +++++++++-
 drivers/reset/reset-ti-syscon.c          | 13 +++++++++++--
 2 files changed, 20 insertions(+), 3 deletions(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
