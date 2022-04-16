Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E807C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Apr 2022 09:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aYDhCuvE5FaJzyx0yjO9xWQjX5mOnqSN7ahBmJ462hE=; b=xELHUBv6ta9qTf
	CP7A5QoSMq0VwSSYr6Q4wdVLPWcItHCkfn5Zk+wYT7I6vkqt91jGMuIYs7EJibgtZdMMuSjYhsNr3
	QW5YIm8mnLMTvZ2Vapuj6Yo75p+oAyvGHHAqzvUCXQgMkkBEfMqms0l083xIVs3wg03YG3yKajlSR
	i0s1/ADuIdzuSWRQqUICTDz7DuccE78zr/NN05yRpNZx963/GpdI1okSJ7cTws+U75ZzDADzfAT3b
	8rx5XEOemp/Lse9NavT8N5bceo/N3sUAwIzy6Fi2ZJm7FrmrOB5GZDRM3ODoLtxg3xjKOtSVaDrOe
	pDOljITtHTPs/tG7VikQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfeOt-00Ca2J-KF; Sat, 16 Apr 2022 09:07:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfeOc-00CZxg-1y; Sat, 16 Apr 2022 09:07:12 +0000
X-UUID: 452cf743fb4e4a9a921a09f256b8a1b2-20220416
X-UUID: 452cf743fb4e4a9a921a09f256b8a1b2-20220416
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <powen.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 140293810; Sat, 16 Apr 2022 02:07:01 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 Apr 2022 01:56:58 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 16 Apr 2022 16:56:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 16 Apr 2022 16:56:56 +0800
From: Po-Wen Kao <powen.kao@mediatek.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Steven Rostedt <rostedt@goodmis.org>, "Ingo
 Molnar" <mingo@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
 <stanley.chu@mediatek.com>, <powen.kao@mediatek.com>,
 <alice.chao@mediatek.com>, <chun-hung.wu@mediatek.com>,
 <cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
 <jiajie.hao@mediatek.com>, <linux-scsi@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] scsi: ufs: add clock-scalable property for clk scaling
Date: Sat, 16 Apr 2022 16:56:44 +0800
Message-ID: <20220416085649.5660-1-powen.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220416_020710_143372_25BA3269 
X-CRM114-Status: GOOD (  22.00  )
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

In clk scaling, clk_set_rate is invoked to set dedicated PLL clk rate
on scale up and down. On some MTK platform, scaling is only possible
by switching parent of a mux, therefore we introduce a new
"clock-scalable" property to gain fine control over which clock rate can
be scaled by calling clk_set_rate. If a clock is defined as non-scalable,
clk_set_rate won't be invoked while clki->current_rate is still updated
if min/max freq is defined. Customized clk operation may be embedded in
pre/post change of hba->vops->clk_scale_notify.

All clocks in dts without "clock-scalable" property defined are assumed
scalable and works as usual. There is no neeed to make change on existing
dts.

To specify scalable property, one may define dts as follow

&ufshci {
    clocks =
        <clk1>,
        <clk2>,
        ...
        <clkn>;

    clock-names =
        "clk1",
        "clk2",
        ...
        "clkn";

    freq-table-hz =
        <1000 2000>,
        <0 0>,
        ...
        <0 0>;

    clock-scalable =
        <0
         0
         ...
         0
        >;
};

Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
---
 drivers/scsi/ufs/ufshcd-pltfrm.c | 99 ++++++++++++++++++++++++--------
 drivers/scsi/ufs/ufshcd.c        | 52 +++++++----------
 drivers/scsi/ufs/ufshcd.h        |  2 +
 include/trace/events/ufs.h       | 16 +++---
 4 files changed, 105 insertions(+), 64 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
index 87975d1a21c8..757ba2ef2a4c 100644
--- a/drivers/scsi/ufs/ufshcd-pltfrm.c
+++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
@@ -18,6 +18,59 @@
 
 #define UFSHCD_DEFAULT_LANES_PER_DIRECTION		2
 
+/**
+ * ufshcd_get_clk_u32_array - Resolve property in dts to u32 array with
+ * shape check.
+ * @hba: per-adapter instance
+ * @propname: name of property
+ * @cols: column count
+ * @rows: calculated row count with given cols
+ * @array: u32 array pointer of property data with propname
+ */
+static int ufshcd_get_clk_u32_array(struct ufs_hba *hba, const char *propname,
+				    size_t cols, size_t *rows, u32 **array)
+{
+	struct device *dev = hba->dev;
+	struct device_node *np = dev->of_node;
+	int len = 0, ret = 0;
+	int _rows = 0;
+
+	if (!of_get_property(np, propname, &len)) {
+		ret = -EINVAL;
+		dev_warn(dev, "%s property not specified.\n", propname);
+		goto out;
+	}
+
+	len = len / sizeof(**array);
+	_rows = len / cols;
+	if (len % cols != 0 || !cols || !_rows) {
+		dev_warn(dev, "%s property define error.\n", propname);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	*array = devm_kcalloc(dev, len, sizeof(**array), GFP_KERNEL);
+	if (!*array) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	ret = of_property_read_u32_array(np, propname, *array, len);
+
+	if (ret) {
+		dev_err(dev, "%s: error reading array %d\n",
+			propname, ret);
+		goto out;
+	}
+
+	*rows = _rows;
+
+	return 0;
+out:
+	devm_kfree(dev, *array);
+	return ret;
+}
+
 static int ufshcd_parse_clock_info(struct ufs_hba *hba)
 {
 	int ret = 0;
@@ -27,13 +80,14 @@ static int ufshcd_parse_clock_info(struct ufs_hba *hba)
 	struct device_node *np = dev->of_node;
 	char *name;
 	u32 *clkfreq = NULL;
+	u32 *scalable = NULL;
 	struct ufs_clk_info *clki;
-	int len = 0;
 	size_t sz = 0;
 
 	if (!np)
 		goto out;
 
+	/* clock-names */
 	cnt = of_property_count_strings(np, "clock-names");
 	if (!cnt || (cnt == -EINVAL)) {
 		dev_info(dev, "%s: Unable to find clocks, assuming enabled\n",
@@ -47,37 +101,29 @@ static int ufshcd_parse_clock_info(struct ufs_hba *hba)
 	if (cnt <= 0)
 		goto out;
 
-	if (!of_get_property(np, "freq-table-hz", &len)) {
-		dev_info(dev, "freq-table-hz property not specified\n");
+	/* clock-scalable (optional) */
+	ret = ufshcd_get_clk_u32_array(hba, "clock-scalable", 1, &sz, &scalable);
+	if (ret) {
+		dev_warn(dev, "Optional property %s load failed. Assume all clocks scalable.\n",
+			 "clock-scalable");
+	} else if (sz != cnt) {
+		dev_err(dev, "%s len mismatch\n", "clock-scalable");
+		ret = -EINVAL;
 		goto out;
 	}
 
-	if (len <= 0)
+	/* freq-table-hz */
+	ret = ufshcd_get_clk_u32_array(hba, "freq-table-hz", 2, &sz, &clkfreq);
+	if (ret) {
+		dev_err(dev, "Property %s load failed.", "freq-table-hz");
 		goto out;
-
-	sz = len / sizeof(*clkfreq);
-	if (sz != 2 * cnt) {
+	} else if (sz != cnt) {
 		dev_err(dev, "%s len mismatch\n", "freq-table-hz");
 		ret = -EINVAL;
 		goto out;
 	}
 
-	clkfreq = devm_kcalloc(dev, sz, sizeof(*clkfreq),
-			       GFP_KERNEL);
-	if (!clkfreq) {
-		ret = -ENOMEM;
-		goto out;
-	}
-
-	ret = of_property_read_u32_array(np, "freq-table-hz",
-			clkfreq, sz);
-	if (ret && (ret != -EINVAL)) {
-		dev_err(dev, "%s: error reading array %d\n",
-				"freq-table-hz", ret);
-		return ret;
-	}
-
-	for (i = 0; i < sz; i += 2) {
+	for (i = 0; i < cnt * 2; i += 2) {
 		ret = of_property_read_string_index(np,
 				"clock-names", i/2, (const char **)&name);
 		if (ret)
@@ -92,6 +138,7 @@ static int ufshcd_parse_clock_info(struct ufs_hba *hba)
 		clki->min_freq = clkfreq[i];
 		clki->max_freq = clkfreq[i+1];
 		clki->name = devm_kstrdup(dev, name, GFP_KERNEL);
+		clki->scalable = scalable ? !!scalable[i / 2] : true;
 		if (!clki->name) {
 			ret = -ENOMEM;
 			goto out;
@@ -99,11 +146,13 @@ static int ufshcd_parse_clock_info(struct ufs_hba *hba)
 
 		if (!strcmp(name, "ref_clk"))
 			clki->keep_link_active = true;
-		dev_dbg(dev, "%s: min %u max %u name %s\n", "freq-table-hz",
-				clki->min_freq, clki->max_freq, clki->name);
+		dev_dbg(dev, "clk %s: scalable(%u), min(%u), max(%u)\n",
+			clki->name, clki->scalable, clki->min_freq, clki->max_freq);
 		list_add_tail(&clki->list, &hba->clk_list_head);
 	}
 out:
+	devm_kfree(dev, scalable);
+	devm_kfree(dev, clkfreq);
 	return ret;
 }
 
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index eea5af5fa166..295f8a314f37 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -950,6 +950,7 @@ static bool ufshcd_is_unipro_pa_params_tuning_req(struct ufs_hba *hba)
 static int ufshcd_set_clk_freq(struct ufs_hba *hba, bool scale_up)
 {
 	int ret = 0;
+	u32 target_rate = 0;
 	struct ufs_clk_info *clki;
 	struct list_head *head = &hba->clk_list_head;
 
@@ -958,41 +959,27 @@ static int ufshcd_set_clk_freq(struct ufs_hba *hba, bool scale_up)
 
 	list_for_each_entry(clki, head, list) {
 		if (!IS_ERR_OR_NULL(clki->clk)) {
-			if (scale_up && clki->max_freq) {
-				if (clki->curr_freq == clki->max_freq)
-					continue;
-
-				ret = clk_set_rate(clki->clk, clki->max_freq);
-				if (ret) {
-					dev_err(hba->dev, "%s: %s clk set rate(%dHz) failed, %d\n",
-						__func__, clki->name,
-						clki->max_freq, ret);
-					break;
-				}
-				trace_ufshcd_clk_scaling(dev_name(hba->dev),
-						"scaled up", clki->name,
-						clki->curr_freq,
-						clki->max_freq);
+			target_rate = scale_up ? clki->max_freq : clki->min_freq;
 
-				clki->curr_freq = clki->max_freq;
+			if (!target_rate || clki->curr_freq == target_rate)
+				continue;
 
-			} else if (!scale_up && clki->min_freq) {
-				if (clki->curr_freq == clki->min_freq)
-					continue;
+			if (!clki->scalable)
+				goto skip;
 
-				ret = clk_set_rate(clki->clk, clki->min_freq);
-				if (ret) {
-					dev_err(hba->dev, "%s: %s clk set rate(%dHz) failed, %d\n",
-						__func__, clki->name,
-						clki->min_freq, ret);
-					break;
-				}
-				trace_ufshcd_clk_scaling(dev_name(hba->dev),
-						"scaled down", clki->name,
-						clki->curr_freq,
-						clki->min_freq);
-				clki->curr_freq = clki->min_freq;
+			ret = clk_set_rate(clki->clk, target_rate);
+			if (ret) {
+				dev_err(hba->dev, "%s: %s clk set rate(%dHz) failed, %d\n",
+					__func__, clki->name,
+					target_rate, ret);
+				break;
 			}
+skip:
+			trace_ufshcd_clk_scaling(dev_name(hba->dev),
+						 clki->name, scale_up,
+						 clki->curr_freq,
+						 target_rate);
+			clki->curr_freq = target_rate;
 		}
 		dev_dbg(hba->dev, "%s: clk: %s, rate: %lu\n", __func__,
 				clki->name, clk_get_rate(clki->clk));
@@ -8364,6 +8351,8 @@ static int ufshcd_init_clocks(struct ufs_hba *hba)
 			ufshcd_parse_dev_ref_clk_freq(hba, clki->clk);
 
 		if (clki->max_freq) {
+			if (!clki->scalable)
+				goto skip;
 			ret = clk_set_rate(clki->clk, clki->max_freq);
 			if (ret) {
 				dev_err(hba->dev, "%s: %s clk set rate(%dHz) failed, %d\n",
@@ -8371,6 +8360,7 @@ static int ufshcd_init_clocks(struct ufs_hba *hba)
 					clki->max_freq, ret);
 				goto out;
 			}
+skip:
 			clki->curr_freq = clki->max_freq;
 		}
 		dev_dbg(dev, "%s: clk: %s, rate: %lu\n", __func__,
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 1637f5cc1420..eaa3d6c5b9ab 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -260,6 +260,7 @@ struct ufs_dev_cmd {
  * @keep_link_active: indicates that the clk should not be disabled if
 		      link is active
  * @enabled: variable to check against multiple enable/disable
+ * @scalable: indicates if clk is scalable in clk scaling
  */
 struct ufs_clk_info {
 	struct list_head list;
@@ -270,6 +271,7 @@ struct ufs_clk_info {
 	u32 curr_freq;
 	bool keep_link_active;
 	bool enabled;
+	bool scalable;
 };
 
 enum ufs_notify_change_status {
diff --git a/include/trace/events/ufs.h b/include/trace/events/ufs.h
index 599739ee7b20..780c964e52c2 100644
--- a/include/trace/events/ufs.h
+++ b/include/trace/events/ufs.h
@@ -103,30 +103,30 @@ TRACE_EVENT(ufshcd_clk_gating,
 
 TRACE_EVENT(ufshcd_clk_scaling,
 
-	TP_PROTO(const char *dev_name, const char *state, const char *clk,
-		u32 prev_state, u32 curr_state),
+	TP_PROTO(const char *dev_name, const char *clk,
+		 bool up, u32 prev_state, u32 curr_state),
 
-	TP_ARGS(dev_name, state, clk, prev_state, curr_state),
+	TP_ARGS(dev_name, clk, up, prev_state, curr_state),
 
 	TP_STRUCT__entry(
 		__string(dev_name, dev_name)
-		__string(state, state)
 		__string(clk, clk)
+		__field(bool, up)
 		__field(u32, prev_state)
 		__field(u32, curr_state)
 	),
 
 	TP_fast_assign(
 		__assign_str(dev_name, dev_name);
-		__assign_str(state, state);
 		__assign_str(clk, clk);
+		__entry->up = up;
 		__entry->prev_state = prev_state;
 		__entry->curr_state = curr_state;
 	),
 
-	TP_printk("%s: %s %s from %u to %u Hz",
-		__get_str(dev_name), __get_str(state), __get_str(clk),
-		__entry->prev_state, __entry->curr_state)
+	TP_printk("%s: scaled %s %s from %u to %u Hz",
+		  __get_str(dev_name), __entry->up ? "up" : "down", __get_str(clk),
+		  __entry->prev_state, __entry->curr_state)
 );
 
 TRACE_EVENT(ufshcd_auto_bkops_state,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
