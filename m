Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35D260A262A
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 20:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YmCcoY+/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=jcLQwh5n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Hvi6UIajIglEhxrzqUdlsFCj9Wr9GC9WiHiI7xVbplA=; b=YmCcoY+/w5dk1+
	0Zj7WeoLfr9N6kptHdbCdvbr8BHSifcvOBrfYDgoJbUNt4O9JHd4oCzOcCZ0GJN+0WH5CnDZI9ysl
	NpoqZMW4QQeAdpBbOkI9i25g3zo+2r+HxqC3Lrl96nqXkXHDjRtfF0nsCt88ocyAFQQBsrDYWW2vk
	zAx8lvn5z4cjoT0iY8SomqzSYN4PX6xqicyJBQ9fUEpY6IAPVy3XP1cy3CGv43l/QPTyNZk6oMyHT
	4XFUZFwM07uVL6gU2I/GQ1A+jRwiQV60yBHXrdEIr11St2QbE5/u3gio0iJsl930inJ+e//fbEqaa
	kMuPK37JYr5cmfGWj6qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnh-0000000FJE0-3pTv;
	Sat, 07 Nov 2026 20:14:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnQ-0000000FIgY-26UD
	for linux-mediatek@bombadil.infradead.org;
	Sat, 07 Nov 2026 20:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Hvi6UIajIglEhxrzqUdlsFCj9Wr9GC9WiHiI7xVbplA=; b=jcLQwh5nFwfD64kqB0eAOG4DF9
	BXqFJ/ny1QqnRTtTOwmxxli57fXGHU7SRAOFER+f+Y75skE4mhj3YsU4XkeOkbb5bUtUNbkrqPdbs
	IhmsTOKiw5sysa7bfGzEbMPdf2uraYrjqfG2ZUQZNxHe/05QZR2+I/968qnJh32epOkO9ubiCKwcB
	OopRFxhPFMcs//We0qkvLjyJSSkyO/laQWMKn/j7CzygTYHiStn+3tp7wQXBsdplKdGjkjxmC7XDj
	VHV2AqnvrhpZ41EACDqbw1t54IFhATq39nRJ3Y1vUmmWslH9pyk/nd24ogMdcflXABnZxlzqK8DIE
	wE97UoPg==;
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnL-00000005Qjs-0uMS
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 20:13:50 +0000
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-825b40f8a26so705859a34.1
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 12:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082425; x=1794687225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hvi6UIajIglEhxrzqUdlsFCj9Wr9GC9WiHiI7xVbplA=;
        b=AQZW3oBHa/Pud9lc6UBqOuPJ1VrM4++8mP63Ru+1aLh7rBdfWysZcgfO/NixdYkr30
         ntbLmRllzs/7bXbi/yb9Gy3lqpptm54zSzouigxRiEoEA6ONihhP6Tp+VnjwbArN66GQ
         1LLOcDwRrhvezrbYDJrxKKnpE4mUp0aOG41i3T6HBgSpaFEH89jBRZE1Nx13YRKi23vJ
         uT0TqdUYEXlAjKn5RQaDoQi13ocJNL4uTxMdcH1emUXQGIYDIzyZKavY1tP3/7204HA7
         2quV3+JHq8CV0axzPQmEf/cCKxkBNuMwXMCwjPrhcEfAmLSJvSDsne7uOxTmFtvOGTqQ
         ZZnA==
X-Forwarded-Encrypted: i=1; AKwUvBwD9UYbg42wJ6glJLSsbzneQWfZNxlSFJbxLp0x64ZJuakgBvh0qx+pXgRLSKwmxA3Mkpz0iJ58BfnFp5zDyw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+rxqg0QQdOrMOEw4qQrkg8hAPjgWb3p6c9pWUb1HpYb943jDnF
	cxd1Rh+5BaNCqgVKuirEXLlL71JpN9UNcuOLkjee1RO5ZGtfRIJea+a42TTG45TG16Y=
X-Gm-Gg: AYBFou3RshEr+HNbLZ6W1PVn8wHB0lch4dhlNdH1KRRIz/bAs2smI4jtV9Svf1FIt0I
	36R9YM+Xr307ooMpbAqtEeCMN+FIjbzSbaHvsDsxTRmRmiPwdz/t1vAYHukC6OF0HEjqp5MmUTz
	lmMrIeBwYr236+uu6y7LiXxdPlDqFbZGc9mj/9+68McYrR9w2oTtwS0aSQ0J0WNNQ6cYDPlkCDT
	aM58wKn+Y/N7dEiMQ1AGx7ZuW7XuuSaLw40GeR0CcbSMdMIRY7cP7nEM6XRg8ncS8iePaQ4jYtT
	bZIcbtx8UAGb9mjYQGjVP1yySEYvV491BRt/5vexL7VVxvp/k2Jxq1jtyI8VW0BMPbqjqt0BPsP
	jMYwPrPcjIn0zYgxj8k4pghbVzHvuwHwLqYxFlsS4W/y8vEh/fIo1Yg2kpIckX8CJnglqOtr2FQ
	CUuWOyXDjZHuf839OmSrvJBjJat1b4MhGUngYAGhKzIIO4Q9fb1XKH4e25WCKuMmTEzutaEvq3B
	NQAnIqMZUzSiwg5U7vFjqqg/IDc69yJi3Ogmq+58e5lz/5CcmTSD/ubdzJBkQ8ZEbwRfw9wbbKH
	9PJV68urkey09Qcqq0eFrOTDFT2ClOAjseQpKBWz8LLW51sHS/S63eA0LrdO
X-Received: by 2002:a05:6808:1985:b0:55c:8ee:a9c4 with SMTP id 5614622812f47-567e115e036mr4539353b6e.43.1794082425397;
        Sat, 07 Nov 2026 12:13:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:42 -0700
Subject: [PATCH 45/58] mtd: rawnand: sh_flctl: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-45-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_201347_199224_A0D1D578 
X-CRM114-Status: GOOD (  17.57  )
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

Unregister and disconnect the NAND chip before releasing the DMA
channel. Retain chip and controller storage until the last MTD reference
is dropped.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sh_flctl.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 97f733e481ff..291d809d0ea1 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1109,6 +1109,11 @@ static struct sh_flctl_platform_data *flctl_parse_dt(struct device *dev)
 	return pdata;
 }
 
+static void flctl_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct sh_flctl, chip.legacy.dummy_controller));
+}
+
 static int flctl_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -1119,9 +1124,14 @@ static int flctl_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	flctl = devm_kzalloc(&pdev->dev, sizeof(struct sh_flctl), GFP_KERNEL);
+	flctl = kzalloc_obj(*flctl);
 	if (!flctl)
 		return -ENOMEM;
+	nand = &flctl->chip;
+	nand->controller = &nand->legacy.dummy_controller;
+	ret = devm_nand_controller_init(&pdev->dev, nand->controller, flctl_release);
+	if (ret)
+		return ret;
 
 	flctl->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(flctl->reg))
@@ -1187,9 +1197,15 @@ static int flctl_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_chip;
 
-	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(flctl_mtd);
+		goto err_chip;
+	}
 
 	return 0;
 
@@ -1207,11 +1223,12 @@ static void flctl_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &flctl->chip;
 	int ret;
 
-	flctl_release_dma(flctl);
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	flctl_release_dma(flctl);
 	pm_runtime_disable(&pdev->dev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver flctl_driver = {

-- 
2.53.0


