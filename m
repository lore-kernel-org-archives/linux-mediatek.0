Return-Path: <SRS0=bnG6=GB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1E8C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 06:24:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AACA1207AE
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 06:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AACA1207AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tie5dAhG51bZlDsAQlsqT+8RUyxwi4rBgQT84jr9OEA=; b=qr35YIXIb9/+KNHERcvD6D4Lbe
	1gGik0hVcuusZvwGb8UOy2J7KRdayd2ZBIi7hDD3s0aeEC4pQPwnmdaHIluh95khXSI5DQQKsCIS9
	Pj/Yz6wTebMkw8OjZeYA8e33c+0eFv58EgQWiCs/MiQZByXYVSlGgzUWicn+1BoVAKXs1Z5v1r6g3
	YTfRcfZmmCVecdkoLve2+6NlZ046rJ4LlPqUlerXkJOqKczz8wwnVSspFu5h9wszWmCd0F+OOoC0r
	e1Br94+WE7+vNY6lD54xL+j3wqaCEBzqOMPhMf6/MIW1nd3zdWDq95HLjob34rUp4xP0sV/NAba6L
	hKA6KqWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ku8Qy-0000G4-Ep; Tue, 29 Dec 2020 06:24:40 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ku8Qu-0000DP-5J
 for linux-mediatek@lists.infradead.org; Tue, 29 Dec 2020 06:24:37 +0000
Received: by mail-pg1-x529.google.com with SMTP id 15so8664727pgx.7
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Dec 2020 22:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DHWKOfIlULemhi5ysN15tt1vuyV8ns7onsr3JuvhwTg=;
 b=PKFRX78B2Ve7CFHiQWQtcoea3FAh4uT/ezml7jqKjdWRWTspbGvppeqgj5x0KMY0h0
 /zGsD2WOqwewlWIVdR8BtpfRjeVogGc/VkJF4A5R8V8hFBf2WIYCRVCD//bQfzbSEQHR
 n6UozFSLE+K/Ih6gb2GBwe0vNEdhkqDjnONvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DHWKOfIlULemhi5ysN15tt1vuyV8ns7onsr3JuvhwTg=;
 b=lgnEpn+MW7AOfZF2qaySfvSsPvw8Kn+rrmCYBd5Cx7+ZqPSl7Lmj5WMsrCOW/8UUzo
 6ZLA/uwLWNi+ZdlZEW7DDhf9LQbJ4fr7LHK3vrczhaVcqzDEYZCD4G4pmqhyzQXGxCiz
 xgK/jkpFO1g+CvXR2H9DmUhwwwNYDYBAul7pdh6HvjbFm7tmrhKlas+5Ab4le4Brh86G
 dzR+rOP/vJ0vWnHN6JAYfRKKllQLvAZjPRmYdaPDxQHIozceH4rcFhgqjpux6PbO5rWG
 AXW/XYgE+oGOrz3Y4CWekmrrV2YSVdERseYH2CdfxxWJ7JfVAKgkcHSPLvchBwHP5u7N
 20uQ==
X-Gm-Message-State: AOAM530Y6tP0aJ/Cqw37mG1Fl+mRFCZTdebdx8q92Gt9FFbMJGJjEl7u
 N400afFKjBdq7guT2X7wjMcRXyakwjzElw==
X-Google-Smtp-Source: ABdhPJyj+qHpn8THMMRV5yWEZvzJd/efTszeHfGp7uUJ1X8xwWqxOPv9iYfujhCTmFTs1XLBfC6wdw==
X-Received: by 2002:a63:3549:: with SMTP id c70mr35444598pga.361.1609223072261; 
 Mon, 28 Dec 2020 22:24:32 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:b:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id b72sm37336462pfb.129.2020.12.28.22.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Dec 2020 22:24:31 -0800 (PST)
From: Ikjoon Jang <ikjn@chromium.org>
To: linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5] usb: xhci-mtk: fix unreleased bandwidth data
Date: Tue, 29 Dec 2020 14:24:27 +0800
Message-Id: <20201229142406.v5.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_012436_230642_90046BD9 
X-CRM114-Status: GOOD (  22.67  )
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
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Tianping Fang <tianping.fang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

xhci-mtk has hooks on add_endpoint() and drop_endpoint() from xhci
to handle its own sw bandwidth managements and stores bandwidth data
into internal table every time add_endpoint() is called,
so when bandwidth allocation fails at one endpoint, all earlier
allocation from the same interface could still remain at the table.

This patch adds two more hooks from check_bandwidth() and
reset_bandwidth(), and make mtk-xhci to releases all failed endpoints
from reset_bandwidth().

Fixes: 08e469de87a2 ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")
Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

---

Changes in v5:
- Fix a wrong commit id in Fixes tag

Changes in v4:
- bugfix in v3, check_bandwidth() return uninitialized value
  when no new endpoints were added.
- change Fixes tag to keep dependency

Changes in v3:
- drop unrelated code cleanups
- change Fixes tag to keep dependency

Changes in v2:
- fix a 0-day warning from unused variable
- split one big patch into three patches
- fix wrong offset in mediatek hw flags

 drivers/usb/host/xhci-mtk-sch.c | 124 ++++++++++++++++++++++----------
 drivers/usb/host/xhci-mtk.h     |  13 ++++
 drivers/usb/host/xhci.c         |   9 +++
 3 files changed, 109 insertions(+), 37 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 45c54d56ecbd..95d20de9fd1f 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -200,6 +200,7 @@ static struct mu3h_sch_ep_info *create_sch_ep(struct usb_device *udev,
 
 	sch_ep->sch_tt = tt;
 	sch_ep->ep = ep;
+	INIT_LIST_HEAD(&sch_ep->tt_endpoint);
 
 	return sch_ep;
 }
@@ -583,6 +584,8 @@ int xhci_mtk_sch_init(struct xhci_hcd_mtk *mtk)
 
 	mtk->sch_array = sch_array;
 
+	INIT_LIST_HEAD(&mtk->bw_ep_list_new);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xhci_mtk_sch_init);
@@ -601,19 +604,14 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	struct xhci_ep_ctx *ep_ctx;
 	struct xhci_slot_ctx *slot_ctx;
 	struct xhci_virt_device *virt_dev;
-	struct mu3h_sch_bw_info *sch_bw;
 	struct mu3h_sch_ep_info *sch_ep;
-	struct mu3h_sch_bw_info *sch_array;
 	unsigned int ep_index;
-	int bw_index;
-	int ret = 0;
 
 	xhci = hcd_to_xhci(hcd);
 	virt_dev = xhci->devs[udev->slot_id];
 	ep_index = xhci_get_endpoint_index(&ep->desc);
 	slot_ctx = xhci_get_slot_ctx(xhci, virt_dev->in_ctx);
 	ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
-	sch_array = mtk->sch_array;
 
 	xhci_dbg(xhci, "%s() type:%d, speed:%d, mpkt:%d, dir:%d, ep:%p\n",
 		__func__, usb_endpoint_type(&ep->desc), udev->speed,
@@ -632,39 +630,34 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 		return 0;
 	}
 
-	bw_index = get_bw_index(xhci, udev, ep);
-	sch_bw = &sch_array[bw_index];
-
 	sch_ep = create_sch_ep(udev, ep, ep_ctx);
 	if (IS_ERR_OR_NULL(sch_ep))
 		return -ENOMEM;
 
 	setup_sch_info(udev, ep_ctx, sch_ep);
 
-	ret = check_sch_bw(udev, sch_bw, sch_ep);
-	if (ret) {
-		xhci_err(xhci, "Not enough bandwidth!\n");
-		if (is_fs_or_ls(udev->speed))
-			drop_tt(udev);
-
-		kfree(sch_ep);
-		return -ENOSPC;
-	}
+	list_add_tail(&sch_ep->endpoint, &mtk->bw_ep_list_new);
 
-	list_add_tail(&sch_ep->endpoint, &sch_bw->bw_ep_list);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xhci_mtk_add_ep_quirk);
 
-	ep_ctx->reserved[0] |= cpu_to_le32(EP_BPKTS(sch_ep->pkts)
-		| EP_BCSCOUNT(sch_ep->cs_count) | EP_BBM(sch_ep->burst_mode));
-	ep_ctx->reserved[1] |= cpu_to_le32(EP_BOFFSET(sch_ep->offset)
-		| EP_BREPEAT(sch_ep->repeat));
+static void xhci_mtk_drop_ep(struct xhci_hcd_mtk *mtk, struct usb_device *udev,
+			     struct mu3h_sch_ep_info *sch_ep)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(mtk->hcd);
+	int bw_index = get_bw_index(xhci, udev, sch_ep->ep);
+	struct mu3h_sch_bw_info *sch_bw = &mtk->sch_array[bw_index];
 
-	xhci_dbg(xhci, " PKTS:%x, CSCOUNT:%x, BM:%x, OFFSET:%x, REPEAT:%x\n",
-			sch_ep->pkts, sch_ep->cs_count, sch_ep->burst_mode,
-			sch_ep->offset, sch_ep->repeat);
+	update_bus_bw(sch_bw, sch_ep, 0);
+	list_del(&sch_ep->endpoint);
 
-	return 0;
+	if (sch_ep->sch_tt) {
+		list_del(&sch_ep->tt_endpoint);
+		drop_tt(udev);
+	}
+	kfree(sch_ep);
 }
-EXPORT_SYMBOL_GPL(xhci_mtk_add_ep_quirk);
 
 void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 		struct usb_host_endpoint *ep)
@@ -675,7 +668,7 @@ void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	struct xhci_virt_device *virt_dev;
 	struct mu3h_sch_bw_info *sch_array;
 	struct mu3h_sch_bw_info *sch_bw;
-	struct mu3h_sch_ep_info *sch_ep;
+	struct mu3h_sch_ep_info *sch_ep, *tmp;
 	int bw_index;
 
 	xhci = hcd_to_xhci(hcd);
@@ -694,17 +687,74 @@ void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	bw_index = get_bw_index(xhci, udev, ep);
 	sch_bw = &sch_array[bw_index];
 
-	list_for_each_entry(sch_ep, &sch_bw->bw_ep_list, endpoint) {
+	list_for_each_entry_safe(sch_ep, tmp, &sch_bw->bw_ep_list, endpoint) {
 		if (sch_ep->ep == ep) {
-			update_bus_bw(sch_bw, sch_ep, 0);
-			list_del(&sch_ep->endpoint);
-			if (is_fs_or_ls(udev->speed)) {
-				list_del(&sch_ep->tt_endpoint);
-				drop_tt(udev);
-			}
-			kfree(sch_ep);
-			break;
+			xhci_mtk_drop_ep(mtk, udev, sch_ep);
 		}
 	}
 }
 EXPORT_SYMBOL_GPL(xhci_mtk_drop_ep_quirk);
+
+int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
+{
+	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct xhci_virt_device *virt_dev = xhci->devs[udev->slot_id];
+	struct mu3h_sch_bw_info *sch_bw;
+	struct mu3h_sch_ep_info *sch_ep, *tmp;
+	int bw_index, ret;
+
+	dev_dbg(&udev->dev, "%s\n", __func__);
+
+	if (list_empty(&mtk->bw_ep_list_new))
+		return 0;
+
+	list_for_each_entry(sch_ep, &mtk->bw_ep_list_new, endpoint) {
+		bw_index = get_bw_index(xhci, udev, sch_ep->ep);
+		sch_bw = &mtk->sch_array[bw_index];
+
+		ret = check_sch_bw(udev, sch_bw, sch_ep);
+		if (ret) {
+			xhci_err(xhci, "Not enough bandwidth!\n");
+			return -ENOSPC;
+		}
+	}
+
+	list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_list_new, endpoint) {
+		struct xhci_ep_ctx *ep_ctx;
+		struct usb_host_endpoint *ep = sch_ep->ep;
+		unsigned int ep_index = xhci_get_endpoint_index(&ep->desc);
+
+		bw_index = get_bw_index(xhci, udev, ep);
+		sch_bw = &mtk->sch_array[bw_index];
+
+		list_move_tail(&sch_ep->endpoint, &sch_bw->bw_ep_list);
+
+		ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
+		ep_ctx->reserved[0] |= cpu_to_le32(EP_BPKTS(sch_ep->pkts)
+			| EP_BCSCOUNT(sch_ep->cs_count)
+			| EP_BBM(sch_ep->burst_mode));
+		ep_ctx->reserved[1] |= cpu_to_le32(EP_BOFFSET(sch_ep->offset)
+			| EP_BREPEAT(sch_ep->repeat));
+
+		xhci_dbg(xhci, " PKTS:%x, CSCOUNT:%x, BM:%x, OFFSET:%x, REPEAT:%x\n",
+			sch_ep->pkts, sch_ep->cs_count, sch_ep->burst_mode,
+			sch_ep->offset, sch_ep->repeat);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xhci_mtk_check_bandwidth);
+
+void xhci_mtk_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
+{
+	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
+	struct mu3h_sch_ep_info *sch_ep, *tmp;
+
+	dev_dbg(&udev->dev, "%s\n", __func__);
+
+	list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_list_new, endpoint) {
+		xhci_mtk_drop_ep(mtk, udev, sch_ep);
+	}
+}
+EXPORT_SYMBOL_GPL(xhci_mtk_reset_bandwidth);
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index a93cfe817904..577f431c5c93 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -130,6 +130,7 @@ struct mu3c_ippc_regs {
 struct xhci_hcd_mtk {
 	struct device *dev;
 	struct usb_hcd *hcd;
+	struct list_head bw_ep_list_new;
 	struct mu3h_sch_bw_info *sch_array;
 	struct mu3c_ippc_regs __iomem *ippc_regs;
 	bool has_ippc;
@@ -166,6 +167,8 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 		struct usb_host_endpoint *ep);
 void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 		struct usb_host_endpoint *ep);
+int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev);
+void xhci_mtk_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev);
 
 #else
 static inline int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd,
@@ -179,6 +182,16 @@ static inline void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd,
 {
 }
 
+static inline int xhci_mtk_check_bandwidth(struct usb_hcd *hcd,
+		struct usb_device *udev)
+{
+	return 0;
+}
+
+static inline void xhci_mtk_reset_bandwidth(struct usb_hcd *hcd,
+		struct usb_device *udev)
+{
+}
 #endif
 
 #endif		/* _XHCI_MTK_H_ */
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index d4a8d0efbbc4..e1fcd3cf723f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2882,6 +2882,12 @@ static int xhci_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 	xhci_dbg(xhci, "%s called for udev %p\n", __func__, udev);
 	virt_dev = xhci->devs[udev->slot_id];
 
+	if (xhci->quirks & XHCI_MTK_HOST) {
+		ret = xhci_mtk_check_bandwidth(hcd, udev);
+		if (ret < 0)
+			return ret;
+	}
+
 	command = xhci_alloc_command(xhci, true, GFP_KERNEL);
 	if (!command)
 		return -ENOMEM;
@@ -2970,6 +2976,9 @@ static void xhci_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 		return;
 	xhci = hcd_to_xhci(hcd);
 
+	if (xhci->quirks & XHCI_MTK_HOST)
+		xhci_mtk_reset_bandwidth(hcd, udev);
+
 	xhci_dbg(xhci, "%s called for udev %p\n", __func__, udev);
 	virt_dev = xhci->devs[udev->slot_id];
 	/* Free any rings allocated for added endpoints */
-- 
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
