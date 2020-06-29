Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3547BC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 09:09:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00CF4233A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 09:09:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tLgkP1WO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Vvi95zdK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00CF4233A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A2tN5ip7qKYmh/dlxfcdmRA7A4KCO0T/8m54ZXVi4SM=; b=tLgkP1WO3ZJpZOVJL2YQLQ3jWg
	jAT/H5qBTjS9K3vkvC4GIPwOjqAEzYm6a/UEaKpI29WyZ2qUjtk2HoXJ+A7b6GDf2ilA1ESvptr2f
	VlvPEY2CsCUzpG16mFA+dPk0bm/aOYtBQEbW6JSQFVRequdroJMP+44wg79Wr92RD2Sz+mC0YBqwq
	/Mfu6gMWo8upzW34ueL9f4XlyOdKp2xyODLQIhk1jZD+Wkz4XLbdc8fYM9+RWEVgCdEbQIa3iYOzX
	I52VGPokMzQ6SvovCa4l3g7adQfFNDGc5pJbB4O/2SL1U23DAP04m2pgmUs70LACV11aqqazwSGI+
	VWrbfIhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jppnE-0004RM-SV; Mon, 29 Jun 2020 09:09:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jppnB-0004QQ-AT; Mon, 29 Jun 2020 09:09:34 +0000
X-UUID: 7f6e46cef494420c9a60cee3b07e0d4d-20200629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ig0iIX5OqmRuR0jC1ymNu1pDYDa/vcXlkdQxdm8rcZE=; 
 b=Vvi95zdKrB/8CAnhQ3gmKWXUgzFLsn7NyADi5qe4SLju1TdxR0OVSCAFuPSILKRQjajzj8FNU0K6vAYpupcnfVXe9Lvv2zCoOecF4lLkoPN3ucXZ0Pndui/ZnUOLt9qcepXgg7FWg7aLgtiJlHV8xKh7UuZW0Aftl5itIOQ9OG0=;
X-UUID: 7f6e46cef494420c9a60cee3b07e0d4d-20200629
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 893526557; Mon, 29 Jun 2020 01:09:17 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 02:05:47 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 17:05:40 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 29 Jun 2020 17:05:41 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Jacob Pan
 <jacob.jun.pan@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sami Tolvanen <samitolvanen@google.com>
Subject: cpuidle: Fix CFI failure
Date: Mon, 29 Jun 2020 17:05:39 +0800
Message-ID: <1593421540-7397-1-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
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
Cc: wsd_upstream@mediatek.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 Neal Liu <neal.liu@mediatek.com>, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

*** BLURB HERE ***

Neal Liu (1):
  cpuidle: change enter_s2idle() prototype

 drivers/acpi/processor_idle.c   |    6 ++++--
 drivers/cpuidle/cpuidle-tegra.c |    8 +++++---
 drivers/idle/intel_idle.c       |    6 ++++--
 include/linux/cpuidle.h         |    6 +++---
 4 files changed, 16 insertions(+), 10 deletions(-)

-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
