Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2057CC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 14:09:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E91312075F
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 14:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RAcuLwgu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="g32zJVsJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E91312075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IssQDwIFRTmCuJtOWmtFMbyeSxAS+V9/QV2TdjXFj4w=; b=RAcuLwgu/AJAKSHmy4+1LIWXh
	HC+ALvQv2HH5G/aedBTM5ReErkpRRndlPOyoFAa4rVkFWwjvEl4dt+3Ikg9nxQgPShrhk71UlOZxV
	h5Z7FW2PSB+UPYP0FrMC65WyrECyKtNz6nrb+E/dbarW7mC4TQOgIWTXW1esyKludDQ/GA4+ElkkF
	OM5KTk+ZawZ1Q6/MgUsvZuV2zWGCryOuqEfBs/CzgSXFaKlPU/xfuQZJ5XF+oXU7GHBdCRYEf5Qt0
	JQ/6M5guqWWEie4MVc0KBbmWUpX9kNjjcuwdCgJiRvy7LwKpbw4xnkXQj4JQv46invKd8fpv3p+Lt
	UGdrrN/fA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2xdQ-0002X9-2x; Tue, 04 Aug 2020 14:09:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2xdN-0002VU-Fr
 for linux-mediatek@lists.infradead.org; Tue, 04 Aug 2020 14:09:42 +0000
X-UUID: 4755c0b32c92443b916273d8048110ab-20200804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WfJqxF9cONOh9ISapZhRAcSdB5lxjyrlgdtXWgEHlC4=; 
 b=g32zJVsJXvHWDDFMgTuK2vui/Zwti5HGQcOH0G2zn9dgRQWTNYSgTJvYmEC5085dgGkPwc8fZaels+e0+ErsfSoLGiJ7WseCeZS/UerNBgX86iitGww7UAR9Pmwrex+fEbKnkbVAd1WnTwH6nfYcxATtxaiu2ahDUuz0qmz2/mA=;
X-UUID: 4755c0b32c92443b916273d8048110ab-20200804
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 875403127; Tue, 04 Aug 2020 06:09:32 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 06:59:15 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 21:59:12 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 4 Aug 2020 21:59:13 +0800
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Todd Kjos <tkjos@google.com>
Subject: [PATCH v7] binder: transaction latency tracking for user build
Date: Tue, 4 Aug 2020 21:59:09 +0800
Message-ID: <1596549552-5466-1-git-send-email-Frankie.Chang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1596509145.5207.21.camel@mtkswgap22>
References: <1596509145.5207.21.camel@mtkswgap22>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3E93D052AFF41D3ADDCCD18A75EC749C115769084484D43C1F80304E3455ED712000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_100941_707684_5920FD89 
X-CRM114-Status: GOOD (  11.08  )
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
Cc: wsd_upstream@mediatek.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Jian-Min
 Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>,
 Frankie Chang <Frankie.Chang@mediatek.com>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Frankie.Chang (3):
  binder: move structs from core file to header file
  binder: add trace at free transaction.
  binder: add transaction latency tracer

 drivers/android/Kconfig                 |    8 +
 drivers/android/Makefile                |    1 +
 drivers/android/binder.c                |  425 ++-----------------------------
 drivers/android/binder_internal.h       |  417 ++++++++++++++++++++++++++++++
 drivers/android/binder_latency_tracer.c |  112 ++++++++
 drivers/android/binder_trace.h          |   49 ++++
 6 files changed, 607 insertions(+), 405 deletions(-)  create mode 100644 drivers/android/binder_latency_tracer.c

Change from v7:
  - Use the passed-in values instead of accessing via t->from/to_proc/to_thread
    for trace_binder_txn_latency_free, when trace_binder_txn_latency_free_enable() return true.
  - make a helper function to do the above.

Change from v6:
  - change CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING type from bool to tristate
  - add comments to @timestamp and @tv under struct binder_transaction
  - make binder_txn_latency threshold configurable
  - enhance lock protection

Change from v5:
  - change config name to the proper one, CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING.
  - change tracepoint name to more descriptive one, trace_binder_txn_latency_(alloc|info|free)
  - enhance some lock protection.

Change from v4:
  - split up into patch series.

Change from v3:
  - use tracepoints for binder_update_info and print_binder_transaction_ext,
    instead of custom registration functions.

Change from v2:
  - create transaction latency module to monitor slow transaction.

Change from v1:
  - first patchset.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
