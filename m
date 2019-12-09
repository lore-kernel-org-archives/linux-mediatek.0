Return-Path: <SRS0=SGDP=Z7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EE0C2D0C5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:58:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFC22222C4
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:58:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hTLG/QAo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaNk4gU+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFC22222C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UYo0EAPUeBpd0Z8oWX7Qh6VlYrozSPdeM/h3Drf4bps=; b=hTLG/QAoCrUXao+OMZRJupVM/A
	1RsUPl+xOkHVncsGPBrQojzL07d4qmYzq1OY5qUWd+/XCWJ2lCHnzL8tfhrjy32l98GionRcQC+mW
	o0WgDz4ZUIpZfFNs5Yi7o0BwwdlK4Sw3/ICC4h0tbZHEPXWIaR881XQ8iMx6y0u5Nr4zXT9b5BhYg
	8DZIAIE7qFqr1vOGVCxbuPuCG3N1yr2QPnjBMwpz4cXptFjFXUCGo9qG91ouuhvnIjzRJVFBj1IVz
	3tLVOLglSstPGt3ymZs7GTkln2M/WFdNCJ6fWP3bedw304SEI+ypWuK2n4I46F4VhNvEijsrGAJBQ
	eLrwpEMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iePBF-0002TI-45; Mon, 09 Dec 2019 19:58:53 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iePAf-0001iL-KW; Mon, 09 Dec 2019 19:58:19 +0000
Received: by mail-pf1-x441.google.com with SMTP id d199so7757510pfd.11;
 Mon, 09 Dec 2019 11:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ps/yL6sIyA/HzDEFUdGrtX3BgHMKWprdRozhFXs72OQ=;
 b=TaNk4gU+Qf1rcbmjZAkQiW3/WHyVFXCi7zmDAdiZtdKbXURE12spMk6pgcjhAfd3Ro
 i0JM6AXHmKs4EjDYYp6GM5QNgAPGiJVGrzJNPp8G1ld+NZoMTP605aHNwFlMgRKgiL4w
 E6jWfIqvgrnzKW0hAr+vOBCG54aHqgBXe1H2UZhmiXkv4o0fK52AjpbkcvfVX789pO0r
 kTro2cUcvpnZmtEYPliBihUPzgqPCLYFyKLfeOBXrfVZFsBL0duPZDkOscsczOq48pKL
 Q1zNZ2uC/1chXyMS5dboUhYoAs6WHs3Tj3Wk2yK5HYKQk6r2qFEMrq7/UC3aLlsbf12a
 5tCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ps/yL6sIyA/HzDEFUdGrtX3BgHMKWprdRozhFXs72OQ=;
 b=l4ciBqeaUsUQ2tSpSKrFqdKakm1hUPMN153iNYtJJaKb1Ke+gctqkWE5fSUJue/D+R
 mAEFoxa995Mfi2Xxw+PCuAZst0g7eiwQH7VQZFwqG4BN29MJObLgUBxBIjX4QNCqb5Ax
 irl9kiuvCX7HlvKrZMHdG8uRaeEm5sYJflGD7Ny5dB4smi6rxd8wQibSH68z7ETd5YCT
 6XzOkcFfnZou+fRqvJxESsJm7Vt2K+fMLUKZCgIdCGBaKGBq2lmIMl7n9miiIqXPMbYz
 JfNbk+B9bFkUIrD3Wn9LJpnvktlAlrcr/SS9bqj0fKPn3XmcekTSuEsJaSfX+ccy32dW
 j2QQ==
X-Gm-Message-State: APjAAAXTsmy8vnH1z6JVlZBSyoOC93YB5sbcd2cXMYELdnk4GAmLW69o
 tCM5qAKmwozQN8aATCAaOyY=
X-Google-Smtp-Source: APXvYqzfh0NCFt3LIk+KUA0hhxrykBenrX9LyOzFKnUPS1uqtGFUf/GaYK5SaID3cQhSSuXJEI4UIw==
X-Received: by 2002:a62:1c88:: with SMTP id
 c130mr31355900pfc.195.1575921497176; 
 Mon, 09 Dec 2019 11:58:17 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id z64sm307501pfz.23.2019.12.09.11.58.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 11:58:16 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: afaerber@suse.de, manivannan.sadhasivam@linaro.org,
 mturquette@baylibre.com, sboyd@kernel.org, Eugeniy.Paltsev@synopsys.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, agross@kernel.org,
 s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com,
 kgene@kernel.org, krzk@kernel.org, palmer@sifive.com,
 paul.walmsley@sifive.com, dinguyen@kernel.org, mripard@kernel.org,
 wens@csie.org, emilio@elopez.com.ar, pdeschrijver@nvidia.com,
 pgaikwad@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 matthias.bgg@gmail.com, rfontana@redhat.com, gregkh@linuxfoundation.org,
 t-kristo@ti.com, john@phrozen.org, tglx@linutronix.de, allison@lohutok.net,
 kstewart@linuxfoundation.org, swinslow@gmail.com, aisheng.dong@nxp.com,
 robh@kernel.org, daniel.baluta@nxp.com, weiyongjun1@huawei.com,
 wangyan.wang@mediatek.com, chunhui.dai@mediatek.com,
 miquel.raynal@bootlin.com, heiko@sntech.de, jcmvbkbc@gmail.com,
 nsekhar@ti.com, geert+renesas@glider.be
Subject: [PATCH 10/17] clk: axi-clkgen: convert to
 devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:42 +0000
Message-Id: <20191209195749.868-10-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_115817_722744_5E984FCB 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-samsung-soc@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/clk/clk-axi-clkgen.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
index 96f351785b41..8d0c32e81e78 100644
--- a/drivers/clk/clk-axi-clkgen.c
+++ b/drivers/clk/clk-axi-clkgen.c
@@ -412,7 +412,6 @@ static int axi_clkgen_probe(struct platform_device *pdev)
 	struct clk_init_data init;
 	const char *parent_names[2];
 	const char *clk_name;
-	struct resource *mem;
 	unsigned int i;
 	int ret;
 
@@ -427,8 +426,7 @@ static int axi_clkgen_probe(struct platform_device *pdev)
 	if (!axi_clkgen)
 		return -ENOMEM;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	axi_clkgen->base = devm_ioremap_resource(&pdev->dev, mem);
+	axi_clkgen->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(axi_clkgen->base))
 		return PTR_ERR(axi_clkgen->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
