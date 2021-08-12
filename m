Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D34EC4320A
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 04:36:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFDF061019
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 04:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFDF061019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rycCvoYeR7hN+n17T2w06Y39Lmj3bZA1cWK066raZv4=; b=Zug2IgRamQBIVP
	ZNibxFg0a8SaG59TH+Zp/w+qpYkO8X98vLX9KEu1kY8OwTbePzyBGYbWdDkwke/Lss+Y+u4Eg38cN
	fxgmI0Wd1hf5eQK1j36EgJFoGlux/8BchvAyEa7Zg4CTS9m3KQAxdDyO53uEp+jdNSlpd7BXJOvpQ
	p2RViMw5i0y0ZJmvgnaXON/nHau8qWF1qisLZAcetr/qoUZ3aT7WZPo8A0CcbmEXntc00oVK/Oelc
	g4YvCEj+aMpLKS9mfTTePB7/HCPpczNwD2CMiye1dLqaruheHvjwFVSvsPrKOQkjZObSwcVRcm2n0
	FkPPR4wl9szJZX1Yk/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE2Rd-008aVy-MY; Thu, 12 Aug 2021 04:35:53 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE2RY-008aUu-5S
 for linux-mediatek@lists.infradead.org; Thu, 12 Aug 2021 04:35:52 +0000
Received: by mail-pl1-x634.google.com with SMTP id d17so5591951plr.12
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Aug 2021 21:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gxr+kN6SetTz50b/VYivr0ZuxkSNxFN7jKWgrcYWkys=;
 b=S1St+GitlDcWedfmRSFXGJimehgFJFlFJwttWDdN3zwMXbC6pb4l3lsPKEyWRkGHT4
 hj9LanR1X1hmDGTxbFNTh/HHOKWVEnuDZfgYbxGVXo3MUos0btzQLY1ssDN9j0N7AHhL
 Pu44FndYuRVG9rtcQMyDyV4EmtQs4oqkIkFl+XfKvg6+Vao0c8+3kx8PqON9bX+JdMBl
 aIq7jZYDN4rflT6LH0T9TIARx4Mxgc/yDJfjP//GgTvrgmSqM04S+JVjOmKlX7saeAp5
 5ADWwmehJpMTRJ9Re+vvybV419/uXAoHdupfeo6URKjlLwTxfWFuma6Rv1rECl3+e0gB
 0TEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gxr+kN6SetTz50b/VYivr0ZuxkSNxFN7jKWgrcYWkys=;
 b=M6kMBdagaVgQ/iGhMggsuUrV/5IjmMBnNExCXTRPoK+9AGr6CN9FTy/aqUHzPgYE+d
 eQmM1Exdu2HUHvwLWZQwCfp0PX+AQXKy3PKAhZ9bPHf+qYv6eo034SCnh9D8GWvt0Xcq
 AckW3u5K54waxZoI0wYHfsHkp5n03gqlprknWWtH/4GyZe0dwOEOzRA4dd07OsRxbJ9t
 eSLcuh7Zc8CaDmGSxilp3e/eP9ECTI3PJcsU1pXFFGJJ8Y8SbQRewL8Lvaz+/3Co5XNS
 6anKwNJf8vFGvCXCY1LJ+exn7594UMQO3b9mOVmXGtHlgmReUja+rWfhNSmHJw384mk+
 TwYQ==
X-Gm-Message-State: AOAM530/FTVLi0xP5JJK3AoDo+vMpG3RFcxS9QhD17D8CSwsvyH3FU+/
 1nahvwE+awkMvBauXzWanqwhAg==
X-Google-Smtp-Source: ABdhPJydv+lAOJdvjzc80FCXMzAsQnjZgaDpNJlleVqm7BNMfhuu1ZD0GXkUb8D3PJVRnvy/JGxrcQ==
X-Received: by 2002:a63:4423:: with SMTP id r35mr2089732pga.358.1628742945985; 
 Wed, 11 Aug 2021 21:35:45 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id z13sm8264118pjd.44.2021.08.11.21.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 21:35:45 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>,
 Vincent Donnefort <vincent.donnefort@arm.com>, lukasz.luba@arm.com,
 Quentin Perret <qperret@google.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org
Subject: [PATCH V3 0/9] Add callback to register with energy model
Date: Thu, 12 Aug 2021 10:05:13 +0530
Message-Id: <cover.1628742634.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_213548_278327_315144C0 
X-CRM114-Status: GOOD (  11.83  )
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

https://gitlab.com/vireshk/pmko/-/pipelines/351965580

FWIW, I have queued up the series for linux-next to get more testing, but your
reviews are welcome. Thanks.

V2->V3:
- Drop the auto-register part from all logs, this isn't called auto registration
  anymore.
- Call register_em() only for new policies.
- Update scmi driver to register with EM only when required.
- Add Rby tags.

V1->V2:
- Add a callback instead of flag.
- Register before governor is initialized.
- Update scmi driver as well.
- Don't unregister from the EM core.

--
Viresh

Viresh Kumar (9):
  cpufreq: Add callback to register with energy model
  cpufreq: dt: Use .register_em() to register with energy model
  cpufreq: imx6q: Use .register_em() to register with energy model
  cpufreq: mediatek: Use .register_em() to register with energy model
  cpufreq: omap: Use .register_em() to register with energy model
  cpufreq: qcom-cpufreq-hw: Use .register_em() to register with energy
    model
  cpufreq: scpi: Use .register_em() to register with energy model
  cpufreq: vexpress: Use .register_em() to register with energy model
  cpufreq: scmi: Use .register_em() to register with energy model

 drivers/cpufreq/cpufreq-dt.c           |  3 +-
 drivers/cpufreq/cpufreq.c              | 13 ++++++
 drivers/cpufreq/imx6q-cpufreq.c        |  2 +-
 drivers/cpufreq/mediatek-cpufreq.c     |  3 +-
 drivers/cpufreq/omap-cpufreq.c         |  2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c      |  3 +-
 drivers/cpufreq/scmi-cpufreq.c         | 65 +++++++++++++++++---------
 drivers/cpufreq/scpi-cpufreq.c         |  3 +-
 drivers/cpufreq/vexpress-spc-cpufreq.c |  3 +-
 include/linux/cpufreq.h                | 14 ++++++
 10 files changed, 76 insertions(+), 35 deletions(-)

-- 
2.31.1.272.g89b43f80a514


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
