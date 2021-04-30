Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92D9C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 12:44:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E4AE61468
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 12:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E4AE61468
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hbtk26L7Ldjlm2qj+WHFmY6+kBXnWOi2aJplSI6cwqw=; b=RCnw7+ZwZjIYpBKC9Kq5DpIpr6
	9f8UVsWnRYJWDkC0xbam2zMzK5n1BX2ztDrw5Ds6l7JvxHKf9zJMoJmc0tENBDxnuJHoZ7xKhZBJE
	cw2wcU02GBJFeJwWeKXyKh57LFZSzE+t8E8wrqEWE8QEzuiQt48A1oT/QKL1k3WY2pCOD6vJcZ7wt
	YpmsST9uvstzUbJJCgDyUFmB0Hu0uOVCeZdOu6saLK7Tpow/I7hygroqBgXRPNL+BJPbQPLW8nxMS
	2vw90zomcVcQyFljGHo6aO7Ifc2tA7oTzvqI6x4vowdmuH+GEbiZZidPfCxkeyn+j5g7E+AopgJXx
	8lzWh0tQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcSUx-007r8Z-TW; Fri, 30 Apr 2021 12:43:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcSUl-007qnt-Tb; Fri, 30 Apr 2021 12:43:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Icrc7EFL5BUHi1eYahCvzZ+YzD3iOur+Sxb89HRIcns=; b=pyH6WYTA9H8gKYfokBHE6/WArz
 FYuWKJb9w5yfqBRj0AnWdcPTew9ElKb6EY6vI6FC0LPM9BV/S2vizmj6uUtoNe85t2siZNIgM9Eb5
 10bkFREDT6n+uJ8RyyhkMKyil9p9OI/5bebD8xp/DVaZUOofLyh/9f+aqNPUCyiWTVG80aFHDBQ9t
 5qnjQJSOGkqRgZMM/E5dUDun4xWT2EJaG7Q0E4IGn5+cM9WYvBhuo8z5f1QAj+7Pj3M/aB+7E877I
 tByX0DQyXo0p0VOGYDHWdLnQdHS8FuDIM6/HXUOntTdawye5CPh/TCfmqN6zFlXI2g+yQLXc2vQ6A
 90Ku/IfA==;
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcSUh-001NYE-Jb; Fri, 30 Apr 2021 12:43:46 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout1.routing.net (Postfix) with ESMTP id 7C9764009A;
 Fri, 30 Apr 2021 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1619786614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Icrc7EFL5BUHi1eYahCvzZ+YzD3iOur+Sxb89HRIcns=;
 b=dSw6qOZOcuuy0Y16DK9t3T5tJDiGkH9DdNysT8eVGLodCZoYpJf5qnSjJ/8YB1XnebO720
 +DuUAJ8cCqo7G3eYgEf443jhKFkv/mDD5gIlnM0R6VdTIkQ8U7WSDt9MH5TjCzwjcfF6Vx
 P3/+ts9c3RX8y92JqgIIQYjSuB/1dVw=
Received: from localhost.localdomain (fttx-pool-157.180.225.50.bambit.de
 [157.180.225.50])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 7F99F360499;
 Fri, 30 Apr 2021 12:43:33 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>, Bin Liu <b-liu@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 David Miller <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>
Subject: [PATCH] musb: mediatek: rename driver
Date: Fri, 30 Apr 2021 14:43:17 +0200
Message-Id: <20210430124317.97376-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: 90a10fd3-9eba-4320-aec9-e63f16763ee2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_054343_956043_C8BD22AA 
X-CRM114-Status: UNSURE (   8.40  )
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

From: Frank Wunderlich <frank-w@public-files.de>

currently unspecific mediatek.ko is built,
change this by adding subsystem

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/usb/musb/Makefile                   | 2 +-
 drivers/usb/musb/{mediatek.c => musb_mtk.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/usb/musb/{mediatek.c => musb_mtk.c} (100%)

diff --git a/drivers/usb/musb/Makefile b/drivers/usb/musb/Makefile
index 932247360a9f..82928d4fd42a 100644
--- a/drivers/usb/musb/Makefile
+++ b/drivers/usb/musb/Makefile
@@ -24,7 +24,7 @@ obj-$(CONFIG_USB_MUSB_DA8XX)			+= da8xx.o
 obj-$(CONFIG_USB_MUSB_UX500)			+= ux500.o
 obj-$(CONFIG_USB_MUSB_JZ4740)			+= jz4740.o
 obj-$(CONFIG_USB_MUSB_SUNXI)			+= sunxi.o
-obj-$(CONFIG_USB_MUSB_MEDIATEK)      		+= mediatek.o
+obj-$(CONFIG_USB_MUSB_MEDIATEK)      		+= musb_mtk.o
 
 # the kconfig must guarantee that only one of the
 # possible I/O schemes will be enabled at a time ...
diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/musb_mtk.c
similarity index 100%
rename from drivers/usb/musb/mediatek.c
rename to drivers/usb/musb/musb_mtk.c
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
