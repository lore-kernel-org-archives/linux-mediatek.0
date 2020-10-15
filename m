Return-Path: <SRS0=+2Q0=DW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A66C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 17:03:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68C2622210
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 17:03:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yQQO99ne";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bxiaOgrZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68C2622210
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SQBykdYMZfG2SMtTxnuLQ5SdhWKM/8TIdtxB0oGV4ms=; b=yQQO99neCcPLYQeRn0xjvd2qv
	MUT5fscrXTfh2NKTVd3MxUM7Vm2n1hlAY14njG5Kt5P2m8LepHQ0FFCIKHSmX4KC5g1A5qSViyrLp
	jEPO2pX52G3aHDfHoZdsvmMSQXgUOjW+QjUr652IZdjsQMqzbL1XhaZEGe1CTFkEUq363xvAlQ9um
	fy769xXJV6ZOLYK5u1lSWbmnqKNFq13uA5nORcPDKPfYU+Y1tnCbBn3nE7tc8llh4d8ZChy0G0YAd
	99UVTW5oE40ZuDNDVJtooOyb1QgKoAizbaqSmrVOHZ+zJ4YEDlRT17x9CHOSPmpQlDhQmqsWDSNMl
	KogHhaoAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT6eq-000448-Tn; Thu, 15 Oct 2020 17:03:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT6en-00041t-HV
 for linux-mediatek@lists.infradead.org; Thu, 15 Oct 2020 17:03:15 +0000
X-UUID: de9b95ed9499403b9c459a9cf98be871-20201015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=G8rs2gCzhxbEma2709cmrK2Za0pKUpdbsxniLmNg3D8=; 
 b=bxiaOgrZe1S1ZNAETuzinDmJmrNJIcokes+0Gt8pZj40msfYfT6fT2FZVkWh9K1tGkBhNWWUlQkiSJe2QAqDjlE/3xL/FmFJVkBBEuhLpa8thlG8hXxRaaVzDZeWaO1Ns5IIoyBgJkzUQTq3F2qF4u4dMHfl1n2PFxJGV3vJm04=;
X-UUID: de9b95ed9499403b9c459a9cf98be871-20201015
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1158770539; Thu, 15 Oct 2020 09:03:02 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Oct 2020 10:03:01 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Oct 2020 01:02:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Oct 2020 01:02:58 +0800
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v10 3/3] binder: add transaction latency tracer
Date: Fri, 16 Oct 2020 01:02:54 +0800
Message-ID: <1602781377-4278-1-git-send-email-Frankie.Chang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <20200916173845.GA3072065@kroah.com>
References: <20200916173845.GA3072065@kroah.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: AA346BA9F015F58D217AFA35FC30F4C5FE4712083E76C7D3ECDC1ED6BC4699A92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_130313_714267_4AC1733F 
X-CRM114-Status: GOOD (  10.94  )
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Jian-Min Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>, Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Change from v10:
  - replace timespec64 with ktime_t.
  - fix build warning.

Change from v9:
  - rename timestamp to ts in binder_internal.h for conciseness.
  - change timeval to timespec64 in binder_internal.h

Change from v8:
  - change rtc_time_to_tm to rtc_time64_to_tm.
  - change timeval to __kernel_old_timeval due to 
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c766d1472c70d25ad475cf56042af1652e792b23
  - export tracepoint symbol for binder_txn_latency_* which binder_transaction_latency_tracer to be ko needed.

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


Frankie.Chang (3):
  binder: move structs from core file to header file
  binder: add trace at free transaction.
  binder: add transaction latency tracer

 drivers/android/Kconfig                 |   8 +
 drivers/android/Makefile                |   1 +
 drivers/android/binder.c                | 430 ++----------------------
 drivers/android/binder_internal.h       | 418 +++++++++++++++++++++++
 drivers/android/binder_latency_tracer.c | 107 ++++++
 drivers/android/binder_trace.h          |  49 +++
 6 files changed, 607 insertions(+), 406 deletions(-)  create mode 100644 drivers/android/binder_latency_tracer.c
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
