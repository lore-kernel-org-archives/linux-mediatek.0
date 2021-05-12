Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE27C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:17:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B97C06194D
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B97C06194D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=biS2mnzUQEKoZzBEKnY3otwrORK8/Q9sILjo1GPg9ow=; b=JeUauVrwkZ4/YrovZUT5+J5/zs
	jyZn/R+Gz5wWaIBekTwKNMgQMm15SdecEcCDnbc16KFxPSuw0XFIiBRlVn+JAym/EaqMpx0dPSr3u
	Z3zTLLNtWT86FCUqI8IP3WEZzGm8KQFW3FZcsEApvenfGPXww0zRvWkBuHyDXuvTrRdJnPEubpvb8
	mPgsfX+5y/4onSy3C4luORxygs4619Fl3/trFEEuukAGxsDGstW416+qOOwgn0NsIHMP/cNEISvoh
	nwmUh7fPtNwrvxTgg8s/XL3VNN33v8Y53WoAKgKERYjBbmo5cebAvGu+ShkAW2UQ8YgN2h97rWr9s
	gdLW2O+g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgqbQ-003995-7i; Wed, 12 May 2021 15:16:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqbB-00395o-JH
 for linux-mediatek@desiato.infradead.org; Wed, 12 May 2021 15:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=GDfHlfvGgS7fXLPKGx3FlVf6YEX/1T7ZpXdjwd6txh8=; b=lD/iuQZ6PfZY5+fmmr6BV2OLJ5
 XLIx/7a03wWKKdUpfqfyhg2+EZK1M5Gy0OY5cIkUcMl5rjXBQ+IzvGmcEd9oQZS6njKaQcw48ZDH4
 ge8ZXr6sRjryrAWZmyw4ryF63fK9PadrDUG3Qw4ZpjB1OI6xQELxNecEsWYzFF+dBdf3k9+u5sD+W
 hGJgXPUSvQs7WrIvSrfbXLKnTC782Hr6K5vwy8FUrnrhAPRAhJyP0I3xTnZyg+YXh6RhF5Ku+ZwPN
 Qkuv+tnsdHgHa1ekqtxjgw7gIMXtWbQQcOu3ART6Xk0V0v05efgPDxwzpYiVNLurU+Kj8b2HdP5fe
 xq9hurjA==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqb8-00AVAU-3T
 for linux-mediatek@lists.infradead.org; Wed, 12 May 2021 15:16:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 4-20020a05600c26c4b0290146e1feccd8so3238334wmv.1
 for <linux-mediatek@lists.infradead.org>; Wed, 12 May 2021 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GDfHlfvGgS7fXLPKGx3FlVf6YEX/1T7ZpXdjwd6txh8=;
 b=utmLTJuzUlAWiJJ2I7sO7sN+rJ0xJZPDgk+sbM8D88/+apd0NE/N7DiJj/z0Y/0SDZ
 7q+qXkA1DehSPGZt2xcQ2ir0d9PzpF4PRLrlKBIANEiB458Sy3aXFuHBJI6aE8P4EIyR
 MLs8nKMA5HZsD+PZgQTWWGj8vRpDaa3xGzS/GWQQCA7TawKJuJbNQbkaPmkmMHhstXZg
 GHWo3dTSkcEAIfK8dJaDHxXYZ7HjyJV8t0H6951/nq2gr9jqFb2MjMAy2gFWKiBBaeHp
 iwYXRRgPcHvjdYHfvrOgNO/y64CptU/XnbA4vNxBxBC89AW3MMdje9w/Whaep2QXYLUZ
 IEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GDfHlfvGgS7fXLPKGx3FlVf6YEX/1T7ZpXdjwd6txh8=;
 b=HATbyB82EFYdfjZOeDRO1ErvZUvArESIIzdidEEVq55ec3ScTOeL2uZODBuFQO+WAq
 28GeC+aOdCDheqpi2AZEzLROUyj7dScW0vxH8vhugPO0INwDxJaXOcpGtaTwtu2/EEup
 BfiXt5WhBobaupoDw2stcd3vV/TDZQj6gHK5OTjO7gfMMGcHb4DvKf5KBmv3asUY4O79
 4v8CN3hzq4X418PBmrpH+ujpTyy3hBHzZVt0SV1czh2WzteejUNeNVi+LGGLnNfi8HFj
 +Tpnic8gDdZytmVzI0n3AzteifaV6b54NQ5T4ZC1bxOqQkmKGbOIXbgRqxv/KZNmRjHY
 UWcw==
X-Gm-Message-State: AOAM5309iWnSS/mrpwB9xopfMW1ySO6TZAawV+Jy1WZGcNTWibZPYHTA
 tIlmF0qZ3tijzjyvTBgUIDU0NQ==
X-Google-Smtp-Source: ABdhPJyI3xdXbd5uniPUQaw+qrjIO2uDp1W5G7V6XvL8VFTQ0gpNN9lqEOC5ypH91WGzf0KRYZs71Q==
X-Received: by 2002:a7b:c74d:: with SMTP id w13mr38372027wmk.25.1620832585788; 
 Wed, 12 May 2021 08:16:25 -0700 (PDT)
Received: from mkorpershoek-XPS-13-9370.home
 (lfbn-tou-1-1465-169.w90-89.abo.wanadoo.fr. [90.89.34.169])
 by smtp.gmail.com with ESMTPSA id c15sm30095011wrr.3.2021.05.12.08.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 08:16:25 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v2 0/3] mfd: MT6358 PMIC button support
Date: Wed, 12 May 2021 17:16:11 +0200
Message-Id: <20210512151614.36996-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_081630_165635_F341D6C1 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

The MediaTek MT6358 PMIC has support for two buttons: PWR and HOME.

The interrupt logic is a little different than other PMICs from the
same family:
for MT6323 and MT6397, we have one interrupt source per button
* for MT6358, we have two interrupts lines per button: the press and
* release interrupts are distinct sources.

Changes since v1 at [1]:
- cover letter title prefixed with 'mfd'

This series depends on [2]

[1] https://lore.kernel.org/r/20210506094116.638527-1-mkorpershoek@baylibre.com
[2] https://lore.kernel.org/r/20210429143811.2030717-1-mkorpershoek@baylibre.com

Mattijs Korpershoek (3):
  mfd: mt6397: add mt6358 register definitions for power key
  mfd: mt6397: keys: use named IRQs instead of index
  mfd: mt6397: add PMIC keys for MT6358

 drivers/mfd/mt6397-core.c            | 20 ++++++++++++++++----
 include/linux/mfd/mt6358/registers.h |  2 ++
 2 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
