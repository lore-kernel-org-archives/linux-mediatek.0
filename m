Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9999F6082BEA
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 20:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h1GYy3B2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BTF18Tls
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qoIL+h3VRnDc2UQ+UqSvvQ4SKOAi/m0jcVk5/5iZOfM=; b=h1GYy3B2L92gWB
	+CCBy50e6pi009ucHikY+5KQ6NMQhIEG8phQKGua3mS82aPMYMhnQAT15jApF7Y5v7hgXuHSNa1MA
	eCikhHsLk4npjod9WyOGiQnIo57+ogXLW0UMHgRxR87WEkXhUwr6/jOKmGCYliBwhAmNAjsMb0+fx
	FkVHw2RMhluoGnLwPNlhkfxUUr8hA79QZGvJF76NbiXUImkXTr2f2TCZWGurxNv6JmonpxqYXqAqi
	qEmIdxgxODT2eTHf9LTe/8Pwo9PnXVvLKKvMTJ9SH9PzBQO/HVz5TFYmzSdAYWoTbh6ECBCp8dov3
	WVfdh4dyS2R5w36FCg4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnu-0000000FJWI-0Dgk;
	Sat, 07 Nov 2026 20:14:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnY-0000000FIw5-159N
	for linux-mediatek@bombadil.infradead.org;
	Sat, 07 Nov 2026 20:14:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qoIL+h3VRnDc2UQ+UqSvvQ4SKOAi/m0jcVk5/5iZOfM=; b=BTF18TlsMl70lpKiySv20IFtdv
	Dp8tTrboVf7qG34Q6r+HZLiAQN5WiTDEKAw97E/xTCoCwrt67VvtW02IOzGmPbkHKM1H2N3mrpiBY
	Ksh3C0ZPK9uM9IjXJjMN5CIHqxNJFo5GzvnEoMUkRLLB7LAatOluHB4ovx9SXh3oJY9o31VaMQfD3
	BW8zp4L2tQRnwm/SghE02HoGz1sD/TY3oJZg4z3ZrsD7+OdQFbStzPc9ui4INL61mi7Ujdir9LtB1
	peQ1FJUL8Tx+keIv5FVYnM4yg7+4NIMaA9ne0jugattVy+cNlx5MVGfTySwiLbHlJU/wXpgRo6EBI
	5fHqXyJg==;
Received: from mail-oo1-f44.google.com ([209.85.161.44])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnT-00000005Qq9-3y3d
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 20:13:59 +0000
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6f8a519e215so22945eaf.1
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 12:13:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082434; x=1794687234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qoIL+h3VRnDc2UQ+UqSvvQ4SKOAi/m0jcVk5/5iZOfM=;
        b=USbSTI3RO/YYIQALCMugWXsTfabvNIfYJy/jXWeTSBTUrPeH/bXR7oK107NQf+Z9Fh
         9gsQQn4oqvj0GGhxo7OwRnetmF3aScvBOT+ha7NCAlxgFCLH8pI6cg/cO3PyYEEeTP/X
         p9qwPeVC49ear19aBYm2gvGX6tv1fdzSoxXlxJj68FnmIWGQtzFtv5+ommyLTsnKAUX+
         lZWxk8RYy0G/qE8LmtdYOPrSReb9+wKYp9TiOJhfNEvdrtcxFNwkBOslQIyVB4KD8E3c
         4Mrq5wcXI+2yaKAKCaG3eCRPyhjw0ClbmH2Y+ef8S8HCLYg84eWFB/T/qiOmxWBnoEel
         gD7A==
X-Forwarded-Encrypted: i=1; AKwUvBw4qeqhMhdi1Ea77/IYR4nE9HusDEKjwvTw+yXAnx+aEoj5p3mb0AvVW+7IdgtR3yDVPA350ns7AvcZt8igbQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+HMIz960kFoR1a92tOU4iBvLGhoWOhlSRxuvJAr39YbbHnTmoS
	Wk28nyQOAEC6pv64ilk23ldymO5uCnOx8PlOgJfpdnm2cgWE9pPQh1qRQbANWDZRYO0=
X-Gm-Gg: AYBFou1Rq/4WvC4Gr05z/MATmQPMJt2GK98RLiQOaiwy6SBpOIkdOPy3bHWGwL4EBN+
	A4J6t/5nn89tQQVqiiuj4eoJQjF5vLP3AIf/mdk/tyR5XEc2g8NWfqH8S+fcCo2QsVH2X/3Mi5S
	w1nv7VbhXFpEeVqD9zxS8p3DVqpsP2cE1uNLRMVOxENSLUlKfpWQcn7gARPlZ91rEF+b8XaNk/E
	2aHdgu94jcGlwHXtmoujJlfs5Fj+0vuVnH7sOZwzqK6YuAqOe0gYBBFoo0Mfq9+OYsugNMpEjoq
	o0M90/1NcXZ8SfUm4CkLQp9nBz5JUirm7wwLaMrNITiekeDgS6qiU3FUlLbpxRTitBj1PbTSb4A
	xz3qEGcNA4gK8rPF20vuxGNxVFwxojrL/6HNesqMWFsP2xldhn/OIZEzWRbPodLVG5qgM+rqBUI
	E/+sPBUyAzV1n/ERZhvcJ0vyCeNnS7aEy3PhM6sIZPje8sNcXhEaIYaAjY31X7GbvRdX7omah3j
	BfgPeeyks31rQpt/vXyaL8/P+pMbBtFeAIJvVAV/AVagBqYk3jX6uc2IG3V58ybgTMFfSvnW5Z9
	oZLvXgK9R1URc1LaCsKpXwBu7mYV1yF8Gli8Fn40eYAreHQa0pO69YP2+3m+ewh0CUws0fgkn8K
	5/9pxDA==
X-Received: by 2002:a05:6820:2910:b0:6f6:baee:3ccb with SMTP id 006d021491bc7-717009e3477mr1267617eaf.9.1794082434177;
        Sat, 07 Nov 2026 12:13:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:45 -0700
Subject: [PATCH 48/58] mtd: rawnand: ndfc: retain chip state across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-48-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_201356_195835_8C1215DE 
X-CRM114-Status: GOOD (  18.01  )
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

Allocate controller state per binding instead of reusing the static
chip-select slots. A retained MTD handle must keep its original chip
state when the platform device is rebound. Disconnect the old chip
before device resources disappear and release its state at the final MTD
put.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ndfc.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index d7b119028a71..50506ad87fd4 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -37,8 +37,6 @@ struct ndfc_controller {
 	struct nand_controller ndfc_control;
 };
 
-static struct ndfc_controller ndfc_ctrl[NDFC_MAX_CS];
-
 static void ndfc_select_chip(struct nand_chip *nchip, int chip)
 {
 	uint32_t ccr;
@@ -173,13 +171,27 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (ret)
 		goto err;
 
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+	}
 
 err:
 	of_node_put(flash_np);
 	return ret;
 }
 
+static void ndfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ndfc_controller, ndfc_control));
+}
+
 static int ndfc_probe(struct platform_device *ofdev)
 {
 	struct ndfc_controller *ndfc;
@@ -187,11 +199,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 	const __be32 *reg;
 	u32 ccr;
 	u32 cs;
-	int len = 0;
-
-	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
-	if (IS_ERR(ndfcbase))
-		return PTR_ERR(ndfcbase);
+	int len = 0, ret;
 
 	/* Read the reg property to get the chip select */
 	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
@@ -206,10 +214,18 @@ static int ndfc_probe(struct platform_device *ofdev)
 		return -EINVAL;
 	}
 
-	ndfc = &ndfc_ctrl[cs];
+	ndfc = kzalloc_obj(*ndfc);
+	if (!ndfc)
+		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &ndfc->ndfc_control, ndfc_release);
+	if (ret)
+		return ret;
+
+	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(ndfcbase))
+		return PTR_ERR(ndfcbase);
 	ndfc->chip_select = cs;
 
-	nand_controller_init(&ndfc->ndfc_control);
 	ndfc->ofdev = ofdev;
 	dev_set_drvdata(&ofdev->dev, ndfc);
 
@@ -243,7 +259,8 @@ static void ndfc_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id ndfc_match[] = {

-- 
2.53.0


