Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D8EDC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 14:23:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53DF52084C
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 14:23:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j/dBAgM7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="Ej4N7usl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53DF52084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pKHcVAv/zSN+YKCCROixbcoCLtcHAZWHUtI5mqq/wAY=; b=j/dBAgM7oGc6yv
	TO+fDqJcBSP61JPLTUgiPRcQem29yPBFmVfjd1Nuw6MAqtIM+3kzvt/orqgEXfL/5W4G+smoKl4Ba
	4DylSvULSyeSJLV06+IHu8yorOwzkFmw3SGinwUEyMaaHOBQmSKef3G46OmjPU1DefTIO7b18vbNn
	j0iDyqn5z0BRAILob3+jcEUjdRkAP1tw5v1fX8jwJJoHl2wBnkyesYD91pMcnvcWqbeJXdJDbzoNU
	RJTqfTmt6veJ+NsR8ZJThOOG7pBznO+E4DnMtfnqKF7JRFKtEgoS6Q3AR0C41v32LpYhAB8TzoMpP
	3X4FJThFPm1jrE9y0rNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeJRK-0002jP-Fh; Thu, 28 May 2020 14:23:22 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeJQs-0002Fw-7j
 for linux-mediatek@lists.infradead.org; Thu, 28 May 2020 14:22:55 +0000
Received: by mail-wm1-x344.google.com with SMTP id f5so3382415wmh.2
 for <linux-mediatek@lists.infradead.org>; Thu, 28 May 2020 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fW1nO44AIOkd1DyHEXQPPUYlT6a8b9ESKOQqboJxrOI=;
 b=Ej4N7uslJSputqEQa2xbVuKyL2M+K03+7SqLgEzI3Rn7DshHJgdM/1XfyTMJGnW2Vr
 m0kkQeSvrJxgLmRBi4HalZPUSysYWSMvD8eFOAkLxWuFZhQhfy/KFGA/rhCdy4GUO4Pn
 iKNJxxJUjDqambIIaNJHNZx7GdTpvLc5/YhqkdhU/HunYNdaEEHUWKYEKM/54NCX3mc4
 7+4XyZJipYLbx5cPjsGshzE8ppHw/6xYyV6Z2MCCG8D1JcIbjXIceyeEUpdWsHqCAuhz
 oq1OVCuUMCpbxDzIXVKaKNAUP6MtMrYwvPGK3qKZh8Z+oY7R5T9JWGFIadiTQ2msyWgZ
 0lcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fW1nO44AIOkd1DyHEXQPPUYlT6a8b9ESKOQqboJxrOI=;
 b=UPgm79aBqsY99W0ecnH5Esj2Hlye8pu83r0WVRRpB+DQA9T7ru2uXda1b+9djpZemL
 UC/FF7dYwT2RM3PeZhnc9CMEVcCH5EgWQejGVD5T2o6IdaXLtwi++E/bP9bC0uH8e/pM
 qYUq1WqDsg5qmURsXCvm19DHxHRElN/rqk2eBDuJEvjXcOCbrhttiUVFqosZ8/Uw9TvG
 WWhe3V3RYCxx1wiu5yNaoPU0mV/F2HBhITqrcndhzM7iLNcHrnqCjz9g08NRXlF95Y0R
 xuWVhXI24gi9pQcWSNL9FV3yge14WUbETU3pWki13OCQAFXdkeShCu49/ysY0p8bXHp3
 E3hw==
X-Gm-Message-State: AOAM533tgTFLjtXlKYOdJHTGtDASSCs0h7nScVu24Yye+kHKbH/wZ5Dh
 KQ7NCUiNVUCf5f3xPoVE5msZiA==
X-Google-Smtp-Source: ABdhPJyjpo8fZxpr55zZ4EY0chHkdotq2Tr2sLbnnUHjIG5v+Aeelk58EK7UzA58W/G6CefodEUQ6A==
X-Received: by 2002:a1c:4008:: with SMTP id n8mr1516082wma.118.1590675772064; 
 Thu, 28 May 2020 07:22:52 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id h74sm6258162wrh.76.2020.05.28.07.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 07:22:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/2] regmap: provide simple bitops and use them in a driver
Date: Thu, 28 May 2020 16:22:39 +0200
Message-Id: <20200528142241.20466-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_072254_298525_E2243D86 
X-CRM114-Status: GOOD (  10.52  )
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
