Return-Path: <SRS0=L+xn=ZT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FC6C432C3
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 16:42:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 523BC2073F
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 16:42:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hv2rHB25";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaLImqaX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 523BC2073F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7jNK+yL9uYKDMKIjZ6ua3Q4s7T4Ii6D+X8kuNCTzvc=; b=hv2rHB25B/Rzbo
	n3adt1MbNDSFUluWMgIRtJmc/NjgkBdRlPrwW9J97WraHOnotnR4R9X+esRmWs50lMEh9rIxSG0rH
	H+L3QazKqZy5Pz0slQEJE64gNiNY3kRoxvN+Yy5619+93HhME9kgcG2q6i922Sjn98d28Cv90oxvI
	FnaYYHqd0QlrjpNRcihQ71xdaZnf/OwJH2akLxics3wM108RBl073EVp5xPj74+wuxKK5Y2d0jk+c
	FWgtnMzH3b1cwK2tOZvXjJCBDCXRqq0KcFPUVzc50l/cOVJjW7+vZPbGI60uqKaeRzLx+7ggJ+Ehi
	NZx2OOzO2/MQ74/4aqhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ia0P3-0001Ew-Dw; Wed, 27 Nov 2019 16:42:57 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ia0Or-00015B-JW; Wed, 27 Nov 2019 16:42:48 +0000
Received: by mail-pg1-x542.google.com with SMTP id t3so10708768pgl.5;
 Wed, 27 Nov 2019 08:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Xl4Glegm6mdECeLqfmquxCwZlwbSQB4i6Znnj9ZE+DI=;
 b=aaLImqaXXEFyDQoHrPEMGh8ndhdl9gZJuOmHyu+pZZDTZWbfo8bKC+whjrSQVWhuxU
 NYt+PbFK7OG+rEYQVDWtB8A0KHHEIDstj61l0+aHTIFEZ3ibUY4OeJYXrC+28XbcaqqY
 atqmBXE+O4sp1cYypiKae5R6bxlRt8myyVVJ1So1UTPM+Bv2pXNfGlal4+Fo2eYANxA/
 b9F0B4VdjmNO6gO5aXgVhVpAa8kcNBSkcwJzRmb4430VOcNRZAgSNLtP/9Oiq7y1w4ne
 sjDEqe9L1scDSQetQaLeZAncSNqzJT0GL8oFf05RRmWtALJqS5XFvK2+YIZ0W4zrVlL+
 F/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Xl4Glegm6mdECeLqfmquxCwZlwbSQB4i6Znnj9ZE+DI=;
 b=lC+52JBUkS3I5X7dLvnzPkDKLF9oDe9WQmCMLlZcXA+jwMvt/JuC+fvD9D4FJFt/AH
 DNGNBzhiDec+AnZ/+n5m+/NMgHHy+d+Gy2VNQOBkRiWB7yJWr8F5WfnzOtBh2AAVCq2n
 EJApTOf2QcIdOd2e/+e+5WfYQG7yaL9HSU4wOBDs+9s10mZPRIemuWatC2WvK5X/Pdgg
 pF7lU4N6gdLAb5+9yfulvAPiUx6xrHLO27u+ZMKyCOvr1YlSlTYb1ks2hNev2By0TDgH
 sawo9b8bDGBN4ms952ynODwvWe0BqJqWho9vYQ3ilH/vhadODGl3gvlGhRAI7KgLJ9lM
 vLVg==
X-Gm-Message-State: APjAAAWPwKrjf72Pq0DZ4kkJ9IENtqOwOR9XEzOIi3aA2XiIYr0YOUfz
 Pw/37kWAmh4pybepr3+Lg4g=
X-Google-Smtp-Source: APXvYqwlDU2Ab8PAuwqLDAc5/btU/U8B8e0EchIgGnZlTuxZOq1jBwxBcCm7mSvfv1ntAHxZjKgsbg==
X-Received: by 2002:a65:590f:: with SMTP id f15mr5870948pgu.381.1574872964385; 
 Wed, 27 Nov 2019 08:42:44 -0800 (PST)
Received: from nishad ([106.51.232.103])
 by smtp.gmail.com with ESMTPSA id v3sm16827100pfn.129.2019.11.27.08.42.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 27 Nov 2019 08:42:43 -0800 (PST)
Date: Wed, 27 Nov 2019 22:12:33 +0530
From: Nishad Kamdar <nishadkamdar@gmail.com>
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joe Perches <joe@perches.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 2/5] pinctrl: mediatek: Use the correct style for SPDX
 License Identifier
Message-ID: <2994fb2f3375790e832396cdbb0a279dc8c8839f.1574871463.git.nishadkamdar@gmail.com>
References: <cover.1574871463.git.nishadkamdar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1574871463.git.nishadkamdar@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_084245_648625_0F668311 
X-CRM114-Status: GOOD (  11.77  )
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
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch corrects the SPDX License Identifier style in
header file related mediatek mt2712 pinctrl driver.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used).

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h
index ba2356a8ab89..845c408b5fdb 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2018 MediaTek Inc.
  * Author: Zhiyong Tao <zhiyong.tao@mediatek.com>
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
