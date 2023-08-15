Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DC0C04A6A
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Aug 2023 15:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmLPugTGz1sgSy2J/v99Dk0J3o8zfc9d+fDcwlxsiEo=; b=DbRGRBhj0B/CntcArXY45gUR8T
	T3dYq5Q827n6JQnl6geEXp6CxJcJDJ6+8OpkDUDR3t/PsH1i+BTs6AQlRmUJ9bYoe7DMmcpNk3zpA
	HhfpOooviDhhFCBAKjBVSYrT5DDd9gJun8+/fWuPB4E7wKxtKx/Hbf31/Yq1K7ZpupIPapH+lazxs
	vUE9JuAjx1EHJST88Io2a6J/VCK0qXscib5zFMBb39NIWvrjIcNm479g/vDcKTfw9yAu3bIiL71yU
	PfZNCxzmRneoOxTiriTl9Agr9TBnUjrlPOoRlSJNsuzFk74ojgemj5UTluybDRJZ4eilXej99p9n8
	qMJiXnNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwEC-001tH1-0Y;
	Tue, 15 Aug 2023 15:45:04 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwE6-001tBf-0B
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Aug 2023 15:44:59 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-68706b39c4cso3929186b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Aug 2023 08:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692114295; x=1692719095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmLPugTGz1sgSy2J/v99Dk0J3o8zfc9d+fDcwlxsiEo=;
        b=hPdGnKSUgljhFqFsgGLQzZfUk5Zd5v3vXX+lFx5n/q9s02AfGmaHSqc010GOa/OM3f
         aNaofPdOvBFPFjUmGdt3gDNvOc1wV1TJoZpvyVHeBIsK21QCzXmvuoygHnn6HnbssZcB
         EsnO0+NmyNRllTqEzVtLDpy5CY61OZisnow1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692114295; x=1692719095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmLPugTGz1sgSy2J/v99Dk0J3o8zfc9d+fDcwlxsiEo=;
        b=CLwbnahkD06B/0UgCyszIsZ/otl8IW2QrkgqpsD/nzrU1SXuXMyUBNDib7Sv4wYba6
         4OWzLdWfSZcy+dVyjiwcHKd8d8QnkoLlbnMtcR41UXSdLzB4iPE1bzfeYwWKiM7vsypE
         TK/oprfMFBjsl/E0EfiIvoRk9zlGhotKFgN9FrGO5DYVUox1k3s//txVRwLHk/IuNXvo
         Hq+A6KNJqRzwu5zAlnGOjLd8z6PCzNm+7v6tlLoJ/GEi1YOR5KDOQDy+IkNIxcujRF07
         IyqFa6Ijees1xii6ar1XcBlIdOugGzz5V/9Q9T5DcbMR+7/lCWQ2qGrFUAgojJ+e/i97
         /TfA==
X-Gm-Message-State: AOJu0YxECl9xtpUZxG4tNrVpHDzAMyr12pNXg94sEBMFDFHidKcYFGvC
	3ZXXt8zUSjdO3+OlDP1zgAs4AA==
X-Google-Smtp-Source: AGHT+IFGfwXqvhlQgK3dZJYanVm1WhEoRWmNzCEnvvClZuT/nup6kWHRH9gSZE0NGJjts8ZfBG+bbA==
X-Received: by 2002:a05:6a00:1a50:b0:668:73f5:dce0 with SMTP id h16-20020a056a001a5000b0066873f5dce0mr12705130pfv.29.1692114295080;
        Tue, 15 Aug 2023 08:44:55 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:40cf:3807:f8c8:2d76])
        by smtp.gmail.com with ESMTPSA id n13-20020aa78a4d000000b0065e154bac6dsm9431247pfa.133.2023.08.15.08.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 08:44:54 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	"Miquel Raynal )" <miquel.raynal@bootlin.com>,
	"Richard Weinberger )" <richard@nod.at>,
	"Vignesh Raghavendra )" <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	cros-qcom-dts-watchers@chromium.org,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 2/4] mtd: spi-nor: sfdp: read disable-quad-mode property
Date: Tue, 15 Aug 2023 23:31:53 +0800
Message-ID: <20230815154412.713846-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
In-Reply-To: <20230815154412.713846-1-hsinyi@chromium.org>
References: <20230815154412.713846-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_084458_098167_C1FDC76F 
X-CRM114-Status: GOOD (  13.58  )
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

Some flash devices, eg. gd25lq64c, enable quad mode by default after
spi_nor_parse_bfpt(). However, the systems using these flash devices may
required the quad mode to be turned off to use write protection or to
avoid a potential short issue[1].

Add a disable-quad-mode property in devicetree that system can use it to
override the quad mode status parsed from BFPT.

[1]https://www.elm-tech.com/ja/products/spi-flash-memory/gd25lq64/gd25lq64.pdf
page 13

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/mtd/spi-nor/core.c    | 5 +++++
 drivers/mtd/spi-nor/core.h    | 1 +
 drivers/mtd/spi-nor/debugfs.c | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 614960c7d22cc..dcf4ff46c37ae 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2847,6 +2847,11 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 	if (of_property_read_bool(np, "no-wp"))
 		nor->flags |= SNOR_F_NO_WP;
 
+	if (of_property_read_bool(np, "disable-quad-mode")) {
+		nor->flags |= SNOR_F_DISABLE_QUAD;
+		nor->params->quad_enable = NULL;
+	}
+
 	if (flags & SPI_NOR_SWP_IS_VOLATILE)
 		nor->flags |= SNOR_F_SWP_IS_VOLATILE;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 9217379b9cfef..b06bd97668f3a 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -133,6 +133,7 @@ enum spi_nor_option_flags {
 	SNOR_F_RWW		= BIT(14),
 	SNOR_F_ECC		= BIT(15),
 	SNOR_F_NO_WP		= BIT(16),
+	SNOR_F_DISABLE_QUAD	= BIT(17),
 };
 
 struct spi_nor_read_command {
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 6e163cb5b478c..c17451ae0931a 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -28,6 +28,7 @@ static const char *const snor_f_names[] = {
 	SNOR_F_NAME(RWW),
 	SNOR_F_NAME(ECC),
 	SNOR_F_NAME(NO_WP),
+	SNOR_F_NAME(DISABLE_QUAD),
 };
 #undef SNOR_F_NAME
 
-- 
2.41.0.694.ge786442a9b-goog


