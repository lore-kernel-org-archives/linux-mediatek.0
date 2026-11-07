Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136E46083628
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 10:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HKYo47Fu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=LaH5+mzT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i1gVjdWK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=; b=HKYo47Fucw+GW4
	4ZK0dLoK64FYtUiSbKINh1E5IleW5d+km3ArJUn15U7Fkc8LWghI0VgW4UFdXHDnpr7biT8c/RS49
	AenzCAIO7a5uNyHils5vp96WeBVQUO76likR+BSCPZnTTQU/tlAoetzy1IMSdy2HZ+1MRus4Oy4hn
	D9WPv+TpC7ufw0uSPH9OWRFyH2xufxflOvd/uLEmDTpYQwn4r0iNHQE34DvC7C8cslUHzhCLyfELm
	+IycRundd8ggfbHxX8318KeV2LBcH1tiki+6hAsSD3gUGdrgp8pqmqeelM/lhyaqwjXn4Dca9QQZP
	BQeNmXnXGZTl5LMS2S4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdVW-0000000EVSK-2hbo;
	Sat, 07 Nov 2026 10:18:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUL-0000000EUDa-0rlO
	for linux-mediatek@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=; b=LaH5+mzTuENxvGk4cr9Rgj3mWE
	urB4K5/2Naq2DfIK/c9HUT7xUNLDH0PbyqRHgXd3MvRPWl5ergPa2ZgTDJlQ8rr2LNvmnCAntmrY0
	gB0/NGec/duyu5LHHr1Szzl6xK/7GFDpP8Ra+pjG12qsscODhnST7Ud6fMdtguXnkWLhZOCqiqk62
	wjIHQUZ0UzAnfP6vTMNvbh5pH2CV8HUsORMcvXSmyb3LcCZhrvTO7VxyhM+3KHu7rXFprwiQtcy1s
	oFCVzg1VIZp7Zf6oqNSYJMreTUS5uzWu+Gcg6nN2SSO/dJvaw4kUGrQHmlcdABKohHGm04DVssFyt
	VNqLGyMw==;
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUE-000000057zu-3fdl
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:30 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-8256106635eso629503a34.0
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 02:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046645; x=1794651445; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
        b=i1gVjdWKfGWAS+h+v3DucDj3N6QFxGp351OMEhaIW19Qk/kgKctaQPlrFPysevaACl
         /RLqg+xOUFRV6uGCzq873IRqzvQook1Xau8RwqjywgKivE/tjzA9Nx7kfX9z+/WEcTBY
         yiGFThNN0fY6bBy/UtGzZxJO0mPpI8WSm5yVYSzq1+WJFz0Jk3ceTS0e2nfW1Y8nucJ/
         bV4jzYg+lQYruifvf2Ofk68cvZzBQ3PdO27bilwhrhsUV2kb+xDS5dVDCu85QNem6lyl
         /hY+knm59RmSWFS8sIETLtaNJfhCHObjpsihmlXQTeB/RKulySbjnFE6jNwuDM7xF26+
         xJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046645; x=1794651445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
        b=2djQDu9MTzPgkT5lnFp/Ou7LPFT4dQ18JN1ivTffQYgYY+06Sm7ldg+RZEITGNd6ok
         K8STSCnf24y9wltadsC4iidLyn8a2erIbg/+W3xzpMb7IYFot6bx2kkTUNm48CANQlVl
         YIliKzO/PRNRN4T9bF+Vm587u+t2yvqd6ojZko7G8NM6viJ7SoPjRIltgeU+eGnAgwux
         n7E6OjMOrN51ON0b1b4ZvTO7EjwL+90ZS7aqbnYrmAzgHLVvqtpJUnhvBFGBdoTPT6rs
         VlHND76c0WI329rier+1BhQ+2KQmf+fvXAPyLYiWUEyMVxa8+OSPdg++8dZ06G1hpl4h
         2vRQ==
X-Forwarded-Encrypted: i=1; AKwUvBysfAD0SX5OgzM8B0UnaBcJXwQqW9qDYoNfs2sjHyeYTvT9CdcnsUW84ZwXOilH/cUA/FT1ptX3bdCXL0Lffw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/HQ/KDEekPS9ZO4mXlGFJqRKCRCMzTXIzyIkmWxOBnyU6rqX8z
	aN/hCI8OiWNdUyxKeN7NBVD7A/axL5pAH1ock/DY9AXoZVcBC6SpRFgl
X-Gm-Gg: AYBFou0Y8HFKmsWQBQmTVN9TkfSY7GPitkI7A6H4HlGOIitFDAwqEiE24MsjiX/xr4+
	M41MrQVLq9jUdb0wI7DUD0CCNwLACwq0/rLP56sITxbNNq0Cw9XA4H4muJchSplKf5ZFYunErK5
	hpqA84dRDsIZaW5KjP2k8WRVUNPjGBpNDyYZ/CwV7B+Rxfi6tNDi6+8QieC0cqGJLUtE9oNsLso
	qYZHfQG4ydtSV8HbY8e6zhUPJNe1+EPxcjo/rz2iEdnG973Q316MF+aks2e8HMZclsNZajauz7j
	KekBX6sqMM85kGLsbtg2grvN6So3Hm4bghVVutMQGtvKXELLbog5oY3CwFqkXo+pB5tzTBYS89/
	/WUVWaFB8ogU6hsGTYngGMSdPqwxhVbhjIgw8+Lv4fWZ1JciiP3XcK1xYECuZtSUQf7XKY7SdiE
	hyMVuQlHzAtkdWy5gf7+T7S9HRUi7K2A89uqauhgpiaFKM/pCE16nVas2b5Z1s1m/Cdt513VJY5
	VMjasxvFapm9JBiiXsQFYVJEhEU+0Uh0RGTscGP0u3YFwLXVIB+et436qAlxu5jtB7vxouGrmI7
	807OzIEULSdtCkwLQXOvILoRH5tFHTi8SD68XPmlhURdzYhLFQDXwKeKU0iiXAUvk0ap3tP2jza
	DJ8it9H60rn95TrrmDoILuugzMAnktEVXi9EZAYg4o5BetiyUVJSKJeixFn6FTRSmB02xyF2fvz
	IX3juoLED+FhI0oBxPizaGoMVCyhfciQDmwZibk6yUE0iLOJy8ezcZ
X-Received: by 2002:a05:6830:2546:b0:834:200b:49b7 with SMTP id 46e09a7af769-85f1cf63bedmr4454506a34.17.1794046644873;
        Sat, 07 Nov 2026 02:17:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:18 -0700
Subject: [PATCH 21/58] mtd: rawnand: fsl_upm: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-21-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_101726_924617_111CA585 
X-CRM114-Status: GOOD (  16.71  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Also clean up scanned chips when partition registration fails.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_upm.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index f4dc990a8da1..bfa4f450d7c6 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -69,7 +69,16 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	if (ret)
 		goto err;
 
+	ret = nand_set_release(&fun->chip, NULL);
+	if (ret) {
+		nand_cleanup(&fun->chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(&fun->chip);
+		mtd_put_master(mtd);
+	}
 err:
 	of_node_put(flash_np);
 	return ret;
@@ -160,6 +169,11 @@ static const struct nand_controller_ops fun_ops = {
 	.exec_op = fun_exec_op,
 };
 
+static void fun_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct fsl_upm_nand, base));
+}
+
 static int fun_probe(struct platform_device *ofdev)
 {
 	struct fsl_upm_nand *fun;
@@ -169,9 +183,12 @@ static int fun_probe(struct platform_device *ofdev)
 	int size;
 	int i;
 
-	fun = devm_kzalloc(&ofdev->dev, sizeof(*fun), GFP_KERNEL);
+	fun = kzalloc_obj(*fun);
 	if (!fun)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &fun->base, fun_release);
+	if (ret)
+		return ret;
 
 	fun->io_base = devm_platform_get_and_ioremap_resource(ofdev, 0, &io_res);
 	if (IS_ERR(fun->io_base))
@@ -222,7 +239,6 @@ static int fun_probe(struct platform_device *ofdev)
 		}
 	}
 
-	nand_controller_init(&fun->base);
 	fun->base.ops = &fun_ops;
 	fun->dev = &ofdev->dev;
 
@@ -244,7 +260,8 @@ static void fun_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id of_fun_match[] = {

-- 
2.53.0


