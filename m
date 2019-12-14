Return-Path: <SRS0=Zwng=2E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63886C43603
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Dec 2019 17:57:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34A8520724
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Dec 2019 17:57:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sg3WdlnJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ak3fvDEQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34A8520724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kEvDK1sHuObfqg7Z7fvEaaZtt7REZvbzXds5X2SEGh8=; b=sg3WdlnJ27O6mdBphmnEMtpOyb
	bsxjlHKKzkPR8uyLgwA22U52R9q1dD5OGuzDJnZKcOZ6Ppp2+TwcJB59a1w9qMRdUujFCLdkadxj3
	d3w8M57FDyefXb58nAgwCvE0GsIdoxCmcldVcCvX2zaiRSpT8AiFLYXz4qDDLJWbZSTNrf4mDamxq
	Qdk1vd4FEpJJK6mwIkqiwKrI1IhlVl+EJpa4nj0/i8kz5uSvad2U7tfGQ2iG+VG+opgS87BSW5S1t
	S4FxOaGZEeG58vCYO8SuCge3BCHJ/DqaRepWvdzbjOPCAOhhKPwTlrv3ZBqGHUk+YzHDKlZnKMKXU
	o4fnK+Zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igBf4-0006Qg-Nl; Sat, 14 Dec 2019 17:57:02 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igBd5-0003SA-SG; Sat, 14 Dec 2019 17:55:01 +0000
Received: by mail-pl1-x643.google.com with SMTP id c13so2632415pls.0;
 Sat, 14 Dec 2019 09:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cR390BUd1z2kCitxpdbSxliSXAqeOVtm3C9sL9OzjjQ=;
 b=ak3fvDEQ4v6f6WR6iuVyCDGGuOXR5kV7UcWmahh2teo8P+j98Rkfhsic/vSt4LF2S0
 dG816usghYdayQyFi+h73xQK7mV3WEin9ewgy+4obyVj2YJLKxIBJTgWNVo1ReynM9f2
 dGPbh5KaUL27AYtbMhomIj9EpwiJPMiJrFqZGaR8U8Y1Hr81RmU50AXBc5AYTUAAcu+X
 h34m0JUpuOCbta0deTOnbL3CduxIdcdVoOTeaS4rX/cXd1+cHBmGKmJAfRZMkgReE+eh
 ib0Fwx6P7vvwuE0bkNdrKd7uZCbDlbvAJgyao18OQue/ZJTBhgdtEsEcKmDZssmDkZmE
 2MGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cR390BUd1z2kCitxpdbSxliSXAqeOVtm3C9sL9OzjjQ=;
 b=dxdJ5efI6rBAa1us/sBE8bvETkzgnvMlwGgPxMhG8IzcWS42EP+1ibALeg74GC/rPQ
 biiWhng03YkR9HT5yR2QXFDMer9ev8BRmZDpDPFfYpmR1wBIFamM54Yy4dqlMm0l4+Gc
 3TtsBL1H7eL5X3BE3T4678SZ056pDSvbgAT5Q3UwkD8R1Y606Ka5M/mJupZyfdURZGWZ
 TNs7MSawMbUZxbA/qpmwY57Ch+hLhVyMpYktLqFTGe0BPXPqxEbbGPg8cHp4GERfA5US
 G69bCRsKW2NoWEV451Hw46i5HATTq+iPEofFgpY3J/kQBl+m/zd1g/noP79PydZqri0q
 Vhug==
X-Gm-Message-State: APjAAAWjw6OMbmut5ZjTS0qFhb/kGp2DMhA4onGPRGOVn2ZPjZxhTPxZ
 QloXlOcpjtLUt7e1s6wTVbE=
X-Google-Smtp-Source: APXvYqwoSFUXO6LtjfdNMc8g3OGbieZm7pvHioNceUic/z+nzmqFIdRcPY5BJ/C1CRPZ5uLd99i6yw==
X-Received: by 2002:a17:902:6b49:: with SMTP id
 g9mr6338781plt.156.1576346099003; 
 Sat, 14 Dec 2019 09:54:59 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id k23sm15535481pgg.7.2019.12.14.09.54.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Dec 2019 09:54:58 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
 john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
 mripard@kernel.org, wens@csie.org, ssantosh@kernel.org, jun.nie@linaro.org,
 shawnguo@kernel.org
Subject: [PATCH 03/10] soc: amlogic: convert to devm_platform_ioremap_resource
Date: Sat, 14 Dec 2019 17:54:40 +0000
Message-Id: <20191214175447.25482-3-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191214175447.25482-1-tiny.windzz@gmail.com>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191214_095459_930798_5DA0FD53 
X-CRM114-Status: UNSURE (   9.53  )
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
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/amlogic/meson-canvas.c      | 4 +---
 drivers/soc/amlogic/meson-clk-measure.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/amlogic/meson-canvas.c b/drivers/soc/amlogic/meson-canvas.c
index c655f5f92b12..561044063319 100644
--- a/drivers/soc/amlogic/meson-canvas.c
+++ b/drivers/soc/amlogic/meson-canvas.c
@@ -166,7 +166,6 @@ EXPORT_SYMBOL_GPL(meson_canvas_free);
 
 static int meson_canvas_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct meson_canvas *canvas;
 	struct device *dev = &pdev->dev;
 
@@ -174,8 +173,7 @@ static int meson_canvas_probe(struct platform_device *pdev)
 	if (!canvas)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	canvas->reg_base = devm_ioremap_resource(dev, res);
+	canvas->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(canvas->reg_base))
 		return PTR_ERR(canvas->reg_base);
 
diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 0fa47d77577d..173baa53fce3 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -605,7 +605,6 @@ static int meson_msr_probe(struct platform_device *pdev)
 {
 	const struct meson_msr_id *match_data;
 	struct meson_msr *priv;
-	struct resource *res;
 	struct dentry *root, *clks;
 	void __iomem *base;
 	int i;
@@ -623,8 +622,7 @@ static int meson_msr_probe(struct platform_device *pdev)
 
 	memcpy(priv->msr_table, match_data, sizeof(priv->msr_table));
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		dev_err(&pdev->dev, "io resource mapping failed\n");
 		return PTR_ERR(base);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
