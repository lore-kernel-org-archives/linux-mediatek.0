Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D91C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 02:59:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3CB564F72
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 02:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3CB564F72
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rMdkBttvSI0Rrln35YIrdUNBRNypVRHRgYDliVko2t8=; b=Ft6QIHu/lTs6aA3dtvr28ltQP0
	OI1TZshFQj2wYn6Jx/pu+Y2y5BdEur9dnfJPB5TowgC2rgq1d7Vcjtxmfg5nHibYu2XoIj62ZtVwq
	uLaV+/At4pzbvh0KtcRA3G0MSQqyUQZTcXH53WryBbGBf2YnHc6kqwf225xeVgWFOoKXJehXBZ9HN
	L9aDzVP3kFo7ABuKg4GZ5m9rnwM7SAnG48QvbfRt+AtAwmsaNzuaSn/h8LM31V/gShOrM1dM3PoU9
	aECEQiGGUtieM5adp7T8UUHFZcmNqaS3h0h31n3ofzak4ib5eqnneia3YpwSNds9zKfZTYgwzCnPL
	L9tpfvVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l78Nk-0007QZ-RY; Wed, 03 Feb 2021 02:59:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l78Ng-0007PU-Qk; Wed, 03 Feb 2021 02:59:02 +0000
X-UUID: 5f52293d8592429bab8becd1cac7375e-20210202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Ac/vLvpLQNLg5BwuOpNucb7rUWljIaYh6atw4KBAxf8=; 
 b=UNmYxrnC8H0bqkBfaSuvsYwYkXYjcT+nC+32yMb3ose2JYY1D3E4Kw4tG8uz2yqyohC+G1tT5Gzu1V8NxwY4qKhVh55v1kf6rmD0JSIFhc6wPmpGqwVxcVaWDZ3bwOd2eZU61iPBD1QgyqTI8932gQT2d5ld92hpUTMIe0HMG0Q=;
X-UUID: 5f52293d8592429bab8becd1cac7375e-20210202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 967746153; Tue, 02 Feb 2021 18:58:54 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 18:58:53 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 10:58:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 3 Feb 2021 10:58:45 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rob
 Herring" <robh+dt@kernel.org>
Subject: [PATCH 0/2] Add support for ARM Cortex-A78 PMU 
Date: Wed, 3 Feb 2021 10:58:00 +0800
Message-ID: <20210203025802.30201-1-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_215901_653781_CDD19C61 
X-CRM114-Status: GOOD (  11.64  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Namhyung
 Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for ARM Cortex-A78 PMU since it will be used in
new Mediatek SoC.

Based on v5.11-rc6

Seiya Wang (2):
  arm64: perf: add support for Cortex-A78
  dt-bindings: arm: add Cortex-A78 binding

 Documentation/devicetree/bindings/arm/pmu.yaml | 1 +
 arch/arm64/kernel/perf_event.c                 | 7 +++++++
 2 files changed, 8 insertions(+)

--
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
