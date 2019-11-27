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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CAEC432C3
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 16:44:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D1EC2073F
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 16:44:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qcTLk4Rm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrlA9jBo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D1EC2073F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3qoivEw8Ga9bHdv9wASUvhF8m5wx65+NcX/2iaJNFyQ=; b=qcTLk4RmkWKlZy
	Ji549aXZtdVWtSgG1ObwuyrUMFDaHRuuU7urzex+I/fy64vM14hIYRE8om1z4cQ+3XK0PlOn4GJqw
	SgwYneNBODTlhNxRy8PTsRDp6x+OBWp0ORpvLuwJu1pLrKggNy8v3m/GLtqVeTrapb9rDqzXjZNhy
	Rne3vbzi5/FioKZZ9OfZHO93xUtRHvO30NXEZPbe4DFISZC/kf37chp/wi0MSvAD60XxR5YAjmMft
	cTcBYKoWsNq3Acn5n+eSWewgdbYXM67npt8D/bKfzrthvDuHIvpdarWrHUrUaNMTANxym1A2OM65r
	ZEbOnV1i9DfGkIml+uNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ia0Qq-0001ds-NJ; Wed, 27 Nov 2019 16:44:48 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ia0Qe-0001U3-7n; Wed, 27 Nov 2019 16:44:37 +0000
Received: by mail-pl1-x644.google.com with SMTP id az9so10009449plb.11;
 Wed, 27 Nov 2019 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=whErUc4BDiJMZ5xY3J/KJ/8CM+fMkJiEkPObAvIrJNY=;
 b=IrlA9jBoYhmnJLv3XX1CbNuYLMmcJ20omNiqylLbqKNY7YXmt5Qg/tzaiDbcvEWRJK
 LAHOhWLyA/laKOk7HCohToz0fPm5rZ5anSEPArvahmgydJXYD3d4FJ3loZNxqXeNWl1y
 wtepn0Z6Bpw2qvYFLZfU3TKSbDcDJBi7F+805QOAsDJrFTbBkgAr6IDkKcb1mgHK26xx
 7dH6YKmNo7AA3SOht4pAksRArEDouCbxLv/ZbHdVujMaso/1Il1sUuXGTjNla8xixG95
 AkBCdedD7tjrwJxwv7h4Mjl+WBKvopx/3Dnfvhf99W9n9FKhOJFvkpkzsqY7dQT1aWUN
 tKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=whErUc4BDiJMZ5xY3J/KJ/8CM+fMkJiEkPObAvIrJNY=;
 b=RcpmR/5B/mgWS9sNee8svoKBnCkiEeD5nDhpGVJpcI0uyflV45VECw2iSLs1GrvEX0
 VvmzQo/9Ig5N05VcSwNryCtlVMXo2xMs67gKVB8rlrDbe7zURVeFp45D/o6Ry/+JaX2Y
 s8IccyTLpzxWnnzYnsu/YYEJ0EzEJSsOxX/8u7m2X3tqs3zyberDs6DnvN07l9rDeqpj
 71kWXuvNFHIXrejyi1dihIDl1kuNNJAFhu8u1xeO4CJWcGXfmbbMqv8yljWFI2o48qhB
 vd6JWCNYDqigHKqu7GjbM/KexgWOOcRgjUGKCHjkSPZ30eFNXeu86tqVY5hR5aBzSAd+
 Pfqg==
X-Gm-Message-State: APjAAAXJnBzoZBDQiBdalMSrQNBxanpnGC4KOjhM6BckgSdon4To7VwG
 BLjdME2HaDQPyFH0gKsZdig=
X-Google-Smtp-Source: APXvYqxU5CUXFdGJB2Ooeq9rK1fyfcqrLOz+Hg0d0n70pp541B+B9o7dx7Stb4JEkXaH6oaMWoeZug==
X-Received: by 2002:a17:902:bb84:: with SMTP id
 m4mr4987230pls.255.1574873073243; 
 Wed, 27 Nov 2019 08:44:33 -0800 (PST)
Received: from nishad ([106.51.232.103])
 by smtp.gmail.com with ESMTPSA id z11sm18371211pfg.117.2019.11.27.08.44.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 27 Nov 2019 08:44:32 -0800 (PST)
Date: Wed, 27 Nov 2019 22:14:22 +0530
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
Subject: [PATCH 3/5] pinctrl: meson-axg: Use the correct style for SPDX
 License Identifier
Message-ID: <bcb86aa22d8d8499502bbd8c54a364be24886a86.1574871463.git.nishadkamdar@gmail.com>
References: <cover.1574871463.git.nishadkamdar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1574871463.git.nishadkamdar@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_084436_278012_D6E2B33F 
X-CRM114-Status: GOOD (  12.00  )
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
header file related Meson axg SoC pinctrl driver.
It assigns explicit block comment for the SPDX License Identifier.

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
index 8ff88bf2e849..aa79d7ecee00 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
 /*
  * Copyright (c) 2017 Baylibre SAS.
  * Author:  Jerome Brunet  <jbrunet@baylibre.com>
@@ -5,7 +6,6 @@
  * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
  * Author: Xingyu Chen <xingyu.chen@amlogic.com>
  *
- * SPDX-License-Identifier: (GPL-2.0+ or MIT)
  */
 
 struct meson_pmx_bank {
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
