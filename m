Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9925D60A2609
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 10:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2RZMZWzU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=J19tH02n;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lgxdwTpg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=; b=2RZMZWzUH8XLt3
	0t0RXN3wQCTr6fw5QGWtO8UU480fQP5WidM3y9U941tGet0aM8ykDNlnuvDtKULUk8z3yzvFJJF4T
	KkeOmVWlozc9JK8/OZ/V2ihbDPFKNPAthLRe6s3maFzP3iq7QmdNHf7mYjET+6+Bhcn+1N9w1Mdz8
	CBRXRHvkVjl+zMDcRYzsf2ge0GXxICJvjonYWycq1xHyY+YZ1zUXjpzcUR/tIOTMcN4Sp7B6HRdbC
	a1NEhBJ8vxQfaoHi7qPLIzIbliFA83dDEAT7GNw/OeLwwEgJ2Oy/pFw/xz4CkaDc1XiYuRfDicSI9
	/lAketrOzb3qZfNoKokA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTn-0000000ETQ4-0Ole;
	Sat, 07 Nov 2026 10:16:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTc-0000000ET1p-3xeq
	for linux-mediatek@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=; b=J19tH02nkU1zSj7SpSmX3UR6qt
	KmOHIk6/Pqpr+RNqAB1Q8wfeXAAQflUOm6caPGceiZRshN7FZcK8o511SP8pInjfdGqqLZ2+0OjWd
	cSnvMOYa+UO2KgS21zd+fL2xjfekFwIt4mA/PcKiwHfWsmBr6P4DKxx+07540lJhNOVxwG6iCf785
	9Ioj/iW8a38z5O7MXnzHDlKfs9frYsnVERYjRyujZuhR14l//8X7rldI16cF+UvYEdC0fyjg9B6/I
	I5Z4FAGz4PSnDxWAnowp9wQHLGo3eVp901lCWHcNnUJADlNn7089I0CNoaSlYv0MEGeTU8RDPTvNl
	mGHs3kcA==;
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTY-000000057bC-3Z35
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 10:16:47 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-84e513877a3so369780a34.0
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 02:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046602; x=1794651402; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
        b=lgxdwTpgd5z0PuvkyIHpK+edB4AspuU7l5gxAc4hlhVK43ATNj0W1W5x1dlBHdrOvo
         jO1L6eWqJij2/Nrx3lfLwVoaYB0gEEQS81qpY/vBXYeBUbQWiW5gq1qzPUCp30XGPoRi
         wE5JQCKeQShJmF0yVFcxIV/nA/Zi1sdeVzlAR6NgECCafoAEWMxdOh2mRaJ5TLhX7s7X
         y0n7BV4rGwafsUnMxUIT1YviA2TvnHLWnzkzAOAyCXMfZMx9Sdsxaaea5TRPgI+ZALiD
         xtVq6IBq42Rtt0YP+BhvD8JOUJ7SNdl4vEX6B7xQ0Pjc7MtMqH7CbvXFd0ciI0wOkNK2
         HqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046602; x=1794651402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
        b=BBep2+zuhIGC9WijEAE9oirIwTC1LScJ+pyx6UVyeP5XYIGFeyQVQRWgdLaUS13Z7j
         AoLxzfuCCeMlgdzTluxZKs2JWTR/tCk4MFyAq0KhRSJAxdGrQQxqRAjuFXlUfyaQ9rYV
         wHzvoIdJzVUM50AXPo/BbNgHruJOYHsYrIXSF0YYRqBQpr4tGlwNdWpNcXUY/LdNOiJY
         WwvVgqxV8V9ZmRXSoBhw6HQCIVElY9fmvNJYgkZircZ0FTsFz02imDfVzyNH6SfyVdXe
         CuQ/sKziqSsdDLkHlwqivZtp8A22kRlUz64yJ8QKvR3N/a4KmAIUFYnJXM3UZnKL2zW3
         /OUA==
X-Forwarded-Encrypted: i=1; AKwUvBy5PEOIQnUQZjuPgIlcT/I9dsTgZWYiy3CbpkuuKD0U/vslAkA7zSrplSZWKs406yC5UArQpELLjiiQtuOgsA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9ifXKd11nYqgX6zHDwftoCFf0j1Phdc34gpHU9Qj4Kw0E5Fm7c
	eI/PXHJ6M1Lx53PJzEiM0kh90Si0ztXKh/CF7UXKkOiolEhjRN1qghJP
X-Gm-Gg: AYBFou1TTDY8avAIZmjRMLMbtcWzCwT7ghokhNZInVaWIc8ppChGXtHPIued92DrJa3
	4iQs85wIA1N6dlV6A443HdxCOi8bbKgXl/aCypIv+JIHC4UHk+u2Y8nmlxGTQtt3pZkLw/9/LgA
	hEgztZ14FANjNSmn9k4xPeiJPxEKyUkECHgm6ZYpRYTv+Qf4iTPkW9KhdCzGoYGEc3VM3lVeEJU
	Icvpyw7YIpfj1H7EuWNDWUULL6IgIaje9B11sYnYbjDlPqECwhi18C1oWa9xaPJCzeFdhwGVqWn
	ba2P9XkK1+aTQy5OYe1DKnsoVv/9OuszUPcEn52N2HYCGWEPZPkhZ4sCnTfGfkiVm34XGRf/Tfv
	tylpSizkxW8jga7iUZMCADTLo59pi/3nVbHxpz7UWls1rsdpVp/JuFbA0yyhDc9qFfvJrn9Piyp
	qGS2aLkmjL/lJd7WCd3USlsXIBy/4+ntis2EFVrh448c6rOZ0T1jFAcAmjZsrBuc/eBAL8bgJ97
	9YgLhRqyBTVTbWHCNAP0DZiwtclcesbbxBbHxF9sKbITIwtQB9zDzhA3dIOLUv/3T/FEl7bwiDR
	7SJLvddTEIaubhGwHg4bLaYdYIPRNoh9Uf/xegiHpU3Mxe+qazHyb2H+Fn2SyFCFYW8Ib2RWhpz
	5eDmmUUa5eR55jAdx3kLvMTlpmvYCjj/+EC/TUPREdGI99uDg+CkK5Zd8enwf6hAHWeKQkFDYbt
	uaGtRT/+TRztUvbczabPinBExUb4GmF2ZZq/TalHF7cCw4NlgizepjSkH2BNIp69JrJ/yQam8GD
	g==
X-Received: by 2002:a05:6830:314f:b0:823:e626:277e with SMTP id 46e09a7af769-85f3419d333mr1085835a34.4.1794046602585;
        Sat, 07 Nov 2026 02:16:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:03 -0700
Subject: [PATCH 06/58] mtd: rawnand: macronix: serialize OTP access with
 NAND operations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-6-0181ef0cc4c8@gmail.com>
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
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
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
X-CRM114-CacheID: sfid-20261107_101644_902035_B874F61A 
X-CRM114-Status: GOOD (  17.00  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Macronix OTP callbacks select a target and issue feature and page
commands without taking the chip or controller locks. A retained OTP
handle can therefore issue commands after controller disconnection, and
normal NAND I/O can also interfere with the temporary OTP mode.

Take the common NAND operation locks around the entire OTP transaction,
including restoring normal mode. This also rejects operations on a
disconnected chip and waits for suspended chips using the normal NAND
rules.

Fixes: e87161321a40 ("mtd: rawnand: macronix: OTP access for MX30LFxG18AC")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/internals.h     | 2 ++
 drivers/mtd/nand/raw/nand_base.c     | 4 ++--
 drivers/mtd/nand/raw/nand_macronix.c | 4 ++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index b8b29341b88c..dcd9536da449 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -81,6 +81,8 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct mtd_pairing_scheme dist3_pairing_scheme;
 
 /* Core functions */
+int nand_get_device(struct nand_chip *chip);
+void nand_release_device(struct nand_chip *chip);
 const struct nand_manufacturer_desc *nand_get_manufacturer_desc(u8 id);
 int nand_bbm_get_next_page(struct nand_chip *chip, int page);
 int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 8f7d2571e8d9..2667faf02a91 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -207,7 +207,7 @@ EXPORT_SYMBOL_GPL(nand_deselect_target);
  *
  * Release chip lock and wake up anyone waiting on the device.
  */
-static void nand_release_device(struct nand_chip *chip)
+void nand_release_device(struct nand_chip *chip)
 {
 	/* Release the controller and the chip */
 	mutex_unlock(&chip->controller->lock);
@@ -336,7 +336,7 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
  *
  * Lock the device and its controller for exclusive access
  */
-static int nand_get_device(struct nand_chip *chip)
+int nand_get_device(struct nand_chip *chip)
 {
 	/* Wait until the device is resumed. */
 	while (1) {
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 03237310852c..1ffe2fc4943e 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -380,6 +380,9 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 	int ret;
 
 	nand = mtd_to_nand(mtd);
+	ret = nand_get_device(nand);
+	if (ret)
+		return ret;
 	nand_select_target(nand, 0);
 
 	ret = macronix_30lfxg18ac_otp_enable(nand);
@@ -426,6 +429,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 			write ? "write" : "read");
 
 	nand_deselect_target(nand);
+	nand_release_device(nand);
 
 	return ret;
 }

-- 
2.53.0


