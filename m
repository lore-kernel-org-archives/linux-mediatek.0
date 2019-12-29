Return-Path: <SRS0=5MtA=2T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8124AC2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:15:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B128207FF
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:15:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BMkGh7im";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USfTeOzM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B128207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Q6CtSd8/tMuqgwPV68VE91uv7RtaFiglH1hLsr1/Cxc=; b=BMkGh7imgoDNIQ+Mlc2og1CgMB
	4nlKDo8MYEXkbjkC0KioU0JAfwSxKVrUZnDkkkltzeNbB0WNv/mIioHZCxVHm5iETNal/WxuZ5UAW
	jOalCVoclIYDauUIPuqADUJr0sp7bt/BYKngXAAQvabzNHzffudQ+BmqzYcnJNztmAhi9VInLIoUU
	l/6voRqnOU14mhMPRm/zis9RG7CCUyc8puDUTU2yjEpsxwdMc3dfDxg9idInBmT8LpLXvxfH92u3z
	uOg9r0pvKRkZJgJVMcozarayvjaMcs4yoQUo1YLUp4+tgGlqeV+PimJOrWI/nQkTkRrbZjnasjq23
	KTIdrxRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTjS-0002NI-Ou; Sun, 29 Dec 2019 08:15:26 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTak-0000u6-FV; Sun, 29 Dec 2019 08:06:28 +0000
Received: by mail-pg1-x542.google.com with SMTP id z124so16594388pgb.13;
 Sun, 29 Dec 2019 00:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JTxLwNHfWMCSdl17dQPhCHcE/C0FIExdEqc5ZBEYZfU=;
 b=USfTeOzMptYKE9gYaoMN2AcaH/T/YEM97jTDKmejVbSSpQ0VRIuSMlgI4iWyJKdyQi
 TgT9w+oa6HCJV/EbiMSTDznTvHy0o9Vp8Aeh/T6tvJ8fulH7IELjdTO1440DnsBW7Ecm
 Vz4vqPF74gnUndLkJNSBtRQYtMeOhcuKZyydfYZfkPsH4Sf7OVJT3S/62fwzKN7SAC0a
 smkyZe6cJlsjW8nzE5cySMMBI0HWlMKH5JEDgxO50BfnBw0Hn5cKB0WTigN/A/SOihJp
 Np6zIfueMyLZVqllS3iEN64sQ4rjpXubD9ErAEUULvzWV7cNsVjo6lk/euhBZ+ZFH8L3
 C+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JTxLwNHfWMCSdl17dQPhCHcE/C0FIExdEqc5ZBEYZfU=;
 b=UJHJmrFOzFeRb0BXFIeMDVmQPLv3NsHZh/PgOFa0yVZ7iHxoJiEjr7HspjPkid2CcM
 8uuLrWbDvbHbDYgAe6gabfH9O6BtLvg+Gxqh/ZNGd7OQXZIA9dSVSRwSW6wz8X+7eIKB
 irlxFSBe3UCnbvREOZI3ZjTREc1k3YRUUJdIFsR9qRyT1t3eCrBifNI/hA4I4D3jIQJI
 tO7Ha8rpvwbTjDYbIOgZRmQe9ZjO9H9NUh4YotdCJEMNoPzgOJab9D2oRVx7JqMIkudk
 WoQzRYEezjrAxhqM9EEiy8vUFEhRQs1UAlmVdgLTXJNcdL4E2LMP5bvgDKVTG9S56cly
 EkXA==
X-Gm-Message-State: APjAAAUAXbB9k9eFrTOR8fHUmxSijwHUSd0YIhWUaXconGgGMPbdn+ko
 ma/HffgD6Zf0rnIZig3ku98=
X-Google-Smtp-Source: APXvYqw0aOEeyRNR1ZSX3UWHpVI83plQz16k8Unv0vX9tNYiTSBj4CWfSoUVyECQTs/4PKYZlIN+yQ==
X-Received: by 2002:aa7:9115:: with SMTP id 21mr33026878pfh.224.1577606784475; 
 Sun, 29 Dec 2019 00:06:24 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id m45sm20368923pje.32.2019.12.29.00.06.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:24 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: claudiu.beznea@microchip.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com,
 nsaenzjulienne@suse.de, shc_work@mail.ru, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, vz@mleia.com, slemieux.tyco@gmail.com,
 khilman@baylibre.com, matthias.bgg@gmail.com, heiko@sntech.de,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mripard@kernel.org,
 wens@csie.org, jonathanh@nvidia.com, linux@prisktech.co.nz,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 08/32] pwm: sti: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:05:46 +0000
Message-Id: <20191229080610.7597-8-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000626_588573_D61B8AB7 
X-CRM114-Status: UNSURE (   9.50  )
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
 drivers/pwm/pwm-sti.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-sti.c b/drivers/pwm/pwm-sti.c
index 1508616d794c..eaeb38c0c0c7 100644
--- a/drivers/pwm/pwm-sti.c
+++ b/drivers/pwm/pwm-sti.c
@@ -540,7 +540,6 @@ static int sti_pwm_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct sti_pwm_compat_data *cdata;
 	struct sti_pwm_chip *pc;
-	struct resource *res;
 	unsigned int i;
 	int irq, ret;
 
@@ -552,9 +551,7 @@ static int sti_pwm_probe(struct platform_device *pdev)
 	if (!cdata)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	pc->mmio = devm_ioremap_resource(dev, res);
+	pc->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pc->mmio))
 		return PTR_ERR(pc->mmio);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
