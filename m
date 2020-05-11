Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C5BC54E4B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 11:22:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50F3920722
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 11:22:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QEz2Q4cM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50F3920722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=avamQ4AanxflpOhm38u/7PmsxeUfxR+kKrm8IPGMpqE=; b=QEz2Q4cMkm155WBexvWb0WfRKX
	+1/6SxWquEymPbYEfscYy2BmhhOWpMBijYw1BjWlJZi2CjPAVlb43Mjf9Zx/QvgPHPj0mnCDTBdLg
	TPyIsITY7O/u5JIduhhBVgFhfNh+DH1gYLCWa+YoXPV0ZtNRGsAsDlCtfI+WNgeFC4zrmFOHwST+M
	WvMWlbABtHtxpu5QZXEiVn8vvBOfAvIBH4EHRcv/+s81isKHV212KwlrKgjVd5c1JqAyPn/qHSKJd
	GTY7f9cieTqa9WVWtJXeoNxTNIiLs0mhWPxI/JFmuxPYyv37I20mbduF/ys9OryCjsM2Gz+un9dc5
	h4Tm1Jwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY6Vx-0000qp-KW; Mon, 11 May 2020 11:22:29 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY6U2-0007P8-Gv; Mon, 11 May 2020 11:20:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0C5F1FB;
 Mon, 11 May 2020 04:20:29 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.37.12.83])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2FB523F305;
 Mon, 11 May 2020 04:20:19 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v7 05/15] PM / EM: remove em_register_perf_domain
Date: Mon, 11 May 2020 12:19:02 +0100
Message-Id: <20200511111912.3001-6-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511111912.3001-1-lukasz.luba@arm.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_042030_671793_C9C852AB 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, bjorn.andersson@linaro.org,
 bsegall@google.com, festevam@gmail.com, mka@chromium.org, robh@kernel.org,
 amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, daniel.lezcano@linaro.org,
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de,
 rui.zhang@intel.com, alyssa.rosenzweig@collabora.com, orjan.eide@arm.com,
 daniel@ffwll.ch, b.zolnierkie@samsung.com, s.hauer@pengutronix.de,
 rostedt@goodmis.org, matthias.bgg@gmail.com, Dietmar.Eggemann@arm.com,
 airlied@linux.ie, tomeu.vizoso@collabora.com, qperret@google.com,
 sboyd@kernel.org, rdunlap@infradead.org, rjw@rjwysocki.net, agross@kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org, lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Remove old function em_register_perf_domain which is no longer needed.
There is em_dev_register_perf_domain that covers old use cases and new as
well.

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 include/linux/energy_model.h |  7 -------
 kernel/power/energy_model.c  | 25 -------------------------
 2 files changed, 32 deletions(-)

diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
index f5a88486d1c4..6b56ae6c6a89 100644
--- a/include/linux/energy_model.h
+++ b/include/linux/energy_model.h
@@ -77,8 +77,6 @@ struct em_data_callback {
 
 struct em_perf_domain *em_cpu_get(int cpu);
 struct em_perf_domain *em_pd_get(struct device *dev);
-int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
-						struct em_data_callback *cb);
 int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
 				struct em_data_callback *cb, cpumask_t *span);
 void em_dev_unregister_perf_domain(struct device *dev);
@@ -180,11 +178,6 @@ static inline int em_pd_nr_perf_states(struct em_perf_domain *pd)
 struct em_data_callback {};
 #define EM_DATA_CB(_active_power_cb) { }
 
-static inline int em_register_perf_domain(cpumask_t *span,
-			unsigned int nr_states, struct em_data_callback *cb)
-{
-	return -EINVAL;
-}
 static inline
 int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
 				struct em_data_callback *cb, cpumask_t *span)
diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
index 9cc7f2973600..3c5c579ad2c2 100644
--- a/kernel/power/energy_model.c
+++ b/kernel/power/energy_model.c
@@ -322,31 +322,6 @@ int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
 }
 EXPORT_SYMBOL_GPL(em_dev_register_perf_domain);
 
-/**
- * em_register_perf_domain() - Register the Energy Model of a performance domain
- * @span	: Mask of CPUs in the performance domain
- * @nr_states	: Number of capacity states to register
- * @cb		: Callback functions providing the data of the Energy Model
- *
- * Create Energy Model tables for a performance domain using the callbacks
- * defined in cb.
- *
- * If multiple clients register the same performance domain, all but the first
- * registration will be ignored.
- *
- * Return 0 on success
- */
-int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
-						struct em_data_callback *cb)
-{
-	struct device *cpu_dev;
-
-	cpu_dev = get_cpu_device(cpumask_first(span));
-
-	return em_dev_register_perf_domain(cpu_dev, nr_states, cb, span);
-}
-EXPORT_SYMBOL_GPL(em_register_perf_domain);
-
 /**
  * em_dev_unregister_perf_domain() - Unregister Energy Model (EM) for a device
  * @dev		: Device for which the EM is registered
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
