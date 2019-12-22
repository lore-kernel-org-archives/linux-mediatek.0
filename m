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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7EAC2D0C8
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Dec 2019 18:53:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B81FF206D3
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Dec 2019 18:53:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="urM67l4J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9wWDWIi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B81FF206D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AEbPnNGz+PFjbHPw40ca50mkbNgo6QlWDvP65t8tSBw=; b=urM67l4JY+LQ2/FQsOA7bf20Y1
	9ygw4lI+mB1LWwJc02FjzRChNd8BdhJKSXBeTZGfLteEp7nZgZZGcqs3zVnj9/joGC9rPxN755rfn
	6R02zXDRmZtg2EAISZZilKVKVTOtFsx6Ho+6bBy/EZX/UqYBWPT6h1mHvJJsegxrxUefypYnCh/LZ
	GORyP6b4SkqqjgYwev5IMKpaMG26e+neWO8h8q3ejkIO58pKtEFybGTqn3nj7W213koz1M8winPbx
	xOkFLsO2+BBori7oaJ/9AaD8pfrxgv7y2pot5KHGWe1dP3VoJD2bIgwUM4njaeT0KUdns+kajhH2m
	AwB6RcTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ij6M1-0005dH-NH; Sun, 22 Dec 2019 18:53:25 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ij6JV-0003I3-40; Sun, 22 Dec 2019 18:50:50 +0000
Received: by mail-pg1-x544.google.com with SMTP id x8so7694114pgk.8;
 Sun, 22 Dec 2019 10:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jPs8btFmLJCvfF7hm3VTorkXTs5PUOJURx/gZ3fO9eo=;
 b=U9wWDWIi3n8EDeWs3WHwGy7eoXyLGsrOlw/hUKX+ISHOS3xn5Dad3I37IpGKVcYmpX
 c7ssXhvzL+NYvVCdQBGVuc50r3MblDmMPwNUscnf9MONE6923+V6+iIWt1bajkdgp0y9
 RKw8mWWzpDFxm6SCqJ9rApfBvxXwgdNBdG/M/2FR2KOsCmKyZPm+Ud+ZyGN7hbvJkTqe
 x3teVL8N7hNg6tKSDWuiLMPbAf/L/TBXIyBM6IBj0/DfwNpcMRvYmN+mBnER89RTEuJ+
 ffKqxUz0SFPgfauy3nPc89x2GmKowZLpaEAnJRv7PQL00t1LmCsx1YS3S906MMWlHTmU
 OFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jPs8btFmLJCvfF7hm3VTorkXTs5PUOJURx/gZ3fO9eo=;
 b=o1u4ht7Iah9Uaf9p9VFzBWM0JK1zm0XNkBPKrwWzWfhfrX1Ecowcntjfl4cahVjT5N
 PmwqSJU2R4P+6s3Y+xy3N+Gq6f9IQmOZyyKf5CiGdoW1t+C2dWL3zIoRXCdzOzH29HeP
 RRaIikD7wLxfmkNzTXGIc8UVEa8TkvJO8pH9mME0EHI8Eo5ACsA+iz7FW/8cMBRVR53R
 Ysb35wKXFV40YD6N4yYTZU2WEcFR81QbHqZ2u/oYvYskHzjK/06XEfNqD5vzugaZT2Di
 72CUK59gTiLunN5h4yz21sAjfXIBmsA7pGjtZv03TcqCgIfcGz7qUOAvBpt0iYkVxsn2
 PyGg==
X-Gm-Message-State: APjAAAXwj8+NB/KLivHCbCwDJ4+VLLrQA26dI7fKud3jxqLjq8HUurYC
 /RewPePELnumHTlyL5Ric2s=
X-Google-Smtp-Source: APXvYqy5fHyoKX5i2orUytoXPpDCOFDkYgEOajqHueKFcpqGwfh052+BcQyINUsUMtnaA5I3q4bl8g==
X-Received: by 2002:a63:780d:: with SMTP id t13mr26159519pgc.82.1577040646922; 
 Sun, 22 Dec 2019 10:50:46 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id 73sm19170792pgc.13.2019.12.22.10.50.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 22 Dec 2019 10:50:46 -0800 (PST)
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
Subject: [PATCH 6/9] memory: ti-aemif: convert to
 devm_platform_ioremap_resource
Date: Sun, 22 Dec 2019 18:50:31 +0000
Message-Id: <20191222185034.4665-6-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191222185034.4665-1-tiny.windzz@gmail.com>
References: <20191222185034.4665-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191222_105049_218412_E3C98CFF 
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
Cc: Yangtao Li <tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/memory/ti-aemif.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index db526dbf71ee..6524229f634a 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -328,7 +328,6 @@ static int aemif_probe(struct platform_device *pdev)
 {
 	int i;
 	int ret = -ENODEV;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *child_np;
@@ -362,8 +361,7 @@ static int aemif_probe(struct platform_device *pdev)
 	else if (pdata)
 		aemif->cs_offset = pdata->cs_offset;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	aemif->base = devm_ioremap_resource(dev, res);
+	aemif->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(aemif->base)) {
 		ret = PTR_ERR(aemif->base);
 		goto error;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
