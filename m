Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A195C001E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 15:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ng63cZGntPuN0j1n9XuJdxXGmv1YE1KlQ3j2MXnap4=; b=ZM6/+mNLF0g/DKqm7SvZZCKHRG
	5ogb9b2U+3bVdTay8CcKDr+Fo0naepZK+gMtav5LOiLveB+eBAXK/NSnDsOfq/k77SiFe3rUBDVcU
	EanEukedNSHy3TG0fcNUu3n7wHzYQlJIvuGB4q9ropse/VUFW3k50pvz+bQwUfpfMtO0Dp5QWdLxO
	BuEMOxWPWtlpM5p4Ad7MqPY3VD5A17F/URP7K035n6ZWfmVQ9ucUr28G4vK2wdnBlXyzUi/YuMaeO
	RFxkVB2QS4QZyvXbYYriPCss5XcabIxJ6hI4raevYcpxuHED8OB1VtI+GZ+Tf1Z0xOmaxJdPQfVRw
	E2erE81w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxrz-003ez9-2l;
	Thu, 13 Jul 2023 15:04:39 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxrq-003eqy-1r
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 15:04:33 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51e57870becso962790a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 08:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689260668; x=1691852668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ng63cZGntPuN0j1n9XuJdxXGmv1YE1KlQ3j2MXnap4=;
        b=lQe41vnEFdqLyJ1o9YHM2ytU8kUBmglnP9jpOoPejOiPsl4O/66oeQyD/DkzKwLmJa
         S2fpJo54olIwFolsKPT6QwoP8x0xWeBuW0mrc4ILvOzRLp2INGvzHpgoS1ZEJveqA955
         xNaB+5f87gTytEA8UeSGAOsmWvO5RzsL6ExzcPrQae7/4IqsGv/NBrtJuUCQ/2z3lIIm
         9LhRcNJtIaIN4hPmTenqvmE2xvCzGtj/bl23j4bqv8jFblc8sqYDWPJwzDtA7FtwsKZI
         Rj3eFoXo+xNJKsoJeof4No6gV53sILXPLJrzj1aDeXk1G7NvfRWux9rlSVfJVcfRmhTx
         SKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689260668; x=1691852668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ng63cZGntPuN0j1n9XuJdxXGmv1YE1KlQ3j2MXnap4=;
        b=jair7QXX6hGgk72AWMZnjwTibEoFCav4IPB2qK5Goo3HdlC6eUsTlboSwYMctZWKxo
         DAaJCznjTxW6j8GpPiL1UyfLrnl7Uhs2OpRl+ABg8Pgty5SC5scHaNSCecc0dgt9a5yD
         NDDgaf45kYNjeP8sQjbcjIzf5OB4pKU9EEViMhjNCdswdyxAtQQSazsBZgSwS4UKE2bX
         UWeHxbCnIS7oEVJA+VEw6iUJeW+KV8HAaKdj+aXI6EX5WIGcimjY7iql+k9LYF8p5A1K
         Tq2csZrepVze/rbiSyBG+7RGh60zv/i6KFbjF0BJplIxLY2MwRRbaelJaVRmQY7pvt+N
         ueoA==
X-Gm-Message-State: ABy/qLaPJu1dnWQyIQwr5P/IQ0MnKgEaciJWwBq3TWxVq2mXWMJs3fuV
	ldV+IDCiY4glc9K0a19a/f6O9w==
X-Google-Smtp-Source: APBJJlFS1yOXkJiGcsubz6fbxOwOREGZZ4cJYCXM2GYnkUxFZlHMLbXnpHunATsi046sOFIlMRziuQ==
X-Received: by 2002:a17:907:30cc:b0:994:577:f9dd with SMTP id vl12-20020a17090730cc00b009940577f9ddmr1614554ejb.9.1689260668546;
        Thu, 13 Jul 2023 08:04:28 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4091:a247:82fa:1d6d:d215:e7c4:dd5e])
        by smtp.gmail.com with ESMTPSA id cd26-20020a170906b35a00b009929c39d5c4sm4102939ejb.36.2023.07.13.08.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 08:04:28 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v7 2/8] soc: mediatek: pm-domains: Move bools to a flags field
Date: Thu, 13 Jul 2023 17:04:08 +0200
Message-Id: <20230713150414.891893-3-msp@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713150414.891893-1-msp@baylibre.com>
References: <20230713150414.891893-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_080430_619265_D2EC7B53 
X-CRM114-Status: GOOD (  11.61  )
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

To simplify the macros, use a flags field for simple bools. This is in
preparation for more flags.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/soc/mediatek/mtk-pm-domains.c |  6 +++---
 drivers/soc/mediatek/mtk-pm-domains.h | 19 +++++++++++--------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 354249cc1b12..aa9ab413479e 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -128,7 +128,7 @@ static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, st
 		if (!mask)
 			break;
 
-		if (bpd[i].bus_prot_reg_update)
+		if (bpd[i].flags & BUS_PROT_REG_UPDATE)
 			regmap_set_bits(regmap, bpd[i].bus_prot_set, mask);
 		else
 			regmap_write(regmap, bpd[i].bus_prot_set, mask);
@@ -165,12 +165,12 @@ static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
 		if (!mask)
 			continue;
 
-		if (bpd[i].bus_prot_reg_update)
+		if (bpd[i].flags & BUS_PROT_REG_UPDATE)
 			regmap_clear_bits(regmap, bpd[i].bus_prot_clr, mask);
 		else
 			regmap_write(regmap, bpd[i].bus_prot_clr, mask);
 
-		if (bpd[i].ignore_clr_ack)
+		if (bpd[i].flags & BUS_PROT_IGNORE_CLR_ACK)
 			continue;
 
 		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index 5ec53ee073c4..d8c0c299dd45 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -42,23 +42,27 @@
 
 #define SPM_MAX_BUS_PROT_DATA		6
 
-#define _BUS_PROT(_mask, _set, _clr, _sta, _update, _ignore) {	\
+enum scpsys_bus_prot_flags {
+	BUS_PROT_REG_UPDATE = BIT(1),
+	BUS_PROT_IGNORE_CLR_ACK = BIT(2),
+};
+
+#define _BUS_PROT(_mask, _set, _clr, _sta, _flags) {		\
 		.bus_prot_mask = (_mask),			\
 		.bus_prot_set = _set,				\
 		.bus_prot_clr = _clr,				\
 		.bus_prot_sta = _sta,				\
-		.bus_prot_reg_update = _update,			\
-		.ignore_clr_ack = _ignore,			\
+		.flags = _flags					\
 	}
 
 #define BUS_PROT_WR(_mask, _set, _clr, _sta)			\
-		_BUS_PROT(_mask, _set, _clr, _sta, false, false)
+		_BUS_PROT(_mask, _set, _clr, _sta, 0)
 
 #define BUS_PROT_WR_IGN(_mask, _set, _clr, _sta)		\
-		_BUS_PROT(_mask, _set, _clr, _sta, false, true)
+		_BUS_PROT(_mask, _set, _clr, _sta, BUS_PROT_IGNORE_CLR_ACK)
 
 #define BUS_PROT_UPDATE(_mask, _set, _clr, _sta)		\
-		_BUS_PROT(_mask, _set, _clr, _sta, true, false)
+		_BUS_PROT(_mask, _set, _clr, _sta, BUS_PROT_REG_UPDATE)
 
 #define BUS_PROT_UPDATE_TOPAXI(_mask)				\
 		BUS_PROT_UPDATE(_mask,				\
@@ -71,8 +75,7 @@ struct scpsys_bus_prot_data {
 	u32 bus_prot_set;
 	u32 bus_prot_clr;
 	u32 bus_prot_sta;
-	bool bus_prot_reg_update;
-	bool ignore_clr_ack;
+	u8 flags;
 };
 
 /**
-- 
2.40.1


