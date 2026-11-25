Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040E8606A32D
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 17:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fAzBVAaL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=qrr30Nh/;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=i1MhEK/f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dgcQq5x/Y8QFhx80+Eu+QadOSuCUE1CUEnmcqVfNUk4=; b=fAzBVAaL+zVaJY
	5j8ML+Rf+JO6P1CK6hErWqg5QLMRR3WC1Z0AhhQFQ0IcgY2+NGku+NTUzq6wxDe4QBEmcXugDoi2Z
	ExCPYyk/X6Mmy4xgcKfyNDXmqOOHMS6pbd3KboM2SaqOznsRzaDFTxHLwe8swW2ZcTWAmMUjE9dVQ
	/6ZyE2tdnIXG7IDJt7TSpJse0TV+0kDdIqncbcB581ERIyTSnsE93DWk1gg3zGidHI5ycv0DPstFj
	nEY6YoIaYp+i+mcRXhI5fU6ZaDfP0sq1pkEUMp9sjTAU0RpbVE+GVpa0W9sVcABVZ1pfb5OpgKN2j
	deQufP4U4EIvniWQkdmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGev-0000000Ai9A-3QvZ;
	Wed, 25 Nov 2026 17:19:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGes-0000000Ai7g-1IUK
	for linux-mediatek@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dgcQq5x/Y8QFhx80+Eu+QadOSuCUE1CUEnmcqVfNUk4=; b=qrr30Nh/ENF/RDpQGi9ZT1YJ/9
	eZlQch06T0KJCsEqLQ73tZGczNt+iHAmaBdfvDWAgmraAifCWVVzOjMY1cUqrdAQ4iiH8ootVpBt6
	FBvdd8Gwcw3WIOwGUTsAz/jQp910WuKwyF0dl7xci2Ew3uQ69TBccydMHyxHSsMqikilbcYOSAP1F
	vFtKV9bx/uzb2WTyrHvy4N8eL4AKycR406GGTD/luXOjYVlcwrFS6PUG+GerK4+sVtxZr60Qjmy0K
	aWOn6+CzJtkO/NcZlwH/MobPvxCQPHzcyOcnLiKPjIgtgdlj4S2XRcoK4CaQ9DyY0au5u5zply9Ut
	upstuOVQ==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFrd-00000005X1j-0muT
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 16:28:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so77387405e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 08:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624136; x=1796228936; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dgcQq5x/Y8QFhx80+Eu+QadOSuCUE1CUEnmcqVfNUk4=;
        b=i1MhEK/fPQCorpqqzpNQSonyzH54JUiA8RQyIlgccyZjj38kNsxnzW8g+CvBLACrO7
         WrM0oEm4wsnRSh9+SbADldEFuAK3d7rn826qLL+6M1i6kj/Ngw0eEBrVt2FbdlYfujo9
         bDHuiLW/a9iY4QXrtgPji1Pqvw9B/2BMaKZZ3R6UUxpqZHIWqooXWCzQxfdWFxxPvti8
         wMPfvxtoYy7ORm3AxNarOy2IsB1bds1Y9Kqpxuo15hk95MMn9UNmmDiosORbqM+ju6bW
         304PIEyA/icUdKAzGY/yQtOk9rh34z5pZQvwY/iKSlWB5JS5Zlw9aU45ECQZaueQknSf
         +cOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624136; x=1796228936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dgcQq5x/Y8QFhx80+Eu+QadOSuCUE1CUEnmcqVfNUk4=;
        b=oUOKnKjVui4NtWsD0Xd3b0CR2J2tSbNvdDQ5s9TGAga2EBqtJgzUum3hSddY7huGfq
         /RaLGrmX2HuFr9/3IB7MpZW/MSdCy7wbqZn3GIuDnsu5wzwc9kjtNH7Yj4/BydMK2F6/
         HSeOWjYIgA+JS8sYePnoKetmG+FHIzXMBLeHsKNx5V0PB5iJIP3JcUhRZwj3TfYbIxG1
         pquvAerMCyKS086GlJHR9QccsAyZoNQx+d611bi9tUebXKoGTSRw2T+XZlD1/pTxOE/u
         r4Kzvtz6XN3pjNNdIFQsU7F2qax0sAjAEYXQObzQuygCgBgSzhNXA4l7PVOS/EEdKNVK
         odoA==
X-Forwarded-Encrypted: i=1; AL+hErEtcQljBRwZgXBXMMHL13++kEgiIDzE/hbVNmrCSS2/QLsSyi6ApKK5pkkyrg0Pe5njin1KlJ5r61zwrDep3A==@lists.infradead.org
X-Gm-Message-State: APuU4Z+Fq5xrkPCEUbh9SbZxvgNNj53G98MFlpHWpXMYChbR2hgM2ysw
	Jmx4LfbQHKpGlXVDVLFm6H1ZJT8CytefaMmJhAWvPsHdtf2QOckwF5KtsiL7N1Sve/A=
X-Gm-Gg: AZFdTZfoTFrdIgaKCRdzGvRliarbYi0sWMcZs9GIMqmO9VU4qt5expcaUBQuL/A8yzV
	Gs6/6PZj3BiTm1hyMWz6/gvTuMuJ+w6zB4RSjw1RX8p8W3FZ+o7+FDkf5ZCAhTjFOGIRoRu5y8I
	UtEkzNjw2PzRWjXEI0W2g8pC4sRpqk65MGbUdToyciR2BOt3UWbJpeuykfkAHH7eOMtRQVwadCN
	sa4hFZ1DhWVVwHGqmfzCaw4+dQ9bj+kZ8JBSEAOJpTN5MGX88bLwUtxTEulSF8iDdoiIfbTlKNV
	Ab4CdgfvRQvfhZ6L9V6N7wJ6EaSHjcGOnd7blZvshm8AsM0RS9NBAdal5mS1Q2593idd5DBzhW2
	xWfY3iKQ9T9UgGNSoap2PXfFSVta+mO10IXYsOfd3MKrQsOKN7YGsJhzP108SqudSmpNcrI9nmY
	9OvlvQVswe0pY7qQ7kLryDdMCi/AMl9u6JB2sZpNPbUVZfsfBX34QyqI4jhWxIrIOoUw5EzU6oY
	nZQ/JwyF/5qHlkyOGhifY/dstmZbHqjx0O+9WuNhBgIiO55ZGY8lHuEZeD3hR5d57sLG/bxkg7L
	S0MY+OPFuTEX1QwqRTboyYPMfVOvSv/v3xjW3kWd6jJ5FuhtH3PIDelm9WMmZU3dZcE=
X-Received: by 2002:a05:600c:468b:b0:4bb:5fd1:92aa with SMTP id 5b1f17b1804b1-4bb888160c2mr388121675e9.15.1795624135909;
        Wed, 25 Nov 2026 08:28:55 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:55 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:34 +0000
Subject: [PATCH 08/10] mtd: maps: Unify list terminator for of_device_id
 lists
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-acpi-mtd-v1-8-42ad2f645bee@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=2018;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=qZ3dtpaE4yo6DqKw2ZZxvSONBhZmYTuwo6Yz4wDKiAA=;
 b=uXOj27KlhNAZizznn9ogyLPuEGUV9GthH9XWkHXihalhOuNlIXntNNK6vnlTDONhse9U1m2BX
 wgOwv22X4fNCfrJ4kS4rB81GgUoV5JAjSZu8Y1OsSvN/EQwWtziAtg6
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_162857_137473_D69EE128 
X-CRM114-Status: GOOD (  17.92  )
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

Unify the list terminator to have a single space between the brackets and
no trailing comma. This change doesn't introduce any diffs between
pre/post to the compiled binaries of the modified drivers and just aligns
these to the common style with other *_device_id arrays.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/maps/lantiq-flash.c      | 2 +-
 drivers/mtd/maps/physmap-versatile.c | 4 ++--
 drivers/mtd/maps/sun_uflash.c        | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 519126abb9a5..1ee15d50bd7f 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -177,7 +177,7 @@ static void ltq_mtd_remove(struct platform_device *pdev)
 
 static const struct of_device_id ltq_mtd_match[] = {
 	{ .compatible = "lantiq,nor" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ltq_mtd_match);
 
diff --git a/drivers/mtd/maps/physmap-versatile.c b/drivers/mtd/maps/physmap-versatile.c
index 2e779111bf79..9d308c4f21e5 100644
--- a/drivers/mtd/maps/physmap-versatile.c
+++ b/drivers/mtd/maps/physmap-versatile.c
@@ -58,7 +58,7 @@ static const struct of_device_id syscon_match[] = {
 		.compatible = "arm,realview-pbx-syscon",
 		.data = (void *)REALVIEW_FLASHPROT,
 	},
-	{},
+	{ }
 };
 
 /*
@@ -77,7 +77,7 @@ static const struct of_device_id syscon_match[] = {
 
 static const struct of_device_id ebi_match[] = {
 	{ .compatible = "arm,external-bus-interface"},
-	{ },
+	{ }
 };
 
 static int ap_flash_init(struct platform_device *pdev)
diff --git a/drivers/mtd/maps/sun_uflash.c b/drivers/mtd/maps/sun_uflash.c
index cac780cd23f9..2960cebdb0dd 100644
--- a/drivers/mtd/maps/sun_uflash.c
+++ b/drivers/mtd/maps/sun_uflash.c
@@ -138,7 +138,7 @@ static const struct of_device_id uflash_match[] = {
 	{
 		.name = UFLASH_OBPNAME,
 	},
-	{},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(of, uflash_match);

-- 
2.53.0


