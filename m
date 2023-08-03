Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51056C001E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 07:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrPeOXoKc2hUZA03cIawOYELY2pxQM3mW6RdAg6oP4Q=; b=vn405TlVw0SKC5nzfirHL6jakv
	XEL74w5sk6+zdptbP9SW8peJlLg0LUmJ8vouEc8pIzfj9zF3ILIkXfvkI4JsierEg3u0jA3YYJCwT
	+8EP+kky7+fPAWh5RTk9gcq9Y93Wx3xuIhaUn1aLhkpyT48xNy51b5snsashszfPQfZDpJS8gm5kS
	26t4Rr7b3p29yFKlxv8c8ymWaqyXQRJk/4gEG8lG1USxNbCXwWHSwbFmLzUYIyqVYFkXTSDJ/HZ1Q
	b902AyHHhJ0eTiDyrHiIDpokPMYAuP0CPowGOlAjylUrx2RWZEUNJ5HPR0y0tgsImCwgWz9rWG+ii
	fe4yPBpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSzZ-006uUq-0o;
	Thu, 03 Aug 2023 07:43:29 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSzR-006uLe-23
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 07:43:23 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-56401f1da3dso335506a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 00:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691048600; x=1691653400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrPeOXoKc2hUZA03cIawOYELY2pxQM3mW6RdAg6oP4Q=;
        b=B64w8cCq99lVMCbkJggf/D7Dt6lLV5K5zg7oC1ThIFLNH3t5f1k3gSs8+jSLNo/ka8
         7PcdgmMrzsxU8npBb4uQYX9e7OPVdfd6aJDYBa6wJ8Z1u0I3jU5/6hkQVS71dHVk4JrU
         iDZQJbm63agTlZLMmk5l7hGyemkE7pqJogmMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691048600; x=1691653400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrPeOXoKc2hUZA03cIawOYELY2pxQM3mW6RdAg6oP4Q=;
        b=OgxND6l/CyB9OoPDpXr+Fc7U1y/T7f2af2ipcHFTFoevOuDYtyID+ZAhIf7ctIq0Cd
         3eaLy7E1hTddA7cL6ZVbPEU8+dW+++ramxO7AEphrwl7ygn5Ngjj2pyLndWN+8EoH/fQ
         vYlreqcEIL78vdOVt0zhsQlU3kywxidZ1ZK8tCi8JncseUGDJkR0ENeDD/2ekPrpl/jI
         zv8FVTsnNWtol5i1RflFvFM9VzixnSdBqZCpoyPFRq72jquHAnWj8TFIueifnrqTzHlo
         ovMmBu+/K1KWsTUd3+GyalA5yfWQ2rGVce63Ah5n5hs2qr9t8wFdhsx1PEpQYYE6xuqO
         ptcA==
X-Gm-Message-State: ABy/qLYHdZugL4CiIY54EclYb7JVGOo7yy2T5ZDa6hB+zlgKm1+4fKWt
	sgy97dcsB7lx7R/B0sthtzVfEw==
X-Google-Smtp-Source: APBJJlFurYNnQLVV4RTU7su1Ey1Aj+eNI2+WPiuqHQ1LmYf3d/bpTlfIF23QfhrRuirChqwjNcAVsA==
X-Received: by 2002:a17:90a:d78d:b0:268:1f64:cefc with SMTP id z13-20020a17090ad78d00b002681f64cefcmr13321482pju.49.1691048600567;
        Thu, 03 Aug 2023 00:43:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6f3e:66ee:db46:473b])
        by smtp.gmail.com with ESMTPSA id l11-20020a17090a72cb00b00262d079720bsm2095753pjk.29.2023.08.03.00.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 00:43:20 -0700 (PDT)
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
Subject: [PATCH 9/9] soc: mediatek: pwrap: add support for MT6366 PMIC
Date: Thu,  3 Aug 2023 15:42:47 +0800
Message-ID: <20230803074249.3065586-10-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
In-Reply-To: <20230803074249.3065586-1-wenst@chromium.org>
References: <20230803074249.3065586-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_004321_709106_435A7120 
X-CRM114-Status: GOOD (  13.84  )
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

The MT6366 PMIC is mostly, but not fully, compatible with MT6358. It has
a different set of regulators. Specifically, it lacks the camera related
VCAM* LDOs, but has additional VM18, VMDDR, and VSRAM_CORE LDOs.

Add a separate compatible for the MT6366 PMIC.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 11095b8de71a..e3c0e767033b 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2257,6 +2257,8 @@ static const struct of_device_id of_slave_match_tbl[] = {
 	{ .compatible = "mediatek,mt6357", .data = &pmic_mt6357 },
 	{ .compatible = "mediatek,mt6358", .data = &pmic_mt6358 },
 	{ .compatible = "mediatek,mt6359", .data = &pmic_mt6359 },
+	/* MT6366 is mostly compatible with MT6358, except for slightly different regulators. */
+	{ .compatible = "mediatek,mt6366", .data = &pmic_mt6358 },
 
 	/* The MT6380 PMIC only implements a regulator, so we bind it
 	 * directly instead of using a MFD.
-- 
2.41.0.585.gd2178a4bd4-goog


