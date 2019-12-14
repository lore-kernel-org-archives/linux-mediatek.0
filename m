Return-Path: <SRS0=Zwng=2E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A509C00454
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Dec 2019 17:58:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48C3D20724
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Dec 2019 17:58:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pvntLdUe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwbTlKjU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48C3D20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+7AvPo8JKw+zZ8187XBhSD/J8vEYh9E9m/+r8MVztVk=; b=pvntLdUeV9RjoGVo34n4J9qvOy
	QqQZTznYmna3ibPKmcPUX+534E+jG5bPYa6jfPEXQnNPydyHnLMaKl0hfBow9WNmNQ6E5+Ghuc7QG
	qF2ddyQRo3TdZEErTiC1XK3/XXTxt5yvbC1Pjx2OnS+jWPepoYWOYO8z22zPucACinyFY7KCxgrMB
	4kQtfNOr/yNDAXfrGDNCDNt3VOLOBjiqjrmn8KZSCszdy/zMrPrVIZYfKjO5GXCUWpEKUvhilz0Kv
	9WrR4A2BJzRRfEagotW+uQKLmJn5wgUV5nyfY4L0LDLDUWIKUP3Ywlkja5FJDQEpZOcozFmYSBMqz
	7epwpwTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igBg0-0007Hv-7L; Sat, 14 Dec 2019 17:58:00 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igBdL-0004p9-Kf; Sat, 14 Dec 2019 17:55:17 +0000
Received: by mail-pl1-x643.google.com with SMTP id z3so1090724plk.6;
 Sat, 14 Dec 2019 09:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p464edzUa2iPp9uHgJjpc0nSudXprxPgj9c87WZ/a/8=;
 b=jwbTlKjUlgdBEVsfFGJ0AFRM27IrT+5/nGVpeqjmCQY8Pvog9nLbJEGs3BoJShCWcc
 HUCs/NcUJEbspXufkbpSOSgpcLjHI9uSC2uL8deL98KCPLdAycltVaMbDTSY7BfErs2r
 3jb+3au9m3HLLvo5IanTkhro0u+uMh+7QnL1Kmvn6n0zxgK8PqWxjbHB9UOlTP9lJERQ
 fRA0q2rQ0Mg0I4cJZ6oR/WvAPyLLemDcLzfJOfJwdMDJDyZj6sbgdurkJ9mbvF3rvF94
 qtAuTF6Xj2R2j2anoXaTjjEStkzmzXjXeUm9O3eCz5K6gXyVi95VvTd8QtE1eKhmZ/RZ
 FutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p464edzUa2iPp9uHgJjpc0nSudXprxPgj9c87WZ/a/8=;
 b=QkA9ulfNGFdcNSgMWEVXsFBJjHAUpev6D5ztoLksthkorOGb1R+y6Oj3oZcjZKJij6
 GyZfIZU9/P8ov4LwLWaVF319X7dOTKIt6/HD8grClMXLeVU/ZNFuhReG1Y8mFuMmDavU
 YdTTTCzlznvVzNa7SE38ckPVsGqVV0szwQ/zUk747WP0QC1zPPzaxT33I3WqDKjko7bw
 diBhpdzdBNQ+JvTn+mdHj+vofHkyHBwfc8ZbHYGdDBsuRd2ZXCCQqyvn2Xk3zQF7DgBR
 fhYo+iBNuffCimzrFBkgX2EVeLR6WPvX9TJanGIxKaE8mT8acE5RVjs/wW3x2MYYou67
 wN7Q==
X-Gm-Message-State: APjAAAXTTpyiwdaRnrpO5UQ3qycLmB5NjT6gI/UrgGbVJotdWaBFLtFt
 TvtsUBEvZMO+tUZ5uHW2bF8=
X-Google-Smtp-Source: APXvYqxG8GAI4f/vKneCzHJdyU3sDnTOcUKGttUJVG0Uipa0HZQ6CtNPSXlPYC7sJOX/nTAUj+QlEA==
X-Received: by 2002:a17:90a:374b:: with SMTP id
 u69mr6820565pjb.23.1576346114545; 
 Sat, 14 Dec 2019 09:55:14 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id z23sm14868517pgj.43.2019.12.14.09.55.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Dec 2019 09:55:13 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
 john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
 mripard@kernel.org, wens@csie.org, ssantosh@kernel.org, jun.nie@linaro.org,
 shawnguo@kernel.org
Subject: [PATCH 08/10] soc: lantiq: convert to devm_platform_ioremap_resource
Date: Sat, 14 Dec 2019 17:54:45 +0000
Message-Id: <20191214175447.25482-8-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191214175447.25482-1-tiny.windzz@gmail.com>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191214_095515_698519_7D334AB8 
X-CRM114-Status: UNSURE (   9.58  )
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
 drivers/soc/lantiq/fpi-bus.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/lantiq/fpi-bus.c b/drivers/soc/lantiq/fpi-bus.c
index cb0303a0fe60..dff1375851cf 100644
--- a/drivers/soc/lantiq/fpi-bus.c
+++ b/drivers/soc/lantiq/fpi-bus.c
@@ -28,14 +28,12 @@ static int ltq_fpi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct resource *res_xbar;
 	struct regmap *rcu_regmap;
 	void __iomem *xbar_membase;
 	u32 rcu_ahb_endianness_reg_offset;
 	int ret;
 
-	res_xbar = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	xbar_membase = devm_ioremap_resource(dev, res_xbar);
+	xbar_membase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(xbar_membase))
 		return PTR_ERR(xbar_membase);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
