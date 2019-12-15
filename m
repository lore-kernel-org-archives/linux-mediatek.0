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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8FEC43603
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:56:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45DE224679
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:56:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SMcJ2Vc3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDW2vMxn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45DE224679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=E+V3sA1IxPMjWpKb8JFdThEVt0p9C5A+lswPLxdDRsU=; b=SMcJ2Vc3eqZGZka4APqRPeNfko
	N2r7IOYhJAT2r48DO6i+ceC9AsniELfIRQwXc8ESEHNeOuIX6ZrTyZ89Y2fx5pMJpcXlN8/gso7qb
	YMl31TCd0igJqpb9kdJRcD2MM9uLxlSRBRxSuQlWa0hhS/2YIHyJwh3+dOIXmkMDamb7QzIVb1q8h
	nhpe0uuNO+4N8aGFfjON4q5GhtFSMGwE/goann5UlWzOOPTBACvQflsdsSWObPJohwEZxikz18Yev
	R34EXds6pj7Brvex3z4Av3yWZYO4QARUbCLfTtkioGEvLbOedR9GAM9NHOAEFnbL/5L/yRLlSdNq+
	J+7Jq8rA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igY8O-0000kp-3s; Sun, 15 Dec 2019 17:56:48 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igY3b-0003p0-N5; Sun, 15 Dec 2019 17:51:56 +0000
Received: by mail-pg1-x541.google.com with SMTP id s64so2322966pgb.9;
 Sun, 15 Dec 2019 09:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JtOW+QPlUjdDS6TdBpSLjjaJL3b4V2DiQFsJEo2gjJA=;
 b=TDW2vMxn40YMaoX+ioc+kFuwF0B5ob/A2CzICAPtb+qqwCs2/f86cDNY8GUpSPbLln
 Hlo06+FCU6SOZq1/jo2ypmsAz1kxZQNuth6jJbt2oCV0LD5k1RF98BGMYORMcoQWEi32
 DsyXmvip+22q618Yyx6PTaVobtsOUACZVWl1Hu4UU4SjTlgbBYW2kfmvA8+NyChEznJY
 bLHGtt3S6OOvFEKXq2gfsHzRd5IqFFnkGurymO6w5udnrxokay7YnkmiVi5KyYyZX9tI
 bdWt2j+oo+IR7Bl4IuHG4Btis2Hz0o09xIkeJi6Awngc1D4VJM4OzVkjHOyPNrPZPjfs
 6xGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JtOW+QPlUjdDS6TdBpSLjjaJL3b4V2DiQFsJEo2gjJA=;
 b=ubL8CNbHyfTMwQuGlfklif3Bt55FMB12l4a49gMGiK6oLqohHEhKurFi+84lxEN4Nw
 J1LRzKDSVEatLQqjeW0FbA4hFixK1nexcJXu1oh4SDYlaiMOoVMPvSuv3JBNHhebt0dm
 cCgOmMALK2R5RcJyKNRY+I+9U7QApA/m/pF5uec4ZrRV8vbLAuSr+DE8JP1iJbw/Nugh
 l7rJ6TEXhRygW3kmPCAy8Z2ZhFpfQeJ1WFFeFEBKq4zxwZ6fyIKL1gVxgZlJeoK3/UOB
 Z/1L7fMtkLt1Jt/0U4GFqjxRYy9rRHENu9wBkmqMY0DZVJtCeF3742249Jgc++6YQ/nr
 zOoQ==
X-Gm-Message-State: APjAAAVrLjzQgETbDiQVUWWHo4NNOGtlw2Hi0zGkdJ3VfN6LiD6oCS5x
 mwkryvRJr6QInQATokltH+c=
X-Google-Smtp-Source: APXvYqxnu+iNgVmWSpd7t0baxtWXCgIAvh8wDpoGpNjO6fT2yXWyu/IonFOvxs5K2771DvIxbC2lQw==
X-Received: by 2002:a05:6a00:de:: with SMTP id
 e30mr11358233pfj.243.1576432310186; 
 Sun, 15 Dec 2019 09:51:50 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id g8sm19007763pfh.43.2019.12.15.09.51.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Dec 2019 09:51:49 -0800 (PST)
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
Subject: [PATCH 12/13] mmc: mtk-sd: convert to devm_platform_ioremap_resource
Date: Sun, 15 Dec 2019 17:51:19 +0000
Message-Id: <20191215175120.3290-12-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191215175120.3290-1-tiny.windzz@gmail.com>
References: <20191215175120.3290-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_095151_981426_B0AC4021 
X-CRM114-Status: GOOD (  10.58  )
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
 drivers/mmc/host/mtk-sd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 010fe29a4888..7726dcf48f2c 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2194,8 +2194,7 @@ static int msdc_drv_probe(struct platform_device *pdev)
 	if (ret)
 		goto host_free;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	host->base = devm_ioremap_resource(&pdev->dev, res);
+	host->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->base)) {
 		ret = PTR_ERR(host->base);
 		goto host_free;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
