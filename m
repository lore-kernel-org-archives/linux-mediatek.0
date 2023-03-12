Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C352C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CwcHrV5a02s5JB75+HpDxEu4ezBqVrMI6kJUFyMDg/I=; b=tMmB5nMvVO5sA6ZONzsdA4imho
	+tXJUYyPAjMALSrU7sEWw5WnqZfv3I7ZUc9rzAvW3ET1eNIy1lVVTWXRrghSJpyw4XTfeCBsktrkZ
	mx5pRsTECJiTEablNk4KL46I/gMP0mUqAlos5vm6cPySefgrvwi7Qj4KvkJjkr71aFeRelpthAWMl
	E5N3OAvnM0jSBgdLTWZ0jjjZYjz/eNLub0ekcZJqf6zCChqwoJyWRpBcA8dqAsfJX4zehfUeEsP0Q
	2xOTmWqRnJmpHMMrnUSckubkxnZE9LdLrfDntgsox06U5AlZyR+MSQnGoqoXHCFURyQLH7kNd3dHW
	E6RqwhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLZP-002KIn-P8; Sun, 12 Mar 2023 13:17:03 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWB-002IVu-6F
	for linux-mediatek@bombadil.infradead.org; Sun, 12 Mar 2023 13:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CwcHrV5a02s5JB75+HpDxEu4ezBqVrMI6kJUFyMDg/I=; b=olqnPyDXAbcwUHu2dtxTXUHkD2
	yWrGUZTgzuhywYWUFKkEAlERU3G8U4OFia4T06Jz6xYa3k9VB2yQPu39kfP2rnugTKo2GioTthog6
	RVQmhZP3QmvnU+8J/qU0453LmdSVt4+sNGg6euM+VHrG0sdzeln22WvaSU67V6t1+p+lsYjR+llvR
	2WY09rLngNiSYzcpL3wXpLfCnz5QOQ6GFJV7ns3nbC4wAWtIYPPknFPEoVkXnXJmy8yNWbX9AMBQe
	y1SqYojMuN/8og3fB7NnckJ/oelX/y0GNIgvPaY29dIvOnvTmwIwYL1X1I96Fz8URYpNefoCzcnyi
	yA7GBxRA==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbLW3-0011C2-2G
	for linux-mediatek@lists.infradead.org;
	Sun, 12 Mar 2023 13:13:40 +0000
Received: by mail-ed1-x531.google.com with SMTP id er25so10368003edb.5
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwcHrV5a02s5JB75+HpDxEu4ezBqVrMI6kJUFyMDg/I=;
        b=bV/PAEtQn1KGw/Zi6jTCgqYa5nRbO5IPf2+hM5MLwAk5Uk0e9xROyciD1SeTbKeIvo
         MlkLJZ7Bn9rWTiPWyy1rXLIb0NPN7l/0SUcmQ1gPA0Px803dGmfYFSsMi0zSxvCDYIEp
         xAfx/2AAA1BZBrfbtUqRJvxUVRAewGUUTagEKg9AHpIaQNB2T1bQ98IqMD5mo2GoWKwK
         +FQom24Ip58JAYs2KpB60hA0ik3xFPiniQmemJhG9dzrzLF06IvbDUiE2YiA/R8WS7FC
         c4jhRSJ9/XJbJhFhHSbrl0/vOmemeevZCwfrLAtLWu/L6nb0K50kiGKmyGQmjBDX2sbg
         iSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwcHrV5a02s5JB75+HpDxEu4ezBqVrMI6kJUFyMDg/I=;
        b=z5464wq8NePMoT6PrDVs7HcIlVWzqgSTmqLS0sXnYuJipmRPXB9N7ol/Dv9I1TjEyB
         gYcywHk+0r+Ht1F4yM+NXs9IenlBAv4NQ6pcFOvo8B0pk4dgLndLmhlpq3bPDmMI0ECH
         xJVUuPOh8KVOf3iLiGQzLfj8BWaI47GUDXUh2B02aa/+rBSLvLB711rNUJko9NbQ5/J3
         R5i64Y7Ez4zJQALomqc+/u4myUXkC/gn+XGBIWNo5ctHves0sC/IMHzKui2mZS13z2dx
         fk2ipZWROLEXuIJxzoafmXkzInCK5X4UCVjGhkN24Ev9K7o6exTokDMEQ7TJ2G0NF34h
         WqaQ==
X-Gm-Message-State: AO0yUKWBHixVMmbQvowlkK8j7sxHE11GXieOlDfN9hgfTHBJcvT2HPGY
	XLtB7s8macKqsUU4Xg67d1gAcg==
X-Google-Smtp-Source: AK7set9S2U41oyugwgVu8YTpoQzzlycJss1HXlDHk5bJDxiw4kxZXbt8ZreuYC74Gl5l/Mtsa+88Og==
X-Received: by 2002:a05:6402:1005:b0:4f9:f45e:c8b3 with SMTP id c5-20020a056402100500b004f9f45ec8b3mr5024696edu.27.1678626811779;
        Sun, 12 Mar 2023 06:13:31 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:31 -0700 (PDT)
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
Subject: [PATCH 04/28] media: rc: gpio-ir-recv: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:12:54 +0100
Message-Id: <20230312131318.351173-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131336_029457_DB028771 
X-CRM114-Status: GOOD (  14.91  )
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

  drivers/media/rc/gpio-ir-recv.c:197:34: error: ‘gpio_ir_recv_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/rc/gpio-ir-recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
index 8dbe780dae4e..ae1199cc73fd 100644
--- a/drivers/media/rc/gpio-ir-recv.c
+++ b/drivers/media/rc/gpio-ir-recv.c
@@ -205,7 +205,7 @@ static struct platform_driver gpio_ir_recv_driver = {
 	.remove = gpio_ir_recv_remove,
 	.driver = {
 		.name   = KBUILD_MODNAME,
-		.of_match_table = of_match_ptr(gpio_ir_recv_of_match),
+		.of_match_table = gpio_ir_recv_of_match,
 #ifdef CONFIG_PM
 		.pm	= &gpio_ir_recv_pm_ops,
 #endif
-- 
2.34.1


