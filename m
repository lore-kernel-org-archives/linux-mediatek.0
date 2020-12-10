Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998DEC4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 10:48:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E7AE23D98
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 10:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E7AE23D98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SomzfJNfGjYqtddgtm//nwivzpCapMVvwey4KmFEJb0=; b=ezGnXbR7RjvSXI/zUIw3gN3vZ
	85gjaJGWslBUuV6rdISXNKZL7+XIHRXe9y9Shhe4HTzL+b0HLCyHMt8NexxgwgCP0LNTohCutfxXX
	WG1cMow5z3AFZMtwy/lGXLTGFV/Ylmudz0TRTYTD0+j0x4bXl6w+An/p1rfgR+SRRSwSpjug/dq+d
	xfs0EToOlTE5swXDudMUeXO4zkl2qUJGv65YfqabQNAArOsgqo8LeSLoPYdf3V6HhPpUendC0Wqri
	v9orrdqjKFgAIxg0FWcLwzFSt2V3td7UigY7p1o8uFboLQZjcf/MkzZWz2kDfp8PGkJJGRoH9dZcc
	AMAayXaBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knJUZ-0002oe-Cc; Thu, 10 Dec 2020 10:48:11 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knJUO-0002jQ-74
 for linux-mediatek@lists.infradead.org; Thu, 10 Dec 2020 10:48:02 +0000
Received: by mail-pf1-x443.google.com with SMTP id 11so3680137pfu.4
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Dec 2020 02:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l1M5kh9FzmwOyDDNFP6k0BxG+cNWzeRxUyCPj6S0GWQ=;
 b=ZXpfdt5NgbnEYIKX/MaDEPe3ejVoVbAQ7AYhno49D4nE8TmYy0QvV/52L/2m3uJ44a
 t7HnjlCuVmW3rb3fzuYAKzoAp09/1znbUlH++xhDBiPthUYTRk82LmFPK+UFjU+8Bbju
 hDAcAKCUwbyH5Nea7voe+YGQ7AcX/NuckxAQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l1M5kh9FzmwOyDDNFP6k0BxG+cNWzeRxUyCPj6S0GWQ=;
 b=M+HILGXUaRurqSpwOJ1uG9pznjYtdkGLm+Dr1512s88TrSNCJCGwt9gF5oGxKl9WkZ
 HM7QL2XsoRbtWRGf1VrqtjqNxULijhyWfgmYk7vefH77DpVmoBX70+Dqy6NaSU+q3Z5N
 DwXJj/9fea2FrhG6I3xjcPTRBxGA58t4ejp4voVh8zKPvm29TkvAgy++UamjMIOoLgcJ
 lVobOnLzvH4cenaejr+l4+5k98hUhGy7G9YpRhuPB4Nf8CHduFswrQQhEyF4WgaTSL1Q
 Bn9G4pSlUOmOyqido4dG5PGgxBDx4G6EXWk6hRgwCxXicn7lJHKrc9Y+3RQfPoM/xrBY
 xHMA==
X-Gm-Message-State: AOAM533VKGlLTzoxPHzrHSFSWTORsjWMUg3ihnNkCn9AnwVNHM4AFR+W
 eOP5MUoDmph239B/2J2PeuqTerY2kecFOA==
X-Google-Smtp-Source: ABdhPJwn4JVEouLVEtcDAOOpSHA184rYh3nVQayhZSD8/VwtKI9hsj7R6oi8Wqd6f+cE24MglamImg==
X-Received: by 2002:a17:90b:46ca:: with SMTP id
 jx10mr6935918pjb.208.1607597277606; 
 Thu, 10 Dec 2020 02:47:57 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:b:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id y1sm6386658pff.17.2020.12.10.02.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 02:47:57 -0800 (PST)
From: Ikjoon Jang <ikjn@chromium.org>
To: linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 1/3] usb: xhci-mtk: code cleanups in getting bandwidth table
Date: Thu, 10 Dec 2020 18:47:45 +0800
Message-Id: <20201210184700.v2.1.Ie9a3b8ec3b2fba74aeda3ac996ec8aee19f78334@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201210104747.3416781-1-ikjn@chromium.org>
References: <20201210104747.3416781-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_054800_340115_BFD39EE3 
X-CRM114-Status: GOOD (  13.50  )
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

Simplifies the codes for getting internal bandwidth data,
No functional changes.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

 drivers/usb/host/xhci-mtk-sch.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 45c54d56ecbd..c334b6d76479 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -49,9 +49,11 @@ static int is_fs_or_ls(enum usb_device_speed speed)
 * so the bandwidth domain array is organized as follow for simplification:
 * SSport0-OUT, SSport0-IN, ..., SSportX-OUT, SSportX-IN, HSport0, ..., HSportY
 */
-static int get_bw_index(struct xhci_hcd *xhci, struct usb_device *udev,
-	struct usb_host_endpoint *ep)
+static struct mu3h_sch_bw_info *get_bw_info(struct xhci_hcd_mtk *mtk,
+					     struct usb_device *udev,
+					     struct usb_host_endpoint *ep)
 {
+	struct xhci_hcd *xhci = hcd_to_xhci(mtk->hcd);
 	struct xhci_virt_device *virt_dev;
 	int bw_index;
 
@@ -67,7 +69,7 @@ static int get_bw_index(struct xhci_hcd *xhci, struct usb_device *udev,
 		bw_index = virt_dev->real_port + xhci->usb3_rhub.num_ports - 1;
 	}
 
-	return bw_index;
+	return &mtk->sch_array[bw_index];
 }
 
 static u32 get_esit(struct xhci_ep_ctx *ep_ctx)
@@ -603,9 +605,7 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	struct xhci_virt_device *virt_dev;
 	struct mu3h_sch_bw_info *sch_bw;
 	struct mu3h_sch_ep_info *sch_ep;
-	struct mu3h_sch_bw_info *sch_array;
 	unsigned int ep_index;
-	int bw_index;
 	int ret = 0;
 
 	xhci = hcd_to_xhci(hcd);
@@ -613,7 +613,6 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	ep_index = xhci_get_endpoint_index(&ep->desc);
 	slot_ctx = xhci_get_slot_ctx(xhci, virt_dev->in_ctx);
 	ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
-	sch_array = mtk->sch_array;
 
 	xhci_dbg(xhci, "%s() type:%d, speed:%d, mpkt:%d, dir:%d, ep:%p\n",
 		__func__, usb_endpoint_type(&ep->desc), udev->speed,
@@ -632,8 +631,7 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 		return 0;
 	}
 
-	bw_index = get_bw_index(xhci, udev, ep);
-	sch_bw = &sch_array[bw_index];
+	sch_bw = get_bw_info(mtk, udev, ep);
 
 	sch_ep = create_sch_ep(udev, ep, ep_ctx);
 	if (IS_ERR_OR_NULL(sch_ep))
@@ -673,15 +671,12 @@ void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	struct xhci_hcd *xhci;
 	struct xhci_slot_ctx *slot_ctx;
 	struct xhci_virt_device *virt_dev;
-	struct mu3h_sch_bw_info *sch_array;
 	struct mu3h_sch_bw_info *sch_bw;
 	struct mu3h_sch_ep_info *sch_ep;
-	int bw_index;
 
 	xhci = hcd_to_xhci(hcd);
 	virt_dev = xhci->devs[udev->slot_id];
 	slot_ctx = xhci_get_slot_ctx(xhci, virt_dev->in_ctx);
-	sch_array = mtk->sch_array;
 
 	xhci_dbg(xhci, "%s() type:%d, speed:%d, mpks:%d, dir:%d, ep:%p\n",
 		__func__, usb_endpoint_type(&ep->desc), udev->speed,
@@ -691,8 +686,7 @@ void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	if (!need_bw_sch(ep, udev->speed, slot_ctx->tt_info & TT_SLOT))
 		return;
 
-	bw_index = get_bw_index(xhci, udev, ep);
-	sch_bw = &sch_array[bw_index];
+	sch_bw = get_bw_info(mtk, udev, ep);
 
 	list_for_each_entry(sch_ep, &sch_bw->bw_ep_list, endpoint) {
 		if (sch_ep->ep == ep) {
-- 
2.29.2.576.ga3fc446d84-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
