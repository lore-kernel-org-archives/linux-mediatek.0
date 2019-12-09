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
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE4FC2D0BE
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:59:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6767D207FF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:59:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NTal+3Zv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVr8525x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6767D207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SKqAvJ7Uvds0rBJYmQ/kqD89KGuLQaeUFC24bJCQgc0=; b=NTal+3Zv8RHqpyzX8x6bYEo/MB
	ZlgAYbeJ3vsaC5pAsgtErlOVlx60sKk5i6DM2jelkqL89bx5xSU6/0az2NhsqBqyRLiDY+81Kvk4e
	GM9I7BNccy1UhiknJk/PVh3bwQkhSNI1KQ5j0Qh+GpEFiIydB9jZb3TrWnvYHrnVdKK5nvtb/GkTP
	TQ/hQnuU0fBINSevnBTQlwNpM/RhWHUQTd8NnKr6p1aM37BaBuY0SzS73hrlJ8nElqti8lT/Qvs2k
	V/9C354xHgGw5GdTjSO4Z15mTM90U7bKRLVa5BgTBhvjEunnn7VI9g89N9bH+SDM94vqVpkkSf5sv
	VLyDBJEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iePBQ-0002me-SH; Mon, 09 Dec 2019 19:59:04 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iePAj-0001mx-CR; Mon, 09 Dec 2019 19:58:22 +0000
Received: by mail-pj1-x1041.google.com with SMTP id l4so6336583pjt.5;
 Mon, 09 Dec 2019 11:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DWgsVIOY0rpTchqlnxprL9pMKe3eJBtHdih5dvZI1YU=;
 b=UVr8525x5PR1hCXi/zc6ClYrCBsS4xSdyLch11+WjRQOqJozOqeVeVVTG6Fa9LZrU2
 9KBra6bw+soHXLUDgepf5rziEirRM/1eanxbjgSrCsKhfH1HL6sD0I1OAgr1PXYpOnSV
 p88wyUs/6BZI8luz+1s13LeOqylfYMAiJhtviRBQOg9BH7w94Ab1GgeUmFDqUrfkURAj
 sNXUg7jhFcimeceKhDc6r/PFwqgMOkhKCfEKjUB5NdzfuzH28wTt56kgMT4njq/IBZqb
 XVh2xGpdmlY05wDhjWPOIgE3MKTspZQabX6QRYp62YM/MtYctDAvtyX9QxHohacsM8Lv
 pURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DWgsVIOY0rpTchqlnxprL9pMKe3eJBtHdih5dvZI1YU=;
 b=fy6bhhsQLWXwPB0LYZ5yQy+QmgNOz95FZj7B99kBP7igZpxoGfo7Ss65mFJqRaPhL8
 sGdHgCpCfjJdtEo93DE477kBUn7pU0/e3/aBdKVOrr/3ge7JGu7ENUA0xZpmhC7bv53t
 i/9yBIAm8H/OXq2rTiCWPlrO1i7csD9KzFRkd2Z8FTO/A82FbqYoQFla3ytdBYSD2DlT
 5rl1SrR2WOMcCtKklGmgLTTawWpcyljWRE7cu3EkGcUNKFTd43XHOKkgj3CCxqG0o40F
 WDhf6W4qazghKJFaNyyB0MHKlX3e1NrnR1vOEhTjCxOIuJpmbo62qMv1jXVt/s4FoUPg
 AHlw==
X-Gm-Message-State: APjAAAVNLqDgLH0xEj/FkCwu5mGEBAyIElMBwmGkRwxsKeMCEp++7rvW
 +7Oen2ZJW5iqwqkfAgw+L+w=
X-Google-Smtp-Source: APXvYqwKZyxJmpNNkafn9EdnP/h1LD/E4A0E7uVKQmtBTcyTdH/ma+S37ykzthLJxJAbBvrOHqREvw==
X-Received: by 2002:a17:90a:7bc3:: with SMTP id d3mr924437pjl.86.1575921500696; 
 Mon, 09 Dec 2019 11:58:20 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id u3sm365617pga.72.2019.12.09.11.58.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 11:58:20 -0800 (PST)
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
Subject: [PATCH 12/17] clk: socfpga: convert to devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:44 +0000
Message-Id: <20191209195749.868-12-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_115821_469871_19591A09 
X-CRM114-Status: UNSURE (   9.77  )
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
 drivers/clk/socfpga/clk-s10.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
index 993f3a73c71e..85055fc56404 100644
--- a/drivers/clk/socfpga/clk-s10.c
+++ b/drivers/clk/socfpga/clk-s10.c
@@ -276,11 +276,9 @@ static struct stratix10_clock_data *__socfpga_s10_clk_init(struct platform_devic
 	struct device *dev = &pdev->dev;
 	struct stratix10_clock_data *clk_data;
 	struct clk **clk_table;
-	struct resource *res;
 	void __iomem *base;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		pr_err("%s: failed to map clock registers\n", __func__);
 		return ERR_CAST(base);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
