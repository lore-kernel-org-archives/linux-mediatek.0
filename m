Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B82C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edZ1YtzomlUy1mG3JQnBn+Oq8n+Y+JzAFR8/ksaDlN8=; b=qEIbbCG8UJ2JIm0d9Ljza0a8z/
	RTFzfgm8vXrbh/GxWIQ+1pBI/MIi2QqrHWdHdjvBrIRKBkXM7uzUMbpYJOUdA88moEeegqYAKPcn4
	60h/nO4YwM/01bbs1farsr46aik6crin1txSecmGcbgt7bzznnFfKQNhb3z+GRWK5l705whl73Ro2
	pIvC65Xr5ThOzATMlUGweRrI+jb1CGkDQKjlHxmThG7zTlYD3z7bu404t+H7sg9o4QEEr8zGQlLW2
	wRztE5JecuMzahoPY1Zibt/Cl+jNmG3AAANnpJx6uH+3MoNqXML9ClsfnsLbzKFN7TIo3iI/WTWxV
	08JFgFJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLcM-002Lpq-6g; Sun, 12 Mar 2023 13:20:06 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWJ-002IMi-Sb
	for linux-mediatek@lists.infradead.org; Sun, 12 Mar 2023 13:13:53 +0000
Received: by mail-ed1-x52a.google.com with SMTP id s11so38493326edy.8
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edZ1YtzomlUy1mG3JQnBn+Oq8n+Y+JzAFR8/ksaDlN8=;
        b=PFvlssf4Ggo0VoXlZc2FhUxjUKnB4Eup5x4BhErQZhbBiuiId0oUqCSzyj5+L3ad5w
         wI6FchuGLNBvM91ieUlnkVcU9KFSUcm1EYtijCQcFspt1bzrGvNG3iiXrxY9C+HS3gRS
         /smd1MABeeT4TSBkfeVji+cC8O5AJhgJ0VBS9Fj1bApq6GqFyhw7Gg4+As9zXzm9zak+
         4Z9i2yE5eWKFiHsmntL/Z2XwLUp0qabiZsukjMk3Funkyqc2+A2dYmkPOl4sN3Zuyret
         KZU4GzhA0p7hXpeWwwx7HKQoJEhz0ogqMrGyJOyUMbMpY2OBBaAqZ4bzRXcVEjvfMogv
         4z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edZ1YtzomlUy1mG3JQnBn+Oq8n+Y+JzAFR8/ksaDlN8=;
        b=myp4bYTyYwillqoROVVFm49tHaNunlz4mFVVHZaE8JyYXv4UcElXtCX+ZLPck9HEWD
         v8IhE5ymJKbDLXm9xhf/zhEaXbVgdTA6XnfpTjXlTGl/zF3tdeEgrzS5iQM+S6zYqmcS
         XHFZVB/VuxQ2ES6z70shjs6o1e771+yOpypdk/IekyZUdThG1vj4g78NsRAvj90k+eqx
         CyWDlkDcGaw46SA/Hlkmum83CH0rn4QeovK3zyTTq8OHyMqVajEl7u/qAoZ+3AVCS6/e
         60jwbIgPUsuBOcV2MAImm/EInEnE+83+aYha0gXo8lpa286SwF8yQIGGOG+Ms+qkC78V
         4C/A==
X-Gm-Message-State: AO0yUKWUFlnQvcaTlWcdXSoJyV6tm4g/bI+iwMhUsn6+n1TI5qjQ/yQ2
	m1sFFtbvVkSUCleRPPAXZmiQ6Q==
X-Google-Smtp-Source: AK7set9l4BYDUv8WJ9/1tWNIf7xlyiVfxch/+G9YhPZ8oRq9zxCXa6FbFzm0mSfKGHbdS3OEGsdE/A==
X-Received: by 2002:aa7:d952:0:b0:4c6:f2cd:9d72 with SMTP id l18-20020aa7d952000000b004c6f2cd9d72mr30110485eds.5.1678626831365;
        Sun, 12 Mar 2023 06:13:51 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:51 -0700 (PDT)
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
Subject: [PATCH 14/28] media: platform: mdp3: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:04 +0100
Message-Id: <20230312131318.351173-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_061352_020337_4D7FCCE7 
X-CRM114-Status: GOOD (  15.12  )
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

  drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c:49:34: error: ‘mdp_of_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 97edcd9d1c81..45a407e63c59 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -349,7 +349,7 @@ static struct platform_driver mdp_driver = {
 	.driver = {
 		.name	= MDP_MODULE_NAME,
 		.pm	= &mdp_pm_ops,
-		.of_match_table = of_match_ptr(mdp_of_ids),
+		.of_match_table = mdp_of_ids,
 	},
 };
 
-- 
2.34.1


