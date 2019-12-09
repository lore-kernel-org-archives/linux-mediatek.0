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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABBFC2D0C4
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:58:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAB08208C3
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:58:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DceqxH8N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmA+olZe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAB08208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7GMn/4BwYQHMdYpBSyEm8LX+Fk7nZwyFlwAgOV7SGj8=; b=DceqxH8NQ6L6/+B5zSLZDo+Ylj
	iLFMMJKDX/R6I4i4fxXPWijyhwND8N8s/aRu1QaMtY7G7ilItmPW+Kf5G7D0iOvgE4yqLGgNm1Gs/
	EIK77GVmlqs14D2e/GjYxL1YcO7zdElC+U+yoSBbgmK4336n59rVvx7Cc6bfhzl6ixLCyq0/2nOxn
	9CmtQgCeHTpGQ99J86OMoDgR4b3YWrHOY7tlA34qsY8kTK5xWe0u192FcqbhzxMIpe1j7vOrEqnRG
	HD2k0juvzlGpfZitl6A0hKAjZG0cLSsmA67nP6JVbGa/7Y9yRBXqqEsgRuAVhG7PvS7si1egPwerJ
	qR69GHog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iePBL-0002c1-3i; Mon, 09 Dec 2019 19:58:59 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iePAi-0001l7-3D; Mon, 09 Dec 2019 19:58:21 +0000
Received: by mail-pf1-x444.google.com with SMTP id 2so7740938pfg.12;
 Mon, 09 Dec 2019 11:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SbJEFogy5XAFY4TYFLgBXitNAQgdKkyYMT58Qy+43jg=;
 b=XmA+olZeCpYR11cQzmQbfmvSmN+IsE5uP9rv7i1vzOAVv6sHuoqZB4DbaFo+TnEN6P
 ahp2GcHUxJXqGF/tK5PkLADRoVeuhewH39dnTizx+bjFZkJQIJ67B2i6c7LAASdyiY8J
 t7d/5vEb3E2E7isAub58n5W8bkd0MtGCPnMnAp2uhldQbbB6navMyR1iHAgrjKUZItA3
 fs610lOV5eUsTnczYIWv8AbQLoo1J3ll4yes4ACWDPLMSqNQwk5uWiBXaONxm30aUAqt
 RpL9Dyp77o5wk4KUD09lSJCO3D2Opi0JJKC4YZCnDQX70pNmIZT1hyA/NdV2kQuGmQX2
 sjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SbJEFogy5XAFY4TYFLgBXitNAQgdKkyYMT58Qy+43jg=;
 b=gPxDVV7wfzMSTvGPQsCvNg9NDzdqhuev0g4t4kMdARxyl4qnfukjzCbnsis2P5HY4c
 ttj7MLJ9EFFCDyAQaGFbAEeMF7mJ6/C/JzL6QBJg+XzdCoON+31A9o4HVCaILrchcLD4
 qm7Xz2yfh6h7he0KdoTTSLLq75oFLUI2pgXtcXUWKqeXFQV9Oz1c8PbxXUrilgyId3dY
 OdPVFJ8UzOnhMS2h+twZIlZdotNqJGZDpMyxANsXgwZJA88cCFER+qiA+yjVRzlM9ltf
 7khObhFJYAZnYSbp6OSevUPMX3hU3O7FohqSP8tEv/thAM0RBIGdIY+mxi56ySERHcUR
 82ew==
X-Gm-Message-State: APjAAAUbLUdxUVd1vVU0noOuCnFQ03p45n2OETb7wG5KXpc4MNOLDUDz
 dPscN+PCTfwsGaS/eDmDtm8=
X-Google-Smtp-Source: APXvYqztL0uynR1jfq6nvIVhCUpiCpIkwcvVJW0DmeVnGKgqbUuTQpHioHk3H4rrikSuYpAy2AXhKg==
X-Received: by 2002:a63:4503:: with SMTP id s3mr20541879pga.311.1575921498910; 
 Mon, 09 Dec 2019 11:58:18 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id f18sm289935pfk.124.2019.12.09.11.58.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 11:58:18 -0800 (PST)
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
Subject: [PATCH 11/17] clk: milbeaut: convert to devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:43 +0000
Message-Id: <20191209195749.868-11-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_115820_209537_319821A6 
X-CRM114-Status: UNSURE (   9.75  )
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
 drivers/clk/clk-milbeaut.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-milbeaut.c b/drivers/clk/clk-milbeaut.c
index 80b9d78493bc..05f09fbfb80a 100644
--- a/drivers/clk/clk-milbeaut.c
+++ b/drivers/clk/clk-milbeaut.c
@@ -560,14 +560,12 @@ static void m10v_reg_mux_pre(const struct m10v_clk_mux_factors *factors,
 static int m10v_clk_probe(struct platform_device *pdev)
 {
 	int id;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	void __iomem *base;
 	const char *parent_name;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
