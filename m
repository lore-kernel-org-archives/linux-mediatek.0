Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6ACC00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 04:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yh2iuwzTcr5jleh3q2/6POg/Y9/7hFhA1OrUoqjyqFU=; b=c53OPNVG3dAOhPm+Qcz9Cvw8kt
	c8kY9nZOezRELjcCyFgexddUwx0O7Q/yowedkvycUkTMjKDSMk53HqdAjzQinGHVzieQsoHgwYWpI
	sQ5nPF7fFOmOJNvXAeSrlEEbzwZy+0Qd5x+k1iiwrQ3h7HFMPvc6UQvYyr9RsB3FWVTdcGNWRaJl9
	K2ZzTNPyOj+rYX6ztQjwHRKuaTqK+rTAc/CzTh2mUIf+fE/oc3iVSHH2IxnPelYBS07UA8aByferH
	A7gNnsxhUqzWRoAhl4knK2+p4WJFL35/WbStagXTCNodBykzFeA4rHa5BFh+POSuyw2WG9ZHdl8HT
	WSqUwzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIj88-00ACD0-4R; Tue, 02 Aug 2022 04:03:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIj84-00ACAX-1P; Tue, 02 Aug 2022 04:03:37 +0000
X-UUID: 389ce527cd544d26a83043b4723cc71d-20220801
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ba02841b-6200-47ad-9899-86dc3c3cfa5d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:be4007d0-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 389ce527cd544d26a83043b4723cc71d-20220801
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 110800621; Mon, 01 Aug 2022 21:03:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 2 Aug 2022 11:42:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 2 Aug 2022 11:42:50 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, Zhang Rui
	<rui.zhang@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
CC: <yj.chiang@mediatek.com>, Subbaraman Narayanamurthy
	<quic_subbaram@quicinc.com>, "Rafael J . Wysocki"
	<rafael.j.wysocki@intel.com>, <stable@vger.kernel.org>, Mark-PK Tsai
	<mark-pk.tsai@mediatek.com>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <llvm@lists.linux.dev>
Subject: [PATCH 5.4] thermal: Fix NULL pointer dereferences in of_thermal_ functions
Date: Tue, 2 Aug 2022 11:42:16 +0800
Message-ID: <20220802034238.27127-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_210336_130005_5F7A625E 
X-CRM114-Status: GOOD (  14.47  )
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

From: Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>

commit 96cfe05051fd8543cdedd6807ec59a0e6c409195 upstream.

of_parse_thermal_zones() parses the thermal-zones node and registers a
thermal_zone device for each subnode. However, if a thermal zone is
consuming a thermal sensor and that thermal sensor device hasn't probed
yet, an attempt to set trip_point_*_temp for that thermal zone device
can cause a NULL pointer dereference. Fix it.

 console:/sys/class/thermal/thermal_zone87 # echo 120000 > trip_point_0_temp
 ...
 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
 ...
 Call trace:
  of_thermal_set_trip_temp+0x40/0xc4
  trip_point_temp_store+0xc0/0x1dc
  dev_attr_store+0x38/0x88
  sysfs_kf_write+0x64/0xc0
  kernfs_fop_write_iter+0x108/0x1d0
  vfs_write+0x2f4/0x368
  ksys_write+0x7c/0xec
  __arm64_sys_write+0x20/0x30
  el0_svc_common.llvm.7279915941325364641+0xbc/0x1bc
  do_el0_svc+0x28/0xa0
  el0_svc+0x14/0x24
  el0_sync_handler+0x88/0xec
  el0_sync+0x1c0/0x200

While at it, fix the possible NULL pointer dereference in other
functions as well: of_thermal_get_temp(), of_thermal_set_emul_temp(),
of_thermal_get_trend().

Suggested-by: David Collins <quic_collinsd@quicinc.com>
Signed-off-by: Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 drivers/thermal/of-thermal.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
index 68d0c181ec7b..1f38da5da6e4 100644
--- a/drivers/thermal/of-thermal.c
+++ b/drivers/thermal/of-thermal.c
@@ -91,7 +91,7 @@ static int of_thermal_get_temp(struct thermal_zone_device *tz,
 {
 	struct __thermal_zone *data = tz->devdata;
 
-	if (!data->ops->get_temp)
+	if (!data->ops || !data->ops->get_temp)
 		return -EINVAL;
 
 	return data->ops->get_temp(data->sensor_data, temp);
@@ -188,6 +188,9 @@ static int of_thermal_set_emul_temp(struct thermal_zone_device *tz,
 {
 	struct __thermal_zone *data = tz->devdata;
 
+	if (!data->ops || !data->ops->set_emul_temp)
+		return -EINVAL;
+
 	return data->ops->set_emul_temp(data->sensor_data, temp);
 }
 
@@ -196,7 +199,7 @@ static int of_thermal_get_trend(struct thermal_zone_device *tz, int trip,
 {
 	struct __thermal_zone *data = tz->devdata;
 
-	if (!data->ops->get_trend)
+	if (!data->ops || !data->ops->get_trend)
 		return -EINVAL;
 
 	return data->ops->get_trend(data->sensor_data, trip, trend);
@@ -336,7 +339,7 @@ static int of_thermal_set_trip_temp(struct thermal_zone_device *tz, int trip,
 	if (trip >= data->ntrips || trip < 0)
 		return -EDOM;
 
-	if (data->ops->set_trip_temp) {
+	if (data->ops && data->ops->set_trip_temp) {
 		int ret;
 
 		ret = data->ops->set_trip_temp(data->sensor_data, trip, temp);
-- 
2.18.0


