Return-Path: <SRS0=1xoO=IP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B03C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 18:17:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EADD964E89
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 18:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EADD964E89
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IAemVhlgyhBMRr16Mbfhno761dTQ0ubtPb/4YfvCH3I=; b=EaOyhsM/P+WI5XSzhHnGDHDKjH
	SWddjvFJqKzzfllvs7oOUhh+WzEORDpUNDJwGtCwxnDBgkJaQJzUYvaRF+F8BbDfkcK1zSm5aH/Rd
	FcWFiHvQm2+t1PW46JJjSBafJMBQACJa0PjuF6j3jZhtEf4cir8jAj8nnzflIn/KCgbNwab3+paVj
	Pp7nVPOsUIQjyO3AKEQ9kOh7VOmu23C4L9I8bPp6jQXo1sSwmUgPcV3gTViS5azjtWgNtZfY/rVs4
	Y8llJyKC6oU58Iv/oZfvI40zXM/bhlU/Ap8fianUK8V/pot7DmxrPdpUG788Lw6d3EbmTLaJQm9HN
	Q9CCwamQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMajX-003jKU-U6; Wed, 17 Mar 2021 18:17:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMajO-003jJD-FD; Wed, 17 Mar 2021 18:17:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id A0F991F45484
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: matthias.bgg@gmail.com, drinkcat@chromium.org, hsinyi@chromium.org,
 weiyi.lu@mediatek.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] soc: mediatek: Prepare MMSYS for DDP routing using
 tables
Date: Wed, 17 Mar 2021 19:17:08 +0100
Message-Id: <20210317181711.795245-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_181718_631013_8600E226 
X-CRM114-Status: UNSURE (   9.30  )
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

Dear all,

This is the second version of this series intended to prepare the
mtk-mmsys driver to allow different DDP (Data Display Path) routing
tables per SoC. Note that the series has been tested only on MT8173 platform,
for MT2701 and MT2712 based devices we're using a default routing table
that should just work.

Thanks,
  Enric

Changes in v2:
- Use a default table for mt2701, mt2712 and mt8173.
- Remove the mask field from routes struct as is not needed.

CK Hu (2):
  soc: mediatek: mmsys: Create struct mtk_mmsys to store context data
  soc: mediatek: mmsys: Use an array for setting the routing registers

 drivers/soc/mediatek/mtk-mmsys.c | 300 +++++--------------------------
 drivers/soc/mediatek/mtk-mmsys.h | 215 ++++++++++++++++++++++
 2 files changed, 257 insertions(+), 258 deletions(-)
 create mode 100644 drivers/soc/mediatek/mtk-mmsys.h

-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
