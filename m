Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763F8CD54B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 10:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xQUn/IJIaVFS0x99xumnipF7RzW+wF0bxWwjg0oCIk=; b=l8uDqGKEXwVgksVdjKpyOb2Nte
	m4umbUJfsORFgL3s9c4W9x4KqQlKe8nJ0zpdMKsgWTGvV9PSnqfKhKLI3+9lAGKo+LZbBGw9poa2A
	0m/X4c+DLphMpthi5NhEZ3me8WlD1tuSX2IjRrgFgUC7fQ9xniOS7cFvg3X36x72WChSWBMJ1v5em
	N52gX97AyrnsEu13o71akwqkpt3BjnYWD55K/zQ/6pAwUDPei4xH1esJa7vC/81A3KfO/gq1y2bqg
	NiAeY/mgtHXy0wUtm4cCA0dhgOjj8a9J9g0oYO089x1Uo3AXk2NNbfIE73CJ8iY4ykIPNC/eoias/
	IX44ETng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYH0-00055r-0U;
	Tue, 19 Sep 2023 10:48:06 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYGa-0004cN-1E
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 10:47:44 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c3d6d88231so43950535ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 03:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695120459; x=1695725259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xQUn/IJIaVFS0x99xumnipF7RzW+wF0bxWwjg0oCIk=;
        b=XEMTgjflkGdLz8fZFUgvLh7oUZrymZQKUzT3fOqOOACpPRVku678d3KKe5Oi2r7JXw
         6Se38ieFtu5k/ro5I86dQ3wQq+W6BlhqJKlKK2pl/BHgSXZrPlXy4oBMY7zpMiguCmo/
         FTBI62bzfU4sLozPDPQcXs9GSGi1jL3Qz7k+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695120459; x=1695725259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3xQUn/IJIaVFS0x99xumnipF7RzW+wF0bxWwjg0oCIk=;
        b=MVt1CohJMHc9zVjyqnqVB9xnfZnIqLUEH+KpFySL+9ttlrfEeL42T7GsuriRWlSuX7
         58IMAAPh/dDN4ZmdXtPNtHi7oUGdZg1thLAbj+md9LJqQCZPnCBL+PUnvKb/GoQLnT02
         Jx0xQ+6r5fH27IgocOxOTrOAKvQOD/k0lW8dqj4B5joal8mVK3SfQX/ed/8/Gl+QcFCr
         8M4LeKNk9BQzAXfqQDef5d6KLQDqST3XiYYkskf+ia2CjWL85nDmAK+bcab8tBZxcY6X
         34mrR07hBPlRj+fCTMJ7i/pHysYku5AEamBYgP6DHKpbCX5UoHCxm4+85dGd33u2eGEu
         PSvw==
X-Gm-Message-State: AOJu0YzBonhbbP9RhknglFsoIYGiTNu80JIfIXcjUbe5D6v4iF6EoyoI
	0YpSMrzp92XS9OV4DYnFAQRUHA==
X-Google-Smtp-Source: AGHT+IFe+997cxzsySXWWAQS25qUgXP0auEIHzVPbzDEWEBNw4i2aKJTdNMm2yHSkRleB/3+4BvJcg==
X-Received: by 2002:a17:903:1cd:b0:1bf:650b:14fb with SMTP id e13-20020a17090301cd00b001bf650b14fbmr11811076plh.42.1695120459673;
        Tue, 19 Sep 2023 03:47:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:40a:900d:e731:5a43])
        by smtp.gmail.com with ESMTPSA id c10-20020a170902d48a00b001bc445e249asm6719578plg.124.2023.09.19.03.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 03:47:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 06/12] regulator: mt6358: Use mt6397-regulator.h binding header for buck mode macros
Date: Tue, 19 Sep 2023 18:43:49 +0800
Message-ID: <20230919104357.3971512-7-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
In-Reply-To: <20230919104357.3971512-1-wenst@chromium.org>
References: <20230919104357.3971512-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_034740_460260_0B9C5100 
X-CRM114-Status: GOOD (  15.32  )
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

The (undocumented) possible values for the buck operating modes on the
MT6358 are the same as those on the MT6397, both for the device tree
bindings and the actual hardware register values.

Reuse the macros for the MT6397 PMIC in the MT6358 regulator driver by
including the mt6397-regulator.h binding header and replacing the
existing macros. This aligns it with other PMIC.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- new patch

 drivers/regulator/mt6358-regulator.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index 4a6ad0ccf03b..c312e79a0a39 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -13,8 +13,7 @@
 #include <linux/regulator/mt6358-regulator.h>
 #include <linux/regulator/of_regulator.h>
 
-#define MT6358_BUCK_MODE_AUTO	0
-#define MT6358_BUCK_MODE_FORCE_PWM	1
+#include <dt-bindings/regulator/mediatek,mt6397-regulator.h>
 
 /*
  * MT6358 regulators' information
@@ -326,7 +325,7 @@ static const struct linear_range vldo28_ranges[] = {
 
 static unsigned int mt6358_map_mode(unsigned int mode)
 {
-	return mode == MT6358_BUCK_MODE_AUTO ?
+	return mode == MT6397_BUCK_MODE_AUTO ?
 		REGULATOR_MODE_NORMAL : REGULATOR_MODE_FAST;
 }
 
@@ -374,10 +373,10 @@ static int mt6358_regulator_set_mode(struct regulator_dev *rdev,
 
 	switch (mode) {
 	case REGULATOR_MODE_FAST:
-		val = MT6358_BUCK_MODE_FORCE_PWM;
+		val = MT6397_BUCK_MODE_FORCE_PWM;
 		break;
 	case REGULATOR_MODE_NORMAL:
-		val = MT6358_BUCK_MODE_AUTO;
+		val = MT6397_BUCK_MODE_AUTO;
 		break;
 	default:
 		return -EINVAL;
@@ -408,9 +407,9 @@ static unsigned int mt6358_regulator_get_mode(struct regulator_dev *rdev)
 	}
 
 	switch ((regval & info->modeset_mask) >> (ffs(info->modeset_mask) - 1)) {
-	case MT6358_BUCK_MODE_AUTO:
+	case MT6397_BUCK_MODE_AUTO:
 		return REGULATOR_MODE_NORMAL;
-	case MT6358_BUCK_MODE_FORCE_PWM:
+	case MT6397_BUCK_MODE_FORCE_PWM:
 		return REGULATOR_MODE_FAST;
 	default:
 		return -EINVAL;
-- 
2.42.0.459.ge4e396fd5e-goog


