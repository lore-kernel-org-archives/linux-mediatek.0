Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A57C6FA99
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pr1jUKnL41ZyOFBU50NsUPyS/zukAR1uIPxn6pkxwwo=; b=Ctb48n/6WH5jhr7+7g8+jatc6T
	eWDUfKfbU9gfS1qtcaoKWhbQ0rcRduYcizSvhLcdqYJzjOrTggbMOXd3DexM42RXGQ7HzcPTPV3LW
	1pjoeLyvzwbRuGiNU8cH8ygv9iK0bjgR6mCfAespDCq2L4gQ3L18GkEEImj5D5qGe7Z6qXKPOJAyP
	aCNEaZK1qJkaHOiANO7TMlSb8WS7AEZtjOeSLD2pUijpYp2x4ZbWS1xUF3Xwf6cM2ZUmeNp+65jiA
	WV/yMBEpefrc7XtsMdiCaD5TS3YDVEiRl1zqADr7jyh7Ig0Fz1BuBgnrZfsyK4rzsK8VuZrYxdzvQ
	E05GjUCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLZM-002KH8-2x; Sun, 12 Mar 2023 13:17:00 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLW6-002IMi-5c
	for linux-mediatek@lists.infradead.org; Sun, 12 Mar 2023 13:13:40 +0000
Received: by mail-ed1-x52a.google.com with SMTP id s11so38491954edy.8
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pr1jUKnL41ZyOFBU50NsUPyS/zukAR1uIPxn6pkxwwo=;
        b=d/Be+KE/rae1AooRcRo7NJaoA4jh14ihaoslOYJLSEXJQusR7E+0E7WGgKwVRvJoU4
         7cdi5lsie8od8sSeQOijQ+CU4K2wFTybbFVmGoqHZm94v3n/12QgP7a8B5fLk8P3oQWA
         Oi+Wf1t4BtkYlyqaXjU8X/nXEzUjjdeyZmjOvBGcEe/zF3N/ZANNaRkblY9p/FtqC7p/
         QCvhTboN2UXxOhL+7/WonTj8O2ca0sj3nz65riaVKnjdeP2wrgFMxLx26N7hQlzLO47j
         ME0hrCDR4+HnZG+PoqQA8nwhxmvt0zQP33761Ra+sweUSgGDS99wyFfsfyWun3OK5zxy
         bVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pr1jUKnL41ZyOFBU50NsUPyS/zukAR1uIPxn6pkxwwo=;
        b=bKc7Z3NUX+8VUDs9M/mBcIW6/W7vNkPWTBmTntpWQl4le090J63g3i7J4zLKY7cJkW
         QHa1GAeB4bYaUdkebIrQtzzwPjqpqeJkDyGTMZwm7Pr8kMyqAIzsaSfuH54sEAemsEGr
         B98FbgIk2Fpy27amH5pAh/jnGqexE9Y0IxFUHB141YVJIZZQUepeTNUtGeOE2UUQIh1T
         CLpCoFe4P35I1WqnyBYsynuuJ54AM6xUEPScKErmE73jRFqcz1Oa8qEoLHl9eI/3h2i4
         tltANdxReIc3JwduNKMZOTlPQMfr34GvKangfLlnWPC3JD1LGG7xUEtXi1RB+Z8PzUZ7
         rrew==
X-Gm-Message-State: AO0yUKWmoucEx2oCk8SROZ8qCYLsEgYOnpoWlOw1R4K0LlYiEzD5NAT4
	MjsMlULlr5dJ9pRMZP0C6PvSbg==
X-Google-Smtp-Source: AK7set/eBPmURAU386Ic8efAZKpGibHAFxF6646hcUlmwtY5zSg8zn253Ru88JXsM5LrkN6l2cpu5w==
X-Received: by 2002:a17:906:6988:b0:923:c55d:efd2 with SMTP id i8-20020a170906698800b00923c55defd2mr3351678ejr.68.1678626817635;
        Sun, 12 Mar 2023 06:13:37 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:37 -0700 (PDT)
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
Subject: [PATCH 07/28] media: platform: allegro-dvt: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:12:57 +0100
Message-Id: <20230312131318.351173-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_061339_113321_BB6A9140 
X-CRM114-Status: GOOD (  14.95  )
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

  drivers/media/platform/allegro-dvt/allegro-core.c:3995:34: error: ‘allegro_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 2423714afcb9..7fc197a02cc2 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -4009,7 +4009,7 @@ static struct platform_driver allegro_driver = {
 	.remove = allegro_remove,
 	.driver = {
 		.name = "allegro",
-		.of_match_table = of_match_ptr(allegro_dt_ids),
+		.of_match_table = allegro_dt_ids,
 		.pm = &allegro_pm_ops,
 	},
 };
-- 
2.34.1


