Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FC1C47257
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 08:11:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6399720753
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 08:11:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n9vq14Xw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rTqaBwSB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6399720753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4hY0fE4qYYQo8lGKsfDmItXeDoYka6SycMjht5S/Jk=; b=n9vq14XwQRSUVh
	IAJDOgX900n1sxqfBFaKbghh1nvKt+iKLS6aGlkpW3my4j6z9sEn8W91e0KndC2LpcOwvO+fsgiMC
	1UOJFmzamweLNk23JO+AcY/XXpfJZK37x+ZA7IFYv0jk0KrHsRuHgdMf4RY5lbAB2rbhlqzO2sDB4
	kI3HWjudbTP4j2VwfDBPsrWdGyqTUvCWkC0Sjhtcg6cZLUpemcbrOh9ggW1wkovi0ATX1WZ8j+0/N
	4HVaTVpWgkGbWKfpw3ifsOf59jSIyvQhW3bcKGkoFODe4574b+QOKwbMW/gLO6c9Fi2UZ+jE6hDGC
	HxXPlijRiPWs4ZZuJ5iA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWbcZ-00048l-VU; Thu, 07 May 2020 08:11:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWbcX-00047n-IA
 for linux-mediatek@lists.infradead.org; Thu, 07 May 2020 08:11:06 +0000
X-UUID: 7a7319712be04ffe94adcc826b0c8b68-20200507
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=U3rOHmbZkfyZYNk3QoGRcI8HUwADaDcQDbyBxnNmq/4=; 
 b=rTqaBwSBnzuq0adkIykxKC1DinYI46SFK22FHeqc1aSi7nBSec6UGF8w5rF7399MUBvEP/GF2pg71EVTsOkEZ2lzoag75uBRaCvp6KjhW76OSTL7ayC/HaVfV7dzEBBimPl88/r1cszFnS03GuE1aJsahXukQx+YFp6Pvg0m4yU=;
X-UUID: 7a7319712be04ffe94adcc826b0c8b68-20200507
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 805833829; Thu, 07 May 2020 00:11:03 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 May 2020 01:11:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 May 2020 16:10:56 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 7 May 2020 16:10:55 +0800
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Todd Kjos
 <tkjos@google.com>, Joel Fernandes <joel@joelfernandes.org>
Subject: binder: transaction latency tracking for user build
Date: Thu, 7 May 2020 16:10:52 +0800
Message-ID: <1588839055-26677-1-git-send-email-Frankie.Chang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <20200430085105.GF2496467@kroah.com>
References: <20200430085105.GF2496467@kroah.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: BA4C6F361779C1B7134FD62D3A807F06C4F8C4209677814ABEA4A00D1DC073DE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_011105_605493_4C8D71EF 
X-CRM114-Status: UNSURE (   5.21  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Jian-Min Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Frankie.Chang (3):
  binder: move structs from core file to header file
  binder: add trace at free transaction.
  binder: add transaction latency tracer

 drivers/android/Kconfig                 |   8 +
 drivers/android/Makefile                |   1 +
 drivers/android/binder.c                | 408 +----------------------
 drivers/android/binder_internal.h       | 416 ++++++++++++++++++++++++
 drivers/android/binder_latency_tracer.c | 105 ++++++
 drivers/android/binder_trace.h          |  47 +++
 6 files changed, 581 insertions(+), 404 deletions(-)
 create mode 100644 drivers/android/binder_latency_tracer.c
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
