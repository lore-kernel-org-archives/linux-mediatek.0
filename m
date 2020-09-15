Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF28AC43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 05:48:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B142206C9
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 05:48:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qyvAAn3k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d5fpZWid"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B142206C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eM543gKTIcycnoT1APc1GtIvZM/ITYOVElwqGjgzSCA=; b=qyvAAn3k7ePX70189zXqWPynfC
	mA586KN0BC6YwJNTP2RDr+svraa+WRS9ngyBEsiQOiiaNg/ibsvSsiiW+U41xhzOJKP2hnZkn6K0Q
	lYKuqIbINyWL+yPAtJa7zktcQ0bGLAKjxYEamOl4/EnsXQGqmyVmX56ZlbisDNtLVoWkxdxrY1Ucf
	i7/b5dyCGIj1ihWj8FlfSIyykH1WKWBVuLi14t0wNEsivRKmaPAEUyMM46nArA92CE6AbzU1D2cXi
	+iJxhAt0m2rt+J8YvpI0ewqBZ8ez2rYsk81cddbHzxLRYdbGNREACAGic0RZA+VdjpoEAKHHTgcgP
	7wupukSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI3pf-0003Dw-UJ; Tue, 15 Sep 2020 05:48:48 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI3pb-0003Cu-Dq
 for linux-mediatek@lists.infradead.org; Tue, 15 Sep 2020 05:48:44 +0000
Received: by mail-pj1-x1034.google.com with SMTP id fa1so1196935pjb.0
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2020 22:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i6P44y5mpNfyLXR4RrG6FSEEHMj+iy7zvhbL9GfNdpo=;
 b=d5fpZWid3HK1S3xeIBo+ue3RwJcRvMaqXA2dL6Lr92GKstsooZcdMke7Fq8vsiRI41
 Ey17Xc6tNlQNXNx0S2hxaCGnhuY2Y2OnpPjTzRXLub5w0N7X/JxbD8I82KLgzYJxivrl
 68MOS1P2Q86+kcaiKUH9xAmW8eP9Z7oTe1e0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i6P44y5mpNfyLXR4RrG6FSEEHMj+iy7zvhbL9GfNdpo=;
 b=dTxNfHyd+m0KiF0pvGV1wb9gPHFuUt291yzm1ZURr2U9+xPHWGJALLZ4oc5HF9Q54L
 n17kT5ciUTNZGO/QL9cne7t3YzfKNejgXQ+WMjSYNHT7TukDKfke/tg0q7ib6JbwjZOF
 zt/U6FNiYNPQWUU/3QfXoaqjzbENj5M1t6WuVHo0dgVC9q1B0ODBS7ZyJrENA1IwRq0k
 NLfg9rQZ0XWXKrNV6dHF9gvMoBXb7zy6dl9ZPamI583bpwpHeak/Bgl2K1UYvZTlrPNm
 LK1rLI+ccw6St4vCDYMqScXx4s2vBFP6B/i0bG38TWxtH6mUpr4Ll9RLzrvwVWKSjVmc
 wYsA==
X-Gm-Message-State: AOAM532WCWNiKXBdES/OTru6Uh3HRYc8IQ6X5/I54e9DBLYYjL7ZLAz+
 FtUS9rqaT346K31VCw3Z+rh0bg==
X-Google-Smtp-Source: ABdhPJyBoTpUYRjmNE7S4RH/HZ+Wd5QDHCdP+aOrKbrqlSzxhloY/EzG1bmXclaKkAnFOoA370xwVw==
X-Received: by 2002:a17:902:b186:b029:d1:cc21:9a7d with SMTP id
 s6-20020a170902b186b02900d1cc219a7dmr6444831plr.8.1600148920854; 
 Mon, 14 Sep 2020 22:48:40 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id gn24sm11034935pjb.8.2020.09.14.22.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 22:48:40 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-serial@vger.kernel.org
Subject: [PATCH v2 1/2] tty: serial: print earlycon info after match->setup
Date: Tue, 15 Sep 2020 13:48:25 +0800
Message-Id: <20200915054825.3289105-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_014843_513456_233F5867 
X-CRM114-Status: GOOD (  12.92  )
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
Cc: Eddie Huang <eddie.huang@mediatek.com>,
 Changqi Hu <changqi.hu@mediatek.com>,
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
Change:
v1->v2: rename function
---
 drivers/tty/serial/earlycon.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/earlycon.c b/drivers/tty/serial/earlycon.c
index 2ae9190b64bb9..b70877932d47d 100644
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
+static void __init earlycon_print_info(struct earlycon_device *device)
+{
+	struct console *earlycon = device->con;
+	struct uart_port *port = &device->port;
 
 	if (port->iotype == UPIO_MEM || port->iotype == UPIO_MEM16 ||
 	    port->iotype == UPIO_MEM32 || port->iotype == UPIO_MEM32BE)
@@ -140,6 +145,7 @@ static int __init register_earlycon(char *buf, const struct earlycon_id *match)
 
 	earlycon_init(&early_console_dev, match->name);
 	err = match->setup(&early_console_dev, buf);
+	earlycon_print_info(&early_console_dev);
 	if (err < 0)
 		return err;
 	if (!early_console_dev.con->write)
@@ -302,6 +308,7 @@ int __init of_setup_earlycon(const struct earlycon_id *match,
 	}
 	earlycon_init(&early_console_dev, match->name);
 	err = match->setup(&early_console_dev, options);
+	earlycon_print_info(&early_console_dev);
 	if (err < 0)
 		return err;
 	if (!early_console_dev.con->write)
-- 
2.28.0.618.gf4bc123cb7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
