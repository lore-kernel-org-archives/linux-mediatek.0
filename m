Return-Path: <SRS0=+7pC=4K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E448DC35666
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Feb 2020 16:26:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7D2C206ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Feb 2020 16:26:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MckUdP7P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R8Zns9Uf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7D2C206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kZuIz2dUYAE5WFllrrOSn11/6ts6wvxc3A9eSpUibVU=; b=MckUdP7PdvL8Uv2laC/1/Kf6wD
	b8jbxEFeaCYgzWFjnoJLEvClSW3GYOX9V/kf+tzcfes8/3xqvYZcX2BxiKAkgNBsRUjAxZYSot/Sc
	XdevDY5OaMBIEOwlNBEwSx6pWgcMu3KMbVaGalzMmP1Wv8pbnIgTBWzoCrF/8YecMMRPk7/K99wCZ
	sVycg5eNZpQ9KNZZhdvXMG9qmzZfpW4iMXtaWT9s2M4ogRTLaZY7eVxfCfWHWLjpsU3bxun09DZNU
	nW8OkXBVbyi2OTopEzthyPIpj2yBkpf7zg+V+WpbP3j24bEBHYytkenKcpxDJ0mU3tFGcvT38Bv+W
	kJGVIEjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5Xbp-0001wl-Di; Sat, 22 Feb 2020 16:26:29 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5Xak-0000oP-VC
 for linux-mediatek@lists.infradead.org; Sat, 22 Feb 2020 16:25:24 +0000
Received: by mail-pl1-x641.google.com with SMTP id e8so2179158plt.9
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Feb 2020 08:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gg7bS1nflOAaxyupRzfc5VSU36LQb9MIJVDzdfFhX04=;
 b=R8Zns9UfFCLkk51MpnD30Zt7kTfhnWJpFVg858FZmvU0SYaspwl+hj5Dxmf5F7KdtD
 JczjkiLhNwc7OEFMuPNntrvRuDR2bN3B/ojiXZIyhC8X7rCs9cwpxZW+yrCQMtzyoOck
 Rhr9fF1Y/yrtEdcNZz3R8bAEOiooSfmj7GWb2LqUX3jEiKpf3B2T1bPfuY0xEtvy/71e
 /eRpU73u+8zxiqOln+O1XpGxRiP4u3ilob3CVnzvNXJoKFZMrdSZ0VIQq+9/1tfFY9zE
 HDXFIGXM2PO47j3ow9xSshARQrJjsqQ05SKzLMziSVIkKeT1+YzyRhbGx/X+EufB195z
 Mzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gg7bS1nflOAaxyupRzfc5VSU36LQb9MIJVDzdfFhX04=;
 b=GYAZ1Sl+2XDJUzV5tgdDDkNZsCj5MS8v60GYuBpFRQG/C3xIYxSw6yDO26rCurXdi+
 vDGiTd1d+Lufl6Vh7LeXTTllt1QXic8YqAiZpwWWhJh9HLKFW2Cs3alUTjipVw7G5Qfp
 Sywk3Rq+Gj6wu0tqJWlpV/xXEwbHRo207aWPtrNHSusu4Urv+iGVuGzMU0yvnqUsLpX9
 RzNRPCb/yab9dUiacLyeXJ6Qz2rU55Y8NShnnmf1Ae2oFA7UlMchAoBZKj7FBPNZLwJu
 rTLAQJLGtj72jx2v62P92sx3xD1B3bowvM0rTuV/bb0HOGzqiCZFKhJp6djQzzJ914Bq
 ayew==
X-Gm-Message-State: APjAAAVhSjOzZsx2u9Hs5Bqb5uNkkhZN5pNYG60i2tHsNPEAuD3U/RE8
 Dygt4Y/NsQgSSY6O6ddjVO41
X-Google-Smtp-Source: APXvYqyya8y7D5YQFJCiWMM9h4XXO/EBmT5VgPITYvRx6kw0b7p7kv+JpJQey18UWknHAr5CfF29wA==
X-Received: by 2002:a17:90a:cf07:: with SMTP id
 h7mr9838281pju.66.1582388722406; 
 Sat, 22 Feb 2020 08:25:22 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:801:b38c:89e8:305c:23c4:b77f])
 by smtp.gmail.com with ESMTPSA id q17sm6851296pfg.123.2020.02.22.08.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2020 08:25:21 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH 4/4] arm64: dts: mediatek: Switch to SPDX license identifier
 for MT6797 SoC
Date: Sat, 22 Feb 2020 21:54:44 +0530
Message-Id: <20200222162444.11590-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200222162444.11590-1-manivannan.sadhasivam@linaro.org>
References: <20200222162444.11590-1-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200222_082523_046670_B4D61C8F 
X-CRM114-Status: GOOD (  10.96  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 adamboardman@gmail.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Switch to SPDX license identifier for MT6797 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index 22f093960d27..c1295bf7080c 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -1,14 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2017 MediaTek Inc.
  * Author: Mars.C <mars.cheng@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <dt-bindings/clock/mt6797-clk.h>
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
