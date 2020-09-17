Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C3CC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 12:08:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4A7F208DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 12:08:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mQxaKF3m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CevI0gAx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4A7F208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u35Vc/dsF4UvNRZoCznhUBkrNetUBdrV41wYe7ZGHh4=; b=mQxaKF3mUnbwEcTtJfe3EkOjT0
	hbo8Fr/EECTdlRtT9yLWdttTzmn+ZXgkgcpsuo3kOJY/J3KddGShdqK510mzJT5iDnx2SdWdRwS10
	ofI2r22uDOULzqwDBN6ZzpAGK49gj7yKnryKLutO+XtCIYosuqFOFM83lNw3klDxxePzYlSc5eGfA
	bLWOZoGpCFsi2vpEjVhg/16jYSeo+2wRf1VNe4fvX31dt8c6jd6u3xhKKys9DCFmIBLK+gpi21RHh
	rykeHypXpwp1sMlKdidflaluAHzWQSYUG+2xrjWPrHhDLwRk6o3VvXtnxWuyZNVNy+o/nwfV4UDCU
	GmAbgnkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIsiM-0000Mn-5H; Thu, 17 Sep 2020 12:08:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIsi0-0000AJ-D4; Thu, 17 Sep 2020 12:08:17 +0000
X-UUID: 14fb9fe3402f4a17974eba1e627dec64-20200917
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6RsFN3FgI09QCmEIV64IUurK2wRwXLViWE4DI22IWEY=; 
 b=CevI0gAxzwQWnyHIN7cLsYBuCJ4gsX+/9Ypq1hApsLwTuKwpCdLm7AbvEKtcEQIZqmT4fs2ZwKx7qe3LKFygV8nRO2KmKEcXofj5NYBpVBQMOtJQD5e01JB9AvKKyUah16Ao0E+1oLm8UFn79auPIBHUQyM8PpvWo6m06VNITeE=;
X-UUID: 14fb9fe3402f4a17974eba1e627dec64-20200917
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1118548795; Thu, 17 Sep 2020 04:08:05 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Sep 2020 04:58:01 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Sep 2020 19:57:59 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Sep 2020 19:57:59 +0800
From: Qii Wang <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
Subject: [PATCH 0/2] Fix some definitions for bus frequency
Date: Thu, 17 Sep 2020 19:55:40 +0800
Message-ID: <1600343742-9731-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_080816_907686_1740895C 
X-CRM114-Status: UNSURE (   8.41  )
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
Cc: qii.wang@mediatek.com, srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series are based on 5.9-rc1 and we provide two i2c patches
to fix some definitions for bus frequency.

Qii Wang (2):
  i2c: mediatek: Fix generic definitions for bus frequency
  i2c: mediatek: Send i2c master code at more than 1MHz

 drivers/i2c/busses/i2c-mt65xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
1.9.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
