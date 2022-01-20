Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2FFC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 01:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qPyuW4durzy8UPDHOccn7z4cFbom2iDz+a6v+eB0bf0=; b=bDkU5NzCAm3/6N
	q8HRGt4+RY7i/SgWArRfUC6AZ6HSnrw5C7rmoutDFXGgN1DnV2adyn64BiwPbrdHsvtzmgwamaZgD
	8Sk65RS466k5ibjzjlIYLJu0JIyuuAgTS3pP5Pe45MOAM/8SnEhZx/hVBCAPb63lJDjhYHXeGftbY
	v88mtEk6HdWh6qYDmM5kZD2PxNkEk443kQDEGVgQFgsA9ZTmwfOAJPaLe/90nbtFBdRQHoiroRFfj
	nwE7D76ruJXCHPHGw61zVlAfvX8dlcaytfPXXU2GtwFdl9pu4fzR7YVaavNr2ZOIq/U0w9HZEv3Cl
	T0CpmoVh/q0eg2nNVHeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAMZs-008EWn-GB; Thu, 20 Jan 2022 01:49:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAMZf-008ETR-OX; Thu, 20 Jan 2022 01:49:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 39B9F61580;
 Thu, 20 Jan 2022 01:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA429C004E1;
 Thu, 20 Jan 2022 01:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642643353;
 bh=XVNGFC1UcemnELjzQ0k/YD0qA9SM3qfudnkbbNl7eqE=;
 h=Date:From:To:Cc:Subject:From;
 b=Oj4rKPsIwX2nhI+KKfEncfk32rHuyVRxiOhLR9sN7mCedxrBAwxOAM2S+04QZMvhB
 2CFyfb2nqjwRG07Cy5TBeYDYr+OyZPzT/iYrNE1PdXdgN9E5+VSCaae7NVr4AO8keo
 /qw9pRpUTEbG6ies/dSh05mnFpX6+imOb1VihoEPx/jwqhTzy5ABSzbDSvyrFLq0r5
 XjOR9rtiS4xskS7WywYM0GtizrXQ7tskiwY/01yU9o+CXn0xhWOc+p8yhr2UWNcM/y
 yOEPvut2r8wd/fGyQ2RGyjc4f7E83DO37cArweQKwB1HGMXGuLwm4aZJC0PI4pkZPe
 xBxI9A5LMmjYw==
Date: Wed, 19 Jan 2022 19:55:46 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Mathias Nyman <mathias.nyman@intel.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH][next] usb: xhci-mtk: Use struct_size() helper in
 create_sch_ep()
Message-ID: <20220120015546.GA75917@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_174915_902514_32F979CE 
X-CRM114-Status: GOOD (  11.01  )
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

Make use of the struct_size() helper instead of an open-coded version,
in order to avoid any potential type mistakes or integer overflows that,
in the worst scenario, could lead to heap overflows.

Also, address the following sparse warnings:
drivers/usb/host/xhci-mtk-sch.c:265:20: warning: using sizeof on a flexible structure

Link: https://github.com/KSPP/linux/issues/160
Link: https://github.com/KSPP/linux/issues/174
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/usb/host/xhci-mtk-sch.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index edbfa82c6565..f3139ce7b0a9 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -248,7 +248,6 @@ create_sch_ep(struct xhci_hcd_mtk *mtk, struct usb_device *udev,
 	struct mu3h_sch_bw_info *bw_info;
 	struct mu3h_sch_tt *tt = NULL;
 	u32 len_bw_budget_table;
-	size_t mem_size;
 
 	bw_info = get_bw_info(mtk, udev, ep);
 	if (!bw_info)
@@ -262,9 +261,9 @@ create_sch_ep(struct xhci_hcd_mtk *mtk, struct usb_device *udev,
 	else
 		len_bw_budget_table = 1;
 
-	mem_size = sizeof(struct mu3h_sch_ep_info) +
-			len_bw_budget_table * sizeof(u32);
-	sch_ep = kzalloc(mem_size, GFP_KERNEL);
+	sch_ep = kzalloc(struct_size(sch_ep, bw_budget_table,
+				     len_bw_budget_table),
+			 GFP_KERNEL);
 	if (!sch_ep)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
