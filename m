Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB77C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 03:20:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24F3B20657
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 03:20:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="abncy8H3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kcVmrFQu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24F3B20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JiF3pbiC9+2SUgtU8GT5ujIhARFOLEtDpwn1Vqxsaqg=; b=abncy8H3LLXcA05pfJdk0M1Ojh
	dYeSC8FKC06mpgVE7spFxrVj3563/U+rgU8LF5fwfCbuz60VR/pPqHIUSIYqbzQjwB6UIIYGFQEIA
	g+/XCleCCwM9bYS3mzK33GQfi5suAas+ekBH16sWAFShFK1LpYxEKWxmNfEAf6ea1KKu+bh4vTEt5
	bAcLMyBn240zwP4TR7M6mhn5ISp1zDsIyD6trQYdo6df7BxqNel5GN0OZpXxIFXpHzqOJs73m3DRA
	l/1yotduA5ZJ68AJvXeu6zMFzMkvVqZ1dbSrRdBID3PZVfMzwoUx8IocslV1nTW5E7ST/D6OA08sk
	slV1yrGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy5Il-00050j-N4; Wed, 22 Jul 2020 03:20:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy5Ii-000509-GP; Wed, 22 Jul 2020 03:20:13 +0000
X-UUID: 8370f407b4254be5aa685cc86e0b13e7-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=FfnplIb03F5mygWVhrAncd7mBRDTjO+wl6Oht14jAw4=; 
 b=kcVmrFQu/+/n8u8hWJa9yO2e1afSIphZSTY/2NLmphm1rwLkzcAG/1N/Zl3iTpNUuMYbv8NvOdr528WkNQiwKT4Bk1xwl2QXye6QOLFGDKBMMVu23Kk/EyJCSvbqX6OL82CTnQcjCo1P+alBYE+zkpzAk/pS/rwxUdrl//e2DKU=;
X-UUID: 8370f407b4254be5aa685cc86e0b13e7-20200721
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1756180870; Tue, 21 Jul 2020 19:20:11 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 20:10:06 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 11:09:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 22 Jul 2020 11:09:58 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>
Subject: [PATCH v2 0/2] Remove MT6779 UART3 clock support
Date: Wed, 22 Jul 2020 11:09:55 +0800
Message-ID: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 24DA662D4C732F673DA55CE5622ACF3B05E818798C543EB8C5849691F46B03292000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_232013_109546_9414FF18 
X-CRM114-Status: UNSURE (   8.82  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, wsd_upstream@mediatek.com,
 Hanks Chen <hanks.chen@mediatek.com>, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

remove the redundant clk interface of uart.
CLK_INFRA_UART3 is a dummy clk interface,
it has no effect on the operation of the read/write instruction.

Change since v2:
Commit "dt-bindings: clock: remove UART3 clock support"
-- remove Fixes tag
Commit "clk: mediatek: remove UART3 clock support"
-- remove Fixes tag

Hanks Chen (2):
  dt-bindings: clock: remove UART3 clock support
  clk: mediatek: remove UART3 clock support

 drivers/clk/mediatek/clk-mt6779.c      | 2 --
 include/dt-bindings/clock/mt6779-clk.h | 1 -
 2 files changed, 3 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
