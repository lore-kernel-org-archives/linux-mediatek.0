Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F21ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 08:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MMkRjNbatJklpFghNZh+6S773eFMltyEZW7eycnWeXs=; b=N+YtHF4ngSD/PJyXYMdpyBfFUC
	FH70SkVU6H7/3ZXN2tvfjyRA+jg9zgZogIdFJATmRrH6iug7A0GP1YRVopd1ThpqZwqN4hZuJwD2m
	OX3q40+CKn7pyk8r+TfEiA/3Nmyccrre6r37NwsFWHo3EinR+OBON6z4vg4LvdR7j9klaXHzUD6ba
	MeIngT2j7l9ddsRfM/5TrOyBWGzmtdJSNDvq0fv3OTqoo9MAo0EI9Nmp2AZ/ZvKS9gQkMsG3gTA10
	7ztUAopi8Kyd4yyls7YN8oNGiTapvptkOFA0MMqsKMDOyEX9Gv+lU/KAa4E0Vfg6Sf2OqpH60SiIU
	6buq7rwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCYd-00APdK-Pw; Mon, 19 Sep 2022 08:55:15 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCYZ-00APXM-GR; Mon, 19 Sep 2022 08:55:13 +0000
Received: by mail-pl1-x630.google.com with SMTP id v1so27297168plo.9;
        Mon, 19 Sep 2022 01:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=MMkRjNbatJklpFghNZh+6S773eFMltyEZW7eycnWeXs=;
        b=RABW2tDqXoFg4LQ0NjP3HVYaOt+0OJLZuPB8x0CS2U9SMOMCrCB7dSCnNLyZoEQHLF
         RKajIoMLS8m8F0kYmhMgUlPnfTVgsR/0sghQ2ia+B21YqPFs56FPzphpx1/d9iSt55id
         1DRX6KkLs1nE1zb2LmlRM2uKumPFmiMssMrYihFIEEQrZeBxFHt7SCXTmHdaKePx4mLW
         y0dt8focSVsxwbgrvRZ3KlsKlNscSdE/wfROPvOE83ZXbsNztIvqKkLuwfr5kiAdtEcV
         y8CFHX1UBluCb0KDog7DguTqI0lcpLiwBfZuz8+7IuUKhkfEsFIFbD916vSD+ucwTqFU
         17eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=MMkRjNbatJklpFghNZh+6S773eFMltyEZW7eycnWeXs=;
        b=UWyY3rtHDTDbqVMcsOSxEfMPy+qD7oQFexLRJ6fehm32/GRgDjZiiK+BpL7QIS1YmP
         0flnkkRyZLKTWaCFf1ywL6vvhr150b1ukxvDsvuYXOzU1tdj8sjZprzmbxBYhijrZ3NR
         5liJ/mWYckkp9gd2/LXI3ksu+FY+hrqA8p5jPTCrczjFnAaoabx1eIzbub7l162MA5FS
         BTwCsrpKNopR2cN90iWuWGoRHcORC0Rf9lR4NcVaOhyuOTlW7CsSgaWgXIFQRi1oSsjR
         bBsJ8DM/Wqv6QD4MpJ+zxumXRN8O6dVczgMlNzhhnPKpZFl0WhUmgr4WMB985tuxmVpU
         pgDw==
X-Gm-Message-State: ACrzQf0WGsOIDpk8kRJy0pHqtcKNFVqKmM6o1wsEELDov0reGwNZf9Ka
	iRmyqdCTWJSejEX5a5JLKTYe0zd8jGjcaA==
X-Google-Smtp-Source: AMsMyM4qJlCxakHFEM9sLtYdvDPPYfuuDH6DFtcswTBBIpdYndlunojk1JqYWvDRar2iqo/sAeKElA==
X-Received: by 2002:a17:90b:2398:b0:200:a861:2e86 with SMTP id mr24-20020a17090b239800b00200a8612e86mr18806211pjb.233.1663577709566;
        Mon, 19 Sep 2022 01:55:09 -0700 (PDT)
Received: from localhost.localdomain (lily-optiplex-3070.dynamic.ucsd.edu. [2607:f720:1300:3033::1:4dd])
        by smtp.googlemail.com with ESMTPSA id i29-20020aa796fd000000b00538056de6ecsm19801091pfq.52.2022.09.19.01.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 01:55:08 -0700 (PDT)
From: Li Zhong <floridsleeves@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org
Cc: etremblay@distech-controls.com,
	l.sanfilippo@kunbus.com,
	u.kleine-koenig@pengutronix.de,
	robert.hancock@calian.com,
	ilpo.jarvinen@linux.intel.com,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	jirislaby@kernel.org,
	Li Zhong <floridsleeves@gmail.com>
Subject: [PATCH v1] drivers/tty/serial/8250: check the return value of clk_prepare_enable()
Date: Mon, 19 Sep 2022 01:54:55 -0700
Message-Id: <20220919085455.1582310-1-floridsleeves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_015511_633705_921F287B 
X-CRM114-Status: GOOD (  12.07  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Check the return value of clk_prepare_enable() which could fail when
cannot enable the clock.

Signed-off-by: Li Zhong <floridsleeves@gmail.com>
---
 drivers/tty/serial/8250/8250_of.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
index 1b461fba15a3..23e9b9e8c940 100644
--- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -298,7 +298,8 @@ static int of_serial_resume(struct device *dev)
 
 	if (!uart_console(port) || console_suspend_enabled) {
 		pm_runtime_get_sync(dev);
-		clk_prepare_enable(info->clk);
+		if (clk_prepare_enable(info->clk) < 0)
+			dev_warn(dev, "can't enable clk.\n");
 	}
 
 	serial8250_resume_port(info->line);
-- 
2.25.1


