Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6574C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 08:07:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BA976196C
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 08:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BA976196C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JHefkknvERkd0B9hdkkij2Z15KcSGqJAxHEeVmMbHDg=; b=IvROmVhTwOFKXWEypaSkJ9A8k
	w4FJk2QROr9StKZLeH5ojZZ1sZxZcqzvD1PyLc1pv0qac/5PquRTdv3qamSOog6ci80imoE3pQCsG
	2ocnuoesfWURTAHFhb0fLpFLceO+xkxo8dmCo14BJ5m9+0C7XdhW7n5BXW5Ay2gfEZPbSQa0GD/F+
	yr/kQ9OK3IYX7BODnX60iTzUGUplMyUEPZ0lG7qpS04Q4oZxzt91lvLbzR7xaxEyeO/Ypx4gX/6ez
	BYFuKPE7lNdnTw+2VPru1oSBro1RcCuQ0gkew1EgA7JYg+RXsLMVquCZFiY3haByzTcI6G+qiBJnT
	Wf7jwwLqA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR9Of-002yCY-Ou; Tue, 30 Mar 2021 08:06:45 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR9OR-002y9b-3e
 for linux-mediatek@lists.infradead.org; Tue, 30 Mar 2021 08:06:33 +0000
Received: by mail-pf1-x432.google.com with SMTP id h3so11598809pfr.12
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Mar 2021 01:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=omYb2z/SxeccNVlBPetfsj1e/P6RhqbnacO8PchLVZY=;
 b=nFTABc/J7yBKCfkL84+8tT1dkIPuXZR3YssrNm/LsQ1ZgHjiz+5CYmQtvoCyKXA69T
 YUtTTw68+mM1DvHyQ9HKL3hU1ZjujV0l8FHLLbcy+/cuVzCcecHTpARqUQB8fh9mWEDs
 9nN/yZMvg33SdK6FrusNp57t0RfZcJoPdGtvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=omYb2z/SxeccNVlBPetfsj1e/P6RhqbnacO8PchLVZY=;
 b=rIl5vxTgQiuSQpZ1rQP7j11UiYMlnFtUYF1NB/xXtZA2kNTyVb7N1D+j13X++VX9Ae
 P6+JIrTNA01sq6lyCUlGg32eDTjV49cvVgVfP/4/fSbO2no1tYEuugStdu5vR7sKn4nY
 TEPqvS0GLMzCB8yiDJb9AhbrdLgRpGH8QrwuoXL237OojLPp+lcm1fsdvVJjw1MFak/s
 Hy0at9nZt0Gp2brhCXuH2vXYbpj+1T9uYELm0njEVtGhTZRvg2ycw8CX8D/qURRKLj+6
 4GBsQ+fNixOH7HHEqvfta360U8HlfnUMYHHIRi0cxG4iGXb9uFIIc9boliV9+8tMdafR
 BnDg==
X-Gm-Message-State: AOAM533g2g3b5HE+zhOyEB4XJnhP5eTZAmURAwgyln4FHMVbfWEX9XKP
 jWFyuaz55/mxHoqr48170cGXPA==
X-Google-Smtp-Source: ABdhPJxeGsARwOmu0kpuzHXfaqLI91H5qK/dwMnsn/LcD/lal1cqTKXlS1D5HNZSxQ4+b4mKsMcR/Q==
X-Received: by 2002:aa7:8145:0:b029:20f:58e6:9c17 with SMTP id
 d5-20020aa781450000b029020f58e69c17mr28921254pfn.52.1617091585565; 
 Tue, 30 Mar 2021 01:06:25 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:b:49fb:d79d:bee6:d970])
 by smtp.gmail.com with ESMTPSA id f23sm19118913pfa.85.2021.03.30.01.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 01:06:25 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: linux-usb@vger.kernel.org
Cc: Ikjoon Jang <ikjn@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] usb: xhci-mtk: remove unnecessary assignments in periodic
 TT scheduler
Date: Tue, 30 Mar 2021 16:06:16 +0800
Message-Id: <20210330160508.1.I797d214790033d0402d19ff6b47a34aff60d3062@changeid>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210330080617.3746932-1-ikjn@chromium.org>
References: <20210330080617.3746932-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_090632_154351_22CA3FEC 
X-CRM114-Status: GOOD (  14.87  )
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

Remove unnecessary variables in check_sch_bw().
No functional changes, just for better readability.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

 drivers/usb/host/xhci-mtk-sch.c | 52 +++++++++++++--------------------
 1 file changed, 21 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index a59d1f6d4744..0cb41007ec65 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -479,6 +479,9 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 	u32 start_cs, last_cs;
 	int i;
 
+	if (!sch_ep->sch_tt)
+		return 0;
+
 	start_ss = offset % 8;
 
 	if (sch_ep->ep_type == ISOC_OUT_EP) {
@@ -606,54 +609,41 @@ static u32 get_esit_boundary(struct mu3h_sch_ep_info *sch_ep)
 static int check_sch_bw(struct mu3h_sch_bw_info *sch_bw,
 			struct mu3h_sch_ep_info *sch_ep)
 {
-	u32 offset;
-	u32 min_bw;
-	u32 min_index;
-	u32 worst_bw;
-	u32 bw_boundary;
-	u32 esit_boundary;
-	u32 min_num_budget;
-	u32 min_cs_count;
-	int ret = 0;
+	int i, found = -1;
+	const u32 esit_boundary = get_esit_boundary(sch_ep);
+	const u32 bw_boundary = get_bw_boundary(sch_ep->speed);
+	u32 min_bw = ~0;
 
 	/*
 	 * Search through all possible schedule microframes.
 	 * and find a microframe where its worst bandwidth is minimum.
 	 */
-	min_bw = ~0;
-	min_index = 0;
-	min_cs_count = sch_ep->cs_count;
-	min_num_budget = sch_ep->num_budget_microframes;
-	esit_boundary = get_esit_boundary(sch_ep);
-	for (offset = 0; offset < sch_ep->esit; offset++) {
-		if (sch_ep->sch_tt) {
-			ret = check_sch_tt(sch_ep, offset);
-			if (ret)
-				continue;
-		}
+	for (i = 0; i < sch_ep->esit; i++) {
+		u32 worst_bw;
 
-		if ((offset + sch_ep->num_budget_microframes) > esit_boundary)
+		if ((i + sch_ep->num_budget_microframes) > esit_boundary)
 			break;
 
-		worst_bw = get_max_bw(sch_bw, sch_ep, offset);
+		if (check_sch_tt(sch_ep, i))
+			continue;
+
+		worst_bw = get_max_bw(sch_bw, sch_ep, i);
+		if (worst_bw > bw_boundary)
+			continue;
+
 		if (min_bw > worst_bw) {
 			min_bw = worst_bw;
-			min_index = offset;
-			min_cs_count = sch_ep->cs_count;
-			min_num_budget = sch_ep->num_budget_microframes;
+			found = i;
 		}
 		if (min_bw == 0)
 			break;
 	}
 
-	bw_boundary = get_bw_boundary(sch_ep->speed);
 	/* check bandwidth */
-	if (min_bw > bw_boundary)
-		return ret ? ret : -ESCH_BW_OVERFLOW;
+	if (found < 0)
+		return -ESCH_BW_OVERFLOW;
 
-	sch_ep->offset = min_index;
-	sch_ep->cs_count = min_cs_count;
-	sch_ep->num_budget_microframes = min_num_budget;
+	sch_ep->offset = found;
 
 	return load_ep_bw(sch_bw, sch_ep, true);
 }
-- 
2.31.0.291.g576ba9dcdaf-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
