Return-Path: <SRS0=ODC1=66=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B29C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 12:50:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61DDA207CB
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 12:50:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SwGX/BHJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdZgSeub"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61DDA207CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KWno5Ob8xSyndt/HfKk7vjNzQanRhNZc5XoJz1edh50=; b=SwGX/BHJgGJcVv
	lz7VEJ3VOoAcX3wC9ynhXTow4Pbh8GWjGqh30hYEJYs47rXSXeDg28ItmLdmiQw3zQOnTZak9oR7Y
	smo60gdq5N53BzwmM7y/bQ+fYMN62ahX89wziynxXHYLupYCIDvvb9tZjlR804neOBXW1DyjDCUQo
	8wDpicdvwrTktFBwvAXm/JRksLMy6J3FhzZJ5x6SjN0lmTWLNlAapvw8+o1EP2qIvPQBK8BklJkWd
	Ytq/GRgDFCAHKGc3EJNdWbktLWfIV9pBxSY8JqfimQtBSMR5t1WAdXQ97DR8gxScdv3EtaH47xO7g
	OgbFf1apiOENqgt5NMkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZwGY-0003Ae-P7; Sat, 16 May 2020 12:50:10 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZwGP-00034U-N8; Sat, 16 May 2020 12:50:03 +0000
Received: by mail-pj1-x1042.google.com with SMTP id ms17so2329191pjb.0;
 Sat, 16 May 2020 05:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y/pu6s9heqLQoPscPRtZWIfWJlyEAE3JhcWqjsVnWMo=;
 b=RdZgSeubYs284jc/aj+vQ6MytNBYmTMw9MitZUl3I4N9Iup5ZDFXQE6pvEMdjkcCF1
 ZspPNeToui/wJwJEKDNqRBmdT9QxQhHaD+UBSTScFwosklKooOUmuMHG+ibsYSN2Sxu7
 XfZ8/4fDYQXF7M2q6ZZiO/6RKWgWI+5UeI2hHs1YYBcxHsYy9Ay7/4mTDkfgUA6UtDcv
 Si34VJBFujnZx+3IkwWZnIp9wJciQAKYEnjPeLS3E0usZhOBq5SenAZOfJdE76R8gSCb
 qURUDvhC8wIVwNy9CKGnVqroqfv7MUmYNQj50xuYHhmHl2eSuNcgMpHRudn7fTro3q7O
 MG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y/pu6s9heqLQoPscPRtZWIfWJlyEAE3JhcWqjsVnWMo=;
 b=Xti6Id35I3M8oTVtaBcx2kKeZCPhXebvruomSoA7tflSUeZOOPZRcl8L3xMrw2Oa9J
 NHBvEZAALHAbqOrZLvqqSm2Rc0djE2wemaRv9zAA/O1J+ZCMuZN4uFF/tNJOsuoRDYcC
 TUIzSPjrF89XlrIcLenjt40BnDk3CuJ3eABrZxV+CtPA123cO+yaz8tiOLprtDqzuegd
 At1wqcAS+JBY0FOwPmYxUx398IPhRvFqq34bUiZamv0xwYDOCF2gRkEiRqnE2gpE1sdr
 qOVQKT7bs39quOqv19E+yrUUloEYdWx31GBGJbqDtGgehUwhpAkYcdYAbBsR2JiyJkSr
 xodg==
X-Gm-Message-State: AOAM533RCNdXnRjTWzTNS/aNm1CeKzkyi77bCU5rZiEiPMNrYI6h4iOo
 Iqs7Pl1YoEVvc5wCdB08hacABzOT
X-Google-Smtp-Source: ABdhPJy2I3ru751urDomegpMHM+LuOGE8PrXhFnO8+ShubkkeVhH+WuYkkZ2G/DJlpcqL/9BEjaeFQ==
X-Received: by 2002:a17:90a:c584:: with SMTP id
 l4mr8877644pjt.195.1589633400684; 
 Sat, 16 May 2020 05:50:00 -0700 (PDT)
Received: from localhost.localdomain (61-228-240-171.dynamic-ip.hinet.net.
 [61.228.240.171])
 by smtp.gmail.com with ESMTPSA id k27sm3768323pgb.30.2020.05.16.05.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2020 05:50:00 -0700 (PDT)
From: Lecopzer Chen <lecopzer@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: perf: Add support for Perf NMI interrupts
Date: Sat, 16 May 2020 20:48:54 +0800
Message-Id: <20200516124857.75004-1-lecopzer@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200516_055001_777203_98FD5819 
X-CRM114-Status: UNSURE (   6.29  )
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
Cc: mark.rutland@arm.com, lecopzer.chen@mediatek.com,
 Lecopzer Chen <lecopzer@gmail.com>, alexander.shishkin@linux.intel.com,
 catalin.marinas@arm.com, jolsa@redhat.com, acme@kernel.org,
 peterz@infradead.org, mingo@redhat.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, namhyung@kernel.org, will@kernel.org,
 yj.chiang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These series implement Perf NMI funxtionality and depends on
Pseudo NMI [1] which has been upstreamed.

In arm64 with GICv3, Pseudo NMI was implemented for NMI-like interruts.
That can be extended to Perf NMI which is the prerequisite for hard-lockup
detector which had already a standard interface inside Linux.

Thus the first step we need to implement perf NMI interface and make sure
it works fine.

Perf NMI has been test by dd if=/dev/urandom of=/dev/null like the link [2]
did.

[1] https://lkml.org/lkml/2019/1/31/535
[2] https://www.linaro.org/blog/debugging-arm-kernels-using-nmifiq


Lecopzer Chen (3):
  arm_pmu: Add support for perf NMI interrupts registration
  arm64: perf: Support NMI context for perf event ISR
  arm64: Kconfig: Add support for the Perf NMI

 arch/arm64/Kconfig             | 10 +++++++
 arch/arm64/kernel/perf_event.c | 36 ++++++++++++++++++------
 drivers/perf/arm_pmu.c         | 51 ++++++++++++++++++++++++++++++----
 include/linux/perf/arm_pmu.h   |  6 ++++
 4 files changed, 88 insertions(+), 15 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
