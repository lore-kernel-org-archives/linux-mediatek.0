Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EDB606A335
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 20:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fYcSzLB6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=mmiSnKt7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LtFKBRAqbAaZtxAu1Nw6aaS7lLmmzcUOPw2XCvAi+f0=; b=fYcSzLB6lVQel3
	y6EI/k+WgKpg0Vn/mdV58Ao0AyMRzh3KEFYPi3z6gs08ANE622CcjjjcAbnX861cgMTVsvQFfhqfP
	InswHI5yhWUq4YRpYC4iQzjIhupAeSlJ3t4ODki70QsRYLy8xK9jZLQuQpAlvJMsXHMHz24EL9Vth
	PJcsKRVK640Thz1ab/b21l3UfT/4g+ewg+6Wh/Y4lLG9srH/Tjh3TZQWetJ85WGIbaMIpFpvbOos+
	BGBZ/CxbNiwEnjLYUd5pnzmzd04G/fYsumLL/z5yQZLGXlj3LBJ3RhLQzDgneyOKjorB7SWu09gOB
	94/Q7X5IX1RRZ7eKwjWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmoJ-0000000FKKb-2aF2;
	Sat, 07 Nov 2026 20:14:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnu-0000000FJWb-41nn
	for linux-mediatek@bombadil.infradead.org;
	Sat, 07 Nov 2026 20:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LtFKBRAqbAaZtxAu1Nw6aaS7lLmmzcUOPw2XCvAi+f0=; b=mmiSnKt7VN6+GPhycFnNvhakQD
	I/0aLWFP04tkvT3DJ4Ju3bFOJvpcnh/XhYRlOJOWgft8kMha2ANT0iUQNsKTj5JgfgxVkK+LUsQu/
	FZr/W9i/D5j508HSA2Y13QYuRD+oybFlOPvLqO+WrZsRUSHbJZtSTfcIhgmqpfBiu3gdgR2FuA91J
	sZXbXRzK1/Q0r3gJyXHNy9+RgZ3yYxGMmWsMfo/MFz91u/9tkks6zDlli+X7hT83nrrbUv/TEoquT
	xx5X9lB8Xd8wDgX9oez4vmszXVy+HOC6MRt7DstGGeV4Yly+Nls4UzohXbtYn76aV0rTFbtKPtg7+
	eeS1g3Jw==;
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnr-00000005R2n-0KMI
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 20:14:21 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4ad5b52f0a7so7847fac.1
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 12:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082457; x=1794687257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtFKBRAqbAaZtxAu1Nw6aaS7lLmmzcUOPw2XCvAi+f0=;
        b=wslOuXEAm5QEQFPhOqBUTHPUagPUekW7IFe+sVDwRusklijycJspI+FveMo1eg2MPQ
         HFFpkc88dtaC7rCA/P2HpyHAMtKqn+k53MCfub8+xIcVM5LdbwgShbqZcCqZZrvuZ26/
         5lul9doGK9Vv2AuXVpL1QMW6s8h6jzlCBLvUf49e+ElCGTvQrHeTSW4gzNzAHK4cA+eC
         cnGXYskr6Q6z39J7Ky20eFWPKTB+hc2ewSbSfCyiheZ+9TzrYTplYD+1c1KH6e3gsl9A
         TsOvqpimVwtx7KaKbIuHhKopwm7jOZmiGCtGVsFpbDGghlnCq7XJuyovKsZoAFnY6dxe
         UuGw==
X-Forwarded-Encrypted: i=1; AL+hErHxTXToXUAesAWMyry7BQsE0trJ2CRRW108kJNOtAZOuOHPl+K6YCULC7EpyBwGZIkdcOEr39PStdvelEmb0g==@lists.infradead.org
X-Gm-Message-State: APuU4Z/9hI7oLJCD0tM2HObnA1VWFNcxKVTHxusRfiMyk+oGzzaBZg7u
	UEQCGnRFepirwQujKefl/4q0PL9hWQeER4ISIYqFJjURJ+4Hlxr7zXUkCMCAihRrmrU=
X-Gm-Gg: AYBFou3ABa65xDf05TTz4oAt4UUcD3km7O8IpsU+6K52UDwYa9UZ4jRnfOXfi9NW56K
	z2Si14OdfKyNN6PdWb0SYkxRuc+lSx/W5QuPeKi8A8ylcRu0mjS8jJ0BOxylYIc3dl1EKcYCvFH
	EZm2hrQ89Wja2m2fPlFqMeoRmQQA2uTK2gvVTI7kHTCVF4bPf4kQ0ZPdnOrhIxItyswkm/uMDgv
	GwcqUOwaPApPBvEOU1OnOO9S/VpozYhezgZFTsGw9h0eoDjWZT/7YP2KxWcEF/O5Z98pQ9+qQ+M
	t4RlXHzcEis9HVU7vbRMmUN6Qg5IyKf8aILxR8SVcijtb1gwPejOF9c6yak7Em1tA+7WxZgtzr6
	w7zQ7gcluvQSZioBYzCrelAPQqxbf6vUXHGivwiAutxkMe9QB0KuWH2slhtnqneQ9H96iEwjJnL
	Btq7rdFl6Usr5bLjsg6ME96QYB47ja5Mbp6ligDjM66QLqu7Jz9plZIezt+JRcdqrm1SqqRbIaN
	l5JtxELdVp7Zeis6yGauSkWupQhSUaGiiRhj/bDtutaBad5gH72M17LZJJBrO6TQ/UqxEKoj7do
	DDU6irDDElJCINVc3IzVBj2O+iFwfqG/QR6oWrxS5n9nHkOqwHYTwYariJiNOPV7RuqlyuzLoPg
	aGHHEfQ==
X-Received: by 2002:a05:6871:438b:b0:4ad:73bd:91b3 with SMTP id 586e51a60fabf-4ad98aab859mr3931286fac.9.1794082457245;
        Sat, 07 Nov 2026 12:14:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:53 -0700
Subject: [PATCH 56/58] mtd: rawnand: nandsim: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-56-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
  Brian Norris <computersforpeace@gmail.com>,
  Boris Brezillon <bbrezillon@kernel.org>,
  Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>,
  Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
  Russell King <rmk+kernel@arm.linux.org.uk>,
  David Woodhouse <David.Woodhouse@intel.com>,
  Mike Rapoport <rppt@kernel.org>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,
  Christophe Kerello <christophe.kerello@st.com>,
  Jason Roberts <jason.e.roberts@intel.com>,
  Michal Simek <michal.simek@amd.com>,
  Boris Brezillon <boris.brezillon@collabora.com>,
  Mason Yang <masonccyang@mxic.com.tw>,
  Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
  Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
  Thierry Reding <thierry.reding@kernel.org>,
  Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
  Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
  Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>,
  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
  Liang Yang <liang.yang@amlogic.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  Manivannan Sadhasivam <mani@kernel.org>,
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
  Paul Cercueil <paul@crapouillou.net>,
  Harvey Hunt <harveyhuntnexus@gmail.com>,
  Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>,
  Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_201419_043105_B2A2225B 
X-CRM114-Status: GOOD (  16.41  )
X-Spam-Score: 3.5 (+++)
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MTD device references can outlive device unregistration even when no
open file pins the simulator module. Disconnect before freeing the
simulated media, and retain the chip metadata until the final MTD put.
The lifetime core waits for remaining device references during module
unload.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nandsim.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fe968037f75a..39fefd83cd85 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2253,6 +2253,11 @@ static const struct nand_controller_ops ns_controller_ops = {
 	.exec_op = ns_exec_op,
 };
 
+static void ns_chip_release(struct nand_chip *chip)
+{
+	kfree(nand_get_controller_data(chip));
+}
+
 /*
  * Module initialization function
  */
@@ -2262,6 +2267,7 @@ static int __init ns_init_module(void)
 	struct nand_chip *chip;
 	struct nandsim *ns;
 	int ret;
+	bool retained = false;
 
 	if (bus_width != 8 && bus_width != 16) {
 		NS_ERR("wrong bus width (%d), use only 8 or 16\n", bus_width);
@@ -2376,6 +2382,10 @@ static int __init ns_init_module(void)
 	ret = ns_parse_badblocks(ns, nsmtd);
 	if (ret)
 		goto free_ns_object;
+	ret = nand_set_release(chip, ns_chip_release);
+	if (ret)
+		goto free_ns_object;
+	retained = true;
 
 	/* Register NAND partitions */
 	ret = mtd_device_register(nsmtd, &ns->partitions[0], ns->nbparts);
@@ -2391,11 +2401,16 @@ static int __init ns_init_module(void)
 unregister_mtd:
 	WARN_ON(mtd_device_unregister(nsmtd));
 free_ns_object:
+	if (retained)
+		nand_disconnect(chip);
 	ns_free(ns);
 free_ebw:
 	kfree(erase_block_wear);
 cleanup_nand:
-	nand_cleanup(chip);
+	if (retained)
+		mtd_put_master(nsmtd);
+	else
+		nand_cleanup(chip);
 free_gp_list:
 	list_for_each_safe(pos, n, &grave_pages) {
 		list_del(pos);
@@ -2412,7 +2427,8 @@ static int __init ns_init_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 free_ns_struct:
-	kfree(ns);
+	if (!retained)
+		kfree(ns);
 
 	return ret;
 }
@@ -2430,9 +2446,9 @@ static void __exit ns_cleanup_module(void)
 
 	ns_debugfs_remove(ns);
 	WARN_ON(mtd_device_unregister(nsmtd));
+	nand_disconnect(chip);
 	ns_free(ns);
 	kfree(erase_block_wear);
-	nand_cleanup(chip);
 
 	list_for_each_safe(pos, n, &grave_pages) {
 		list_del(pos);
@@ -2449,7 +2465,7 @@ static void __exit ns_cleanup_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 
-	kfree(ns);
+	mtd_put_master(nsmtd);
 }
 
 module_exit(ns_cleanup_module);

-- 
2.53.0


