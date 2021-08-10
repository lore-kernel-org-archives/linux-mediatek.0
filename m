Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0EBC4320A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 07:37:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE3B361077
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 07:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE3B361077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xJGqep9QEdRIIhpuk4bzXvjybNjpqB1r+KhHT7A7G/E=; b=0pL8qvDy5io7Ko
	agAcQrqC8oIih8euVQsDVkzTnKm2L4UzKiuMzmyBdfTG2DEn5vjrh4MedxMsjsMZOrp1BWvI2QAda
	p/AOJ4VLmMEI9ms7lSvI0qm31bZUgRVAXhAshwLMjq/WRYR5SRoG3zhv6MVh3pjScDmPsojidqNpa
	El7oJX6S7aJ2Xff1ysgzDNZDQa2NiQCSX8WbTQ0UifFWxQzOrlfEr9ZhydUaXKXFTpJlPNhF4YE3b
	RHFzbB8EFggH+qES1R+xy8h+NZHFaO27f0WEny0ArQusvyiaWkZNr2EZsKvv+67XtArWLula4g3is
	EkuvZoVhndfe5Xg6uuPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDMK8-002koW-RM; Tue, 10 Aug 2021 07:37:20 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDMJt-002klN-1k
 for linux-mediatek@lists.infradead.org; Tue, 10 Aug 2021 07:37:09 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 hv22-20020a17090ae416b0290178c579e424so4041956pjb.3
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Aug 2021 00:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gp9yqcscf7/Q8S71rNb+DklCmCjBfuOZWtoJrdKgq14=;
 b=IAglVf6Pn8I8I9dsDbHjIfeAkSA/yD6E0MfLksr0I3bbp7rSOQLo46sTKTKHyl9KbR
 1/Ax/Ap4XrXSvqSfj4UKWMsMiK2Qlt+w+AwybJt6Afct7yPg8QghYKttCJvCY/xqXvkm
 SkVBZJ83g65LBxLJZxqL82lCxNFSOhBzmTWP+VjWSx6JwYTMIlwFMEqzKCpRoO2ZHeMy
 iLi9J2g4OA/gouk7AIivwb3wNG0F55BWN3FaLUULACXKVzJzbp8T6EZqU2AN3WsvBWuT
 6xKHRzNBm8HKbeykYID8qlR3XXsS6uZSkgeIJMMAyf3R73Ni3U2SsNf7QyhEebDAbH1k
 0nNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gp9yqcscf7/Q8S71rNb+DklCmCjBfuOZWtoJrdKgq14=;
 b=ij2G8H53QNOgRwYAxNFWBYi3zhGj1x4fHOUKZjrMW5gvT9hU0VB2KoWova7QA6qXci
 1FAKVHfq7NDI3ykCoJqbs3hEvd6l5Z9DgAj+qfv9iS8WuQrgWC9pJ3ZQWfh1CXrZFrkp
 qRUKz27T59nYSLypJjCicPWlChFXg04B+grEdgncKj/RW8fSC0eTmwuvZXMelnjmyVuG
 xUCE9vij3T9gRbJfGh5HN8hZLHAWL+IyCnqfi7bP8QAEOpFfXAnWTHFq4VcE9FuTV5Uj
 OS5UGFm4HO6GjcIayx/uYpXjM9QilEBM/b49KxsmP8StKzIMNOAC38PSHk/IaPzHw1VY
 9Fvw==
X-Gm-Message-State: AOAM530WImGrvwBM/K9ScbtgSHj+NF5/k2WGq/D1KT/NGNjb89nOs2Ns
 6RQyXXjrToEZ1BI9Cuadz7nN4Q==
X-Google-Smtp-Source: ABdhPJxILYrr525KX9FnT9P3v0D4xd0mT7Xu47cl+ZsvaVSJ3lXE+EgGIYbCSv1kqvc+zewvjPYhrA==
X-Received: by 2002:a17:902:b601:b029:12b:d9a:894f with SMTP id
 b1-20020a170902b601b029012b0d9a894fmr350019pls.63.1628581023914; 
 Tue, 10 Aug 2021 00:37:03 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id v14sm1734591pjd.35.2021.08.10.00.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 00:37:03 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>,
 Vincent Donnefort <vincent.donnefort@arm.com>, lukasz.luba@arm.com,
 Andy Gross <agross@kernel.org>,
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
Subject: [PATCH 0/8] cpufreq: Auto-register with energy model
Date: Tue, 10 Aug 2021 13:06:47 +0530
Message-Id: <cover.1628579170.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_003705_171992_4E5E9E51 
X-CRM114-Status: GOOD (  11.07  )
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

Provide a cpufreq driver flag so drivers can ask the cpufreq core to register
with the EM core on their behalf. This allows us to get rid of duplicated code
in the drivers and fix the unregistration part as well, which none of the
drivers have done until now.

This would also make the registration with EM core to happen only after policy
is fully initialized, and the EM core can do other stuff from in there, like
marking frequencies as inefficient (WIP). Though this patchset is useful without
that work being done and should be merged nevertheless.

This doesn't update scmi cpufreq driver for now as it is a special case and need
to be handled differently. Though we can make it work with this if required.

This is build/boot tested by the bot for a couple of boards.

https://gitlab.com/vireshk/pmko/-/pipelines/350674298

--
Viresh

Viresh Kumar (8):
  cpufreq: Auto-register with energy model if asked
  cpufreq: dt: Use auto-registration for energy model
  cpufreq: imx6q: Use auto-registration for energy model
  cpufreq: mediatek: Use auto-registration for energy model
  cpufreq: omap: Use auto-registration for energy model
  cpufreq: qcom-cpufreq-hw: Use auto-registration for energy model
  cpufreq: scpi: Use auto-registration for energy model
  cpufreq: vexpress: Use auto-registration for energy model

 drivers/cpufreq/cpufreq-dt.c           | 5 ++---
 drivers/cpufreq/cpufreq.c              | 9 +++++++++
 drivers/cpufreq/imx6q-cpufreq.c        | 4 ++--
 drivers/cpufreq/mediatek-cpufreq.c     | 5 ++---
 drivers/cpufreq/omap-cpufreq.c         | 4 ++--
 drivers/cpufreq/qcom-cpufreq-hw.c      | 5 ++---
 drivers/cpufreq/scpi-cpufreq.c         | 5 ++---
 drivers/cpufreq/vexpress-spc-cpufreq.c | 5 ++---
 include/linux/cpufreq.h                | 6 ++++++
 9 files changed, 29 insertions(+), 19 deletions(-)

-- 
2.31.1.272.g89b43f80a514


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
