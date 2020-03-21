Return-Path: <SRS0=rKvN=5G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41027C4332B
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Mar 2020 11:40:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1319520724
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Mar 2020 11:40:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mCPJlgd6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsLAT8+u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1319520724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=zOxD5Z6CiEN3cdmwFAGjMkn4xZIL44y8Gy9T8tGEqvc=; b=mCP
	Jlgd6H6PpGX+bSdHhs2FDgf94MtcN1EiKjPW6XoC57hN0Kcp2gIJi7cAtvjVpz1VWZ8+hU6R3PgKc
	BL7ULxgcEr/RRY7d2PPwRU6K6WxzgM66rUw5uEEUje3tNA+QvqUZqSjOM3+IwYJkXSFielZyozXQ3
	GbyqRLULfbjeSynD7pM4AoqWJAaaFnW64Vu0UhfgCC9eJymBXfD8yQfdYsD2CJkzv+zqgOjyIi3Gf
	vG1dJVGrJ5NJ4XkMGnbnyULOXCn3TCEL5UFDKVRHQat/2cL8R3SLKb1v/DHSz99CzWUuPoVrtQ9ab
	6iSXCpciTc2FGCCnFZdb1QS7nDFrIVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFcUZ-0007IP-2H; Sat, 21 Mar 2020 11:40:39 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFcUW-0007He-E9; Sat, 21 Mar 2020 11:40:37 +0000
Received: by mail-wr1-x442.google.com with SMTP id h4so10627819wru.2;
 Sat, 21 Mar 2020 04:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7jR/DJniamHEDhpAAfPOcbN20Xg7ftVEruh/hyhO0PE=;
 b=LsLAT8+uDmGSdQQJntAF8vnUqUnpGplRkCu3wIrpjOm72QwxiPSyucWszlZYxKozpk
 qp1vUdTtSmAetmlLU6jTQsYrGZZvda/aPVoulZxELtCJkR0Tsk815tDkL+3HK/YXbxmF
 jtLdYdPDUeiOXDU/BXFfAiZiw+i+o+K8v/k6ReFNHkMNTlclmAibR2TVRvpJfZhdkJjf
 PO6EcEnhKLmfdn1TCVDGkM0VDNM4QsMMh+da0N9WrkDmlYc+Nei1FaumMXpQqwIkgw4S
 CSLK6Su/ZLNqr4Y5WZVY9LyUUDLzSlUN8nngsIj++Gs1w7nQoRTiQsF98zCyGaGin7Oz
 uAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7jR/DJniamHEDhpAAfPOcbN20Xg7ftVEruh/hyhO0PE=;
 b=MN44luOnCYUoG1/KeortEgoKWaDFCRKaWHDDnTHitD+PIF70P8Mbc4olti27w13TuT
 dA9HW2kNnWSopKBuliXtz8Ua/KsXeTuU9OlSXauYZXgAjW21BMcNfPhNGH5MyOecIjvz
 91SRQemmc0VMlQgOr4zqQabF1Aa//DQnbgLIjPtLKgkSYJdgyYPXyDKjc1oTTPfGsieK
 KjLq+/xB3f6ctcQFjAkxFol2x7WjXKH3jis6huWrhyoKtwv0ENuye6xklgrSHOqWYM2o
 /YV5LG7u2xl4oUE7Pt2ds5VlKzAuoCkacvz1bQKsACB3VWBdmRROS8/8yXwt009yX2MO
 ScPQ==
X-Gm-Message-State: ANhLgQ0irQKg0JKE5P9XuZ5UN0axI7Kg7d8Wk47qa25pmm+J+f+JTV3r
 +dZ+6p3VxB4EEgqAjrG6ci8=
X-Google-Smtp-Source: ADFU+vvxfx5Oi42isr8/wePrVDB2XPv0PjWByfMkPVW34u6Ng9Fb9YvXxU3xXUegrdwEReYm41u9Cg==
X-Received: by 2002:a5d:6a4b:: with SMTP id t11mr17009174wrw.52.1584790834729; 
 Sat, 21 Mar 2020 04:40:34 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d49:b100:e503:a7c7:f4c6:1aab])
 by smtp.gmail.com with ESMTPSA id t16sm9533091wra.17.2020.03.21.04.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:40:34 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Jeff Chang <jeff_chang@richtek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: MT6660: make spdxcheck.py happy
Date: Sat, 21 Mar 2020 12:40:22 +0100
Message-Id: <20200321114022.8545-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200321_044036_500093_4A6E84D2 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-spdx@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The SPDX-License-Identifier shall not be suffixed with anything further.
This makes ./scripts/spdxcheck.py complain:

  sound/soc/codecs/mt6660.c: 1:36 Invalid token: //

Clean up SPDX-License-Identifier line to make spdxcheck.py happy.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 sound/soc/codecs/mt6660.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
index a36c416caad4..06ab1d39d2c1 100644
--- a/sound/soc/codecs/mt6660.c
+++ b/sound/soc/codecs/mt6660.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 //
+// SPDX-License-Identifier: GPL-2.0
 
 // Copyright (c) 2019 MediaTek Inc.
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
