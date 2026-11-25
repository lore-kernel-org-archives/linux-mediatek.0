Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1E0606A332
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 16:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KW6Jpdw/;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gteAu1N8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OnNdjklB4uWYTn3msQzxTr6Lo2LMKVqTjQIZzgFKEJ4=; b=KW6Jpdw/ne4msU
	pHrZ3rGBevpGLKrKs84YHAl8PAAeNnrDADgxRyhDn/M2qXUcGR3GISpSsmw3A1E9VobPTfXtH1PPe
	BUbYjhXf95PEJ9JypT9RcnDePGqKasatrbTUZnEtLxRWYBDvkkM1eBoW6FOtFNIp7jbw2/y1RpeC7
	HuHe3nxqcemTsKqHtiiYECR2mupdwi4PGGAyriSdDwY+6uHqvOVV5Gn2Uoqv7JPlcFLH2+VQ/lU8l
	EhcnphNyLUIppctyAm4v7jY94qrkC6mkIbx7vxT5my1BPpaJDFjzzpUC/CeKwechGJl7xELcMPv4p
	EEEeJgeGZEos811PM1jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFsy-0000000AZIR-2uh8;
	Wed, 25 Nov 2026 16:30:20 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFrU-0000000AYSz-2tgj
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 16:29:27 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so54800875e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 08:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624126; x=1796228926; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OnNdjklB4uWYTn3msQzxTr6Lo2LMKVqTjQIZzgFKEJ4=;
        b=gteAu1N8khpLVy2UlIcycbYuUImTFZGisLUpl25ob1nfBmIDoRsSGPNnc98Q0F9LRv
         VIlFVVJ83afD+d6fqITzXm26UU2rO95jSf+4zD9y7BIAubRbyVGSn1+OsU76jsptv1En
         X9e9mTMbfH6w+Ekphfz+h9jUTKP1FSswKAJ7UrJHXNM+IhjYTK5OghDMlJSjhS8FK4IL
         /FtdAeBxeVoIGjOhTnObrXxA7Z+J+1tt08ok69dPK8GUT0FDBQhyXM6AJM9cjFTiV2yo
         VRCF3o0IhByQdmE9fzw7onJS2hxCELwn9BU18c3aE+KayUq7nmrLjHYmrdFuZ5mJwCvq
         2dvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624126; x=1796228926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnNdjklB4uWYTn3msQzxTr6Lo2LMKVqTjQIZzgFKEJ4=;
        b=xP2KCicJDZbpWLYEzf2es8/FCoCHNJjpeLfVkIuORnZBUq5Wpmk2K9+fiEny5vdniN
         mg0L1J8ozGOIKXQI72QkUhkssg3AO9TARCRB2PwIDmqaFkE/1n6A1Gky5841AgtWg4GV
         wg7sN+g+0avFtgRtNc1CTZ/++t0BZlWtAVZNwg4JN96ctM+eRhClS/WATB3TpxfDeGEr
         tk/lcJ6m76GRo9Stn66dV2pYg1Irq7t51OCy1riOTH17jQGvmDG08esPZQZ84R36jHeN
         67OlMdCJfVV0WeeTfgTjDCxNAlJScEMDA+02gwCWwYWkA2Kd/+PcHoOCxKuxVlZMs12k
         dOEA==
X-Forwarded-Encrypted: i=1; AL+hErE49cGWQv8A6Mg85zwBFgt8+tGtIf8+s71J+k7yB3WhxAvR7Ox4Ac/o0qrEr592mXZtJqbBGdoGL+9Up+M07w==@lists.infradead.org
X-Gm-Message-State: APuU4Z+gHarrXorBylb4gXI5hFQzcQXxDfESqIMH/zps4/ddCH7J/apA
	uH84uo1MqQ+JSVuO50zKFapJeYSPsf2cwvd8XE60IvwSUHyPcx9fIK/OJlDnfdyPzPE=
X-Gm-Gg: AZFdTZdMbs0WG0Y9/7zLMM+JPaKTyOlFs2/FMJxE/PkQExVXgUjDGhRPJkcdRJjBtvT
	ZEjGlkH4cZgCUVHaCn97hFzOr2wZdKCVw7/NbcLBJTJtpRGVfnuAzNyRjFG6SONYex54blIXGpy
	MiuzfYLp3duZnUZmqNx3xF3nyAWDfW8zr/Ja410/Y7t6zo1iJ1h6tdwxVaRi1Q5aM+WndlWatgv
	us3ooKfU61Z3BUWwfYlPysDLgGuvKcKL2a8FZANXo1ymuMufvuchICc2yXG8spdcplNjDZkdzu/
	5wEjHYDe1/17JmQySCIineOMFllVwlDLndSKq5v8F8IU8WFHMvpzwx9qP1lTPOfA3G0lqzNE/8V
	7MPrtZ+MC3TLtO6BvxH6Ln9WurCoUTAeHw80LJIlKjjIexgfCRdsg4Srr98BTAUOlcDrPKmI0zl
	rlOWizphLJ551aZPQrrx0EIZSUecng3qcEMabHPIAjsPrY9x/rLzRPCdqwDr07H8AP3WjjespNM
	Mn3QlSj/+4vSyJuxQMaYZFYEQA988u01nBkmAWYgvBA+A18Fhstb33UcBFEEf0Cpu/QoZwrdEUJ
	kWrInFLOpD5J/RtAr2aUUmSXAoL70hHvi/+ml6heB1cf6g==
X-Received: by 2002:a05:600c:34c9:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4bb88810d28mr405948895e9.18.1795624126434;
        Wed, 25 Nov 2026 08:28:46 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:46 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:30 +0000
Subject: [PATCH 04/10] mtd: spi-nor: Unify of_device_id list terminator
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-acpi-mtd-v1-4-42ad2f645bee@thegoodpenguin.co.uk>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=1549;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=pw1yVugjZoJ1sYzSavbjoh9EtNi40KpLFcyq3KxCgNo=;
 b=kcHPBXNDukNV21LLTOphkMkZzHhEUE3GVm5MT4GkuuM2LkB9EPUAINUu71xJWBBbyUPxGyGvR
 NyJA9ZKxwfTBYz6TriU3QIhP5Egb+QnpqA24EfhtbypOZI53FKPwK0u
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_082913_688405_D0BFFFE5 
X-CRM114-Status: GOOD (  16.20  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Unify the list terminator to have a single space between the brackets and
no trailing comma. This change doesn't introduce any diffs between
pre/post to the compiled binaries of the modified drivers and just aligns
these to the common style with other *_device_id arrays.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/spi-nor/controllers/hisi-sfc.c  | 2 +-
 drivers/mtd/spi-nor/controllers/nxp-spifi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
index 4f6631950a5b..01048ca46a60 100644
--- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
@@ -474,7 +474,7 @@ static void hisi_spi_nor_remove(struct platform_device *pdev)
 
 static const struct of_device_id hisi_spi_nor_dt_ids[] = {
 	{ .compatible = "hisilicon,fmc-spi-nor"},
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, hisi_spi_nor_dt_ids);
 
diff --git a/drivers/mtd/spi-nor/controllers/nxp-spifi.c b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
index 30fe2d414f07..71ee50eb1a71 100644
--- a/drivers/mtd/spi-nor/controllers/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
@@ -440,7 +440,7 @@ static void nxp_spifi_remove(struct platform_device *pdev)
 
 static const struct of_device_id nxp_spifi_match[] = {
 	{.compatible = "nxp,lpc1773-spifi"},
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, nxp_spifi_match);
 

-- 
2.53.0


