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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4B9C43603
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Dec 2019 17:58:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0B4620724
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Dec 2019 17:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qd+f48Ng";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbiDXSDa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0B4620724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bd8bHlFEjlf29aOee9yRBf/yx7PxX0M09s02wFNX9Sw=; b=qd+f48NgcL2xCyh63rwT7MzHkG
	4GPU7ZwBEXKx/HRSb+KtCeAXrsSULhDmAcTFFXCD4mf2p2rpVD866k1wfYDi0PcoFp4ZuNW743tCP
	+510s+z6NEC8XbX8ZGlQULNVyGRNOGMzWA9tKhxHqP8McSH1d3n8PHJBZQ3oVAhDYh1rFIJoCtloi
	nGD/P3wr6UlwF+8ZO0wdPmVm+axq7t4YoH1vTOt5KhGnB7F3Y5OJ2bqy+oq9wR1SSUocc+2Sh2Y2d
	WIs4uHrp/oFopMyfK4NoXCwqXWUHNyWxyui1VXB2ioenuMqxwnS+yJ6rsp/yARvEfUI/OynT8BtPk
	EO8dYU2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igBgj-00080l-7k; Sat, 14 Dec 2019 17:58:45 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igBdP-0004wp-0F; Sat, 14 Dec 2019 17:55:22 +0000
Received: by mail-pl1-x642.google.com with SMTP id bd4so2614805plb.8;
 Sat, 14 Dec 2019 09:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=G5UK5DwBUduQN5XnwW7khvuWSh3A6ZcbhwTioDRukl8=;
 b=CbiDXSDajwRpx8W14h4Me/LqDY31+yHYAfRzx0gJjjZCKzYKeU/z+dRgbh8G0FB8Kz
 n23u0oKZqKSzIYv+ZL33ayO6Nm2GUXWzXYlOWey+vH7BxOSNg1x5YuD+KX3DbDKrOn6L
 s5pmk0dhSJQD63OQQyVOnnG5MA+j9dwufNQjp4qEDTK3V5YkQwYrGSY+U3Pc6GbbZRxC
 CajxwBSj4cWprH+2jMO3kzlI61ws7Qkomli0Aczwwl3k6qQ00RIGGRQNNK5T1/gCZVZt
 gSTJw7QQeLaRrJDTor/KB3Wx5TNqwOMf490slViV18ZldipGn352lX01mW6xS17FsVQG
 TjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=G5UK5DwBUduQN5XnwW7khvuWSh3A6ZcbhwTioDRukl8=;
 b=YLCZQpCWs/652+T+asJYgeECpAFRkkwjFRfG0wcgPiHXNPX0IGWyYLsP5KZclK/7Ey
 3BYKOCENEXEBoVJRwgUrMP02Zc6C41fL+cJFnCmt5kvMQ90NpPDbjkKAe/roeFo11Q8u
 rD3KVCh6P7tPAPkTIecURSDxlMP3ljSGhROEqN4kcvk6dlAlEP9kb9boDIGwUcyQjcjr
 ji/kjdo4RG7Gvj9xNpRQXdsU1ixFsTkR6M5fCsyPrCkB2vFQ0W9duBfqzuug/eWzMLi7
 8HhOGGcltKzqbMfiU1NT666fNwoli2wCncbbQuQNxqC2i44eJzzX4ZQUR4gYqtHcGBYu
 0lPw==
X-Gm-Message-State: APjAAAVnmXT+Pm5oQphCpMFm6tUf2+QT0U2gd7pubUwy4P40mPGC2iLe
 O6OkiHyShr+17rbsfImGWS9ebx6V76I=
X-Google-Smtp-Source: APXvYqxLeBRtno5UO/xbNsZnN4kmZhB035ExJnlkIwjScfYHKudBua3+fBmjaQTpdULAB/liHFw71A==
X-Received: by 2002:a17:90a:33e8:: with SMTP id
 n95mr7043968pjb.17.1576346118077; 
 Sat, 14 Dec 2019 09:55:18 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id g18sm16392573pfi.80.2019.12.14.09.55.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Dec 2019 09:55:17 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
 john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
 mripard@kernel.org, wens@csie.org, ssantosh@kernel.org, jun.nie@linaro.org,
 shawnguo@kernel.org
Subject: [PATCH 09/10] soc: ixp4xx: qmgr: convert to
 devm_platform_ioremap_resource
Date: Sat, 14 Dec 2019 17:54:46 +0000
Message-Id: <20191214175447.25482-9-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191214175447.25482-1-tiny.windzz@gmail.com>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191214_095519_083177_964D26DB 
X-CRM114-Status: UNSURE (   9.62  )
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
 drivers/soc/ixp4xx/ixp4xx-qmgr.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/soc/ixp4xx/ixp4xx-qmgr.c b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
index 8c968382cea7..520babbd9037 100644
--- a/drivers/soc/ixp4xx/ixp4xx-qmgr.c
+++ b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
@@ -375,13 +375,9 @@ static int ixp4xx_qmgr_probe(struct platform_device *pdev)
 	int i, err;
 	irq_handler_t handler1, handler2;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	int irq1, irq2;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-	qmgr_regs = devm_ioremap_resource(dev, res);
+	qmgr_regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(qmgr_regs))
 		return PTR_ERR(qmgr_regs);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
