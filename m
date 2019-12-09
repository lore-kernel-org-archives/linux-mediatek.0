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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9332FC04E30
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:59:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64C612080D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:59:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LZNlD5yQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCfDbZXm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64C612080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1M43XQep0zFib8vNEUHEjLvWEOw/v+FrxN1DKHeK4J8=; b=LZNlD5yQvqy3nzoJwhtG8XuF+6
	/H1ijWnVdxDUKgwmlc3d8ECezR5b18G+8U0JWUppG3Q6GIcxhRjqSMeVk7yo/libBeuBHNiDjn0WU
	+AIlGyXHlLQWR0MSl+5oW5jwWE8h7qXp5eoUPJPabyWdIaTqxvDqZN7JtmVgYhMJRZ2nyCuMQDCmK
	81Q/fU7FCqRqj7qD08hstDWmtdOpzGdPa4qrBePzswBNOKMlKHIH9I/hR0NKemKE9eFZLaosmlzNF
	DV1l37updqNIXUTm/yaad4IaALwwjqRzbooZ2Lr/qNtNjveGBu/aCVSgAhNybzsitqBi1QiYTeXPu
	8fhS6RlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iePBU-0002ss-BN; Mon, 09 Dec 2019 19:59:08 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iePAl-0001pd-IA; Mon, 09 Dec 2019 19:58:25 +0000
Received: by mail-pl1-x642.google.com with SMTP id k20so6219734pll.13;
 Mon, 09 Dec 2019 11:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZyE91jsZAP5JpR1vW4Julj8lDuf0La64PECRRoFBxZo=;
 b=CCfDbZXmu13SPymCWITnSTOML5WPbRVrTGApg5UmfCZHcEOPETnSQVCveR7/W+o2a+
 qor7hZSTQQfKDL5by514ripTgEWP+meMNrMmWqzP3x4a1QCzu3EgAzlp7Swb8ku2Q5+Z
 p1oUekJQCKB5DyCWusZL5/bPYoCwXe6bBmftn1xyOqu+teC0ds7dqG4oGrAcCam8PYHW
 hoY01PI6z9XPnOdWjg7dC7pGm2h6/d/kLhS4ADtwI0ORNpYzQnkLeVLrbNrB+McL5VF6
 QR8+XurF8EvCE6davNfcy+LEmjNUkvmXB3DzElXAKXWk6azefe7qPAWGnQG+mo5gtk3A
 uMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZyE91jsZAP5JpR1vW4Julj8lDuf0La64PECRRoFBxZo=;
 b=ol915Fn7n3AdCuwi33mSow2zDJ4072oHaJoMyL4mMEFDS5M/ns3JiOWEmF9VJVHBcb
 ZQM2zoJ1DO0KP+ETjTyvNaVMtXR7gxyBGNLbX3EL/qSI3guIwacGd0sxS7q7UyAWzgbh
 oHfs72Mj2qHolgIx0TS1DLu5MRbrdNbDWMzqTZFFRq3HJLZ5OrZtv97eN8EjSx+0894k
 mkwpXtgaHrZ7721k+1oGe58M4FZPlNHJknJvG0WE+2DIVy08trENvGXcxr8x7brq4bSH
 DD4qZsM9yKDwTbiLLa5XTcXIKvdVSdE8TJFdSsz1jhiGFwjkspd/Fw8zmNtu8QkjJ8nS
 iLJQ==
X-Gm-Message-State: APjAAAVc2LdMd8PeJxVk/EJXv5zInoPR3YDTvVGFvDJMyUfUesLkWtmO
 smZXhGNbGsi9v8R+PsDPp5g=
X-Google-Smtp-Source: APXvYqzVde8W7TVt0r7e2n3/0zTHRFhCsTrszUtbv0mgbzWPoD9QO1rfKS+Ar6eiXvKpF0LKb2LT5w==
X-Received: by 2002:a17:90a:634a:: with SMTP id v10mr923372pjs.4.1575921502812; 
 Mon, 09 Dec 2019 11:58:22 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id h16sm292614pfn.85.2019.12.09.11.58.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 11:58:22 -0800 (PST)
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
Subject: [PATCH 13/17] clk: gemini: convert to devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:45 +0000
Message-Id: <20191209195749.868-13-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_115823_727110_C689563D 
X-CRM114-Status: GOOD (  10.26  )
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
 drivers/clk/clk-gemini.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-gemini.c b/drivers/clk/clk-gemini.c
index b51069e794ff..0184ff9bd206 100644
--- a/drivers/clk/clk-gemini.c
+++ b/drivers/clk/clk-gemini.c
@@ -276,7 +276,6 @@ static int gemini_clk_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	unsigned int mult, div;
-	struct resource *res;
 	u32 val;
 	int ret;
 	int i;
@@ -286,8 +285,7 @@ static int gemini_clk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* Remap the system controller for the exclusive register */
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
