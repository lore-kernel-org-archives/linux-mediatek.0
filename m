Return-Path: <SRS0=Wnqn=AR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8832C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 03:13:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 859DC20724
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 03:13:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lrF0ZBF1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="inyypq31"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 859DC20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mavWScaLJQQg79aGl4aZAd1nkNOG2AKTcB5d21aagZM=; b=lrF0ZBF1AhF8aYfzDzSKXUBIIO
	ZHgMpvr2V59Nd7ozmgcF5y35xhPrk6L9zP8P8UO2vju4DZt9j853OeM4i42xmuYstRqMOIGDo7m8F
	qLo1Sy3xdKKagO4fA/Z2uvfwUt2N+m1lf+uS85rfU1H/QhT28dDlLZMorkoPmwdJ5rC0H0eIM6TJm
	ZWMZXe+lEaWWecLge9N2GzAQZGItt8Jg5LVPApBshXI5qa/ELTJq5q4oRLooUNpYVZ71FOLGOmRwF
	/BcUbzJj7xNAWbmsPHMfiND6FUgJsdSv2XgJc3AnKYywLwK6Jna9MWaYNEo4pv9J/wyhzDXc3se7f
	vMkPNSnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsHZY-0001T5-Dw; Mon, 06 Jul 2020 03:13:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsHZW-0001SY-Af; Mon, 06 Jul 2020 03:13:35 +0000
X-UUID: c8ee041ec6fa48bd92d718ef59cf269a-20200705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=rI2cSHjQuS/pF7F/Z4krS5142urYzV5+3cIRuS8ygxo=; 
 b=inyypq31fagcP7tD51yXniVb6xe+PN9WY1mWviZPj5s0E/4jUyf6C2sdV1MjdpifQoNOwrbV5RMxEq7alFKemWLr2sk/Wa99WO5F3SU2sqAo+8izSGVEXMnIH1hJG98IzazSheWQet61m5gHorkSFdGsEij4aNHwuQMzwDQU5R4=;
X-UUID: c8ee041ec6fa48bd92d718ef59cf269a-20200705
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1390832164; Sun, 05 Jul 2020 19:13:23 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Jul 2020 20:13:24 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 11:13:16 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 6 Jul 2020 11:13:18 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Jacob Pan
 <jacob.jun.pan@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2] cpuidle: Fix CFI failure
Date: Mon, 6 Jul 2020 11:13:15 +0800
Message-ID: <1594005196-16327-1-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_231334_518478_E2800C40 
X-CRM114-Status: UNSURE (   6.71  )
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
Cc: wsd_upstream@mediatek.com, linux-pm@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, linux-acpi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 Neal Liu <neal.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

changes since v1:
- add more description in commit message.

*** BLURB HERE ***

Neal Liu (1):
  cpuidle: change enter_s2idle() prototype

 drivers/acpi/processor_idle.c   | 6 ++++--
 drivers/cpuidle/cpuidle-tegra.c | 8 +++++---
 drivers/idle/intel_idle.c       | 6 ++++--
 include/linux/cpuidle.h         | 6 +++---
 4 files changed, 16 insertions(+), 10 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
