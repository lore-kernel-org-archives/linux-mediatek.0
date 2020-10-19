Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3158AC433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 14:07:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA2C022263
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 14:07:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZipQpBII";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ixfn+4ug"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA2C022263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dtzZBBQ1x6JwiFjEqEjuT+owKi3S6m6fjuEvfDOdhn4=; b=ZipQpBIIwB9iIOrEaLo5aJlIM
	p7BSqvzD4fDPMGgUx/NWiIsmP6K98TZcb6QjQTDnTCJNeBdug9KgP6YN3j7o9dHcrusVDaoDoDjDh
	FMAIjcbtGr1qof+cP/ovMi0v2/Ow4E+sBhuJVZ71LRG1KzDLssLqcer2+u2KFuSEk2WpGlMnoTT6Z
	RK1ZZqC30wJSrqaVXHuCQ6moDGnhKPtpkLlSK9hSRlXy0FxAR3kaXIzvZaOlaDSIy82/7EC5zmQFS
	DyyOmP3GSdSa0cVt2aEcokYz9+USutT7VryUcztVEIHiOiZ/DaW2a/QTKFT6k0gownEUuz6r3pO2n
	XTr9LaG5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUVpC-0004SO-EF; Mon, 19 Oct 2020 14:07:46 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUVoe-0004Cm-Pl
 for linux-mediatek@lists.infradead.org; Mon, 19 Oct 2020 14:07:14 +0000
Received: by mail-wr1-x443.google.com with SMTP id e17so11583305wru.12
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Oct 2020 07:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uWLN3YIMsxR1iGy7rW1d21liH/vLTaxscqX6iA3EebA=;
 b=Ixfn+4ugrcnS0mcW3BpGq5osRpI/rGY/CpMOsUqua/hbUa+kFr/ArHc10T2Dxc99gw
 m9g/xwwtm8YQsVgMYeGuFEMDGXwN17ZEDGoWyeaPfZzQHcMrJF0z6smN9CjY0BC6h3kB
 gyKQesVJMikHoAQiI+3NW1VsGkrKqQHi/NcEec7KYt+Mqgf9AyQXzlYvCeXOEJeYkeSn
 slON715WIhocdH5j8IPKbVCYrfsglhtXQX8TwBxEY1iB10d/Wzi2TJY8yranDGWHLlqS
 xRUNyjec1IBAB8zs3SaT9ttqc3YJhecUHYOjNDIc2m8PZODMC9+8yHId0iTorspZQFLZ
 bjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uWLN3YIMsxR1iGy7rW1d21liH/vLTaxscqX6iA3EebA=;
 b=YffxYzAABGBK8skLTz05noLeUA8jktF60+5NEOxuI6omYSl7YaAjQ6udCjDiyRSR76
 lLF/rNnQFsOVdPKiSlXe1IttiEYw5Xhf+/TiTUUNZ2//lQM5R5ECuFmIY6HPsGlwh+7m
 RU6UUS5yEdEyNO560j1CvXjGoyU0AYCDE+NV7elNB3kuuW93uzPqs4I8tmcdtPbZMF0/
 ok2sQNuQ+J5xkzTjUQ/Kucl3q7141P6jgHkEBmX65Gp25nPypShdcgFxFGBLzhuQpm6D
 PvlBd5fOk0lNtWrtvjjtB8fhQ63E9Hz8A8oGYj0m5Xdw5pTUUjM78MD19TJhmfbvZrLP
 JKpg==
X-Gm-Message-State: AOAM5308piloe3B4kARmop+VWh1rnQ6nY+smElYLWMt4KLgSkdGuDtlQ
 5C5cWRrXAVxAwePLY5DQ0xORaCcU/m3bzQ==
X-Google-Smtp-Source: ABdhPJwUZdiAJQZSzWLvRRrWeMnEjALHfBudLnha4o6MOrkzvyGZ8EKUQGdLBDYORfWVRnYqKGuLsA==
X-Received: by 2002:a5d:4fcc:: with SMTP id h12mr20998755wrw.132.1603116431423; 
 Mon, 19 Oct 2020 07:07:11 -0700 (PDT)
Received: from localhost.localdomain (26.167.185.81.rev.sfr.net.
 [81.185.167.26])
 by smtp.gmail.com with ESMTPSA id a3sm114182wmb.46.2020.10.19.07.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 07:07:10 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: pwm: pwm-mediatek: Add documentation for
 MT8183 SoC
Date: Mon, 19 Oct 2020 16:07:01 +0200
Message-Id: <20201019140705.1518822-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201019140705.1518822-1-fparent@baylibre.com>
References: <20201019140705.1518822-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_100712_922186_0B6816A6 
X-CRM114-Status: GOOD (  12.22  )
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
Cc: robh+dt@kernel.org, Fabien Parent <fparent@baylibre.com>,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation for the MT8183 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
index 29adff59c479..25ed214473d7 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
@@ -7,6 +7,7 @@ Required properties:
    - "mediatek,mt7623-pwm": found on mt7623 SoC.
    - "mediatek,mt7628-pwm": found on mt7628 SoC.
    - "mediatek,mt7629-pwm": found on mt7629 SoC.
+   - "mediatek,mt8183-pwm": found on mt8183 SoC.
    - "mediatek,mt8516-pwm": found on mt8516 SoC.
  - reg: physical base address and length of the controller's registers.
  - #pwm-cells: must be 2. See pwm.yaml in this directory for a description of
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
