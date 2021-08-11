Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6378BC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 12:06:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CDF560F56
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 12:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CDF560F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=odhYGCfkPpoCfk7qfSOeeRaxyVJscm/H3S1wtvBchkc=; b=k152YYSGwkU+RU
	hHRQ8VFuKEsfZCoBJJuBKDyF+YtKO8K9NtYrwokDHZjwlyKlgsi/sROjxeLy95+aw6NAOIMEk7Il8
	eLVhYDFZVHvfq9BK+UhmqT6w9qHG2BmEz5oFgYV7bFixrAYCetMSbl6Mud++WhY1XAzE311XKo+IK
	eG4rjoAR+kB6yTAHAczFY1VtgJO2XnfdoEGXutIlyeGIuZAB0lXVcNPe6mEucsqz/d0SFvbuV8Hv6
	CkLOidqcVDd1oxnxvi2T0eRhqYyucXWLDgDwZ5aLs51tWSFtNLMVuRXgEv7qxqFAo59nDu0i7ICDi
	blUGyAFaIkuVfW0ISHTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDn0B-006taL-8Z; Wed, 11 Aug 2021 12:06:31 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDmzv-006tWn-8s
 for linux-mediatek@lists.infradead.org; Wed, 11 Aug 2021 12:06:19 +0000
Received: by mail-pl1-x62c.google.com with SMTP id e19so2387013pla.10
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Aug 2021 05:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FKg83oB/EOubumHMLyW/+CxlonCs6Sr8DZwUqs7o61s=;
 b=hVsCtquq6U45kkQsI7Vj3hNlKPy4eJSsAmLAbQEn+7pXV2fOQSrxopruKn3Ijor4hJ
 G3XsS5s9jVLqw0cMSMl5wK6FVWYmItaavWYetcFnlX4D5xn3TCcyZaVSIVPzMQQJ6I5R
 dx1WDeV5O6HZSPu941m4uq2vC2UQNKfSo7DfOH5e2VWf4Gw+gb0cgXH7QF8UrNJHR05Q
 ASd86ZctPo0kjcQxyD0AcAr7jotdkEb09HtawOdq2Yg9MgJ7Q7EkgYv6WJZ8hN8c7JGa
 czQYiGXR9gLjmD+F/9aozWcLXiB4+NT46gLj7Ed2ICK9sOgrgVSsXmWHZmxmz0ZpZed1
 iI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FKg83oB/EOubumHMLyW/+CxlonCs6Sr8DZwUqs7o61s=;
 b=SCjAcHgSH56f+aJuYN/pYDBD+mejCh7wi58hdSyzvJ4kCguYgJzrWfSBoj6QQoxpTr
 AiTszKtMbEA85Knu9KpnMEcxdr7Vuc9ekzI4sP+uYiGUnXWFfA+W8VmQu0nATB93lXQs
 27rKLcNffrMEZruvpjoG+IPtBCG01Yc81TmVqp9MWxusYj9iiv6DGtNBjZWMZX4LPRx5
 Pp3NRGGUpl4oMeuKuqi39FsI2jjHVj0T9P2kWq7Xo/2UQe4202LtADvGJTNZP112hHIZ
 fy6Uei7ip2TfGDzqEQzIox9xC6te2NEuQXequEhuO2W4BUOWoKhcE0XgEiHzp0DlctxH
 rw3A==
X-Gm-Message-State: AOAM530yW0WXzN2mdrKLdhFynCgNnIWUbQx2s4GJ1seKGJ9+H0VUrlyJ
 zg5GVdzUyBrSMtEoqJTD3vf/CA==
X-Google-Smtp-Source: ABdhPJztfFMMqUn9AEZt5iJ8AdfS9ivDU1oMjYwxS6YRWF0FK+JSOzQ526ggirfhbR8GWllwV35JIQ==
X-Received: by 2002:a17:90a:404a:: with SMTP id
 k10mr37162653pjg.145.1628683574049; 
 Wed, 11 Aug 2021 05:06:14 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id v20sm2695779pgi.39.2021.08.11.05.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 05:06:13 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Lukasz Luba <lukasz.luba@arm.com>, Quentin Perret <qperret@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org
Subject: [PATCH V2 0/9] cpufreq: Auto-register with energy model
Date: Wed, 11 Aug 2021 17:28:38 +0530
Message-Id: <cover.1628682874.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_050615_361381_E2D6982D 
X-CRM114-Status: GOOD (  10.82  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Many cpufreq drivers register with the energy model for each policy and
do exactly the same thing. Follow the footsteps of thermal-cooling, to
get it done from the cpufreq core itself.

Provide a new callback, which will be called, if present, by the cpufreq
core at the right moment (more on that in the code's comment). Also
provide a generic implementation that uses dev_pm_opp_of_register_em().

This also allows us to register with the EM at a later point of time,
compared to ->init(), from where the EM core can access cpufreq policy
directly using cpufreq_cpu_get() type of helpers and perform other work,
like marking few frequencies inefficient, this will be done separately.

This is build/boot tested by the bot for a couple of boards.

https://gitlab.com/vireshk/pmko/-/pipelines/351525873

Note that I haven't picked any of the Reviewed-by tags from the first version
since the idea is very much changed here.

V1->V2:
- Add a callback instead of flag.
- Register before governor is initialized.
- Update scmi driver as well.
- Don't unregister from the EM core.

--
Viresh

Viresh Kumar (9):
  cpufreq: Auto-register with energy model if asked
  cpufreq: dt: Use auto-registration for energy model
  cpufreq: imx6q: Use auto-registration for energy model
  cpufreq: mediatek: Use auto-registration for energy model
  cpufreq: omap: Use auto-registration for energy model
  cpufreq: qcom-cpufreq-hw: Use auto-registration for energy model
  cpufreq: scpi: Use auto-registration for energy model
  cpufreq: vexpress: Use auto-registration for energy model
  cpufreq: scmi: Use .register_em() callback

 drivers/cpufreq/cpufreq-dt.c           |  3 +-
 drivers/cpufreq/cpufreq.c              | 12 ++++++
 drivers/cpufreq/imx6q-cpufreq.c        |  2 +-
 drivers/cpufreq/mediatek-cpufreq.c     |  3 +-
 drivers/cpufreq/omap-cpufreq.c         |  2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c      |  3 +-
 drivers/cpufreq/scmi-cpufreq.c         | 55 +++++++++++++++-----------
 drivers/cpufreq/scpi-cpufreq.c         |  3 +-
 drivers/cpufreq/vexpress-spc-cpufreq.c |  3 +-
 include/linux/cpufreq.h                | 14 +++++++
 10 files changed, 65 insertions(+), 35 deletions(-)

-- 
2.31.1.272.g89b43f80a514


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
