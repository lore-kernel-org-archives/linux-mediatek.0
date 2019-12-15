Return-Path: <SRS0=PXBb=2F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC1AC2D0CA
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:51:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 027EB2465E
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:51:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kb4du/V0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LD9i0Sz6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 027EB2465E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=jy43/yTVmREBqZdXkA9IGCMQBhvdMksPu+5WaN80xzk=; b=Kb4
	du/V0p1WqLD+TzcE4CfNTaWfxkwis/wW5NRKQn9aeEQzRo/6ZUI+BE3bFtEMevt3ZR49BMnccKw26
	OGOVRRMweATN+oEPGU3yCdOPAbK4l3hBc9gCl9zLiB9V6OxGl9Me3Iq27DTHMnTLwIJTwwD31T7mT
	JAEZsfoI8/TkcPV5rpXUkGnrHQlABrZek4kBimRL/2pWJ7bH5a/s9WmfK1l0n2m8g1RH9S18D0nIq
	3xYPY4qxy9waZtmfNLEI1RZwhB2VH9ktXI1CAHMVkQ9hyaxZBKL/AKjnybb+368Pq2bhZfg8bbYsM
	RVbtAGOgaHSvkMeTvXnN2622gAX8S9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igY3b-0003pS-LU; Sun, 15 Dec 2019 17:51:51 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igY3G-0003UW-5t; Sun, 15 Dec 2019 17:51:31 +0000
Received: by mail-pj1-x1041.google.com with SMTP id w23so1972220pjd.2;
 Sun, 15 Dec 2019 09:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=z1jBRqifD9uwR57sxHEm4IG5SvaRCOY1FJ5LXadeqP4=;
 b=LD9i0Sz6s6XSzCMt0KxGg8AkP/88Gm29YgxJKl/PIqRJ29V1U4k/Q1BcW2j8KkXiun
 oYLm5Oj4XhSh35ez2t6kOADhXR1IKCNrHdK9Tq2IoifZqzGaoUiYkTDOgVZVjEzxGucW
 t0yMqBvCvtGLkldgOTt6EEETTw6diR2m8JWhrciDiz8t0r6oWa5FoiiSjOFWVrwjKVO1
 3SculOLAtHzrOynoET+zghiGzyI5dGzUZlCNZ+YHnez/tYiMyMo2tB4pHUN2jVptR1lv
 GPXHLuxviOJVUKzri0wyTsmwSmsOOjY0g7WapaSEIWGMR1TvUxQrPW9ddrdvJOARMD1R
 OveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=z1jBRqifD9uwR57sxHEm4IG5SvaRCOY1FJ5LXadeqP4=;
 b=p6sWZSASE4FLBEiE9PL7x5x8SZe0hKpgCdengkS7Sx/kok10zyKa9wwbL9fTnYO1jD
 v9pmwAqP0YRLC8auGju2p9cp50HSxCZUKcH01+iim6KEzqvUkiWTJJaeTjqhI6pC+mPg
 pQf14m8+JjXZiDZR3cIx0nGs3ulaMuFCLZRDJ+/+FCpWT6by1zn7gTnirdT3yadkWoMk
 pg6SfHZmImSwo61NpAeZAfuKvcFELkv6BmfzkBVVP+CkaJFq6COmZzup5rm2d0dT8deq
 gcJJcCdSgMHvHzOOURSTr8/PNP9//RliQen0JWBe2PxxaKYii24fS6zv3XtqNabFYs1Z
 vcwA==
X-Gm-Message-State: APjAAAX1WYRb0Hbjz1iE0ZobXTPYWoZP0KkLvkKvBUpJILHOQlbeKzsU
 txM9OGr2/2ndVstu3BwpN+Q=
X-Google-Smtp-Source: APXvYqzWCydMHykUpEys8y8YK57hVRHOWOHSqS0Ui0zvmzlWq1mTCq8BkWpBBEPrjneRePs+lPMvMg==
X-Received: by 2002:a17:902:59c9:: with SMTP id
 d9mr11602644plj.184.1576432289298; 
 Sun, 15 Dec 2019 09:51:29 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id q6sm19291374pfl.140.2019.12.15.09.51.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Dec 2019 09:51:28 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: manuel.lauss@gmail.com, ulf.hansson@linaro.org, khilman@baylibre.com,
 chaotian.jing@mediatek.com, matthias.bgg@gmail.com, nico@fluxnic.net,
 adrian.hunter@intel.com, agross@kernel.org, bjorn.andersson@linaro.org,
 ben-linux@fluff.org, jh80.chung@samsung.com, vireshk@kernel.org,
 mripard@kernel.org, wens@csie.org, wsa+renesas@sang-engineering.com,
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
 yamada.masahiro@socionext.com, tglx@linutronix.de, allison@lohutok.net,
 yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be,
 linus.walleij@linaro.org
Subject: [PATCH 01/13] mmc: sunxi-mmc: convert to
 devm_platform_ioremap_resource
Date: Sun, 15 Dec 2019 17:51:08 +0000
Message-Id: <20191215175120.3290-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_095130_245755_D98DBBC1 
X-CRM114-Status: UNSURE (   9.64  )
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
Cc: Yangtao Li <tiny.windzz@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index d577a6b0ceae..f87d7967457f 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -1273,8 +1273,7 @@ static int sunxi_mmc_resource_request(struct sunxi_mmc_host *host,
 	if (ret)
 		return ret;
 
-	host->reg_base = devm_ioremap_resource(&pdev->dev,
-			      platform_get_resource(pdev, IORESOURCE_MEM, 0));
+	host->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->reg_base))
 		return PTR_ERR(host->reg_base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
