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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912B9C00454
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:59:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62768207FF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:59:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iLJ84DZc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APM6Ox4I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62768207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PM+U/ujCIHguHk7mxnrOQ0migFLyZXO0SKGA9F0W79o=; b=iLJ84DZc7It2yR5pEWgnAJo4jN
	9iPKZhVZEEfuoAIDbu2FMkbx9eYGEeRtxSaX2WKqLaAOA6oANZvUY7CV/FjC6+q2nodLmy3Zg8ZMs
	taWIGe4gqRXn90bDT2LF8bZodbdlA30/bcBSc8cTR3GSYGCJp14weBDWfwHe1HYot4ZzXGI3/eBob
	insWAWs3KaUZl/mH4z5a31pptmJBTAk6Av0LAw94ECAirVP8AyoiPmn9Kr9Ip2ZbB1+bCzc8Q0xFL
	AAj8d98ehOvW/oyoCmgwrUjCpNVnGBWebop8v4HQo+xc9Sd0ph2tSWzEXKZxZeJIccqKJh+mEOk7H
	364qW0wA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iePBX-0002yb-MU; Mon, 09 Dec 2019 19:59:11 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iePAn-0001rq-2u; Mon, 09 Dec 2019 19:58:26 +0000
Received: by mail-pl1-x644.google.com with SMTP id w7so6224548plz.12;
 Mon, 09 Dec 2019 11:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tZCUtzM2Kgd4l9GdZkI7BIJ7+D7+CtwfE4AQUqmqqC0=;
 b=APM6Ox4InSxhkeN7AP2rcFRdPKREu2KgwWxmbm4pxCyU3T2SXfh+CeUHCwvInIb6K3
 nO2kVyT2fGTOIQ583eegwqZluOgT399PuFKptVy7OVq14wKXwDnG1SSfd9lYmO38iF5W
 6rse9F3y7i5qWvjctfUoBvfTlrDq7kfF17HwrAymgXDQmknoJyNHbYiRAKNFDg6nqws2
 pFxgXEZ7pI1gjVqeg2l4kpILrdO02ISFHaD6LU3CTduBvQVWbsTsd3teX2b44S8lXQK3
 gSkjnu9wyEsFp7pKBZE9i3Dh6gt7I/iQHv0egAODcfbYZz0Gh9RerAZBV6JmI5AzKbu2
 s/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tZCUtzM2Kgd4l9GdZkI7BIJ7+D7+CtwfE4AQUqmqqC0=;
 b=Hiy4jqP5r1YgUISSx4zPNL2DEEmQte/+sYvBJRfRopAI0pEhXuZQNp3U2qN5ah8tnP
 kDg/6RCXx1YZOvo3f2qng1KTng5aXCGQkUb0/fWvubhG6+DOvv5ISuz80s8GHRk3Pbx7
 z6F26ExfOiubGcqvJN2NCvVMYZfX88+t6mFpQPu6lyz7CDM+AcO4vjfts3vfB52q+kFN
 kiEwcgPu+Z7RED+UcsUv7Tb2Tfa87XJyel39lF/BtAN8tqScECD+iJW1a+dJOmCAF4Lo
 SVSfjF/bOiqCWsaqZ3fQiJzsb9TDUIY8nNTbio/1+CGDqZGYog2knBYiylTbwFhXNPrO
 8FoA==
X-Gm-Message-State: APjAAAXO/dvd8pVZ7Ubl0wIA3kuxNFo88qXse2Kw0ZchKWfGLWBKIJwh
 piU6uspREqWUAbFCrB2goxk=
X-Google-Smtp-Source: APXvYqzuWE4XvNIl961SlGfMHFjXQnwxlLnSazYqYn06S6wZMDDdG11sZdEmHCrhUyFevRch1olcmA==
X-Received: by 2002:a17:902:9b86:: with SMTP id
 y6mr12047000plp.253.1575921504560; 
 Mon, 09 Dec 2019 11:58:24 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id r66sm305249pfc.74.2019.12.09.11.58.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 11:58:24 -0800 (PST)
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
Subject: [PATCH 14/17] clk: axm5516: convert to devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:46 +0000
Message-Id: <20191209195749.868-14-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_115825_252543_D6276D7D 
X-CRM114-Status: UNSURE (   9.45  )
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
 drivers/clk/clk-axm5516.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-axm5516.c b/drivers/clk/clk-axm5516.c
index 07e80fe8c310..3ab02b62b645 100644
--- a/drivers/clk/clk-axm5516.c
+++ b/drivers/clk/clk-axm5516.c
@@ -541,14 +541,12 @@ MODULE_DEVICE_TABLE(of, axmclk_match_table);
 static int axmclk_probe(struct platform_device *pdev)
 {
 	void __iomem *base;
-	struct resource *res;
 	int i, ret;
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
 	size_t num_clks;
 
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
