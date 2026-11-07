Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0A2606EE93
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 10:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HZ3Fmt+N;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVlbN9k3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=; b=HZ3Fmt+NiMll+I
	jd+s+ds2LEyKN6HYG8LIR3qeeesK+ny/gFvMA7e4ZxFRKYJtCNmkju25e5rjtJKkKzBw5r6loVlZc
	7F50IjwqTMkL6hrWJw60tNeZ89vO9hxFDVjkWJIHCh99TJSfIkZt28nivwZLidWpRcZg5NjsP0goh
	kHe6D91j7B1jNZuhdNej1QO4Pdp4PoP5RTjrgfU3/AYnhd+oY91Jw1Mj+UHeggv3wNNneVhNghWJ3
	MaxKLp08vrH2xLAhbwtJ10baIZZkeMxhOsrNprZ4x0vVJSYkUylT9xvcS0Hzq/EtG5tHCL+FcAsZF
	Be8Rr3kYGYQEgkpoJ8uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdVX-0000000EVU7-0Rfd;
	Sat, 07 Nov 2026 10:18:47 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUJ-0000000EUB6-2EZT
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:36 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7f84a55e31aso1021390a34.2
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 02:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046650; x=1794651450; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
        b=IVlbN9k3UqfnG8b5zdLFAdPw+n+qDXiKjqQEiZdXOZhl+HnZw1bFF9XsC+n+iioixj
         Qy29+do0ktowbQPPdLyBNjuEqX8sV7dduM48hyUg/kQDD1kZ8/GhWE4YgELQ9hHM0FoE
         7NqqIxveZgLVPM0kTBy0FwPc57ncWghD2f+HOn/p1agwQAyi6iRHKC3asp7V2yoplwQB
         YlDiO67kyz87LwS/5pOmR5fG/Dtv0LvOGPjrxZcTzdUyb9CE3ApuhJm1qKYdcLxkH5DV
         z83DmqmrmM35mUC3q5jj9JsFq95+n5kME2TWRG5gZ8hjam3R79dWd2dMra6MpbHi6ljU
         HRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046650; x=1794651450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
        b=r1pJJtp2QmILLxuY56NSJbE0T18ynHV4eE/7qp0OQu/ry7PrlvQ7EVx5v0T3M6z6j5
         +RDXGHPzb2PPDiVfIISQEEXP740cUugfGpewinMjmwk1vSSrJM3kNLJvq5VDOZrnYXPj
         E/VWWilDLUGDYzrlPTqJKloxQ39sxDryMx/GR/CK17yfMFYiIMed0aZR2pWbg93YWwy4
         MIUZpj+zEZLjRSRNNvza9+6LZDUPNQAmjjr9Nl7Mb/zozvICwtg+INxnGIo/rJwmuyz6
         btHWqHsmg7RQJo8DFwaukxt5OaHKKHugQMrVUKQ2eE2dB5Kh7Zu0K552Idz2fWgynC4I
         ZRsQ==
X-Forwarded-Encrypted: i=1; AKwUvBytZje8cviJGtbWGYoHP9w6zP5AuhUhL0oJ0771kVaoAuGFYvAhB+y7UQJhJOVhZFDAMVgjl+nMa2nMoFU9IQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+4/OVDoTWOg4L2/2zMfAtwUvaZlTUPcdw40aqD5njF9JKJ4eME
	xokqqRe9z0l/G+y5IGUiH8OrNN7z554bGigs3I6ui3dLZt50yGiQp07v
X-Gm-Gg: AYBFou27W2WUXhneJJ5OJpERJiW+zlwOGc8B8cuDRSyPwAznU6kmj7XILrppbY46eOU
	TLlAiN7di4MI/Ni0+vFtlIMYx9u/ky/ZEWa1miEz42vkhUafwl64SUWzCTQhzw++pBspowIcYZ9
	mzncGMjUNLndb4fO1maiyYCU41ipOAtK0YasyOrw71Ldhpn/678LAjWY5nx3At5rWRdORk9BtD0
	YaV93toOPxcrsICanV6o0FX1m3CYFmfz5yvjt3Bn6MauDFDShH9ZdN8aaqLojsfYlAdDFkuoZH4
	PhOu9blRZTAg32hb1PwbM8TscxcUMw0+ZJ5kDzhvpzyTrCc2j/ZU6MWbo7c0ytCEQIsFJG1Q515
	tHkD22Prnyl567Q4zTrS/I8uQ6V45V+VfLQO9Pu6YGGDn2qD1SoEVBLoBBTXdaM4PTFr7MB1tYF
	b8rcLhKDC12E3jQV1AcuzIyUI2Ji7w71Sn4f/oXdZZ05KVYRO3vt5wQJe6L3PbIWfV+cL8xep2a
	ZHQx7oitpwSoFz8Uq2STqBnNmjANsLNv4emX9wc+7Wca5wE7e4KICvqAb2DraaY3Oz0meEJDJd0
	hl6iieuSyk3Xc96Km7jzbuQBm+3sB5fwDJoB5M0T1AfaixDHcDqWnXAHArCGT1RDRCI9MXuXe3X
	lqZIyF7+dppywWjGmJbzF9w7BqMvWYKO/g1jJqMA+fTvP/fGnFupdz+veGF0GU/uu9pziXwlUbo
	wk0Roxr4c13dGBsG6T/uR5btYBIvkT98Ppgv66Z3/QW1ti4fjYy0cYWVNXUe9BeBcoLMgreq8p0
	f4=
X-Received: by 2002:a05:6830:6809:b0:829:2af1:a07d with SMTP id 46e09a7af769-85f1cf0ebb8mr4412683a34.5.1794046650417;
        Sat, 07 Nov 2026 02:17:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:20 -0700
Subject: [PATCH 23/58] mtd: rawnand: ams-delta: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-23-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_021731_716999_CE23C4C1 
X-CRM114-Status: GOOD (  17.00  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Apply write protection after unregister notifiers finish their writes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index fb2b7db70297..ca3fd966c4ff 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -233,6 +233,11 @@ static const struct nand_controller_ops gpio_nand_ops = {
 /*
  * Main initialization routine
  */
+static void gpio_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpio_nand, base));
+}
+
 static int gpio_nand_probe(struct platform_device *pdev)
 {
 	struct gpio_nand_platdata *pdata = dev_get_platdata(&pdev->dev);
@@ -250,10 +255,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for MTD device structure and private data */
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct gpio_nand),
-			    GFP_KERNEL);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &priv->base, gpio_nand_release);
+	if (err)
+		return err;
 
 	this = &priv->nand_chip;
 
@@ -355,7 +362,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	/* Initialize the NAND controller object embedded in gpio_nand. */
 	priv->base.ops = &gpio_nand_ops;
-	nand_controller_init(&priv->base);
 	this->controller = &priv->base;
 
 	/*
@@ -382,9 +388,15 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		return err;
 
 	/* Register the partitions */
-	err = mtd_device_register(mtd, partitions, num_partitions);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto err_nand_cleanup;
+	err = mtd_device_register(mtd, partitions, num_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		return err;
+	}
 
 	return 0;
 
@@ -403,13 +415,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
 	int ret;
 
-	/* Apply write protection */
-	gpiod_set_value(priv->gpiod_nwp, 1);
-
 	/* Unregister device */
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
+
+	/* Apply write protection after draining outstanding operations. */
+	gpiod_set_value(priv->gpiod_nwp, 1);
+	mtd_put_master(mtd);
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0


