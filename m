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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC65C2D0CA
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:54:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF82522B48
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:54:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jI52AgJH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pbR7pVsV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF82522B48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fVS58NUQBMME+E6OdMmYqDVjW3Bia68dpeCalpg1lVI=; b=jI52AgJHOXwLI028/RxHNy+SjU
	qatLcUBBnzbZNVtrUDJtytyLHCKDJ0/kQhjDABgBquSciQgdKWm+Uc4U0Fjp4ENPw3Ggzb1KHiYbM
	5BE/CDuYvaghOePR5UoMmB6hacn6DZLQMNC2hQy3TONeEyh/NnZZYCTnwFy2+ek7y1lr2Uow0uCdv
	3F/nKCu+5pQX5UsvhUTKX+YZXZIZIW9Cb8kC7Zvw+OqVQIdN5Ual7SCtM42ifKBPyfajnDNfT7oxh
	i0w96ykRdgiyrpJpChqoNSh48UE9F5eqSb1t/+wu+HXw43jcccoaiy6IPj+wH4wpJ+NZjzJQirkRa
	XesLzf/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igY6V-0006R6-9w; Sun, 15 Dec 2019 17:54:51 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igY3Q-0003dO-Bm; Sun, 15 Dec 2019 17:51:41 +0000
Received: by mail-pl1-x644.google.com with SMTP id p27so3446864pli.10;
 Sun, 15 Dec 2019 09:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TZ1xS5qPhU2IhwfRNSwTRqhYIldYr8v5xb3e3qhR6PU=;
 b=pbR7pVsVjeHw0gd67xvoEtScCkAwIdUeTHkozhA37RkgiSyp8YcSx9ERtIfAY+IuDw
 hrCtp5fcXF0DIRbJ9NfadYRWzR7Y1o2M4UDFlv40n+lZbg23Tni/uvFNaakQLuZvz2Bq
 bFwDHfxbqE2SpINHP8LFYxmZWELq6LEjJ3AxV3llH7olhcxa+IBpYaaHVWdsQ4dapcFM
 EOH9KUPmlJpXEPcIKhCwJUnMEMXiTNTg5kJ+Q7IKAKs4CzrlLmCHMy2REvs+RoZazFVg
 ivCZcwp2kgFJP1mYiaGKP/MTCbZNJFOkBX3D7yyGnRrSbgXS12ywC4c8SNGQRXMkKw3u
 nvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TZ1xS5qPhU2IhwfRNSwTRqhYIldYr8v5xb3e3qhR6PU=;
 b=QeRLIcXlZuLu3iExgtkktUMm8FVOkl6Ku2UCdETRgRfyN+nQiy7zGEYeG/avWtdZp5
 lFwSQ6d3T1W0/VDqs5CYy0372yLy2XdVA1vB3N5OpGyMzvFIaZZ7uPltF4A7Qm/HTVp5
 sJ0JkW+p4Trxfr5pZW55KEvd5lhcV6a/0Dr3NPwgtNyDLRAhg9jn0TB6UuZgnWKaKS1Z
 jrmjxyXKV9eSCb/pxfji7JZqYhQuuM9AzeNoKJlb1Vrlp55w5MVd9m1DmHuAY1HcTaXR
 rIXGFF96NvHi9jC0ARtudV35le+rnf9TcGNpqaAYLFHqcJqAt3ashxYHvN6i+k2Wl3q4
 LKOw==
X-Gm-Message-State: APjAAAWZ+75sB5BSTMf/Xhi4+SuWj81CpyYoKIx48S6MTC3i7AwDC8HB
 4eQJmDoVFxnZUtURtTKDIDQ=
X-Google-Smtp-Source: APXvYqy/1P3upyMouvKmiwh3Vz1uiBI+Jt3S3WCz0rzjwcujE1WXEXrqRVWI2k1ffFwimt3XZuCt8g==
X-Received: by 2002:a17:90a:a44:: with SMTP id
 o62mr13115954pjo.80.1576432298835; 
 Sun, 15 Dec 2019 09:51:38 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id s18sm18243050pfh.47.2019.12.15.09.51.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Dec 2019 09:51:38 -0800 (PST)
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
Subject: [PATCH 06/13] mmc: sh_mmcif: convert to devm_platform_ioremap_resource
Date: Sun, 15 Dec 2019 17:51:13 +0000
Message-Id: <20191215175120.3290-6-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191215175120.3290-1-tiny.windzz@gmail.com>
References: <20191215175120.3290-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_095140_410197_779477D4 
X-CRM114-Status: UNSURE (   9.40  )
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
 drivers/mmc/host/sh_mmcif.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
index 98c575de43c7..5069f1cbcef8 100644
--- a/drivers/mmc/host/sh_mmcif.c
+++ b/drivers/mmc/host/sh_mmcif.c
@@ -1388,7 +1388,6 @@ static int sh_mmcif_probe(struct platform_device *pdev)
 	struct sh_mmcif_host *host;
 	struct device *dev = &pdev->dev;
 	struct sh_mmcif_plat_data *pd = dev->platform_data;
-	struct resource *res;
 	void __iomem *reg;
 	const char *name;
 
@@ -1397,8 +1396,7 @@ static int sh_mmcif_probe(struct platform_device *pdev)
 	if (irq[0] < 0)
 		return -ENXIO;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(dev, res);
+	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
