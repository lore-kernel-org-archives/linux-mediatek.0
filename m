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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9002C2D0C8
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Dec 2019 18:51:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A90AD205C9
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Dec 2019 18:51:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tf4aM9DO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VayjpuFU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A90AD205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4LFnxWsOSP2GdMqNqglZp+rf7mfQ+guQuAERm2chfOo=; b=tf4aM9DOSmUwC+Qt6u0Roi/KTD
	pUATJoSEmv0IFbE3QrUEti2eitivtbnMDMibFBe/XRdj4/7h96L8P+S40DK1QcuhivyC0YcgYYRPa
	XWATEe690ZZVybiHQcN0thWwyPo1CnX4kR0stNe9Q4lZFCDEeqRy0JRypz+n7Xnd5z3XOWvVpSjE7
	Q/XLR7Xbc98xFzRki40LPeQmKcNmfwxxV2Y2Iw9FF1LKudYpnYdUW8F8HxvgmhHlNU/r2ZAL3WRFi
	6lJ3uh7TBirxXzmjYZy+b1D4LgklYisRxWTVqo2Xm7ILLHKqaXvMEQWHzKiNhadcQCic7x9IudRVL
	ziJzje8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ij6K7-0003mG-Ff; Sun, 22 Dec 2019 18:51:27 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ij6JP-0003FZ-UR; Sun, 22 Dec 2019 18:50:45 +0000
Received: by mail-pg1-x541.google.com with SMTP id b9so7687894pgk.12;
 Sun, 22 Dec 2019 10:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UYJMcCSP2xqM3DCf7A/aaQtY9AM0A3U6ItqKBHen71c=;
 b=VayjpuFUrgdgU4fvbiVH8S3vP3Kc8cakjFEBT0Zel7kuingvSZcvJD7Uqb4oH65Alc
 ux5vVXmvdS0WecQgYoOET7cvNbt8w3n/m+lts3VNk60W3ubceku2WEvbTeHqILyAHZfD
 FYAECI3LUY4btBcRcIiOCwfMlxBmnh7LY1Y9IAzQkKgX7n+5moSt17ntif6C8YlcUrcO
 fvdESi+Ykpr14f083qpPWwKRXyVarWL7WspdirdvgF040RlnSb8BGYX50Sk8ziO9u5vv
 wiPUicg9NF1+H1zBoDdNbTq9Xh1Z9oPDLK14ToGsC+Zcr+V96UBt8b/PvR/Xsnwjihko
 st4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UYJMcCSP2xqM3DCf7A/aaQtY9AM0A3U6ItqKBHen71c=;
 b=ZkKv0R/EcsJco/kPYE/n5ggmI2EM1i84cjeOrkN9M6SHwOWKqnuUjHKzTtwI8QYrx8
 C4SPN5z3ivxXRnKrSl42NnwGR+TYyAJ7QQNwP4fSKJ71Iv1QzmcnyKcf3vtBlg10HbZM
 Upfvf0bMVARH6Pk4qTqrrTwqr68qR44HpZ8dBPWDeTfRZFPj1HVWBP2ntWvKzLMntXh0
 kg57xtLqdXg4RY1Ce24pDZD0g9NU2ME7RcTG7wMeAFlvDcQCGzBBgxuNcUmLDgd2hz3r
 /10VqcJm5usTAqO1yRuGrotALawRrv05cJ3UIoQd1SezMlEhMXZXOWrCH0fkb1fkcCEq
 zgFA==
X-Gm-Message-State: APjAAAWGc7JKzJ9Hda0HbWLc+Sp6rtwDXez4oHLthbm1/6tU7+AC6inU
 4Ptr+tr2uq5OOwrz+kpLAME=
X-Google-Smtp-Source: APXvYqyrXDL6rPmdg4u1kOSJN24AutsewRcg7DL4++UhnjYbNwRfwWeVlRtWZJBYBtLD7vHFGdAtow==
X-Received: by 2002:a63:9548:: with SMTP id t8mr26359191pgn.205.1577040640148; 
 Sun, 22 Dec 2019 10:50:40 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id p17sm20557901pfn.31.2019.12.22.10.50.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 22 Dec 2019 10:50:39 -0800 (PST)
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
Subject: [PATCH 2/9] memory: jz4780_nemc: convert to
 devm_platform_ioremap_resource
Date: Sun, 22 Dec 2019 18:50:27 +0000
Message-Id: <20191222185034.4665-2-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191222185034.4665-1-tiny.windzz@gmail.com>
References: <20191222185034.4665-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191222_105044_009897_9FF1DBBD 
X-CRM114-Status: UNSURE (   9.86  )
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
 drivers/memory/jz4780-nemc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/jz4780-nemc.c b/drivers/memory/jz4780-nemc.c
index b232ed279fc3..857a9fa5cba5 100644
--- a/drivers/memory/jz4780-nemc.c
+++ b/drivers/memory/jz4780-nemc.c
@@ -269,7 +269,6 @@ static int jz4780_nemc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct jz4780_nemc *nemc;
-	struct resource *res;
 	struct device_node *child;
 	const __be32 *prop;
 	unsigned int bank;
@@ -287,8 +286,7 @@ static int jz4780_nemc_probe(struct platform_device *pdev)
 	spin_lock_init(&nemc->lock);
 	nemc->dev = dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	nemc->base = devm_ioremap_resource(dev, res);
+	nemc->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(nemc->base)) {
 		dev_err(dev, "failed to get I/O memory\n");
 		return PTR_ERR(nemc->base);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
