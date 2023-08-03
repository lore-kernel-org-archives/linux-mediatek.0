Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F8EC001E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 07:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qupwZObmmk0/sdY9oZ6qJIIOW7j+/1bq8fINDZIIlo=; b=APsL4sNwNTZwTqvE5AgN/x8UkX
	+PruY/6GsyxNy+hpSkZBYMxQ39BNuopRq8fKAeNwKILC6BcjgpbtiZ+THPcfWGs/9qK11TGZrX8wP
	56akAGIr2ZEp9wUOIyCsTbsaAtNfBmcVKxwiUQg6FRDMiCtNLUi5f/KIBRil1N0jKr4dQBrp66Pr+
	+o9beKfDL+MqlFmVjaIIIlb/f1j8xtXjqmQ59v5iItkZs9uSZlCz50bPt0hC7DD35sKWucTjbJ7Er
	XQJkS3vHWqlXVkieEmq+86tV9OmRc4fcrTV9idlSVr+AtFxRkXge12zHPOtn8fcd1V+fmHp3CP3DQ
	j615Ghdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSzG-006uC2-30;
	Thu, 03 Aug 2023 07:43:10 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSzC-006u7m-34
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 07:43:08 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-267ffa7e441so374109a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 00:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691048585; x=1691653385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qupwZObmmk0/sdY9oZ6qJIIOW7j+/1bq8fINDZIIlo=;
        b=iuw6BH7uxiaSd8Em4i2OVoxw9xOQqLbcZoPiSw5kiOmF8T+bhab7wAMcmOxJJ7Hmpi
         MNKPP/N4/aFleUK4RWH5+LhgCg5aL9Wt5DNlukiGWxm5GtOn8OEE1JXNQSmyJCIXyS8c
         tUXmKwYpnBorP0BECIRrJ9/KO1SX5Ir0MwtFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691048585; x=1691653385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qupwZObmmk0/sdY9oZ6qJIIOW7j+/1bq8fINDZIIlo=;
        b=gnB4+UF7utCmCNvhHy1v0ZzXpMHA3PTl4n50QC+ZrHD45ZGdZQMurwMWb4CBoFk7sG
         TXt62rXDqgHnHC88+ncqYsDyyuBsLxSdMrx/GRbWRC3CkjXXWYksH3qb6ofMYlZLdvix
         Z9CQW7SvA2h98Kg4iAAEhTPRQtcBb6nMpOowMa2Kaip2OJCGxP8p/zKyXrEFpWEeOuyS
         OrDJQyH6axws6FgcaIbzoH8cb+ihpAVlykMmVGrbEn//pzfUE5zzTCcy8bdJjd3czIHh
         Bei38HuawyhfmcMiRBIsxhfTXYRz0paGPisShrQRTgj9i7PXwEpbzCeWbPTd7PRuLI8w
         e3Tw==
X-Gm-Message-State: ABy/qLZ5theow97U/UbEEKrWtO5U1Jn5qyy1UmjxtQXIKvG2Yyjz9C7k
	fVzpZ5QzdCLA6ot07ZWsQxyIgA==
X-Google-Smtp-Source: APBJJlG87/Ro7nZXzml9fmHTU6Ab8cH9lat6x4i0wjt2yZq9zHMRteYWrxBWgji+jke4gg8BS4lUxQ==
X-Received: by 2002:a17:90a:7f8d:b0:263:72fe:3ef7 with SMTP id m13-20020a17090a7f8d00b0026372fe3ef7mr15974468pjl.42.1691048585544;
        Thu, 03 Aug 2023 00:43:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6f3e:66ee:db46:473b])
        by smtp.gmail.com with ESMTPSA id l11-20020a17090a72cb00b00262d079720bsm2095753pjk.29.2023.08.03.00.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 00:43:05 -0700 (PDT)
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
Subject: [PATCH 3/9] mfd: mt6397: Split MediaTek MT6366 PMIC out of MT6358
Date: Thu,  3 Aug 2023 15:42:41 +0800
Message-ID: <20230803074249.3065586-4-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
In-Reply-To: <20230803074249.3065586-1-wenst@chromium.org>
References: <20230803074249.3065586-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_004306_994462_07786969 
X-CRM114-Status: GOOD (  13.77  )
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

Add a separate compatible for the MT6366 PMIC. The regulator cell for
this new entry uses a new compatible string matching MT6366.

Fixes: c47383f84909 ("mfd: Add support for the MediaTek MT6366 PMIC")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/mfd/mt6397-core.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index f6c1f80f94a4..3f8dfe60a59b 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -206,6 +206,26 @@ static const struct mfd_cell mt6359_devs[] = {
 	},
 };
 
+static const struct mfd_cell mt6366_devs[] = {
+	{
+		.name = "mt6358-regulator",
+		.of_compatible = "mediatek,mt6366-regulator"
+	}, {
+		.name = "mt6358-rtc",
+		.num_resources = ARRAY_SIZE(mt6358_rtc_resources),
+		.resources = mt6358_rtc_resources,
+		.of_compatible = "mediatek,mt6358-rtc",
+	}, {
+		.name = "mt6358-sound",
+		.of_compatible = "mediatek,mt6358-sound"
+	}, {
+		.name = "mt6358-keys",
+		.num_resources = ARRAY_SIZE(mt6358_keys_resources),
+		.resources = mt6358_keys_resources,
+		.of_compatible = "mediatek,mt6358-keys"
+	},
+};
+
 static const struct mfd_cell mt6397_devs[] = {
 	{
 		.name = "mt6397-rtc",
@@ -280,6 +300,14 @@ static const struct chip_data mt6359_core = {
 	.irq_init = mt6358_irq_init,
 };
 
+static const struct chip_data mt6366_core = {
+	.cid_addr = MT6358_SWCID,
+	.cid_shift = 8,
+	.cells = mt6366_devs,
+	.cell_size = ARRAY_SIZE(mt6366_devs),
+	.irq_init = mt6358_irq_init,
+};
+
 static const struct chip_data mt6397_core = {
 	.cid_addr = MT6397_CID,
 	.cid_shift = 0,
@@ -358,6 +386,9 @@ static const struct of_device_id mt6397_of_match[] = {
 	}, {
 		.compatible = "mediatek,mt6359",
 		.data = &mt6359_core,
+	}, {
+		.compatible = "mediatek,mt6366",
+		.data = &mt6366_core,
 	}, {
 		.compatible = "mediatek,mt6397",
 		.data = &mt6397_core,
-- 
2.41.0.585.gd2178a4bd4-goog


