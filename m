Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4816FC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:39:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE23921D92
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:39:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HsD6uvKl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SsrdoWR2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE23921D92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PZXUR/qvRpc9BvJ7myAhCbyg0LCkYnEU3aSrtCGPRwQ=; b=HsD6uvKl6mN9RunSODpU4vd698
	JTv1y1ESV2TtrAFGDCbzd9/Gj6o8a5g9REZO02fRYF7feiC+HHpQO8btRWVWbHBnX/FEGlRA3U5iQ
	Kg89XBEu2CjIaIQmFAD4LyXZ+oZIyhZe7buAXqkR0xxX7DV6onVMIJLv6s51NxKjx8iYpSFZPDx4k
	Q2gQ0JhGnyJ55XxUIHX3MkifkQitiRY4l6fi/ySE+mCKuquJra2IHbSQXe9DWGPmvnISSqJyn/uQ9
	Geo0yuemY+/Bl8ZyzbUsdV7vYzM6lIdDRYoq5DoP0b8taE+HL1jJEBRoWu0M04t3YhUqICDWQ4Iih
	bTnYH9ZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGfWy-0004VJ-7c; Fri, 11 Sep 2020 09:39:44 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGfWu-0004Se-L8
 for linux-mediatek@lists.infradead.org; Fri, 11 Sep 2020 09:39:42 +0000
Received: by mail-pj1-x1043.google.com with SMTP id b17so1439060pji.1
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Sep 2020 02:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rOvkQbHcqdEEW6imcqo512VuspBp3Sjb9vemZ7YeXi8=;
 b=SsrdoWR2xJuerEVchmJHs77EJDNTQwhJJ3BSD7dyycqxfJRgwEXXeZLoufITYzxwdf
 KubMausaC28CReuRTTMNmIOWAOttM0CgeQmKXPHCPJI389V06KhtJx8/5NJYJa9b7l4m
 5HXcxWMAP0vD3X1sXf+tvQ2B3z34erifCxIDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rOvkQbHcqdEEW6imcqo512VuspBp3Sjb9vemZ7YeXi8=;
 b=HoDnzeUDbzeIWHBNwFdK5l+Xlh6A6t2PL5A8lvYeEtw4cQOIfmEKo4U0ZDCmWS/KzQ
 XfGiGXUZFwivxZpYdoUjcW+KWqI9vf6ZHfFG8ZNHst89T6kOiawvARYixwF4K6kjkJDs
 WTNAgRtlZ7WVhw2+GUrCPco2WD95sx8A1FpHqjUq6EaI6K+OHcCTlmC3zzRqMXvSAnE3
 j3WuG5MkW7Y/64qudl+2dup1HG3OdM+1u+NarlaF/TUFCJUGgP+tcodynpTc69yFbDQk
 JbZWjt4wbtdJnawIuTwg92unXLJu9M7pVehIAk+9yXYwvHBDF+jB+nIXhegktqDay3Ij
 bsnQ==
X-Gm-Message-State: AOAM531JP0LJZp5e5ZTHoYCZ3hDyVWMgrge4d8iVTUdetN3/oXESpDh0
 IKjFwMVllcs7iq6pbjdkLrKM7g==
X-Google-Smtp-Source: ABdhPJwmX6yZWnZDIEx+xL+1xsLKAJsdIGcvlBqJnTBWOdo/WI0JBf49uctm86uYeq7xvEW3CgA8Qg==
X-Received: by 2002:a17:90a:2ec8:: with SMTP id
 h8mr1461759pjs.173.1599817175625; 
 Fri, 11 Sep 2020 02:39:35 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id v1sm1433465pjh.16.2020.09.11.02.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 02:39:34 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-serial@vger.kernel.org
Subject: [PATCH 1/2] tty: serial: print earlycon info after match->setup
Date: Fri, 11 Sep 2020 17:39:26 +0800
Message-Id: <20200911093927.608024-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_053940_763150_900612B9 
X-CRM114-Status: GOOD (  12.77  )
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
Cc: Changqi Hu <changqi.hu@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

8250 devices may modify iotype in their own earlycon setup. For example:
8250_mtk and 8250_uniphier force iotype to be MMIO32. Print earlycon info
after match->setup to reflect actual earlycon info.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/tty/serial/earlycon.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/earlycon.c b/drivers/tty/serial/earlycon.c
index 2ae9190b64bb9..22f0876f72d49 100644
--- a/drivers/tty/serial/earlycon.c
+++ b/drivers/tty/serial/earlycon.c
@@ -56,7 +56,6 @@ static void __init earlycon_init(struct earlycon_device *device,
 				 const char *name)
 {
 	struct console *earlycon = device->con;
-	struct uart_port *port = &device->port;
 	const char *s;
 	size_t len;
 
@@ -70,6 +69,12 @@ static void __init earlycon_init(struct earlycon_device *device,
 	len = s - name;
 	strlcpy(earlycon->name, name, min(len + 1, sizeof(earlycon->name)));
 	earlycon->data = &early_console_dev;
+}
+
+static void __init earlycon_info(struct earlycon_device *device)
+{
+	struct console *earlycon = device->con;
+	struct uart_port *port = &device->port;
 
 	if (port->iotype == UPIO_MEM || port->iotype == UPIO_MEM16 ||
 	    port->iotype == UPIO_MEM32 || port->iotype == UPIO_MEM32BE)
@@ -140,6 +145,7 @@ static int __init register_earlycon(char *buf, const struct earlycon_id *match)
 
 	earlycon_init(&early_console_dev, match->name);
 	err = match->setup(&early_console_dev, buf);
+	earlycon_info(&early_console_dev);
 	if (err < 0)
 		return err;
 	if (!early_console_dev.con->write)
@@ -302,6 +308,7 @@ int __init of_setup_earlycon(const struct earlycon_id *match,
 	}
 	earlycon_init(&early_console_dev, match->name);
 	err = match->setup(&early_console_dev, options);
+	earlycon_info(&early_console_dev);
 	if (err < 0)
 		return err;
 	if (!early_console_dev.con->write)
-- 
2.28.0.618.gf4bc123cb7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
