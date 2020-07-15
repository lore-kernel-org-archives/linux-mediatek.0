Return-Path: <SRS0=kQBs=A2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C285CC433F1
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 09:32:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FD602075B
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 09:32:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WNl14dX6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ot1YDljs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FD602075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4E3974TVGrtXtu5O7NLKsxHojg2H19UN30BK2Bxd+J8=; b=WNl14dX6dupleolhaAWUSzEa0
	yQmKrNRusEJepy+9m0+xv0h3RYPJ50KDRUuums0JhmDdk4md0REV7j2/4f2N2JI3TC2Wy9I0anvqk
	ChcXXcBUC4Q4EUADWN/G2lXEdyLHyanAh3XMVFsMljVH/+NWUhtRnl6+nWlb5okfS6S51RExIbqLn
	BfGKzs617d5Nk/9NUhEUaEJTZS+PqAmUuLmwXhuCJqpG9mGT0RgTQl5Z3GOUp4KgpKvz9R/xuGLrH
	6xb9M6NhClLgDe81bWc8PCXtzD0ZVtSQTr1S8XrmA8XN+JNjTkonfaRF+q4drmjHDSwjwsYxjx/Ut
	dhLOXSDkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvdmH-0003SU-85; Wed, 15 Jul 2020 09:32:37 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvdlx-0003LL-I4
 for linux-mediatek@lists.infradead.org; Wed, 15 Jul 2020 09:32:20 +0000
Received: by mail-wm1-x343.google.com with SMTP id q15so4689302wmj.2
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2020 02:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9PiTITbm2Lxqlt8bG5B7tvFplfBvl1yIo6Kmzl56a8E=;
 b=ot1YDljse6ITmipQNFdp/KcP8xZbzbxOBK4qefcNjgnfHxNw60L2lro5mVv0rW9trB
 xr2Npa1kR2uT7uymOuPRZNgM2ZhGFlMSbV0mo3Kgzya3FmBYENGlsCqMUYUQgp1d9tvr
 /P8dABajdryamvwlrBC+ByuqqP+zC6hXna+N5dwZL1CFNdhB3gD4golA6UMyTdyuNmv0
 0ZlgVVU6O5mQfZbJm3f0Ky3AsQphpOiLi455stO9nHMXi4mJSLcGSN6Rf0yi1F/4c8pH
 DQnX4W7hWsD9tMc5lpqioldm4TvV3YYEVULshS4NijjO70jTD/tcHlIWD+pWrJ0VZ0AY
 LL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9PiTITbm2Lxqlt8bG5B7tvFplfBvl1yIo6Kmzl56a8E=;
 b=Q1enxxCDHInlol1dL/enmeyfDfv+ZD9g9WbatbSSRNDa8DxnAKeZgJ0mJ6btTti0iG
 xXrzyvOs3GG/mbHvz5kIwPpKvldUoh6MudxquCgHun0qtPIRc94/tNAsZRew5681sY/N
 9vncfzqHbPshleJfFQb5/7HGDWITaUAKj8toVWiD6qJF4FUQ/Bko2GkS/NlS3N1V/+vE
 B1X0Hi0F31162hDLtasp4LLV/1L2fZm+gmZVamXgJyJaq0P/qaHqz8LRNf2b5KLA4Wjs
 WYEqJSpWzpNSfAaEkgHyGRoOASIeXaUlVPV/gZ9/d1wBBlN07SWaFW4o6MW6gFXkTwFF
 YXTw==
X-Gm-Message-State: AOAM532oUev1tJwAQGY9+dwnHscniqfITav0PiZ6WX5O/robFtnxI6CS
 IVVCUJvelcWZHWF+CzYKLZI6Cg==
X-Google-Smtp-Source: ABdhPJzLcC4/hBG4W1UXFYDrQ8+TkBT6n/tQXy5dSXrQ+pSmxaZ5D+Fy9bfnLvg14NXYp0de96+xHg==
X-Received: by 2002:a1c:44e:: with SMTP id 75mr7879408wme.139.1594805536549;
 Wed, 15 Jul 2020 02:32:16 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id s203sm2686991wms.32.2020.07.15.02.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 02:32:15 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 3/8] usb: mtu3: mtu3_trace: Function headers are not
 suitable for kerneldoc
Date: Wed, 15 Jul 2020 10:32:04 +0100
Message-Id: <20200715093209.3165641-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200715093209.3165641-1-lee.jones@linaro.org>
References: <20200715093209.3165641-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_053217_694495_C4F17318 
X-CRM114-Status: GOOD (  11.06  )
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
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Kerneldoc headers should only be used to document functions and data
structures.

Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
Changelog

v2: Removed unrelated reference to build warning

 drivers/usb/mtu3/mtu3_trace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_trace.c b/drivers/usb/mtu3/mtu3_trace.c
index 4f5e7857ec312..155eae126e5e2 100644
--- a/drivers/usb/mtu3/mtu3_trace.c
+++ b/drivers/usb/mtu3/mtu3_trace.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * mtu3_trace.c - trace support
  *
  * Copyright (C) 2019 MediaTek Inc.
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
