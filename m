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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B724C00454
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:58:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A541214AF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:58:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uPD8MoBE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lo+syYau"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A541214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=e4/ndAhJBTxVLScy6dRwIcCHYNR3t9Qs3Zc4lSRsIZU=; b=uPD8MoBEAA5itoojTDsRO7ukaG
	vLOyNV/vhmhuQQVtLlqt+1ZfM0PM65/b6HHqJ61fgao90LlUkTzPooihDi9lQ4+c0kQ6qDsNOpSXS
	NIXaLmQ2+LNvFLvbmPKcZKYGtgW32p3kQIsdWli6a6CrIjKKzWK575QkVu5s3VqlhpT5srV6vspRf
	fbbLJtYl6bQPo2ZX4U1cPKrPPFilTJn/CxhJLx5AOr5HY6ZXOkj6K7EtWhL6ow794CDBvq73NwsBh
	tZGwoP1boWx4HKcfZ9y3Vun2Ht7N7Wcx/GYRiGvPnhYpG77r4DLhcchYKUU6FqDeh1xYXkOP6rsj7
	7Ahagpbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iePAn-0001s0-2q; Mon, 09 Dec 2019 19:58:25 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iePAW-0001Xr-0v; Mon, 09 Dec 2019 19:58:09 +0000
Received: by mail-pg1-x542.google.com with SMTP id s64so919219pgb.9;
 Mon, 09 Dec 2019 11:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZPPKMUNJFnDD1fLVF2b5xNbZ5vTIG/P+LXFYR9smJaU=;
 b=lo+syYauvnRwQdhFley8gcsKGmFUQ3vpu+XWF0DUCxOGSBbY4/ZuN/YdV51AZ9SRKR
 O+wvxpqy1rrLkIisPjItC043mU1e8IkC+BZjbqmwoBpA0Nd2IJLGqSrXjUzeXEkxuGLw
 jO6gAaWEJ+yy+HjVbD1BCDcfFiMwWu4l9pDCPuymcpOJKHLprW0OBB0f2XBusSH6KjGX
 HPDMUNAxiY68aT3OQvffKpsfJ3TPHq4J5KnYIk7sHGVrLLNPjUH8C447mawTDYyZc15V
 FKN1Y9hgKsXq2kX2BLw3bNCXmJADchGyB3sj7lPFlWWamuVdKb6E0qAGM8acESx0qt4B
 Bj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZPPKMUNJFnDD1fLVF2b5xNbZ5vTIG/P+LXFYR9smJaU=;
 b=g07iFi7fUBxk4qoj0im7+GDp6md7KBOvtPLjsNDV1kSmB0wxPTuhtWFp8Nq0zXEh8k
 1R0ymOvHhalXDs1gnVpgwJftZOZ7MJVD2Rq/k3ld8W8bgHs9xk2sDdhdX4gMd7h+WQa/
 vt373+nbC9rf0s0wOZNpVebzcZtC0FTy5KGCKZafZIjFt69GfiAagyfdjk5Xf3RaBLSx
 0Y5LDpeNzi3URCojg/ibNEOq6w4L8I+YvlvW4F8HkJtBOgUpi9O3PMnJjHhRTurX0G2e
 ehqBs1UKsn4bdAJXmfqDouDlgo3BH0cHM8+1xkN3c3AKNsjp2UuOObEqOkbIUcfeW+3y
 wacQ==
X-Gm-Message-State: APjAAAX/80uOCYQPwcAwclosaoyowdepgWw2n5I/b9Nur+WMKbWLLNuF
 wJW0EEEd3pRaJCOHiTW2FpM=
X-Google-Smtp-Source: APXvYqzVk8FZGIeKpbC0J5xuSpVLKietZZTCSKq+SBUzJ343WU+e8TIgncCtl7MNZ6LNoRCMyAJIQw==
X-Received: by 2002:a65:58c7:: with SMTP id e7mr19794009pgu.390.1575921486181; 
 Mon, 09 Dec 2019 11:58:06 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id a10sm364726pgm.81.2019.12.09.11.58.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 11:58:05 -0800 (PST)
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
Subject: [PATCH 04/17] clk: mediatek: convert to devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:36 +0000
Message-Id: <20191209195749.868-4-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_115808_101342_91A7D19C 
X-CRM114-Status: UNSURE (   9.43  )
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
 drivers/clk/mediatek/clk-mt2701.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
index 695be0f77427..a6aea6646118 100644
--- a/drivers/clk/mediatek/clk-mt2701.c
+++ b/drivers/clk/mediatek/clk-mt2701.c
@@ -668,9 +668,8 @@ static int mtk_topckgen_init(struct platform_device *pdev)
 	struct clk_onecell_data *clk_data;
 	void __iomem *base;
 	struct device_node *node = pdev->dev.of_node;
-	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
@@ -889,9 +888,8 @@ static int mtk_pericfg_init(struct platform_device *pdev)
 	void __iomem *base;
 	int r;
 	struct device_node *node = pdev->dev.of_node;
-	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
