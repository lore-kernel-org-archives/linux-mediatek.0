Return-Path: <SRS0=fxQu=2M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CCBC2D0C8
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Dec 2019 18:51:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 098BA206D3
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Dec 2019 18:51:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DfFpYMyg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnPRKiD/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 098BA206D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=fhnTsMyuned+U+JQnkfjQhK3vlZEFfT7zC1zL/s0Tc8=; b=DfF
	pYMygyXmLWqltKpNCEe0GHj72vlP6npd1YsJfGBMhjyrEahjkGybogMwe+M2tyvux8Ce7ditrLLzk
	/SlvZGWJKKWELwuoq/bbnKAEuMBz4wbYsX6qeY38GlyEqmOdg1fDIRtKkehvP5FQTceyCksn94CSN
	rRyOzp7KCB/ZJTR11EWN1O0LovjYVS+VeMKqFqe5SaVvWkywdkd9TlfkVPLt3VO5unzekX6yk3G2x
	5+IZv2bjSbaIq3hjiEfG2weEuD1FHlOGWS7dANfC4BMkA359Zz/GWPFf2iBpXhpQZ81jnDdxMOHQ2
	Fvf+sAA/HTKd+cmLMbddiOQYBryN4lQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ij6KA-0003o4-I7; Sun, 22 Dec 2019 18:51:30 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ij6JP-0003FY-UW; Sun, 22 Dec 2019 18:50:45 +0000
Received: by mail-pg1-x541.google.com with SMTP id 6so7714768pgk.0;
 Sun, 22 Dec 2019 10:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1MMK/7Lq6Q5MHtrU9nSWhUsHgp2FaIobPnqB6i1bmvU=;
 b=bnPRKiD/QwgUAYoz9VJpDVZ/p49jbueKzMRH23UoBCumqWMJaoMPQ6dZKsx2LUpLwd
 6qLyEJnGymgKxrVXAQeUZyzLjfPstF428bDfW7u4w83ytM7jXae42VT7aKfH8v9Ojho9
 ZSeJZpy8feXZePbc8zB0MwLGIxxFHWStinLBTA8nmHI456Nx8CLH5QDFlb6qaKkxsi/t
 Ik/qjSa8zXDnH7xdgx+rQp5xifmJLeqiEKxY/Lg7e7u82xnxV7U9847OOQQ0ks/JX05+
 5WxkfOP9ggtKlWEpQ4xuDMToMznSBf61l3CgigFqEoUnTL4tC7tWGNmrbXdOGihgMBOJ
 kJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1MMK/7Lq6Q5MHtrU9nSWhUsHgp2FaIobPnqB6i1bmvU=;
 b=DELlTXXcaEta/MjFr5dCxiuGFjwH1ovjJhFWtwgycV/+b0yfQgg/FvLq5PIiq4IHs1
 RmLXzD9ld47R6ZdV2ocO6OTxSTlglwcQMWKo3Nngk8lvVpCoKKlFRPycd9D3rsNTgYjY
 ih8LkyY162+eb3huQ1ssYAeABcIUmzb98q/RHPBAB/OZuoyTMOQHP8ezodG13v88HuKP
 6/7X+K4ZDM66Ml/L4MfVAXXeTSERsBM909DeXN/E8MZfiFJlUH1rRQKJHSTYid3ZSxKC
 YxAMzCGQ+feN1xyUYBS713fv2zl/E4WkAxwaBs+2L1N4ozsy9JKIoC8ojL7y0N/9ZTaU
 PI2g==
X-Gm-Message-State: APjAAAWPGJfMUGi9kZTiT2iPgOwp6+9UGigQZOg9JONCo1hVu2/t/UmE
 YLVXB+3gYiqUqJyOzfe4+RE=
X-Google-Smtp-Source: APXvYqylTRiXM3UuNPaW1PQbCJGvvGrSq2F3X2MYO9m7QdlL5O965z+77yHko+WYYeaRM/Y4Tq4vxQ==
X-Received: by 2002:a65:4381:: with SMTP id m1mr27847656pgp.68.1577040637744; 
 Sun, 22 Dec 2019 10:50:37 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id t63sm21401643pfb.70.2019.12.22.10.50.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 22 Dec 2019 10:50:37 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: ssantosh@kernel.org, paul@crapouillou.net, matthias.bgg@gmail.com,
 rogerq@ti.com, tony@atomide.com, lukasz.luba@arm.com, kgene@kernel.org,
 krzk@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 allison@lohutok.net, tglx@linutronix.de, yong.wu@mediatek.com,
 jroedel@suse.de, evgreen@chromium.org, rfontana@redhat.com,
 digetx@gmail.com, pdeschrijver@nvidia.com, john@phrozen.org,
 alexios.zavras@intel.com, sboyd@kernel.org, kstewart@linuxfoundation.org,
 info@metux.net, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/9] memory: emif: convert to devm_platform_ioremap_resource
Date: Sun, 22 Dec 2019 18:50:26 +0000
Message-Id: <20191222185034.4665-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191222_105044_010296_B60EFA60 
X-CRM114-Status: UNSURE (   8.29  )
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
Cc: Yangtao Li <tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/memory/emif.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index 9d9127bf2a59..9a8463716a54 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -1537,7 +1537,6 @@ static struct emif_data *__init_or_module get_device_details(
 static int __init_or_module emif_probe(struct platform_device *pdev)
 {
 	struct emif_data	*emif;
-	struct resource		*res;
 	int			irq;
 
 	if (pdev->dev.of_node)
@@ -1557,8 +1556,7 @@ static int __init_or_module emif_probe(struct platform_device *pdev)
 	emif->dev = &pdev->dev;
 	platform_set_drvdata(pdev, emif);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	emif->base = devm_ioremap_resource(emif->dev, res);
+	emif->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(emif->base))
 		goto error;
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
