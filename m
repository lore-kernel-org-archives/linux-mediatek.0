Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD023C6FD19
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnLBQwh0LWohgIW0ttdnCRYb1T+hHfqYVBdWUEvm5SY=; b=qaUKfjqKFHzukSKLW9sjOrAiSI
	c6LhAjEe4E8XktmJr3IlGfey9pZ28WckT+9bv9fCaOl68DH67hgs9q485BWjds8CWKY7oS+ljcgIi
	N4FpXySNOlJW77vkEnIo/qadnRLXHv8gxAsY+SFjAPuQMjkj+BRO2HTy9U+/Z9MeV/vLLnc8kqYmi
	/X7emRAfbk/a+kMHGs/ri2yq7TZ1i4vkr4Or2GlK95aFre3vnN1U6lIhntOSSyxl7taz+5fkN1TEr
	1RxdJJewq7wXGT584682HrDHtJ0J3lzIkTjPi/43MH2aOwXc55DnEHbUsKkyERp0aPnMEYTivuFYe
	777pWyUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLsN-002SoH-J4; Sun, 12 Mar 2023 13:36:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLoU-002R6l-EU
	for linux-mediatek@bombadil.infradead.org; Sun, 12 Mar 2023 13:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=EnLBQwh0LWohgIW0ttdnCRYb1T+hHfqYVBdWUEvm5SY=; b=nLxDPtxTs65+V398Hq48LmAYQS
	3Np5rrAbsg5UO30ZLCrkmJIdivUl8vzUL1j0qRhDBWle8ebY/X1QSeV040WRn9JVZ/9jHJ28EO4x6
	HV+7MoPn1boF1VsTSZ2B/uIOTExmqv50ytw2hKCmCPH2bQUEz8MiPlkBb6YekJbPVTEURrvpj2cFg
	ZnqSh2+bFcofbge/1FjC5ZKT0qp+5mWAaAyweTTDiBfetuAV49VVc2hHispr+4ulwwbjwOk+kjaJX
	BuUJDqYA/y3822eZGeKBy6bv8iPeCayl/whvIiP9AILs1fIYrSGyrlWF4Hlc7fxPYfxoO4WNrAk3T
	dkgYED1w==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWL-00B3eS-4r
	for linux-mediatek@lists.infradead.org; Sun, 12 Mar 2023 13:13:55 +0000
Received: by mail-ed1-x531.google.com with SMTP id x3so38434266edb.10
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnLBQwh0LWohgIW0ttdnCRYb1T+hHfqYVBdWUEvm5SY=;
        b=La4x93DEoIwur2ndgJwLR2ny+YVu7M7nkEdhVk1ax5v8kLMw3TJYokXlZF8BTLzFjr
         PRu/S0l02NyAfTpFe4pEI66UWaAF6uJmcsVb1BR2FK6jsIfvFwDPOFk5wFG2iVlmIxhI
         ZJ/g12UWKozHWmTzOeZepQ3MJ3r7QVlHcomJFs3p2sPClVH5Gx16kWz33VatYadsdgFk
         8+5zH1m4BC6cKBxTckNMY0KDC0pilc1T9xae70XkESQD63z5dT3nFJX5kwAf9svjvpJT
         c3i2O6EBh/quArbGNHgqQMbDNPKQh6Z10jClmZdBJqN51EgX8JTNuD0PGN37wDWnlHFV
         5sZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnLBQwh0LWohgIW0ttdnCRYb1T+hHfqYVBdWUEvm5SY=;
        b=nKugiw1Trr5vaLckQcBakGNHeXlwOJwJ6JX1/EqGWtV8fox5QScOWPptAYUshpO1ZU
         zBG8MZifSbJLvI/Pnp0kJfSEJDBmMJTs765HUZpAD4eHzhkuZtEe+VUDOk9OWyuU8Yrv
         s9x2zuW5wDBDZMeKGK60QyfSNvJwgEPoOPBnWY0uQNfFmc/Siv0K56GaXh0LEbbADz1H
         vwv98/DRhbhAMoPl+D0w6YMEWZVY0UW7W30dym1g3/THRYM4G+wUe6cf7H4Bhm3OctNg
         zg+7EguDeIkzyEc87t7XYPK0bR9U4E++bXiRCCYfvr8iZ0m1yIY3uOusyLK7rci8nhQt
         O9LA==
X-Gm-Message-State: AO0yUKXdy19WTMPcMOleSpkG9iTa8XQ6AHEMwYcTX1uOoom5M3qd67eh
	WZijmIrp0A5qgrUuAuSFf+A6ww==
X-Google-Smtp-Source: AK7set9Bjjfvn/Sovq5DWKvwxol1DOkWW2/CuykQR76iLeg9De2xNQq2nnrXH4F7baVnuHw64PeF1g==
X-Received: by 2002:a17:907:1c1f:b0:884:930:b014 with SMTP id nc31-20020a1709071c1f00b008840930b014mr39417055ejc.6.1678626833357;
        Sun, 12 Mar 2023 06:13:53 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:52 -0700 (PDT)
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
Subject: [PATCH 15/28] media: platform: mdp3: mark OF related data as maybe unused
Date: Sun, 12 Mar 2023 14:13:05 +0100
Message-Id: <20230312131318.351173-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131353_665942_5A876AC8 
X-CRM114-Status: GOOD (  12.57  )
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:627:34: error: ‘mdp_sub_comp_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index 091a68685590..817ba9660b5f 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -604,7 +604,7 @@ static const struct mdp_comp_match mdp_comp_matches[MDP_MAX_COMP_COUNT] = {
 	[MDP_COMP_WDMA] =	{ MDP_COMP_TYPE_WDMA, 0 },
 };
 
-static const struct of_device_id mdp_comp_dt_ids[] = {
+static const struct of_device_id mdp_comp_dt_ids[] __maybe_unused = {
 	{
 		.compatible = "mediatek,mt8183-mdp3-rdma",
 		.data = (void *)MDP_COMP_TYPE_RDMA,
@@ -624,7 +624,7 @@ static const struct of_device_id mdp_comp_dt_ids[] = {
 	{}
 };
 
-static const struct of_device_id mdp_sub_comp_dt_ids[] = {
+static const struct of_device_id mdp_sub_comp_dt_ids[] __maybe_unused = {
 	{
 		.compatible = "mediatek,mt8183-mdp3-wdma",
 		.data = (void *)MDP_COMP_TYPE_PATH,
-- 
2.34.1


