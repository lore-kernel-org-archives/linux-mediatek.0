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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DF7C04E30
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:59:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93806207FF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:59:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="noq84mUr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mwbxp0cz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93806207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Y2vKDLb0SMGW/9APWLQKNrj09mAGwQ3p+weeF5Z6uNw=; b=noq84mUrLhfO4vUv5/NnmuP9oL
	v27Oi/ycxvLnlXKZOvNcJaXdkM8DOLRset5FRUAwPhmqcQ8ltMCN/VBMJuh/cHWzTIK0bJvB/u+hR
	6vOQWiPHPhX1Zwt90NdCjK1Ndtzy1Snhf3CQl/Y6SfqT5ZDtAwhfpGyNckJYiZvDJsPGGTnWUwIbw
	4PFdtdhVV5E9+ZpWv5ydsDgIlfzHHAEyo8Oh2H3c3Pt/u6772ZCOHb3QzAHGuoxKqaOo5l1P49QKa
	fCUgEYQHMFHHBaqoNs4QxuzQNrw6QzUUaMYgl48Nuqr+WpgVao6jm1GaJKO9K716h8DOE1Sy533ss
	TqMFR6eA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iePBb-00036h-Tu; Mon, 09 Dec 2019 19:59:15 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iePAr-0001wG-13; Mon, 09 Dec 2019 19:58:30 +0000
Received: by mail-pj1-x1044.google.com with SMTP id z21so6316354pjq.13;
 Mon, 09 Dec 2019 11:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UAdSgK+fA9O9lrhwBZTqgcNqv06lLo3k3bNN7t0UXYE=;
 b=Mwbxp0czb6jYm+pO8RpQXolWKF3fYchQpf977sKp3QQe0/1Xoll3kTO0oeuKkJMEQM
 9luwwdLQdELK86X2RgmMzwDI3ftyzzFTMAnoZLUzxtOMgBq0i+78V6/Tmj6xkhHDOuLB
 gaxDsmEPNX0tLNVGXjCUXdAdcj7yqzFHFSGKIpsw/bulIANe5HNzHJCPluplGWA/kl4Y
 A2FjJ8cpS0CkZzDyGKTaPgKok111l8khZ5BfREE/kyK1a+/ahan3g8fcWi6dVlyPYjaF
 P10gSquZqtb+CxoTfgmaoF8/4ELsnC6MxZ16heLocA/JMCQysQxIi0fgrCn7UKsFOXvM
 smfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UAdSgK+fA9O9lrhwBZTqgcNqv06lLo3k3bNN7t0UXYE=;
 b=lxx8GN7vv4KYpSzCG1cOwQbX96ZKgqi1j5+f68kQHRr6irAooTHjWegIuoCuUUn9cx
 EQ09UQoo/bXyekFrOe60eUPsa7A0pUrWk0XBgzOyl8VGYKT5oi9WOUeEDQ+3fjpC1xnT
 5hL7Lxhg9xaGLugPG9H6RZGa71My2h+CAXAPWZT2xRsi+xYUGdLk7TXwxWrexhIR5cJd
 dCPuI9airXqX0NwQPIlEYtuNWi9uxL8Y7n17m2L8BAWNQyTFm2mAgPmHX1JzAZetW1fd
 TGHPK0hzJxWBkRx/301E26jabeQq5hstFj0PP/yHT1LxiXK/6OCTEdDGi8EbPMwnNKPy
 FBnw==
X-Gm-Message-State: APjAAAWSd5UecdwWF7eJhLgBpzwR7orti93JujakEuoFNBcc66Gkcw8C
 CbiOVraBZ9iO4hsxHYPETu9qSdL3esZftBrx
X-Google-Smtp-Source: APXvYqyseXSQX0ezUzN6Yi60A6N87H983r9c3N5Vir6VF3q9LGo5GM8Zzd8pYnVRLd5PmOxkjr62+w==
X-Received: by 2002:a17:902:b609:: with SMTP id
 b9mr30695044pls.70.1575921508180; 
 Mon, 09 Dec 2019 11:58:28 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id r20sm358961pgu.89.2019.12.09.11.58.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 11:58:27 -0800 (PST)
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
Subject: [PATCH 16/17] clk: actions: convert to devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:48 +0000
Message-Id: <20191209195749.868-16-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_115829_191106_0F3722AE 
X-CRM114-Status: UNSURE (   9.10  )
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
 drivers/clk/actions/owl-common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/actions/owl-common.c b/drivers/clk/actions/owl-common.c
index 4de97cc7cb54..9e98e8a92ad7 100644
--- a/drivers/clk/actions/owl-common.c
+++ b/drivers/clk/actions/owl-common.c
@@ -43,10 +43,8 @@ int owl_clk_regmap_init(struct platform_device *pdev,
 {
 	void __iomem *base;
 	struct regmap *regmap;
-	struct resource *res;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
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
