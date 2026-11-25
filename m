Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BED6606A332
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 16:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aWhPhmBv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=NoP6ICN+;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MZPSosC3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E/Paw5QZ9QxbXxzyBtlunqj4eITAuJB1YG4IYSSOnm4=; b=aWhPhmBvDSfGbp
	/6BZbIF7yK1dUqoXuYYn7iOxprqBxVUMIu/wBm0181Eqpp2yCsM5NAh8Hri4npKrUOIJH7hI2wFqM
	HxG82TxsqK18NQMX1wxWadVaU3vzqNGCaAZS5QNN0CXx+cidV76NCWTMctU7eK5oP888EBmfduzJT
	JYdQ2+avqCsxPinLhvEAO5H49PxNZ8u1/3bv2sKulICoKWzfqvf8FxHFQiI5jcJTDwcPrGlIPfb7M
	tAg7MRNT6RnKQbOk8PwwY2CqvY9D7sLQGTD08rTBZr2JYflAyUX35a7qZ9cKjc7HbZ3cAOqQNyUcc
	E2oxlVlxtanRafFUqakA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFsh-0000000AYyE-0M7z;
	Wed, 25 Nov 2026 16:30:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFrU-0000000AYT9-4A7A
	for linux-mediatek@bombadil.infradead.org;
	Wed, 25 Nov 2026 16:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=E/Paw5QZ9QxbXxzyBtlunqj4eITAuJB1YG4IYSSOnm4=; b=NoP6ICN+Gj4F8TfT3WoDr4bcQ/
	SL2o3k/eM6a82SWlywvfSzBEdQ8vdwMZhQiWvalNwQ9InHo1nDw6fP8wIX1PnB0NXwDLpKU6kzHOE
	b/W55yxlH4P2nQ94jFIJmKeOjMgr+4atcemGGMaaYZWlSeAIZ0HHCcXJfBBAJDe2igMB7Kf7ifYIW
	T1H3B6WwjEr/0lHYAe+o1/LUQkhO5jv14fSJ5afhr7/wVjKPSuRdziCYKtKgQVzuSNw73TxRZNj69
	xiPH7j4l4WX8GZf01MiFMan0KNFo6/n3GbTzmxP2GrEZmvoPgnrY1zr+VGbFhJAvXZnbldOStTbx5
	sUJTtb6Q==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFrP-00000005WtY-0nw3
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 16:28:45 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so34879485e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 08:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624122; x=1796228922; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/Paw5QZ9QxbXxzyBtlunqj4eITAuJB1YG4IYSSOnm4=;
        b=MZPSosC3V5O5dC04J1ZSxw3/loMWtyUiDFlIpVyjr6QBRdE2G/1CGyWCQyAKeX3kek
         aZPFAEBT7c/QZKkZmHAP0b0n00SA9EP/qnY2xVuGQLx5d9wbKevhgraLIZHcPA4iVKIZ
         BqAIbwf+VBL7b5AmTVtVwE1UUtg90QSwwIg5ebxA8HZ3cE9z6KN2I5BMktXs7Pvr58BV
         EUzvMG95yWEzd579L5wMBITL5RgF2MgVhtTs5FWzHyzlkWrUeAPMS+jc+j7UWH3JVLEG
         FACNnf7btGwiCcTsAokmbTKes6yOF9apbnuCpmIx6fM7lbUWads66MR7Bi76oIsiGV1D
         H+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624122; x=1796228922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/Paw5QZ9QxbXxzyBtlunqj4eITAuJB1YG4IYSSOnm4=;
        b=mf0xJpTmkX9ptCSGfGu9c35FDLZzKjGe9SD1K6JeKBx8gm7vrddJfOTuIlrrT8qrhg
         0FhblnVdNAQ0L3GjmTB2LPF0OU1KPpN0ZR4XLfQ/pZIsx+fr9zRdQF7RJqH7Bft7VyKC
         fgtrow/iugO3LgK4LG04bPyPdNqDWZ5H3Xp17ww/2FpTEkY4LPOZS7tqntYbOEor5DXP
         DeMw2zRGf0j4OKohVSBfhWGIUiWJdrIgAf4S/HKUs2y1K2/czbbLEClkwFFsmVAGnK9l
         /y3C9GYzkFZWA+Uv86o+6zfTpLc8aZGzYzZUgdo08z/yJvOyYwSCZsuISrxbQ5DWWvp4
         iVSQ==
X-Forwarded-Encrypted: i=1; AL+hErHp3cR5Sk768fwEzrHluJ5wKj6VVqcq2uyDwq13JFQyBPID3zaeBsKdmYY8rHAdb3U+1+yJPAdOR+NtUG1NtQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9eahA8+ZuiFTs3Ye/yF0mclaRvy0XdqK2IhQ33d9IKzAPNpzgQ
	uU1HbNwyST7VfBRYQB7dGiBRcpircElxgR0ShTmzQYjhs/7IyZ+GF81QcYNPUXWpCZ0=
X-Gm-Gg: AZFdTZcliqKOKu/UKg7AS1CVSIWbVDWUk/2X1bdJkZyfjPTwpZI8KRxDPjtYELxvgyI
	LR8LsjVckL5HLW+62va/By2cazTmzEuDnlfjqoZIbArs+A/4Bm+Q4/6Vz/Q4hyUKCDxOgmN/aqp
	0WqoQ/PLxca9MgHKumIaXFUyt8AHT5wcjNscjp3OOdaLK54mECElkp731/N0PnAVkMYSFIMQ+/o
	UKLrmgca8F8Ot9I86eJim6KtfyZjNzgGnGyD1efhp2VnzDbyBxTD2Z/brHXCPvJjhnq8DTosMg/
	0LyNg1FUjGnW84yj7fXmaY9HyE3YMttNKdGWSrTL5jyN4GVioio7iC6ZpyfFl+LBfsvp31ClUmd
	4YH1N+Mz1IaQDNFTiGD2peJzj7zwNanjgo+F2a0fPuH080DHCafl1bghCidXycfKqN+qx3yXDOB
	IX7APmmPIxpsEmnEKfSgO0Gw/2Nju5qHeSd1RB+clLYVAAPKP+pbN6HjJ1vhxlncsv845j4Eh80
	KjTPGRgZgH/M85acytTYhE+uMnzo6dzEEh3Xznqr5jAWorw/145T36BtZQiJtp3s2tEpW3gSAX6
	lD0YbXaWXNiM24c94ZTLxQX/YPfFLvxYbbqfSWIDlsIHuQ==
X-Received: by 2002:a05:600c:3b8a:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb8892da25mr367205855e9.22.1795624121613;
        Wed, 25 Nov 2026 08:28:41 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:41 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:28 +0000
Subject: [PATCH 02/10] mtd: spi-nor: Use named initializers for
 spi_device_id
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-acpi-mtd-v1-2-42ad2f645bee@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=4183;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=oSYQ7Bs6TY9Bq0it7ME4AMa1HN8RgNqdeSRr8O3thOM=;
 b=ZzYcsPDU1eT9Urm3wkVmXrHRSn8lYS47jYwodaBWVXhHbdUtk3xdzrjUw2pFBpCbVfZ0+gfNR
 dIrCrr0zs9uAk13TU8rgxCJLHxUgZjH9xPYqCVfddGmUaS8ISdiG+oY
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_162843_170847_DD7BADF7 
X-CRM114-Status: GOOD (  17.24  )
X-Spam-Score: 0.0 (/)
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

Use a designated initializer for the spi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Put every list item on a new line and unify the list terminator to have
a single space between the brackets and no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/spi-nor/core.c | 77 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index a04d22d2e2e1..a76c669000d8 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3662,42 +3662,75 @@ static const struct spi_device_id spi_nor_dev_ids[] = {
 	 * hack around the fact that the SPI core does not provide uevent
 	 * matching for .of_match_table
 	 */
-	{"spi-nor"},
+	{ .name = "spi-nor" },
 
 	/*
 	 * Entries not used in DTs that should be safe to drop after replacing
 	 * them with "spi-nor" in platform data.
 	 */
-	{"s25sl064a"},	{"w25x16"},	{"m25p10"},	{"m25px64"},
+	{ .name = "s25sl064a" },
+	{ .name = "w25x16" },
+	{ .name = "m25p10" },
+	{ .name = "m25px64" },
 
 	/*
 	 * Entries that were used in DTs without "jedec,spi-nor" fallback and
 	 * should be kept for backward compatibility.
 	 */
-	{"at25df321a"},	{"at25df641"},	{"at26df081a"},
-	{"mx25l4005a"},	{"mx25l1606e"},	{"mx25l6405d"},	{"mx25l12805d"},
-	{"mx25l25635e"},{"mx66l51235l"},
-	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q512a"},
-	{"s25fl256s1"},	{"s25fl512s"},	{"s25sl12801"},	{"s25fl008k"},
-	{"s25fl064k"},
-	{"sst25vf040b"},{"sst25vf016b"},{"sst25vf032b"},{"sst25wf040"},
-	{"m25p40"},	{"m25p80"},	{"m25p16"},	{"m25p32"},
-	{"m25p64"},	{"m25p128"},
-	{"w25x80"},	{"w25x32"},	{"w25q32"},	{"w25q32dw"},
-	{"w25q80bl"},	{"w25q128"},	{"w25q256"},
+	{ .name = "at25df321a" },
+	{ .name = "at25df641" },
+	{ .name = "at26df081a" },
+	{ .name = "mx25l4005a" },
+	{ .name = "mx25l1606e" },
+	{ .name = "mx25l6405d" },
+	{ .name = "mx25l12805d" },
+	{ .name = "mx25l25635e" },
+	{ .name = "mx66l51235l" },
+	{ .name = "n25q064" },
+	{ .name = "n25q128a11" },
+	{ .name = "n25q128a13" },
+	{ .name = "n25q512a" },
+	{ .name = "s25fl256s1" },
+	{ .name = "s25fl512s" },
+	{ .name = "s25sl12801" },
+	{ .name = "s25fl008k" },
+	{ .name = "s25fl064k" },
+	{ .name = "sst25vf040b" },
+	{ .name = "sst25vf016b" },
+	{ .name = "sst25vf032b" },
+	{ .name = "sst25wf040" },
+	{ .name = "m25p40" },
+	{ .name = "m25p80" },
+	{ .name = "m25p16" },
+	{ .name = "m25p32" },
+	{ .name = "m25p64" },
+	{ .name = "m25p128" },
+	{ .name = "w25x80" },
+	{ .name = "w25x32" },
+	{ .name = "w25q32" },
+	{ .name = "w25q32dw" },
+	{ .name = "w25q80bl" },
+	{ .name = "w25q128" },
+	{ .name = "w25q256" },
 
 	/* Flashes that can't be detected using JEDEC */
-	{"m25p05-nonjedec"},	{"m25p10-nonjedec"},	{"m25p20-nonjedec"},
-	{"m25p40-nonjedec"},	{"m25p80-nonjedec"},	{"m25p16-nonjedec"},
-	{"m25p32-nonjedec"},	{"m25p64-nonjedec"},	{"m25p128-nonjedec"},
+	{ .name = "m25p05-nonjedec" },
+	{ .name = "m25p10-nonjedec" },
+	{ .name = "m25p20-nonjedec" },
+	{ .name = "m25p40-nonjedec" },
+	{ .name = "m25p80-nonjedec" },
+	{ .name = "m25p16-nonjedec" },
+	{ .name = "m25p32-nonjedec" },
+	{ .name = "m25p64-nonjedec" },
+	{ .name = "m25p128-nonjedec" },
 
 	/* Everspin MRAMs (non-JEDEC) */
-	{ "mr25h128" }, /* 128 Kib, 40 MHz */
-	{ "mr25h256" }, /* 256 Kib, 40 MHz */
-	{ "mr25h10" },  /*   1 Mib, 40 MHz */
-	{ "mr25h40" },  /*   4 Mib, 40 MHz */
+	{ .name = "mr25h128" }, /* 128 Kib, 40 MHz */
+	{ .name = "mr25h256" }, /* 256 Kib, 40 MHz */
+	{ .name = "mr25h10" },  /*   1 Mib, 40 MHz */
+	{ .name = "mr25h40" },  /*   4 Mib, 40 MHz */
 
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, spi_nor_dev_ids);
 
@@ -3707,7 +3740,7 @@ static const struct of_device_id spi_nor_of_table[] = {
 	 * JEDEC READ ID opcode (0x9F). Use this, if possible.
 	 */
 	{ .compatible = "jedec,spi-nor" },
-	{ /* sentinel */ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, spi_nor_of_table);
 

-- 
2.53.0


