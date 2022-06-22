Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDBFC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 14:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1MA/RDgkO+/P26+QERE8cd/P/DjCZz2b2axPTCwuc4=; b=vwQRKRSoZ0mtXBkgd1SPzB3qkz
	wiFynLQ1X1bAbIBi2eUWeEAbf4eXDLyw37tgppcYbGWKFMIRObtxGL127fhquU1sMIWvp3AaRU/AZ
	nnwEg2FSGKP5Wa4XeD86v4wRgA/U4aCDQTekcPTKzhxgEN96FweuS15rYBt3zS2yMgTxvOK7kuATA
	6ePUVhHE3dPo9WGj7ve9hnKR6WV6bCfqY4PFFBdClw+4kNyBN5m8CwIZwgXB67Hh5iVm4bdEzAn0h
	Qrp+X+S40cEZgSGT2jBsBvTteP2+OGAsKG269GDtAHQ8uzY/Kg0EVNlGWSRm6a4jy8z1qICNN4Zit
	RIiDOSrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o41p3-00B3Tx-5l; Wed, 22 Jun 2022 14:59:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o41oE-00B33l-3O; Wed, 22 Jun 2022 14:58:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C01B913D5;
	Wed, 22 Jun 2022 07:58:20 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.57.38.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D18293F792;
	Wed, 22 Jun 2022 07:58:17 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: daniel.lezcano@linaro.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	viresh.kumar@linaro.org,
	rafael@kernel.org,
	dietmar.eggemann@arm.com,
	nm@ti.com,
	sboyd@kernel.org,
	sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] firmware: arm_scmi: Get detailed power scale from perf
Date: Wed, 22 Jun 2022 15:58:01 +0100
Message-Id: <20220622145802.13032-4-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220622145802.13032-1-lukasz.luba@arm.com>
References: <20220622145802.13032-1-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_075822_261830_159CD995 
X-CRM114-Status: GOOD (  12.68  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In SCMI v3.1 the power scale can be in micro-Watts. The upper layers, e.g.
cpufreq and EM should handle received power values properly (upscale when
needed). Thus, provide an interface which allows to check what is the
scale for power values. The old interface allowed to distinguish between
bogo-Watts and milli-Watts only (which was good for older SCMI spec).

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 drivers/firmware/arm_scmi/perf.c | 18 +++++++++++-------
 include/linux/scmi_protocol.h    |  8 +++++++-
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index bbb0331801ff..92414e53f908 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -170,8 +170,7 @@ struct perf_dom_info {
 struct scmi_perf_info {
 	u32 version;
 	int num_domains;
-	bool power_scale_mw;
-	bool power_scale_uw;
+	enum scmi_power_scale power_scale;
 	u64 stats_addr;
 	u32 stats_size;
 	struct perf_dom_info *dom_info;
@@ -201,9 +200,13 @@ static int scmi_perf_attributes_get(const struct scmi_protocol_handle *ph,
 		u16 flags = le16_to_cpu(attr->flags);
 
 		pi->num_domains = le16_to_cpu(attr->num_domains);
-		pi->power_scale_mw = POWER_SCALE_IN_MILLIWATT(flags);
+
+		if (POWER_SCALE_IN_MILLIWATT(flags))
+			pi->power_scale = SCMI_POWER_MILLIWATTS;
 		if (PROTOCOL_REV_MAJOR(pi->version) >= 0x3)
-			pi->power_scale_uw = POWER_SCALE_IN_MICROWATT(flags);
+			if (POWER_SCALE_IN_MICROWATT(flags))
+				pi->power_scale = SCMI_POWER_MICROWATTS;
+
 		pi->stats_addr = le32_to_cpu(attr->stats_addr_low) |
 				(u64)le32_to_cpu(attr->stats_addr_high) << 32;
 		pi->stats_size = le32_to_cpu(attr->stats_size);
@@ -792,11 +795,12 @@ static bool scmi_fast_switch_possible(const struct scmi_protocol_handle *ph,
 	return dom->fc_info && dom->fc_info->level_set_addr;
 }
 
-static bool scmi_power_scale_mw_get(const struct scmi_protocol_handle *ph)
+static enum scmi_power_scale
+scmi_power_scale_get(const struct scmi_protocol_handle *ph)
 {
 	struct scmi_perf_info *pi = ph->get_priv(ph);
 
-	return pi->power_scale_mw;
+	return pi->power_scale;
 }
 
 static const struct scmi_perf_proto_ops perf_proto_ops = {
@@ -811,7 +815,7 @@ static const struct scmi_perf_proto_ops perf_proto_ops = {
 	.freq_get = scmi_dvfs_freq_get,
 	.est_power_get = scmi_dvfs_est_power_get,
 	.fast_switch_possible = scmi_fast_switch_possible,
-	.power_scale_mw_get = scmi_power_scale_mw_get,
+	.power_scale_get = scmi_power_scale_get,
 };
 
 static int scmi_perf_set_notify_enabled(const struct scmi_protocol_handle *ph,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 704111f63993..a0a246310ba1 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -60,6 +60,12 @@ struct scmi_clock_info {
 	};
 };
 
+enum scmi_power_scale {
+	SCMI_POWER_BOGOWATTS,
+	SCMI_POWER_MILLIWATTS,
+	SCMI_POWER_MICROWATTS
+};
+
 struct scmi_handle;
 struct scmi_device;
 struct scmi_protocol_handle;
@@ -135,7 +141,7 @@ struct scmi_perf_proto_ops {
 			     unsigned long *rate, unsigned long *power);
 	bool (*fast_switch_possible)(const struct scmi_protocol_handle *ph,
 				     struct device *dev);
-	bool (*power_scale_mw_get)(const struct scmi_protocol_handle *ph);
+	enum scmi_power_scale (*power_scale_get)(const struct scmi_protocol_handle *ph);
 };
 
 /**
-- 
2.17.1


