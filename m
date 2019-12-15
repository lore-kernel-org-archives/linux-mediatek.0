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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7E1C43603
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:52:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EACF22467A
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:52:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FDRaGyHD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEyWXOSv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EACF22467A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LpvIQAscR0G8CwMcKME98Z3Y+pN56sARvGEKTfbE03Q=; b=FDRaGyHD/0k3csMQE8TB+SjiGV
	T6iOvispx/0C5GJTrqc+++0xghAe5uEmsYyvAPe+UCkjrEpsIozX5y9A7NBZSrysLyKfJi3ww8ylr
	B1Kxjy0ZL4cLPcNop4uGxNBN32kFLCAYQjfxxIO0wekCbRrQfoPpzXITYdx+t30vYucDShAHRR63r
	qteq/oZpqDfYBguyiyh5ndGT5r9bZeyZRAsJHYrHMTjFW00O7FngmrJmL6Gy+5wCTrVF++VIEpUGc
	1QH8erwTkge+kCcG34AQhewbz5gz1GB6rtTdDr17KMLLD2FsfMeRrTUppZpvHF5fBxceFFtGwYmvq
	1lvgncCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igY4O-0004WV-C3; Sun, 15 Dec 2019 17:52:40 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igY3H-0003V1-Jw; Sun, 15 Dec 2019 17:51:32 +0000
Received: by mail-pl1-x643.google.com with SMTP id az3so3442872plb.11;
 Sun, 15 Dec 2019 09:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LysDIRyUWjcACkzyZj03TqlWtvxOY9uGmk/396mKWhc=;
 b=NEyWXOSvcxEgMiU0sSL9uY/bFD35hforgyUqSOgXK50IABjB3O1mGxt+4tbptDT1yj
 CxmvnM0vh4yPihzrQE7TGoLaKgx01+pmVH1kwqrdgE5hb/t5rKm3YC3uWSTFFtL/LRBC
 giHhCLMg/coaFC+Ia+Dc/5MjAfToGyWZzhpcjfbaUourf44Bo7/4Z2Oynlzipd1+VTXI
 NyxEwEXknnTRwmYLO35Ys24C85+XKM+1OCbQfwch624nKKK60yY3rqU4Qp2sIC6Ny7GT
 5j//iQOVphr/0l7mVcVXyIXonorpV3qL5ToV+gxkoVM8Ho4JKUjToUixzPT+B6mfSOhU
 269w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LysDIRyUWjcACkzyZj03TqlWtvxOY9uGmk/396mKWhc=;
 b=e+PvsiE+VEIa42txv6ATOjoTcWRnGHw40Bu0Brl+BFktkGVK1OlOXmCt4PA1BGfNgI
 DTDM0j7SlgiDfRuswHKIaGG3is4+aR9js+LAYGtWhO8O4HOtMPblkxrsWHLxvNSY6Z6P
 4rXrrIqAY9vYY/Dk5RP3uL5FX5Gb50gahY1QDY0GOF4u+QxFC44AwZo0qF5KC00grlC+
 AV7xlpvUc4c2tizpwCFr+GU8V7Nb801OB/9VP0dH6jUQJqQKYrgGap/b8dR749hUtEME
 E4KBbOilTF4+/DYnoH3br1H1534QFzCkXug2yduVwO/j/xb1ro5NdfYZszCR+a/l0Tju
 I6Zg==
X-Gm-Message-State: APjAAAX9wJUzDwEw+m7ik3VRj7dWn4UMSdwsnpj36CUYRyrPCayCoC8V
 FWkfVtwDQz/XdAYZUS79oYU=
X-Google-Smtp-Source: APXvYqzmvIDLb1enKy35lMWmLNm4qJzVxGNdBEBQLoJbjT8Xb9jqha4asK/Aw4JMGO6idxiJbcFfiA==
X-Received: by 2002:a17:90a:a798:: with SMTP id
 f24mr13456417pjq.27.1576432291181; 
 Sun, 15 Dec 2019 09:51:31 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id h68sm20424981pfe.162.2019.12.15.09.51.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Dec 2019 09:51:30 -0800 (PST)
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
Subject: [PATCH 02/13] mmc: tmio: convert to devm_platform_ioremap_resource
Date: Sun, 15 Dec 2019 17:51:09 +0000
Message-Id: <20191215175120.3290-2-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191215175120.3290-1-tiny.windzz@gmail.com>
References: <20191215175120.3290-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_095131_654110_F86C19B9 
X-CRM114-Status: UNSURE (   9.03  )
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
 drivers/mmc/host/tmio_mmc_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index c4a1d49fbea4..365d518c6d7d 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1109,12 +1109,10 @@ struct tmio_mmc_host *tmio_mmc_host_alloc(struct platform_device *pdev,
 {
 	struct tmio_mmc_host *host;
 	struct mmc_host *mmc;
-	struct resource *res;
 	void __iomem *ctl;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ctl = devm_ioremap_resource(&pdev->dev, res);
+	ctl = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctl))
 		return ERR_CAST(ctl);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
