Return-Path: <SRS0=gblj=LH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064CDC48BDF
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 12:08:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD12E611CA
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 12:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD12E611CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=reto-schneider.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AwFrCKsGMEmIT/xwiG83VRALqYTcsC55h1UU19550yU=; b=EQaUCBL0BRwNBa
	KCweL64QNijD4foygIj85sEXhxZrEa4/KEYj0p113D7cz92r4etmnlnhqTg7TXKA+jdVK2DUkgt12
	WwMf7LNlvTBwQxSWeZfiTr/pe6+ifWtthp3Ea5/yjMXQWDlCNGpL5cXZrRFWICU9VxGwOWeGf2WFq
	hWRusT28LfmPj8T8XZh9e6Nvefi/UpapCnnp0T0ChbaVrK9DP7FJgUTPMJP3LTBAS4lad8AkaHDix
	d8ERWWSwqlNKQ6NwBKdeS6N6T/HPPKD0Zk/AVJYvFkRLaZe4O/1w9Rf6Q0pRsL3ZjUpMay+/311Rn
	ImDcwlX4PQXRiE0LtVvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsOse-00AOgG-SD; Sun, 13 Jun 2021 12:06:20 +0000
Received: from mxout013.mail.hostpoint.ch ([2a00:d70:0:e::313])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsOsc-00AOfV-2B; Sun, 13 Jun 2021 12:06:19 +0000
Received: from [10.0.2.44] (helo=asmtp014.mail.hostpoint.ch)
 by mxout013.mail.hostpoint.ch with esmtp (Exim 4.94.2 (FreeBSD))
 (envelope-from <code@reto-schneider.ch>)
 id 1lsOsZ-000NTd-TG; Sun, 13 Jun 2021 14:06:15 +0200
Received: from [2a02:168:6182:1:d747:8127:5b7a:4266]
 (helo=eleanor.home.reto-schneider.ch)
 by asmtp014.mail.hostpoint.ch with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2 (FreeBSD)) (envelope-from <code@reto-schneider.ch>)
 id 1lsOsZ-000AA3-RV; Sun, 13 Jun 2021 14:06:15 +0200
X-Authenticated-Sender-Id: reto-schneider@reto-schneider.ch
From: Reto Schneider <code@reto-schneider.ch>
To: linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Stefan Roese <sr@denx.de>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] gpio: mt7621: Assign base field in gpio_chip
Date: Sun, 13 Jun 2021 14:06:08 +0200
Message-Id: <20210613120608.1527394-1-code@reto-schneider.ch>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_050618_129661_AEEC7F71 
X-CRM114-Status: UNSURE (   8.36  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Reto Schneider <reto.schneider@husqvarnagroup.com>

This is needed for gpiochip_sysfs_register() to properly export
/sys/class/gpio/gpiochip{0,32,64}.

Without this fix, the field base in gpio_device remains at its
initialization value, which is -1. This causes
gpiochip_add_data_with_key() to call gpiochip_find_base(), which in turn
dynamically determines the base to be at ARCH_NR_GPIOS - 32/64/96,
resulting in gpiochip{480,448,416}.

Detected/fixed/tested on a MediaTek MT7688 based GARDENA smart gateway.

Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>

---

 drivers/gpio/gpio-mt7621.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 82fb20dca53a..403d64cd65a6 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -234,6 +234,7 @@ mediatek_gpio_bank_probe(struct device *dev,
 		return ret;
 	}
 
+	rg->chip.base = rg->bank * MTK_BANK_WIDTH;
 	rg->chip.of_gpio_n_cells = 2;
 	rg->chip.of_xlate = mediatek_gpio_xlate;
 	rg->chip.label = devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
