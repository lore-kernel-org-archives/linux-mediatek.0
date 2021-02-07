Return-Path: <SRS0=0SFh=HJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50007C433DB
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 03:10:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF2E764E91
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 03:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF2E764E91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cuDlcEv0wW8RuYSjjywgLfbC3AF8dn03MY0nqHkY34s=; b=DgfoXF+L71pqdK71QSFppxCvVB
	HjjefO+EcuD0O30dc95dKJDy5nCy1C4mLyRhPhNBaeidINzrBww/0nL5z7/ZsDBiZbnvJRW9/F3lK
	ccF6PkzDkojKePOtwLBglr6DzeCexMLGUM4VqKhK1/mEmH2vFHhpzOZJ7Wr0JJMFKHKbkGwGZkW6J
	jC9zE703WIdytJ7vuGsQvmvnX26Myo6WjWkpaJCsV46slGfmKl3rBYuOZkMToGuQXWeSRv5JsL6c9
	gvpEE+wfPcJK1/pS3Fk2zf3E9NuoXOUD2XIcawOE7P5KJbT7uUf549glA3AWWUaJCIzQqclsRynQo
	H1bUVvYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8aT6-0008Ir-E8; Sun, 07 Feb 2021 03:10:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8aSz-0008Gg-Rt; Sun, 07 Feb 2021 03:10:31 +0000
X-UUID: 12950b45a0494f88ab5298f190187641-20210206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Rb0phNYTSSI42+BcF7n+nbXYnM/MTI39UW4pQ8jsPno=; 
 b=XHcRZVN6AHgVhObMLLJ+GA3xh0y5RvdZBayT01nDlWjMqmBd3AN+JMb5TYOHZccwh1clFS5dDjz9JfIIEJwtd6qTH9G2cZ4ir88edfTfgq/CpvTth5EG+71qoCH/i3QZKiYPX7H2dbBH5OlN3DqnSuXSL+FP8O7nVjlCQx9gqoM=;
X-UUID: 12950b45a0494f88ab5298f190187641-20210206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 318222447; Sat, 06 Feb 2021 19:10:19 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 6 Feb 2021 19:10:17 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Feb 2021 11:10:10 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 7 Feb 2021 11:10:10 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] spi: add set_cs_timing support for HW/SW CS mode
Date: Sun, 7 Feb 2021 11:09:50 +0800
Message-ID: <20210207030953.9297-1-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_221030_131829_E7226AE0 
X-CRM114-Status: UNSURE (   8.67  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some controllers only have one HW CS, if support multiple devices, other devices need
to use SW CS.
This patch adds the support of both HW and SW CS via cs_gpio.

leilk.liu (3):
  spi: add power control when set_cs_timing
  spi: support CS timing for HW & SW mode
  spi: mediatek: add set_cs_timing support

 drivers/spi/spi-mt65xx.c | 72 +++++++++++++++++++++++++++++++---------
 drivers/spi/spi.c        | 32 +++++++++++++++---
 2 files changed, 83 insertions(+), 21 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
