Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41725C6FD19
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNgYfofTMT0DwU3/gnE/zf49ZhjV1abWtqYCyvkVzBQ=; b=g79rAMwZyGvtO69l2+wM7GpBk2
	JhNzM5IKEYVE5b8h9GNbo9nAAV7buhd4H+NEi4nDTyGoBOMGBgvT9w5TvsWQAZyVuB9Kx09Mq9Yh6
	7PBF0gFPKzNTvQeo+4CSZP2eteyazh+nUQYeqlKgS61fXYTnroQOyc/5V1lwVY3ubHXYXjSTcldA6
	4BYY81z4NyBty4rRk0dBIfcTU1G00GNSH+Q9csGgX3Z7LZ12E3460Ql1fCfPTsCxhW7+5wW6MYB6p
	DzUEzRD9QMc2z87Zrrh+tKWnGc0WtUr5H7RFKrVPvKBQu1S7c8JpJKOE21Sc+X38gkSB8baBKE28l
	fC+0iXUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM6Z-002ZFq-RD; Sun, 12 Mar 2023 13:51:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM1T-002WWr-0I
	for linux-mediatek@bombadil.infradead.org; Sun, 12 Mar 2023 13:46:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TNgYfofTMT0DwU3/gnE/zf49ZhjV1abWtqYCyvkVzBQ=; b=HQnlObf4+3Oj1eQwJPuOYvrAN4
	VrBQBnhsj0526SBP6q7EcK+fs5ZiU5XLk4ekGet6k/8XWGkE73QxcNMpuQJRSIA8fs81CC/pAJM8f
	CDyqHiesLzDnGhRxbjzynbE+xnvrKIZ4t/7snALxxvwLfhY2nAG+vlWl+R0JBNtqKaGl8B1L2KBcA
	eIVjs8IIzuQ5Gc357fyyoConEMBzTwRozWCJBr95JfPG0r8nldht6LkcZIqBfhN9k4EnaFmPwtEvb
	YDGNEUAEMHVOA4HdoWyZqUKws4W3WnuyRbu7eL8YocpD2LsUZ9eIIFbeKZ2Isn+rMHYk+cYmUtxMf
	M6xZJP8g==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbLWX-0011C3-16
	for linux-mediatek@lists.infradead.org;
	Sun, 12 Mar 2023 13:14:10 +0000
Received: by mail-ed1-x536.google.com with SMTP id ek18so7377009edb.6
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNgYfofTMT0DwU3/gnE/zf49ZhjV1abWtqYCyvkVzBQ=;
        b=EgkbAPHTPzo9cfWlbLRM6KLB9a2CDiyTPjgvZIkiQB2D3eAiH7zCEO3VPovDUd+GB4
         KX5pcpWniraKhokFUITVAYNqggo8wmVnv51oebW8T+jTWoS8EYz5RuidnQho16MtLB5Y
         6HnazuF5aS+d0nJV3e7wA/9S90PNSqDWAroW/WjB+cwKhBYuD2AiqFCxO/6DSf+Lzzh5
         s1erEPkcKXTBdvZZEH+znboKjx0L7miHhUyOS7X5sprDW30hvRNz7iLwKLf6cCe9e+VE
         4sxLBtwFF/inQe5VeT2sEqF81F41KzmIGM4nDHT9s2mV60jv2F0INyTIWn4VM/cwT76j
         nAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNgYfofTMT0DwU3/gnE/zf49ZhjV1abWtqYCyvkVzBQ=;
        b=f4YiScyu9tp8plrQDFGx7C+D7ygcT3pl/SJC7y6aZlfS7WTvcGe+cb9+5XwbD+rO9Y
         80fuEDDjqCGxixioWzkOgsTz12fyNcwIhEM0K0+c/BI5flopYmGpuvqdo8Kte+VIMk13
         WOt47cjeu++Qt/DY3xdgEn6FMlA14UetBNmznejyhzIoMQexO4+FMeE5l+mQVm1LdsMo
         VTPATTTXrBwb62kvx/kE/bFshcy7KUH9WpY9oGhuaHtZa4emR551Wy99yrOZ7lZWRMC3
         /AQ57ZvW6roUJ6ukKsoaay+5K5UJZCQfPNhln2yPUbg59tk88pQjm+Ya9FYy48xi5d9V
         L8tg==
X-Gm-Message-State: AO0yUKVgo8xZUZJ24vZTkoRT1ICRqDBngto+mf+P2LRFHUFTRp2HV9wL
	Tl++bhj4lb37LNu26sinLEVhMg==
X-Google-Smtp-Source: AK7set/vg3wcNxuj5n3r+oFsWS7o7VFQ0ZolSjtjcry30Pr24as5+4q+gdgTFv63DmbvH/wtTzc+Fw==
X-Received: by 2002:a17:906:4f94:b0:8ed:e8d6:42c4 with SMTP id o20-20020a1709064f9400b008ede8d642c4mr31116353eju.12.1678626845092;
        Sun, 12 Mar 2023 06:14:05 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:04 -0700 (PDT)
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
Subject: [PATCH 21/28] media: i2c: isl7998x: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:11 +0100
Message-Id: <20230312131318.351173-21-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131405_526906_FF0A3F9E 
X-CRM114-Status: GOOD (  13.60  )
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

The driver will match mostly by DT table (even thought there is regular
ID table) so there is little benefit in of_match_ptr (this also allows
ACPI matching via PRP0001, even though it might not be relevant here).
This also fixes !CONFIG_OF error:

  drivers/media/i2c/isl7998x.c:1557:34: error: ‘isl7998x_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/i2c/isl7998x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index ae7af2cc94f5..b2b351816b82 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -1611,7 +1611,7 @@ static const struct dev_pm_ops isl7998x_pm_ops = {
 static struct i2c_driver isl7998x_i2c_driver = {
 	.driver = {
 		.name = "isl7998x",
-		.of_match_table = of_match_ptr(isl7998x_of_match),
+		.of_match_table = isl7998x_of_match,
 		.pm = &isl7998x_pm_ops,
 	},
 	.probe_new	= isl7998x_probe,
-- 
2.34.1


