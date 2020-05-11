Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204E3C54E4B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 11:24:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1E0720722
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 11:23:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W4BdouH9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1E0720722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5HtuOhkV0UANxtEBbrtQ/mjvaebKRdd4xKbLqzRfYvU=; b=W4BdouH9bi0OiWZ++/TlcO9bdO
	J7kGUDkFtLyvYlRYKGdbYLvOT/YOQP2ZNHK20h27qrGGdn5iRl9TruQblY265L8g1MYuWtQq0Ilc0
	i4At/+uGpIoa099kZN9mZ/amH9+IkTq2kQgEVdGG/vw7CUj5T+a/zjjTVW4njNbOe7nRB72MdJfi2
	AOnHahKQe0pt3Lho4QVOASHrd1/IWhHMeVndP1oD2JhAmShiG3n8KFVkKwl7ibkZiIILAD9Ou3tY3
	fiRU46gXGUGMlfUZeOxzxpnqsX2c3IJfnTIrGJH0shGfcBn+/ZN1zYEgoaRjzPLLntBogH0PwlVPM
	RwdBXeGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY6XF-00025w-Vd; Mon, 11 May 2020 11:23:49 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY6Ui-0007yE-8h; Mon, 11 May 2020 11:21:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86A441045;
 Mon, 11 May 2020 04:21:11 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.37.12.83])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DC05D3F305;
 Mon, 11 May 2020 04:21:01 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v7 09/15] thermal: devfreq_cooling: change tracing function
 and arguments
Date: Mon, 11 May 2020 12:19:06 +0100
Message-Id: <20200511111912.3001-10-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511111912.3001-1-lukasz.luba@arm.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_042112_398735_D1D9FD5D 
X-CRM114-Status: UNSURE (   9.12  )
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

Prepare for deleting the static and dynamic power calculation and clean
the trace function. These two fields are going to be removed in the next
changes.

Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org> # for tracing code
Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 drivers/thermal/devfreq_cooling.c |  3 +--
 include/trace/events/thermal.h    | 19 +++++++++----------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index f7f32e98331b..52694d4bd819 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -286,8 +286,7 @@ static int devfreq_cooling_get_requested_power(struct thermal_cooling_device *cd
 		*power = dyn_power + static_power;
 	}
 
-	trace_thermal_power_devfreq_get_power(cdev, status, freq, dyn_power,
-					      static_power, *power);
+	trace_thermal_power_devfreq_get_power(cdev, status, freq, *power);
 
 	return 0;
 fail:
diff --git a/include/trace/events/thermal.h b/include/trace/events/thermal.h
index 135e5421f003..8a5f04888abd 100644
--- a/include/trace/events/thermal.h
+++ b/include/trace/events/thermal.h
@@ -153,31 +153,30 @@ TRACE_EVENT(thermal_power_cpu_limit,
 TRACE_EVENT(thermal_power_devfreq_get_power,
 	TP_PROTO(struct thermal_cooling_device *cdev,
 		 struct devfreq_dev_status *status, unsigned long freq,
-		u32 dynamic_power, u32 static_power, u32 power),
+		u32 power),
 
-	TP_ARGS(cdev, status,  freq, dynamic_power, static_power, power),
+	TP_ARGS(cdev, status,  freq, power),
 
 	TP_STRUCT__entry(
 		__string(type,         cdev->type    )
 		__field(unsigned long, freq          )
-		__field(u32,           load          )
-		__field(u32,           dynamic_power )
-		__field(u32,           static_power  )
+		__field(u32,           busy_time)
+		__field(u32,           total_time)
 		__field(u32,           power)
 	),
 
 	TP_fast_assign(
 		__assign_str(type, cdev->type);
 		__entry->freq = freq;
-		__entry->load = (100 * status->busy_time) / status->total_time;
-		__entry->dynamic_power = dynamic_power;
-		__entry->static_power = static_power;
+		__entry->busy_time = status->busy_time;
+		__entry->total_time = status->total_time;
 		__entry->power = power;
 	),
 
-	TP_printk("type=%s freq=%lu load=%u dynamic_power=%u static_power=%u power=%u",
+	TP_printk("type=%s freq=%lu load=%u power=%u",
 		__get_str(type), __entry->freq,
-		__entry->load, __entry->dynamic_power, __entry->static_power,
+		__entry->total_time == 0 ? 0 :
+			(100 * __entry->busy_time) / __entry->total_time,
 		__entry->power)
 );
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
