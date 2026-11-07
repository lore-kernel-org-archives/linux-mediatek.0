Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C655606D821
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 10:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OWKQpvgJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=WbgcVjrV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n6X9twcw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=; b=OWKQpvgJ3l3sYo
	Ydl0+aNqwW3Qrs+wQcKRqLFIYdzRRtiUbXV0vOG4/W3qArROSUMOCqNci8DpJAj0z2u1C76/Y7DdH
	LkYoCAgVptSdzBEMrWbz8MOqdCRGBABB4MxEeJt+lZHwpenh/o8C28T8dBt99BBval3v8y4pMyKcI
	z+B9mlblRghT9c1eEW/fUpGodPVDB+dmzkpdvVu1Hi6wI2e8Dz0e5Z83YQPS8QEbuMx0GoTO0r1gP
	bIMnUGDhEE93VBSuz2jXM9qvvkNoZTSDIGzu3gl9W/39ZB8+KGLsRivPt9gDFNAvB+Ibvq/eukKJ/
	QroKutGvUSW1nkGG+MJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUR-0000000EUOz-2ZBv;
	Sat, 07 Nov 2026 10:17:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTz-0000000ETkA-1QA2
	for linux-mediatek@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=; b=WbgcVjrVaA/9Skvux0QjDCpOPR
	CMv4NWTgu94hFGheJDTyaorB48PDFgw6qjs7anQnoHmuGKLYw/baz1kb2LvHFSSa0bD7WdjnkXcem
	d+0lZ9jPDUlJOewGwn5UK8wJ+MBKccS5xJnBWFwrf1bhMQY1+uttvOv9DZuhTq+SBBheFE44JbnAC
	d3N5TjUMWCdt6fQch+6MmCtQ3a6cynODIRfx/EREKR+a5H3BIQAK/rfzpOk/HhJPZy6EgBGzUmVEJ
	W1sO1bnNjnk8AWUHrz3nBCION3UvcbEPB1IsLhpL/ic2u3MKaNhHObDsck0AkGRYKczWaEG2KSF9r
	s5IEjKNg==;
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTv-0000000GOOL-0FEC
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:10 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7f84a55cc06so967515a34.2
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 02:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046625; x=1794651425; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=;
        b=n6X9twcwo1r4EES11tjE1tNGJdqOWAupxe4JaqaEIKLIBsRHE+Yt3/7iyZJNroCwJZ
         3I6jdbklt7JBOQAJQD5CI1eT/2ByGq2AAJQBVP91Sexo43utsCxx0rqMcmAS26voqsBF
         YM6nKcootDH4vaMAUr97o/6SkjvqvG/kY+9XqlA0stQCyQEvIuGqxktkykBMc4T/X9f3
         0nQYRUx6mwKFAfQZ36KC5BY+r8md8AW5rEzXUJ/6fe5v8Hcn3dQM11SxOCa4+bgnfl1G
         DCAL5ejOD3VuubeZNTfJKKjK3T5s3QBcQgSUb85x5Jfh7XPdzemzKEA60vaVu0hyZWPD
         HecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046625; x=1794651425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=;
        b=E2HZAphqEoBzkX/YbebPbFG7Ym2Lelix87t3M+Wv+HwLIHnzB4SF5ifGYDg9kr9pcR
         Rgb3XZxB+p9wsWb4dVWsflsu7q49ExWumz8gMs3CQaqRSz77O8UyKHq7zdIIBAHZOybM
         T2lgoVBubMzYwyJEvQqgB5dDcSItY3EjGXoXEOs2awGgM/l+fOD3hH5QrAr//BJeAcQu
         1Fxe/YLcFr4Zs1otfLm96ghHq4X3SL3sbqp8xax5OC0Rzbg3+TlY7RUi0MyrKYPSyErj
         QPM+aepdroG/Jb0dGZv/rGbVlV5SqaTAhElpMr4sXDsGHKiTk6xU2tQDCFWNOEvz14PL
         izOQ==
X-Forwarded-Encrypted: i=1; AKwUvByh+PtBgDf3L15mZAq834+MeuuNTDpesL+Q+Vm5h/ZzWPHqEyMhxMNXO48Cd1XHMozokzsVZ3YuM4Okjy6Kug==@lists.infradead.org
X-Gm-Message-State: APuU4Z/xNI/Unh3QSJzf9Stsge99mjhNb9PS/tkdYvSODDTkKqj3U4pt
	AbMn3mbgdBSujVFiXlZtKclQefJb9Hwh5vKKAnYX+3eRepSDgPPmINeF
X-Gm-Gg: AYBFou2v7vxFj3xbDAQZUY7860I8laevassH9LyMmIG81Ww7M4fk14zmgDqwfldGZKR
	YVoVuEZTshyMxU9L3DEFBhRDxPW/92YCDZfbQgvUDx+lQtLrBua080hM1hIcJi+CUnj8rZbvSYN
	RD5KDmp41zi5ehkbQGo+Y2rkTnvTEJzMyAjUcXp2xPmdwCSsbUXcCE8gJ4NrCv5A0w118RWinrc
	OwBsLMR72hQ0VN6c3iOjnDuODE/g8vbe78IFpS1wfrzR/xUPyXXaDZ0lzbFqKypeatT/rVkNnPl
	hsDrUeJIAt71bizyt+VhzILw47fpC6UWHqYTuIus8D4hzeyxAHCOzIksCP/7oZzE5pr9Gg4xeTf
	poK975Uz+BsS79N4hIvvCiUq8x3BRuDnsw8zUbGlOm5YgFyw5BLTdFCyy/Bd9mc3PFlg7C9/fG2
	0k7DwagtTnz/ySPVMQv65NWgwM3DWVsz4PaC3JGDaLQfr2YBE/zn0ZS0uhR9AaUpdU6ruVgWyKn
	pedekRvlfMPWduY2tRQsFdLe1BpDC1R7H7PrtF5ve32agwa3BX0+dr5P+8If0dZJGIc97iWYLIe
	IGtLxWxHbLmHTiCb6I71OXgEi4blEmmCeYUQOL16cONd2rkVHcBl2aek9IcgOplwsaoqVs1nSUg
	uL1i8jAKAfNapbitZUYsGfky70SyNbNZAllDI006MKyLeW9DjEguXj/lhSuwW9aJi/vo3tR0XRs
	V8Kpuf5GQetuUGDVgVj3xVYHH7MqrBhyaCY9pqNJC6oCBlE8+kkgHU
X-Received: by 2002:a05:6830:4ac6:b0:81c:a6c8:8a65 with SMTP id 46e09a7af769-85f1d0d0beamr4517941a34.25.1794046624830;
        Sat, 07 Nov 2026 02:17:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:11 -0700
Subject: [PATCH 14/58] mtd: rawnand: intel: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-14-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_101707_188284_FA4D6CB7 
X-CRM114-Status: GOOD (  14.56  )
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

Disconnect NAND operations after unregistering MTD and before disabling
the controller or releasing DMA channels. Retain the embedded chip,
controller lock and NAND metadata until the last MTD reference is
released, including references obtained during a partially successful
probe.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 477a427dac1f..e4a24e69ebbc 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -573,6 +573,11 @@ static void ebu_dma_cleanup(struct ebu_nand_controller *ebu_host)
 		dma_release_channel(ebu_host->dma_tx);
 }
 
+static void ebu_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ebu_nand_controller, controller));
+}
+
 static int ebu_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -585,12 +590,14 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	int ret;
 	u32 cs;
 
-	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
+	ebu_host = kzalloc_obj(*ebu_host);
 	if (!ebu_host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ebu_host->controller, ebu_nand_release);
+	if (ret)
+		return ret;
 
 	ebu_host->dev = dev;
-	nand_controller_init(&ebu_host->controller);
 
 	ebu_host->ebu = devm_platform_ioremap_resource_byname(pdev, "ebunand");
 	if (IS_ERR(ebu_host->ebu))
@@ -692,9 +699,15 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup_dma;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto err_clean_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
+		goto err_cleanup_dma;
+	}
 
 	return 0;
 
@@ -715,9 +728,10 @@ static void ebu_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
 	WARN_ON(ret);
-	nand_cleanup(&ebu_host->chip);
+	nand_disconnect(&ebu_host->chip);
 	ebu_nand_disable(&ebu_host->chip);
 	ebu_dma_cleanup(ebu_host);
+	mtd_put_master(nand_to_mtd(&ebu_host->chip));
 }
 
 static const struct of_device_id ebu_nand_match[] = {

-- 
2.53.0


