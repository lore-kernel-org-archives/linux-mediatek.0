Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F03C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 12:01:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C746C207C3
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 12:01:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="clp9rSVe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dGBv4ArK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C746C207C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AMt2ZuoMsaf5StyeiC6TNEt586koWCTBM1tR0saQFzo=; b=clp9rSVeSiYVA3tMfFoNIuljD
	PpVdw8fUizZ6Fs4I5BkHjYtR5LaOcRQ4yHVYZTghaEjd240XAFheB+3fzR7LHs9fGlKB0gnZZUWNa
	CdsvH5jK0XLDEDjY6uEGSKehNGMwxiCBIt7b1pGxkHrkAG6mMBcV8gnMucRJIpkqwcFStJi2Gr0xd
	ahh/Jf3Wpw5+Pltnl6Jf0dyTQx2wAD15b2AzC6eeL88W9YvO5ZK6FD6LcFaKpinybxGm32/V/TbcB
	Is+I4wSQx8kdUMg14HE+kZNtrjqxoBv2Q8C5sQpwTyTCOl9OS+kFGxxS8i70Nsc9yhtFSYe7jJ5Ei
	WgdwW1b1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFFpq-00055O-Ho; Mon, 07 Sep 2020 12:01:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFFpn-00054N-Lv
 for linux-mediatek@lists.infradead.org; Mon, 07 Sep 2020 12:01:20 +0000
X-UUID: a7790e4968594a7b8ed8998ccd5077b9-20200907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JUcVsy413AmOMLtnb12ZVdnEP4NP18Co8XTq92q97QY=; 
 b=dGBv4ArKhXRVrE38GMJPo9IAdz7QLP7ZQLzmu2urK9voglcAiup/3P+4Kc6fHzIVvJDL5Bj3k7V4SKIITDizMwOA9rdztuiovQEnf21qx5hL9ZE08L9VqbIozqhyGQPSim8qqzIGVfyYRu3WEhBYywZ+KznA7Hue1sSeHOPFhxo=;
X-UUID: a7790e4968594a7b8ed8998ccd5077b9-20200907
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1515019704; Mon, 07 Sep 2020 04:01:12 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Sep 2020 05:01:10 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Sep 2020 20:00:54 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Sep 2020 20:00:55 +0800
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v8] binder: transaction latency tracking for user build
Date: Mon, 7 Sep 2020 20:00:52 +0800
Message-ID: <1599480055-25781-1-git-send-email-Frankie.Chang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <20200907070045.GA605692@kroah.com>
References: <20200907070045.GA605692@kroah.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5F79E32C4879B498ECC0083901FE108F75D4C54F8D5F705B6889A260DFFCD1A72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_080119_842971_E63BC4E9 
X-CRM114-Status: UNSURE (   9.81  )
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Jian-Min Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>, Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

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
 drivers/android/binder_latency_tracer.c | 112 ++++++
 drivers/android/binder_trace.h          |  49 +++
 6 files changed, 612 insertions(+), 406 deletions(-)
 create mode 100644 drivers/android/binder_latency_tracer.c
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
