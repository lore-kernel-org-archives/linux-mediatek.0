Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989D5C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 15:45:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66133207BC
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 15:45:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o6XasUhq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="g0HFkoJK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66133207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qrrq4P9CYQ+wrsj3MgNApmTLv4Q6Ji8s50G/qcRQQAc=; b=o6XasUhq94L+pa
	t9tfjPrbGGUxmJdLvWs/JsIzNeYxPk5WHU6dMfNaKo2Yi+hcLIGGCsa2/IrPon4ENTxPYBgcKmi+Z
	jq1nfZBLZW40oNwHWtMGnyuZ1opP5jrrii05vAQFwbl0CE49fmqOBcog14N1OClGqkjN3ILTJBIPL
	v3kazTbED8ZWOmJOk0kGaVFWKYzL410DCmElMQVjWeKzYA4Df7cd/IIuC1z/ykunrdQ3Rv7X1Fxpe
	wMPxmfnU0Rtp2TFAbQfTT4jqqDcM64kt6jp/N3pGoiydGUg2QJ/wSrFfZo4eb9pl5y/wJfLPhy9cs
	SIFBaagDmUPPN4smUWwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeKiW-0002YX-Tn; Thu, 28 May 2020 15:45:12 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeKiT-0001Nd-Ee
 for linux-mediatek@lists.infradead.org; Thu, 28 May 2020 15:45:11 +0000
Received: by mail-wm1-x341.google.com with SMTP id d128so2593519wmc.1
 for <linux-mediatek@lists.infradead.org>; Thu, 28 May 2020 08:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RRcpe0H3lCAzNpSzTtIGdoPxExC1gnrWV04XMN1Ki5Y=;
 b=g0HFkoJKIY9iSEkgGQr+z2ngQ5RvAXjSLWxFjTtoZKt7hmDAuvtCGVOiKVewJ4rQqt
 T2/8s2EPboAsw2RPb5z3xfaPEiobgw2PMqFJ1KOvmAxxWtVsHP9U0UvlOUIuZFjX4prO
 EROm0xvcPNCKxVAQ4MY81faMt0ml8cV0vQj1lO/w0BPMLaIBrby2hr1ncD0+i5Oordpy
 EMCYu6kRDEgoyGD2TDNNS7Uc4me45W8sJuzMWwUmnF6BmQH2E+ng5a6R0eqKr6M8kiXi
 zeJapxgvsGZrHT30JbNBOTMLluxih3uG2BT13+Qk13hcumfHzLaDzvuwG3Q7yAmDOOAc
 +mLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RRcpe0H3lCAzNpSzTtIGdoPxExC1gnrWV04XMN1Ki5Y=;
 b=Y5Eoi2NgNMJvarbGJo1/iKSS0Ka0Wj++F1uBYlwmK+UjVB74mUNN9SMHwXqikkPO3j
 4KX3yVvmBjNN/O9nNdn0aUTjI3sjpLoK/J+3gQ1+Gntc+zJdeV6wkQYs++dF0e8hmhjo
 6p+OAalzh2oAmUlBpagqmRwKVvXdawyu9bYQrh/j7HgATMFBzNC+1hbFEplNySKb+OXA
 DaQ2wS9zMu7YofDnR3CQ7b/6t9HsUwM3B1Z8arRRM8ZaEwh8t894e4xJdbRSg34PI3D0
 c3tXI084iBMTgIyOY90XSwJfd00bBtlBzRydZ1NLc0GJ64d+l6ZdfF9S55rs3gV8ecds
 u+2Q==
X-Gm-Message-State: AOAM530DbUxKYLB8FilWn2pobJ5+WFJ+JbdZa+k7v22aXuJtuxRfzS8z
 9UAbv0v2fjmUhcia2ti6RFiXtw==
X-Google-Smtp-Source: ABdhPJxsoz5O8Wu+pBo3JregNWfan6WrHopy2c2n+D7n8gRcdVSFiDJEqbgTrXNos0B2dRpaa0ksxg==
X-Received: by 2002:a05:600c:2201:: with SMTP id
 z1mr3945929wml.70.1590680707286; 
 Thu, 28 May 2020 08:45:07 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id n1sm6285650wrp.10.2020.05.28.08.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 08:45:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 0/2] regmap: provide simple bitops and use them in a driver
Date: Thu, 28 May 2020 17:45:01 +0200
Message-Id: <20200528154503.26304-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_084509_585003_C9E900AE 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I noticed that oftentimes I use regmap_update_bits() for simple bit
setting or clearing. In this case the fourth argument is superfluous as
it's always 0 or equal to the mask argument.

This series proposes to add simple bit operations for setting, clearing
and testing specific bits with regmap.

The second patch uses all three in a driver that got recently picked into
the net-next tree.

The patches obviously target different trees so - if you're ok with
the change itself - I propose you pick the first one into your regmap
tree for v5.8 and then I'll resend the second patch to add the first
user for these macros for v5.9.

v1 -> v2:
- convert the new macros to static inline functions

v2 -> v3:
- drop unneeded ternary operator

Bartosz Golaszewski (2):
  regmap: provide helpers for simple bit operations
  net: ethernet: mtk-star-emac: use regmap bitops

 drivers/base/regmap/regmap.c                  | 22 +++++
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 80 ++++++++-----------
 include/linux/regmap.h                        | 36 +++++++++
 3 files changed, 93 insertions(+), 45 deletions(-)

-- 
2.26.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
