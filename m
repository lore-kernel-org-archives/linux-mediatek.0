Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1F0C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FklNTrfw75FQnVJC7no5/FQCPZiirAS85g1dWyaYnQ0=; b=cHxK6wk0mPbNizPJJil5nzXfL1
	oPdCKkldw8qwfNYomLfkMZkfJpxpoBqzFGW1+Dn0uXfSrQan73leS3tlkz6qzV3qKvuEE0YnIjZnX
	14Zs2IY0XINz9TwUp279EFYA3jWwIq40VaFFNyO7/eIH9IWU/Kbgs7cjEUWgVuXubFHKwxkwumV4B
	esItRG2IYmKe58y+bF/VEJcytboWewCmpZd9Ev66a/EIPDVyBegU7ocfspVm1V74zMfTwRmzppndS
	ZG34ppkcGMknAVpEP5olqu5/pUI666RqCPaCPuIjDLxIDtKlBCXAgwS3/9eelmkS3Oj2WfX3gVivx
	fToPBUrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLbd-002LUU-TL; Sun, 12 Mar 2023 13:19:21 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWH-002IOO-Tv
	for linux-mediatek@lists.infradead.org; Sun, 12 Mar 2023 13:13:51 +0000
Received: by mail-ed1-x534.google.com with SMTP id y4so9043684edo.2
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FklNTrfw75FQnVJC7no5/FQCPZiirAS85g1dWyaYnQ0=;
        b=YAxPlJhF1+DE9jUIWYyITWyk7/AONuibeqeBOgc+dWF5fRBbLmZqbk1IYqYlHABI85
         gz1wXPUZjU5FC3mPpXfAfbwnto9A2C8UR5j79ptmQvXc8NIm93NUj7vnZscY32eF5vOQ
         MNqXBlnv4ABmODy3pYii1yEyd13GeBgb4NroSTWOAXhnpEoT/yi4gqdHK3skNRal/Ae+
         3cMpgvlN2t9T17SYFpZKlQ7VLMYX986I32TaxVNtQfKWUgod+jAHKsvNHdpkbRKt4aYk
         B2uanB4ZtOcer65Igqf0RJ3h8hJb/2Xmwgp0Xi2cgPElJofc8L4SdOxvKNLQznQt+/k0
         yqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FklNTrfw75FQnVJC7no5/FQCPZiirAS85g1dWyaYnQ0=;
        b=nMqYQn74cl8cG0zPGrcytQ2oZHrZOFvC+Fc8ui2ua3kb7Pf7ItzFuY5UWIQlaM2YfX
         z1tUG1/H0MFHdULpXlK8sywrVK8aBiWX1YDVG20zSgm8cn4EzhwOnxuuMQoX4KmlEqMU
         g0+EOb6iyNCGFDWBRgwKSN5sNfJWMeANdXXTwgNa/nW8r0WjumsEPczrgg/pNtY6wscE
         uXd3NVEqcOL/BtZndMvIe1JKAEAzrq+7G3e1wKAdxo+Qq6kmydL75JIiji4GHKabpPft
         BgH80s/Z1ppwDkFPsjc5rDUHXvwQxqUzSvqKTwhCA9xAJGZmhFgsvm7NAWGNV8w9tUn5
         1hUQ==
X-Gm-Message-State: AO0yUKWi4iBe67ZiR9fNlTK2VagBGdRLrmMFZBVWvH/vRgok8bAUWx1d
	HsJU1/Fj8bWirr9kZ5x8Tm/6KA==
X-Google-Smtp-Source: AK7set+1VMb4vP5AkQiutwwyqAr2RuSDyquikjNxXi+uMI4iRdw2RCO1AJJ8nzH1kwmE3q0OOnHeOw==
X-Received: by 2002:aa7:dbc8:0:b0:4f9:deb4:b97f with SMTP id v8-20020aa7dbc8000000b004f9deb4b97fmr5865130edt.13.1678626829419;
        Sun, 12 Mar 2023 06:13:49 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:49 -0700 (PDT)
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
Subject: [PATCH 13/28] media: platform: marvell: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:03 +0100
Message-Id: <20230312131318.351173-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_061350_109749_AE2C826D 
X-CRM114-Status: GOOD (  15.08  )
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

  drivers/media/platform/marvell/mmp-driver.c:364:34: error: ‘mmpcam_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/marvell/mmp-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/marvell/mmp-driver.c b/drivers/media/platform/marvell/mmp-driver.c
index ef22bf8f276c..b7747c7bae45 100644
--- a/drivers/media/platform/marvell/mmp-driver.c
+++ b/drivers/media/platform/marvell/mmp-driver.c
@@ -372,7 +372,7 @@ static struct platform_driver mmpcam_driver = {
 	.remove		= mmpcam_platform_remove,
 	.driver = {
 		.name	= "mmp-camera",
-		.of_match_table = of_match_ptr(mmpcam_of_match),
+		.of_match_table = mmpcam_of_match,
 		.pm = &mmpcam_pm_ops,
 	}
 };
-- 
2.34.1


