Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B3DC6FA99
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THpEp92433h+ylj7MjAYKkh14oWq1rOr1JhG8G/iCi8=; b=3Tt8dSsIDoqq8YVPsMDF+H0r8s
	mo2z4QB0lzyz1+HEEjV7XhrjpVcUBM8KljeG9vw1YDS+94AoNreCL2yNqm7CwXmrObPpNwXeHXbAU
	mN2KJ5knLE23Ur53Dks9bloidEXGGfAb5MrCG10mLe2D3YfFSeyV2C1hoTbfWk2mrV7XAEXxQxcN5
	FB+MM4mv8CLZiYu7GFLMGRZPRP61UDdJs3AibXyikP01Gug1NFp+w0HZ67LV5PJRDpV861oKdcBAW
	fFGLLpAIK7f3N6wVDHdVA4gujsYA0SUcl0XmBHFKaY5ir3G+2kEtRfw4ABF+QQtnUHI6NzqYQFyGN
	7v61lxQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLiK-002OfK-CE; Sun, 12 Mar 2023 13:26:17 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWd-002IMh-Hc
	for linux-mediatek@lists.infradead.org; Sun, 12 Mar 2023 13:14:13 +0000
Received: by mail-ed1-x532.google.com with SMTP id cy23so38399552edb.12
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THpEp92433h+ylj7MjAYKkh14oWq1rOr1JhG8G/iCi8=;
        b=oAmaUM64wINePdwiqsLNucIG+F9KVg+0pWxZOpOISN2zYDiUgU/yv8K5zf+HIZRWPZ
         gqp4IIjSd7LtENMJBZIt7lshH2rvnihGtVbM63owEfuqy1ZnRmPYbqfol/+ZvEOFrVHd
         VrpVxvSPZkZ184qqVYaaA01f9WueIzTpU4xqyjJwEvnUqnT3eZZIWAaIJ47PeOYFqomk
         OLUX3ERM+cf4hPKZE2o+qFFER0cVDl4rCmbPRj/hJ99arP84p18QGB2xvAsldfupkt19
         8HnLUAFOtlXajbO89E+91nZDyTEEkk6iYKERayn5ufjor7DdI4g+Ukx48Qb0WK633X4i
         4kDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THpEp92433h+ylj7MjAYKkh14oWq1rOr1JhG8G/iCi8=;
        b=F6+JtNxTEKicsOWAmwu5tBBTyNzfvHeYO/OhZn7oHPxwUCVxHYq11G9xIP+XDvlMms
         qxDkKxm8bnkSAGkK4bBq33ejAkj74wzZwP/GZuPltZxaMSOg9oJvBCz1Cpgp0j5xcUue
         7U7xSiud6XxWe94KbYsj533HkLyTFsNIROwR6U8+Fo6N/tY2nApsGk2QThwJvwUtz7+N
         h1Y6U9MYCXjToZtCxOVejzIcZfjdRKTdlFex3rjiSvBUiOr+Z2RLKC5GUuERPR0mR8eq
         iTw6mMSWcUVvXkKi6VLrAurGM8sM/GJJ78HdrcW2Jz/oFipLAWKxgLr0xihNrHHpiIdg
         sptg==
X-Gm-Message-State: AO0yUKUpmx+dqs35SHvGwtlFkG4QsaCMsexnfmOIRjFFIm5P3priYsdE
	T0dqWA7g3ztkgAktY6M1rHGavA==
X-Google-Smtp-Source: AK7set+tfDLUKN48RCQQAskWmohpYOld4F3QVzJjtSNuw8cfZUaPqmD3dqlxAS7yrTZJTXMv3+HlmQ==
X-Received: by 2002:a50:fc0b:0:b0:4fc:88d8:a031 with SMTP id i11-20020a50fc0b000000b004fc88d8a031mr69807edr.28.1678626850958;
        Sun, 12 Mar 2023 06:14:10 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Joe Tessler <jrt@google.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sean Young <sean@mess.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 24/28] media: i2c: ov2680: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:14 +0100
Message-Id: <20230312131318.351173-24-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_061412_008713_19462389 
X-CRM114-Status: GOOD (  14.62  )
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

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).  This
also fixes !CONFIG_OF error:

  drivers/media/i2c/ov2680.c:1149:34: error: ‘ov2680_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/i2c/ov2680.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 54153bf66bdd..4d8724952c5f 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -1156,7 +1156,7 @@ static struct i2c_driver ov2680_i2c_driver = {
 	.driver = {
 		.name  = "ov2680",
 		.pm = &ov2680_pm_ops,
-		.of_match_table	= of_match_ptr(ov2680_dt_ids),
+		.of_match_table	= ov2680_dt_ids,
 	},
 	.probe_new	= ov2680_probe,
 	.remove		= ov2680_remove,
-- 
2.34.1


