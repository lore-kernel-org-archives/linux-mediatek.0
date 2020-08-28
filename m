Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D50EC433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 07:50:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30C1B2078A
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 07:50:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kXJVug+l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="a8d/peyy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30C1B2078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GajBxGqPupG57YSOKVk2qa1x3cdXDtP3JaNtTuUSVbs=; b=kXJVug+llIITbsZzhq3jieoM03
	YpE8iWRT1zuJU1cPnBwNqR4GWW+I4PKizOOVtkZNAjor+n92YZuxllc6lG0Wj4rbQX4jmDmjZqY3B
	FoGknvBYZ0H3KMxsxumi6gzJhi9Xyp2XgJC8wVrTQ1L7vHFQEFKXzqovAbV4msgWU6Yk0KsrDlWO1
	r20arHLudTa81trzGo9NSWEryaamPiNL/jwQ/R24KixzL8N1zjg8pPm7gZHrIcVZmqWnQzNm3I5uL
	kmrbQAoJB5cgoIcCED/iP6vy9wamVYG0txBU6lyLG59U4rFXHDVFQiJM+Az3oAuzM2NDlL/pt04tJ
	IHlhPflA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBZ97-0008M7-P7; Fri, 28 Aug 2020 07:50:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBZ93-0008Jy-Er; Fri, 28 Aug 2020 07:49:58 +0000
X-UUID: 66a2b50871bf47dfaa170299434053f5-20200827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0EKafp0Drld7nVRG3II9HXY8sizTyEYsQ0QqqSX3Mxw=; 
 b=a8d/peyy+GFrYEF9CYvnWm8+9kIJPVnJqhyXSuwUP9asBnqEA9mtfcOABJMTCUnXTfzAqnhVdk2TUlP1GKOQ62vq2e+iNmlToJalzwBREXamkeh7buqxW+5svNfoGo5So3eEWkgR4pjro6OAnQwnqScw/FO9QvIioUoYMXXY1QY=;
X-UUID: 66a2b50871bf47dfaa170299434053f5-20200827
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <freddy.hsin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1108724681; Thu, 27 Aug 2020 23:49:48 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Aug 2020 00:49:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Aug 2020 15:49:43 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 28 Aug 2020 15:49:46 +0800
From: Freddy Hsin <freddy.hsin@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 0/1] Refine mtk wdt driver init flow
Date: Fri, 28 Aug 2020 15:49:27 +0800
Message-ID: <1598600968-28498-1-git-send-email-freddy.hsin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: F61C1D996371B3870C761BAAAB54EFE1717CDD80FFDF00FED470060D87C340982000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_034957_678359_4C7EACD3 
X-CRM114-Status: UNSURE (   8.30  )
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
Cc: kuohong.wang@mediatek.com, chun-hung.wu@mediatek.com,
 chang-an.chen@mediatek.com, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mtk_wdt_init() functin in probe flow to determine
enable/disable the hw watchdog by its original setting

Freddy Hsin (1):
  driver: watchdog: Add mtk_wdt_init for mediatek watchdog hw init

 drivers/watchdog/mtk_wdt.c |   22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
