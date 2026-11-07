Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C00606D82A
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 20:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JowtKHaE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=m29a8utw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JrxepS2J9VPceqdGkgV52/qe1YoRSs0JHMfO/RKE6Vo=; b=JowtKHaEgIcB2u
	fIuysadPju3uZKdYMKrZ9QoWOZfbi13oCHGJ1JdV2Elt2aarkjVPNI5ke/8B/hiiHUfWmhst15jGR
	krlCKmD2pvaGzubxosfZ+J/CNbZ3SFaap10omCsv+DLuBmKftx9gXj9akmu9Wa1MzVmJs/kttJijM
	ZtpARuKnPryKqsWKM/duNR8WZe9DchFWI+BVrzKA0ZVuVnBQ1FGMUSAm2Enve8SJwD/EtXqAoWghk
	e7MRKPS9qMrSYMXlmPcLMbVsDMe1JLPcFkW27jSckPap3JrYB6WcDBN69EnhSOOPUuXdrc2Wc3mGq
	GoXBbZoPJmeK07K4Xc2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnV-0000000FIsP-3v4p;
	Sat, 07 Nov 2026 20:13:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnK-0000000FIU7-1zUU
	for linux-mediatek@bombadil.infradead.org;
	Sat, 07 Nov 2026 20:13:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JrxepS2J9VPceqdGkgV52/qe1YoRSs0JHMfO/RKE6Vo=; b=m29a8utwaelA6KCUxepqeBAP7k
	fTzK2wAJyk5bKy5DtXdzP6fH1+Cwb+p3oKDvthSSjk6cSh1TtedOg2Wea/+rWtDOy3hVIgNlAvtW8
	vDqOYPazjwvLv2zNRtWfy4jV2R8gFlj7YaW85fp29a3GhpVRPfzRGvbpe5MsU4TYpM5+2FXSOfbTU
	MKbCo7KWiK9JyfcWWgMvmolVhMfQZ8Iq9QAMJ5HeTeWdVsVYUliMEXx2cE8dprC5LsYpkcD8y7mYS
	bfg5f7Df82tgjJNDLXLgZ+V68XGsktypmD4agAn5kg7/fCdseA67D2v6JcNQLRzTUxfsatj8EfcuB
	vMI5jePg==;
Received: from mail-oo1-f45.google.com ([209.85.161.45])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnC-00000005Qer-1d7U
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 20:13:43 +0000
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-70b875f6f1fso1601644eaf.2
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 12:13:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082416; x=1794687216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JrxepS2J9VPceqdGkgV52/qe1YoRSs0JHMfO/RKE6Vo=;
        b=2tmSgnPZCLGOp9hTtQ0grzChVt73tEsA0dl8YAepgVrTjY8hwa5kxwpcR279V1zjAX
         BNUdUSCBwuJQB3Ep8AKAgypWSMM5NmsxxXeNisxjru+4s+c5tylvQ919w6OOPqUjX+gt
         cHxegVvrbZ0Y72n/JkGJSdkeQuDbeYg7Jo9CjAvA1gh2Jr5zV/+rc9QOjxNnOux0Tsv2
         KmkivPh4bQhvB+q0r9FqPcnMB2vH2A0nCBnhOYryj7insVeQbNBwe9dWKeM9HxdKGOQr
         27ZSSM9wsb4E8RM+zihESl4V17ReATeu8I3TxHeqSACeebbjVu923l+lx/qNXhXIWoOB
         Rjpg==
X-Forwarded-Encrypted: i=1; AKwUvBydBREDL4WEtSGj/FwzFl9+9zm2lVrhaS6lJjv1tIDZAzcr7NAgu+tVeRzpApSkCckLHm/9rJVSf0gpSOEmMg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8WPT0yOyM6UGNpf+K/NdaG1rIjIAd6e0UB7IQybfX3TRk4VrW0
	3vyTj0hJyOqJ3fXOgpbziTx9ar4gHbIamX8yC7lCy0u5s24eldbkQ0OBeGEIzRD1jyo=
X-Gm-Gg: AYBFou1s5hVzF+nGu9X4k8i65nbZmIJBWPksWsAL8U2OlmDoJAu41UITnmyvAYmSfJZ
	c120oNEcZM4g214UYB+9emWFgQuRhX14rb5I1S5f7nT8jhzMzlLDzQdceH5Eva0IVYbXS3TdW8f
	v7X4rRdzAR8FzHsf3AccRKxFueKyq2vGtxLrD1kKnM10XT6rVnuKC7YL9c45vaWnB0Fqphmu4xY
	IVnUXoaUX2X9YpyRmVHFQ9VNTzvVu6isEHeFDzmBU6fdbsS0wYSnNX3/Ozr7h1UrJo4Ldlx9337
	ajaB7MsuTnQ+Uo1c7MO1LOiHsQzbHhwMy6chrdX+/k/s1udWMjALarYEKEKfmzphsgfONfoaXO5
	FkV0UnTLWAyij3VGcOD91tqyvbonxrg+D6gcD+aFLxVU2cPqS+VOX1HtnZWg2c6iLsAYphi8xMk
	zafgFxwWFiZp04NhrKRggmkSvb7dU88B2zrg78aSIQTV80KzpUfzvlUnzjfpkTe3HD6Dh7nO/Jg
	KNwEWQ/V+PQSPhYulnzaofyGCjKO0rmxcAEe/iWWy4iMdjov2kepZP9fPysu7uhV9AHrDkq+j2A
	mBJbAUhuT86BylwujDjfepYB1Bc5nHaVYXcdumVqjD7Iu4XN7xxAVK5jXcYc
X-Received: by 2002:a05:6820:60b:b0:6b7:46fa:1693 with SMTP id 006d021491bc7-7170f2e8271mr15281eaf.40.1794082416544;
        Sat, 07 Nov 2026 12:13:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:39 -0700
Subject: [PATCH 42/58] mtd: rawnand: au1550nd: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-42-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_201341_823761_405A9BE4 
X-CRM114-Status: GOOD (  16.90  )
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

Drain NAND access before unmapping the chip-select window, and retain
the chip and controller until the final MTD reference is released. Check
MTD registration errors so unsuccessful publication releases the same
ownership.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index f1e99197ab84..bd78bcc84282 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -251,6 +251,11 @@ static const struct nand_controller_ops au1550nd_ops = {
 	.attach_chip = au1550nd_attach_chip,
 };
 
+static void au1550nd_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct au1550nd_ctx, controller));
+}
+
 static int au1550nd_probe(struct platform_device *pdev)
 {
 	struct au1550nd_platdata *pd;
@@ -269,6 +274,9 @@ static int au1550nd_probe(struct platform_device *pdev)
 	ctx = kzalloc_obj(*ctx);
 	if (!ctx)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &ctx->controller, au1550nd_release);
+	if (ret)
+		return ret;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -302,7 +310,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 	}
 	ctx->cs = cs;
 
-	nand_controller_init(&ctx->controller);
 	ctx->controller.ops = &au1550nd_ops;
 	this->controller = &ctx->controller;
 
@@ -322,7 +329,17 @@ static int au1550nd_probe(struct platform_device *pdev)
 		goto out3;
 	}
 
-	mtd_device_register(mtd, pd->parts, pd->num_parts);
+	ret = nand_set_release(this, NULL);
+	if (ret) {
+		nand_cleanup(this);
+		goto out3;
+	}
+	ret = mtd_device_register(mtd, pd->parts, pd->num_parts);
+	if (ret) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto out3;
+	}
 
 	platform_set_drvdata(pdev, ctx);
 
@@ -333,7 +350,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 out2:
 	release_mem_region(r->start, resource_size(r));
 out1:
-	kfree(ctx);
 	return ret;
 }
 
@@ -346,10 +362,10 @@ static void au1550nd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	iounmap(ctx->base);
 	release_mem_region(r->start, 0x1000);
-	kfree(ctx);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver au1550nd_driver = {

-- 
2.53.0


