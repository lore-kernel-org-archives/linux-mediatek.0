Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2417CC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 03:36:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C74FE20714
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 03:36:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i7VbZADF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="a1ck6GHo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C74FE20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vm32OC3Bc5J6BCvyfKGhwhDdsu1u9UITnc7Qrtyd8g8=; b=i7VbZADF9HKugP+nC7fuFEAkaE
	lRpICZP0ABf6Bt9+5uSftEajfyXGqkx9vP1qSjEWDi1lgILgNwyG7nreDzlzPGXX+CJ2BqKSBnBDG
	zXY4G6GLeiogWBlJeSc4SZKgAN36GMHolnffSSk4gKqCu0qlFn90mQN6my5gITC49SWJlQYrKdDZT
	FgClzc8rZb+PtHRWV16+nKkmUWbQkTsQpCqYH4+MalIT9Ods59QbS4jVluuRz8Ppim6ljZYR1Jy2Y
	JS0pWMWvJrY4mvevkCJjDR9x0tR5AsnnE2y7IYusazKG3MSOtjESJkIUmkbTMramsGobQqD5PQOkt
	puFaUQSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jztvk-0005nP-70; Mon, 27 Jul 2020 03:36:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jztvg-0005mq-Kh; Mon, 27 Jul 2020 03:35:58 +0000
X-UUID: 365511a808a040948e3dfaa1664de131-20200726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=eSopwLpH/77DG0bJJS5cJFVvSCyQIzU5BBA1AxHDxlA=; 
 b=a1ck6GHoJ6jLtLN3ma2OO38vM0av3wzNJHxpBikaAeOyA/qOmNOzDx4PAej1Xk4CRugb+ZheHT7dHCR9HkW6dcz9uX9Dg3C91BvzCW6Sa0PPNRhkGa++xQvBYcgSAv3WBnM68S+8g5KtzPMkR05ms1pNbhudAZD3U6ej1sfGOUc=;
X-UUID: 365511a808a040948e3dfaa1664de131-20200726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 310707682; Sun, 26 Jul 2020 19:35:50 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 26 Jul 2020 20:25:49 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 11:25:47 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 27 Jul 2020 11:25:47 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Jacob Pan
 <jacob.jun.pan@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v3] cpuidle: Fix CFI failure
Date: Mon, 27 Jul 2020 11:25:45 +0800
Message-ID: <1595820346-4361-1-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: D08AD23496ADA7D400167910677C0DCFFBB567C0F76E1255568C6D18DA940D892000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200726_233556_862557_4F573929 
X-CRM114-Status: UNSURE (   7.42  )
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

changes since v2:
- add more comments on enter_s2idle to explain why it is necessary to return
  int even if its return value is never used.

changes since v1:
- add more description in commit message.

*** BLURB HERE ***

Neal Liu (1):
  cpuidle: change enter_s2idle() prototype

 drivers/acpi/processor_idle.c   | 6 ++++--
 drivers/cpuidle/cpuidle-tegra.c | 8 +++++---
 drivers/idle/intel_idle.c       | 6 ++++--
 include/linux/cpuidle.h         | 9 ++++++---
 4 files changed, 19 insertions(+), 10 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
