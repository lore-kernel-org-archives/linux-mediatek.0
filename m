Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826F6C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 12:06:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28F4460F22
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 12:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28F4460F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kuq1iLOccbOnJXcZJ0O0OB527vMpX1RqxpL9kVaxLEI=; b=ls+MoiEdBK/9eq
	ujtpuNQ8A9Wuw7CxgNkSngT07BagNpx7zuXAMGz1REnSHkrTGgfwJlsp6Pt8wkh88h57nsLnBpLST
	2hmCzBVcQkQyj5JgqctR5YWT0IDuDJmCRZHX5no9mRNYZpte6yajgATWY6uwFvQfvUNe3d3g5dmmh
	qhKSA0eYX6rqUy56qotaXREW7d1id/5Vc/4WAi2d7irdfPvT/1vYXewSl/g/wAYiw4xRFJkvRpyHE
	4HlkFnNtd2UWwN9Mp63/gPhnaLZOc3Cff6a5cePappyVmuA/DgbScGPAOCAibwrc/3q3tjguyZcQd
	Mh4ZuWPlei0NYTD/SdnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDn0N-006tdh-Ap; Wed, 11 Aug 2021 12:06:43 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDn08-006tZc-Cx
 for linux-mediatek@lists.infradead.org; Wed, 11 Aug 2021 12:06:32 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so4784520pje.0
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Aug 2021 05:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ufaB+OMXdYU7j7TBo3XtAZpCHOejyA+3wA93Op1lzU=;
 b=t8lLzjPFZAWIYgTJOrFd2HG+scMTfIhGn3oErjtmiM//ccrcySFz8JOOZKulU+EiNL
 OXO+8zbdgMhoqwmYzFPpIQvy4NwR+3xGy5J0bpgHy4m6WaA+Vf+QrgkpMTwpC5PcNtPD
 +3lIVvpcRqaoz4+sOPxLsf88Wq0iRFXBDSECTlXfjDnmdjovXDpk2WgY//lc1NDMlyiD
 OH+cO8WaQ/hiuH1bJmO6CiXIanr5Wlii23Zg8EHPNS8qNTCNeQvGb7mbutXNddc+MLFl
 bh2hLW7kZP4owycILCEv6xAz8aM45z9ROAHxGDHqSi3Dwf27fyvzFcDHRtXM4FVUR9Kw
 QHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ufaB+OMXdYU7j7TBo3XtAZpCHOejyA+3wA93Op1lzU=;
 b=hxY8HYz+a1zNLgS+glrfMM177WvpJnYN+5sN/3yjcJYcySYmWmUAbsCPkqQoZFkKpZ
 veaDBiN+yL49ViGDZ7O98Oi6EiWz+3o7wWhmcRFBvswhRw6U9Q9TDXOVVwufO2U4cF9W
 l7/idNcqdi9Qst93F7++f/iCsy86ynSeC75Itno1jns7TfJujagZDROg5G90FYSaReaK
 61s6Ae7Rotq3eMkS+jaeP9KirrdQAmw5kco3Aj8cr3s1GqBDvndCCMXMpAWhGHSIOz/G
 ATbPVm2nIEzBeSkX6p1V/0ulce8XOFRoLL9lhVstyHC/sjCXElgYAtHMxfhoeOAhbUj7
 +IzA==
X-Gm-Message-State: AOAM532COjgB2ik4pPhmN7vUedrzXWroRYQBnv5C8HFca93GhTgPW+pW
 wnLI/vxG2+NIB17teClEwnMIaQ==
X-Google-Smtp-Source: ABdhPJwMwN2fm97TlkXuwYPxuFuL4cxb2WPXC0Be7ZXZT7ga2QkHLotZZsNvgbZMaOm1uLqj8hwR+w==
X-Received: by 2002:a63:4b60:: with SMTP id k32mr562898pgl.198.1628683587396; 
 Wed, 11 Aug 2021 05:06:27 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id j22sm31239903pgb.62.2021.08.11.05.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 05:06:27 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Lukasz Luba <lukasz.luba@arm.com>, Quentin Perret <qperret@google.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH V2 4/9] cpufreq: mediatek: Use auto-registration for energy
 model
Date: Wed, 11 Aug 2021 17:28:42 +0530
Message-Id: <c643714aa4e525aea4d54c2fd35950c046555621.1628682874.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1628682874.git.viresh.kumar@linaro.org>
References: <cover.1628682874.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_050628_487701_686B4E20 
X-CRM114-Status: GOOD (  11.44  )
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

Set the newly added .register_em() callback with
cpufreq_register_em_with_opp() to automatically register with the EM
core.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/mediatek-cpufreq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 87019d5a9547..866163883b48 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -448,8 +448,6 @@ static int mtk_cpufreq_init(struct cpufreq_policy *policy)
 	policy->driver_data = info;
 	policy->clk = info->cpu_clk;
 
-	dev_pm_opp_of_register_em(info->cpu_dev, policy->cpus);
-
 	return 0;
 }
 
@@ -471,6 +469,7 @@ static struct cpufreq_driver mtk_cpufreq_driver = {
 	.get = cpufreq_generic_get,
 	.init = mtk_cpufreq_init,
 	.exit = mtk_cpufreq_exit,
+	.register_em = cpufreq_register_em_with_opp,
 	.name = "mtk-cpufreq",
 	.attr = cpufreq_generic_attr,
 };
-- 
2.31.1.272.g89b43f80a514


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
