Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8CBC76195
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 16:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p4tdtu/BoCpyFQiT8nwjBdDJ+pofDzulK4/CMjUXkl4=; b=h1gumpvj9O7f/ZmzG0K5Wn5HUW
	wQVoaag1CmkQSdeX+EDfrYjsza6YsXnaDJvMFLEc6ClBpgm2Px3QF1hluMHsj3NcEZGtpNEEQNsC4
	KcdjeqVGcfsnLbR7BkAuccqKMrR5gkInqMABPhI0nV99ZVRZqP5xccIu1tIL4UacRRU2qxGUeZ/ZV
	lT8NAIt0Ngb7gC2y0/UiFKtflRlUIxr37h3wR3A4ZJWYfu8dA3xShur89euUuuOFtgoeKy7LEYpz3
	mXshTl6GLIucVYn6ptNvCclid7tyaIkVK4f6iHChIGf4vjtsSeqKwPaRQrQ/ZVnKdd36iIy+o20j8
	NBerBl6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdvxi-0071hb-04;
	Sun, 19 Mar 2023 16:32:50 +0000
Received: from mail-il1-f182.google.com ([209.85.166.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdvxe-0071fr-0o;
	Sun, 19 Mar 2023 16:32:47 +0000
Received: by mail-il1-f182.google.com with SMTP id bp11so5410357ilb.3;
        Sun, 19 Mar 2023 09:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679243565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4tdtu/BoCpyFQiT8nwjBdDJ+pofDzulK4/CMjUXkl4=;
        b=dpe6zJgIYqzRqo6CfSlij+Y60Fm/1x+Ovo3mEeK9MzJLfCONKLLnyzd+AnYs5WeBH9
         ypIHCko2L6ToQ3i5KuqKcL517tKQi/F5+mK2MQxl6pc9LqFe7aPyO3L26B94ijU2u+VT
         I6tx2pikmK1WT/2ebmZfr7RWywX5AQznXnJXRS8/br+hvSVP74BVjMLyONa/PTA0SLkM
         qeIaARWT5mc983WSClW3HZwluOBqiKSM/aQxU19vDkAsO65AOEEVyngjAn5m/mr/nVDQ
         0at0uiw+1DbZjZC1DFEqFoVui4bz6zN6+lD38mq8LF6Xf4mguJoyPoqm8IoQzkbBjvJj
         ak9g==
X-Gm-Message-State: AO0yUKVjMZOSfpTZF3Ku8yQ7IkRU2nwyCy2faLu37iu41jIvtZm2hKAL
	tRvrmzJEYEvQfyqIBH9edw==
X-Google-Smtp-Source: AK7set/D7386HxB0VdBbnYp8YAwsuBsb57CjrBk1CpenJ2pFHzjL+CaQ3SfHzxMJ8WK6IWZ51RjccQ==
X-Received: by 2002:a92:d64c:0:b0:313:fddb:6e6f with SMTP id x12-20020a92d64c000000b00313fddb6e6fmr3472469ilp.9.1679243564944;
        Sun, 19 Mar 2023 09:32:44 -0700 (PDT)
Received: from robh_at_kernel.org ([2605:ef80:80c7:2689:137d:d795:47e4:3de1])
        by smtp.gmail.com with ESMTPSA id y19-20020a056e02119300b0031830e2c987sm2193842ili.20.2023.03.19.09.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 09:32:44 -0700 (PDT)
Received: (nullmailer pid 226928 invoked by uid 1000);
	Sun, 19 Mar 2023 16:32:40 -0000
From: Rob Herring <robh@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] thermal: mediatek: Use of_address_to_resource()
Date: Sun, 19 Mar 2023 11:32:31 -0500
Message-Id: <20230319163231.226738-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_093246_287647_E736FEEE 
X-CRM114-Status: GOOD (  10.84  )
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

Replace of_get_address() and of_translate_address() calls with single
call to of_address_to_resource().

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/thermal/mediatek/auxadc_thermal.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index ab730f9552d0..c8a3acaf56c1 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -897,14 +897,12 @@ static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
 
 static u64 of_get_phys_base(struct device_node *np)
 {
-	u64 size64;
-	const __be32 *regaddr_p;
+	struct resource res;
 
-	regaddr_p = of_get_address(np, 0, &size64, NULL);
-	if (!regaddr_p)
+	if (of_address_to_resource(np, 0, &res))
 		return OF_BAD_ADDR;
 
-	return of_translate_address(np, regaddr_p);
+	return res.start;
 }
 
 static int mtk_thermal_extract_efuse_v1(struct mtk_thermal *mt, u32 *buf)
-- 
2.39.2


