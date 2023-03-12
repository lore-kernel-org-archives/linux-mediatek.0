Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D549EC6FD19
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSUxJvmcYZNHU5p44Si/GkT5n4QeYi/m+nC/+jkGmUY=; b=z4LKIsu3Fvao1CycTgDwxuQykk
	4rDcO82itlFa8SexzvnNSX0h6TgB7oclg/YtUZkqldLbc+yQ66732OUOz8nGO4Cj5bkba5OJpog7N
	k8jK2TUwVDG8hAts0V9xZmHiXr74vY54hsI9PUVEQazYzix5IfOuHIs0Tb+1rAIhuSJwKDPX7uqai
	QZq6o5fQYTn6DnfMJUXym/SpQwsu5bw4MgMHmQwrJIzyriORZAiYIVd0o+Z8m2Ye9H4OEKSEajm2s
	sjT+OpjjlYMdBnc/B6hySx1POSc8DIU6NvQ8tfLXbUcCRgXBDJYwuRcK0R3da8ieWfWfDpVz/FRlQ
	WvU6oAvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLrQ-002SLq-0T; Sun, 12 Mar 2023 13:35:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLoR-002R6l-24
	for linux-mediatek@bombadil.infradead.org; Sun, 12 Mar 2023 13:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=mSUxJvmcYZNHU5p44Si/GkT5n4QeYi/m+nC/+jkGmUY=; b=odt/2tvsPBMQXEmuXYxV4rQNcP
	Pg9CoGyqN2OeRJfDqrna+Q4DT6L+H9UbzjlHnbSQLate8iXG3FmUquInbItGlLFZw+c1+6imAUENO
	9aRiSUAGF6Az/lfRX9SglLnkTkMomGyvmnqdIjE97VYr2bisHgQsEdgQXSpb1ztEOZQ1wKe75h2DD
	Md6PPCiDLuKEm0/JkZHoVl593j+BRBoqTAoMiqlC5NlU7BJjJztciqLbwbQTm4l5BcFYUH5ubcIQe
	1uqsK7WgdfMXYBF/Pe/kME3rbuWkw+GmUL2VB+kj0VWwhUFMIQxktJ/Yl0ZPx0nFVesNuDH9xoyl5
	ct4xvwtQ==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWP-00B3ed-DV
	for linux-mediatek@lists.infradead.org; Sun, 12 Mar 2023 13:14:00 +0000
Received: by mail-ed1-x529.google.com with SMTP id da10so38598401edb.3
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSUxJvmcYZNHU5p44Si/GkT5n4QeYi/m+nC/+jkGmUY=;
        b=XUpM8Rmy7PnFzNbcL0zTFiuJpFVfxvLHNToRAg/PEhIOn5i3jUDYTrbExuiifCZjBa
         lrh/2gHR1SNfhiAIupdMYuN4BiECY5PDduKMVCgt/dKreE5Wg/tVSsTwrkD15OLzXkYx
         Ecua631wVTD/Oxl54ZVfyIQui2oVuNhx2mQFPm7RKgxRlbbEeYYitaPl/BlXPCrgNlUX
         XZF4sEohO6jZjxrG3VlNIM8pUxH96L5LPxy7NJI/31wC+MsSl6gwuHKl1HyQ4rEQUAi0
         WqFYN5wDqaG6b4ITF6OJjFk5JtUhKdpb608LUw4oYj30y83+6sqO96df1Ud9vqsBjNlQ
         hVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSUxJvmcYZNHU5p44Si/GkT5n4QeYi/m+nC/+jkGmUY=;
        b=60ILmiRMzoAKuEeWiOATwk8+cK9DOoErmGhtE3+oth00nOGVCXA5MUn2reZPEkVFI2
         7VTjErwauC8U+VdIwdmQxLpefL/bDwIxUinyrG0BvI+p9sJ48vlMHHBQgQ6v8HPbKj5Y
         7QlFiHlGLL8NSDs5fbAiCCZm6O8KZ/b5ndQPlJcZE/x3+po2par0CUWCwHB+bKc9urIl
         yXLerrC7C7K+X49CqlzJXwRmT3i5vihJwIOGt5Ey2MbK5ViLq88HZTpSqKCEv9tgatyX
         Zex4qBBC7O/j+5YViAxbhBnviTwOVXWHkVrzLLrBLci3fM3VVhaN/XDTTZh6LR/JPeEW
         QhWA==
X-Gm-Message-State: AO0yUKWP9ea7CPwUFK2P0wuBJLIv/zEHV08zD7ThWyi7K3E0Ji887WTh
	DrUn6DziKTUKr7gmlH2WWnqomQ==
X-Google-Smtp-Source: AK7set88AuX6ejtTeUpkVuYiIVeDjSz3hY6JSMWqIppvJBvfzaC26FemUOmCOTaRkYyk9DXQpBQS4g==
X-Received: by 2002:a17:906:1d01:b0:923:1714:b3d0 with SMTP id n1-20020a1709061d0100b009231714b3d0mr3219717ejh.19.1678626837477;
        Sun, 12 Mar 2023 06:13:57 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:57 -0700 (PDT)
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
Subject: [PATCH 17/28] media: platform: sun6i-mipi-csi2: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:07 +0100
Message-Id: <20230312131318.351173-17-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131357_912366_B9DB039D 
X-CRM114-Status: GOOD (  13.76  )
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

  drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:751:34: error: ‘sun6i_mipi_csi2_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index a220ce849b41..0851b6b4e1ff 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -759,7 +759,7 @@ static struct platform_driver sun6i_mipi_csi2_platform_driver = {
 	.remove	= sun6i_mipi_csi2_remove,
 	.driver	= {
 		.name		= SUN6I_MIPI_CSI2_NAME,
-		.of_match_table	= of_match_ptr(sun6i_mipi_csi2_of_match),
+		.of_match_table	= sun6i_mipi_csi2_of_match,
 		.pm		= &sun6i_mipi_csi2_pm_ops,
 	},
 };
-- 
2.34.1


