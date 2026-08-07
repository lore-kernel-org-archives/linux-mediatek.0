Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2809BC5AC7C
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 08:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Og8epPMT2luMUJBXRpFI2/AU8UKubYJ4m2A5JNHJ56Y=; b=vf3DGzLztHVjQ25hzobUqHuYy9
	7qcLhBWlmL2+kIFqhk5KZCg+MiX6A3hjFy/skHy6+SOmQ997O50IgFXAVlCCK0Y0+Sopha6fdHYe/
	L7zQbt2Nq4+MdVYzOjURMW6KsawFBp0nv9yTYI0TMqZBLwFmcbuDOS2CmZyAhQXm44ZLlrrM05lLR
	lgQqvXciRvXbsHaogYBdd1Cea3+jwSt57VjsosSzo+xkUonJ7qYnOsalzLbax+gS6tRqvLKEOhyrT
	NoQJVwsitDxenaSgdekKKTWrih3cYG2JGcP/s3sjVtFdh+2aD8vl1WNAmyGT3nZWeaWGvs8wAop4N
	1rNCxJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFlS-00000007OXz-2ClN;
	Fri, 07 Aug 2026 08:17:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFlR-00000007OXW-2E8n
	for linux-mediatek@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Og8epPMT2luMUJBXRpFI2/AU8UKubYJ4m2A5JNHJ56Y=; b=nbz1F9a0qq/TT5ww/Uwxwoo/R5
	g1h6li8qx9tLTP/QpaJ1dohCSHuMpk3Q0U/HjKdcv/BMFyKYHqGHl8M4k8ENWMNZl9np7rXRQ1GP1
	U3NRYoKO6LUx8U3amOr+jn8eOtfsUPVkEtyhohqrCO5bpa5CK13RrsOmBljTuv40UR8wKYuPOmRa6
	REevU3NtNHPjePf/M34147zVO+tf/TiuUilM9XwVooVclzUdszl0f5uu/NndPWaiR1/bwVrcC28/k
	VNtkXO35PqgVbvPQ8jcsq55bWi0bF6aIs1Bp+q5wIbs/ym8FmIUlbvmE6jxev053XgeKNusoLTPuJ
	UFEE974A==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFlO-0000000CBav-2BFJ
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 08:17:12 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2572574a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 01:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786090628; x=1786695428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Og8epPMT2luMUJBXRpFI2/AU8UKubYJ4m2A5JNHJ56Y=;
        b=aM0HnrA0DMcHQ7e0guXe4hCCIAIR9fk7CKEutY0sW/3AvG3QYee4lqjNLrnygqW2vj
         cxLOvksrsTTjuIl6xi6vdt0NP+ItKQQpt/6ixZh+Bq+xw/5v9QVDJFbOLa6ghc3e2NcH
         cXEmtlnL1kavgRCxHndZLpHMcNcJrF+y+CJHNjiqfHxgoJuqD7xFuG1vv/rNaGTZqdBN
         spgSvcSSGPLoF6TQPkG3umSeaPc502Rl6ZkMNv52OVHB47Z8Hcpavb4zti2OHIMz/pvv
         DOSS756aIwuNahC/ORgIqMwqUsR9ihF277ub+fRqjAfeYbWbaBEDxKO3pGQsyug/QhC8
         PshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786090628; x=1786695428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Og8epPMT2luMUJBXRpFI2/AU8UKubYJ4m2A5JNHJ56Y=;
        b=b7ScpftuJB9BBgm+TTz38t9C22WBk/eyF1Vu1BFVvLOCC4H+0PyZeEcsCQVxyYsB0i
         4Lvn++sId31h07uhqo190ZpmtP5zeCdg1zkpzUslJhVLpyGairor3UDpK08AA9fne+Ya
         F5LfxhLz+nVVbNP4miEO9/XbyAK3scMHA2nEtL3WZ46ucfUsmXjP3NUzeqH8iCGIvnwd
         Cxxcv0NHHmJyUar51XaBCJU4MjawG14ncjMo54FUbFBMEjR/9MwPJ/g5eZCnuaAy6JJ+
         L9YSwa+55MlXude+heaYRMxxTgRziSwc2CcDkULi8FX4ocF0UMpgEaTvf9AjShw14dHc
         B2ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVtId3LKdO2EzpOv9XzjVaTUpdaK0ENqcjon1RKbHQn5gB5uMAinyYJH0qkcn1pufg5e9cqqMSU4eSHAA+OA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7H6s36fGHtC2/SAwz4krHYhvLSldMxEdodKeyMw4xm8zMc+X8
	9BKjMKaepUFO4qRmSXKwpkYyryZ5WOIx/AhSn38OYUNUlNdsVaqUgnWoidmitQ==
X-Gm-Gg: AR+sD13ASNMDBW1ewl8v6mSUll9unwx33QINI4dhJW8ATOPqTdEvW4Uaeh3yfVZAxko
	7uW3/q/pd9Bt5RQ58Q+tkot7lD2trIu9gTf3g3TD68gSMyTINHcYOrAXlQY9KLSACdt2lhbdyAt
	MyRYicBJbXvKzXW455i+ozMC9VDEJ+vS4q6Ym0DM9sTa+fsj1r7Pc7nRcArwSIIOXT3yDVVCkmF
	7LLlEli+3QOsvLKb27o6a4Li1upXpha3+FyLh+JiiYwvEs/uL5zkaOYkcDYXRCo4feoXbH81KWw
	7AIUHJrXl77aBKjjoRNaQeDlfFfMgq0/hZgVvS6SJfp+lG1R6cN1QtAg2LK5UyR1i296GIoojZB
	FHTatlorh4ZIx819V7CquEYuqPr602Z76n3VPIU33ZZOdnlH5ISaevg4isKDn+4Kx1uNzoEy7lJ
	QUOSrgcAWuoccCbAT580amAvQeP6wJ0AfC3CoJapJ1XsTKedmLiwXfiZRbVxT8tLDY5sunTDOjv
	KWcwB2WqxFTJAw9Gkod40MpFwXRi0bYS0uNdei8IeHvt60p68Zm5FiEjFYY4BsUoqTn4TYTePK4
	36M7DtYdpzZU9rY=
X-Received: by 2002:a17:90b:51ca:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-3909d79f8f5mr8625493a91.3.1786090627565;
        Fri, 07 Aug 2026 01:17:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085de8ddcsm3913377a91.6.2026.08.07.01.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:17:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/4] watchdog: qcom: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 15:16:49 +0700
Message-ID: <20260807081652.38692-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_091710_699971_C1B22511 
X-CRM114-Status: GOOD (  12.10  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Instead of only checking for -EPROBE_DEFER, propagate all error codes
returned by platform_get_irq_optional() other than -ENXIO, so that
failures are properly reported to the caller.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/watchdog/qcom-wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index 49bd04841f0c..a8eb1d8f24f0 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -298,8 +298,8 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 		wdt->wdd.info = &qcom_wdt_pt_info;
 		wdt->wdd.pretimeout = 1;
 	} else {
-		if (irq == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
+		if (irq != -ENXIO)
+			return irq;
 
 		wdt->wdd.info = &qcom_wdt_info;
 	}
-- 
2.43.0


