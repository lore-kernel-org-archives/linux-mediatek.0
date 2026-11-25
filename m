Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415D1606A321
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 17:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1497vnGq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=fZMiA3Dw;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JlTtzqeK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b3zipjW6FCv6jer+zbTeZRYq6wiTPflhk4lNUgGm5Zc=; b=1497vnGqvGbIHo
	bBQFwAUWFEnmu3Tca/zqEd1bfeBCEpBnZPMuy+z94N4+lOJ+X8hQd/piSCZDgIfyaZkiaP29J+VL5
	DtYqfEW3AdSZ16oKbYKqT0p0IcGE6SM2Q6KjVgt1cRWEBEcHpQ7myQgWpNFTDgz3obPtBqrKmPIgi
	R/KH+362eyE3LPkk1jW2mSZo06mChAPCyXOPwtKx3TKlwdGpOZOQuMmisMT+AXCRW7k2HxsT8++Nj
	jaMlq7RasITRW3zwxv5IEBZf7C2EPrU6ntb7WwDsRwDjeUyZm2AqY5cDZpskPJ8RO8jKZJNcii15w
	1m6YDHkrd2Vfiv7sUFFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGe2-0000000AhxL-3yho;
	Wed, 25 Nov 2026 17:18:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGe0-0000000AhwN-2vHH
	for linux-mediatek@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=b3zipjW6FCv6jer+zbTeZRYq6wiTPflhk4lNUgGm5Zc=; b=fZMiA3DwVLl74ui3KKbXnokzXU
	VOPF+p7Br/ssabFRggQG4Ja757ZRxWNeoYqOePF6V6xIPGoYjXeg5CAVQEnoFr18XOjBo1BQhcSkV
	z3QNDueh6+mJeqAs4dabZUX2l1Ooby6nvfm4pnL9E0ileNC5tIjyd4SYPQD2cT+W7VyMhEKENbJdb
	SddiUEugHkGIzETzHiqVtWW4wix7SKMCIjmTymjmwwEV8XrRXFFyCes9Phirdsav7/lAxJ3GSCaxv
	Z2szwgnCiPp5iDYbi9ni0BIRZ1nG2O0qNiwRkNm68vwB8G3HQHPyr3tD8DXr9cq/W/sL+IfjOPQi/
	rbLS+/vQ==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFri-00000005X50-1BiC
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 16:29:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so46733135e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 08:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624140; x=1796228940; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3zipjW6FCv6jer+zbTeZRYq6wiTPflhk4lNUgGm5Zc=;
        b=JlTtzqeKz+O3HivFn5zdXcfi6U/YELyctS5mM+qXHe3R9UfiuIw0jTgo4f/2BwJsRo
         FEMeCFKFmHrsNxOGsf+di7mYK58AgUBVYb6NTZGd7AqF57VpTQPOnp8HwFV6o1YLi0Zp
         ywkHqtEoBzZ/EWBqh6Do8sQri/T59d74t96LhKrkMyA9kfIKrVFTAfTNBqn2erysvhs6
         G6v77QytsbgCjbu8DVqfiEBom90wwE5ixUDzIk9cPfhRg+XofiYiK4qIwUy0+K7fo6bk
         4uWGGWQjwQaYndPKp7ZPz1NfKLS769pA7WOgBaJeZBGYnIOSwC2PufnmlqWSHT7h3pu3
         aevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624140; x=1796228940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3zipjW6FCv6jer+zbTeZRYq6wiTPflhk4lNUgGm5Zc=;
        b=PH1cZkot1kvaZnLGkH1P30+pLmHfAamTILIMUNyAkmXcUvrp5CwD7yG24iRSBTOsOT
         t8soFI1PmWyvKr/hTdrBDGs53fvE2Wdbl/DMrT5QNVCHzsXKqEcLXCALIDOnUaeHPk8a
         t3xcy/+Eb+p74Pa80VFIWuKuk3zaclzcdNNDqwJCJZ2DTdPYaje80RnQnYX1MhAMgPm/
         Ag5e65rA6J7uGRBrdxOKdJC8nCsmgZhTZIR6U87aftqsp6uxPuLesv9CZBadpyWwcG+V
         C2/wgZ7WLZpVTlOggWGL5CDFX6k0NMMcRTmvxxIS9UPeVIpf0QJIOH2izV1AnMniMC0I
         J3FQ==
X-Forwarded-Encrypted: i=1; AL+hErFC6vw11Y+ns4vCo4m4OcFYWtx9rRzp7JveAU/4eO40q7NfVpkuJzqhbGemHN44ybe5cV1ZuIOGZStzBeWTmg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9SwZnuS4bm0SHLhHOmDZY3jR7tEpjVqiQoDU04KM+i0DHG3/I8
	9tPMmuXSdGbmto6dAv3obuU+7j/mlqZYPXbabG8kTKTf1whIfaV6POehu1BToQuj6nU=
X-Gm-Gg: AZFdTZeAgDs38oaA/6iNSf05gz6k6zWatordVS/zDjobIpd5OylDQjyekJcmu4UWBTG
	O2Lbu+MDAFLBrMcfVNOL5rAZQ5ursYDDut0BKb4RXzkOs2EXisdH9adyWazT1YrcLtekcOE7ynY
	2ruQIJSx2UqaCyqRr3Irk9t+iQspgMp0mUfbScx3IiPwowrZmhADozsK5Vnk0H1KXL5GMwx7HyW
	mLp8ViDwYychmBAN5hFE/1LvHNOdaNsDAs+IwiiCWn+MeyzQvPSstk9V0/o2SzGmrALqn2Ucebs
	awRsCdnw3nYG7hp4IQJ7/8yhUjF1iSCyNCydu7dn0n0e5i7lkJWRonKvkttW6nwabD5y45S5zLS
	WhN9xzB1dqH9OcCNAGht3hWmh2khchawqUiolIwlT8QNxKepEVJBO+GJewTEqHOXROw4x9N2ygV
	TwVrzSyL1rHw+Z6Cg6LWeGqug2G2QmRJ/YOLohHJeW+mT1pr14tZOTlgY88AvKme99XRFd+IMGO
	U8vIUgpAwUuhFqcPPZaiDUCfS/XKM+fNi14nMu6DYxUQMKwLDbDrgK0e0kyECRDY7PG93AflK6V
	GNeRCSXR7y9tsPZfo2bjtYYG2LfaevToUgZ4I7/jd8HU5Q==
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr469106785e9.15.1795624140547;
        Wed, 25 Nov 2026 08:29:00 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:29:00 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:36 +0000
Subject: [PATCH 10/10] mtd: parsers: Unify list terminator for of_device_id
 lists
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-acpi-mtd-v1-10-42ad2f645bee@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=5774;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=KOogzIvhzR8eYf+iMlhb8/yYFLWrj/S1PvoHnBRgitM=;
 b=VkPD+ID7sV7Ml7e/hOXMxbv8kZ5YRPTjrP5CRzexH7lH8bYIAqCXSWUv8DDuCLt6WWwVQ34Le
 OZotULTBoziBXkpCQurbY5qTiNItaA5MiH9TUJN3r3pgeSN9ESNfpKu
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_162902_886813_E1E47981 
X-CRM114-Status: GOOD (  16.38  )
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
 drivers/mtd/parsers/afs.c               | 2 +-
 drivers/mtd/parsers/bcm47xxpart.c       | 2 +-
 drivers/mtd/parsers/bcm63xxpart.c       | 2 +-
 drivers/mtd/parsers/brcm_u-boot.c       | 2 +-
 drivers/mtd/parsers/parser_imagetag.c   | 2 +-
 drivers/mtd/parsers/parser_trx.c        | 2 +-
 drivers/mtd/parsers/qcomsmempart.c      | 2 +-
 drivers/mtd/parsers/redboot.c           | 2 +-
 drivers/mtd/parsers/scpart.c            | 2 +-
 drivers/mtd/parsers/tplink_safeloader.c | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/parsers/afs.c b/drivers/mtd/parsers/afs.c
index 7ab3d50f565e..eb6abf5330ca 100644
--- a/drivers/mtd/parsers/afs.c
+++ b/drivers/mtd/parsers/afs.c
@@ -386,7 +386,7 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 
 static const struct of_device_id mtd_parser_afs_of_match_table[] = {
 	{ .compatible = "arm,arm-firmware-suite" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mtd_parser_afs_of_match_table);
 
diff --git a/drivers/mtd/parsers/bcm47xxpart.c b/drivers/mtd/parsers/bcm47xxpart.c
index a412c0e7bd4e..ee7c81894b9c 100644
--- a/drivers/mtd/parsers/bcm47xxpart.c
+++ b/drivers/mtd/parsers/bcm47xxpart.c
@@ -301,7 +301,7 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 
 static const struct of_device_id bcm47xxpart_of_match_table[] = {
 	{ .compatible = "brcm,bcm947xx-cfe-partitions" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, bcm47xxpart_of_match_table);
 
diff --git a/drivers/mtd/parsers/bcm63xxpart.c b/drivers/mtd/parsers/bcm63xxpart.c
index 6e7b1ae8f58f..78fbe8a681cb 100644
--- a/drivers/mtd/parsers/bcm63xxpart.c
+++ b/drivers/mtd/parsers/bcm63xxpart.c
@@ -153,7 +153,7 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 
 static const struct of_device_id parse_bcm63xx_cfe_match_table[] = {
 	{ .compatible = "brcm,bcm963xx-cfe-nor-partitions" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, parse_bcm63xx_cfe_match_table);
 
diff --git a/drivers/mtd/parsers/brcm_u-boot.c b/drivers/mtd/parsers/brcm_u-boot.c
index cd78e432f1de..d48d8ed73ca0 100644
--- a/drivers/mtd/parsers/brcm_u-boot.c
+++ b/drivers/mtd/parsers/brcm_u-boot.c
@@ -70,7 +70,7 @@ static int brcm_u_boot_parse(struct mtd_info *mtd,
 
 static const struct of_device_id brcm_u_boot_of_match_table[] = {
 	{ .compatible = "brcm,u-boot" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, brcm_u_boot_of_match_table);
 
diff --git a/drivers/mtd/parsers/parser_imagetag.c b/drivers/mtd/parsers/parser_imagetag.c
index fab0949aabba..686ef88e3099 100644
--- a/drivers/mtd/parsers/parser_imagetag.c
+++ b/drivers/mtd/parsers/parser_imagetag.c
@@ -202,7 +202,7 @@ static int bcm963xx_parse_imagetag_partitions(struct mtd_info *master,
 
 static const struct of_device_id parse_bcm963xx_imagetag_match_table[] = {
 	{ .compatible = "brcm,bcm963xx-imagetag" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, parse_bcm963xx_imagetag_match_table);
 
diff --git a/drivers/mtd/parsers/parser_trx.c b/drivers/mtd/parsers/parser_trx.c
index cf3bc9735238..db1129919084 100644
--- a/drivers/mtd/parsers/parser_trx.c
+++ b/drivers/mtd/parsers/parser_trx.c
@@ -120,7 +120,7 @@ static int parser_trx_parse(struct mtd_info *mtd,
 
 static const struct of_device_id mtd_parser_trx_of_match_table[] = {
 	{ .compatible = "brcm,trx" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mtd_parser_trx_of_match_table);
 
diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index 1591aea48b28..d46555138978 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -180,7 +180,7 @@ static void parse_qcomsmem_cleanup(const struct mtd_partition *pparts,
 
 static const struct of_device_id qcomsmem_of_match_table[] = {
 	{ .compatible = "qcom,smem-part" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, qcomsmem_of_match_table);
 
diff --git a/drivers/mtd/parsers/redboot.c b/drivers/mtd/parsers/redboot.c
index 120b2eab21fc..f8d421a88748 100644
--- a/drivers/mtd/parsers/redboot.c
+++ b/drivers/mtd/parsers/redboot.c
@@ -312,7 +312,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
 
 static const struct of_device_id mtd_parser_redboot_of_match_table[] = {
 	{ .compatible = "redboot-fis" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mtd_parser_redboot_of_match_table);
 
diff --git a/drivers/mtd/parsers/scpart.c b/drivers/mtd/parsers/scpart.c
index ad6e9d5c3daa..e0bed5ef04d8 100644
--- a/drivers/mtd/parsers/scpart.c
+++ b/drivers/mtd/parsers/scpart.c
@@ -229,7 +229,7 @@ static int scpart_parse(struct mtd_info *master,
 
 static const struct of_device_id scpart_parser_of_match_table[] = {
 	{ .compatible = "sercomm,sc-partitions" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, scpart_parser_of_match_table);
 
diff --git a/drivers/mtd/parsers/tplink_safeloader.c b/drivers/mtd/parsers/tplink_safeloader.c
index b770f41ef874..e9b25e236eb9 100644
--- a/drivers/mtd/parsers/tplink_safeloader.c
+++ b/drivers/mtd/parsers/tplink_safeloader.c
@@ -138,7 +138,7 @@ static void mtd_parser_tplink_safeloader_cleanup(const struct mtd_partition *ppa
 
 static const struct of_device_id mtd_parser_tplink_safeloader_of_match_table[] = {
 	{ .compatible = "tplink,safeloader-partitions" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mtd_parser_tplink_safeloader_of_match_table);
 

-- 
2.53.0


