Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B0FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 23:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wxy0YJGRu28+kXIMnGm5ksdj5bsJ6M29Jqnb1htLkh4=; b=2GkdbVIGaEfffs
	YD0gZ7xomTTDzTKRE5Is2mODiXfETPj5eMhZlzkfkoyLGrxNNUguVq/k/tPHt5vOfxZIN+brXtbPT
	D9m2MObwFe3U/KFu2qzizdmaVQY7+a7Zx2loWCvElc+7CLeIo6ioy1YkSO1upXsbBbDVap8SSofk8
	0+t1+/UNO33e9S20Ij6QZgpuUiwveB+ekzfA7lUt+SxPjBwGsovsOMJoZg/NxhlY5Oim7DCRMh9Je
	JyGOh/JumcUpVJ95LoL6f44nn+HmlXyq+GXg0/RGuk1domg04ZO990d4Pv0nelslhJhx+CGVWmWkU
	20E7ys0+Rq9JGvv0y+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRMLm-001sty-4Q; Mon, 07 Mar 2022 23:01:10 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRMLa-001srw-8w; Mon, 07 Mar 2022 23:00:59 +0000
Received: by mail-wr1-x433.google.com with SMTP id j17so25756148wrc.0;
 Mon, 07 Mar 2022 15:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MXb6dcYiaIaX9vW+hIgXAOrUp0mAL09kFtXf/8jaaiQ=;
 b=mCkLiR1F+3uFUHN4Cux2+9V699zxWgmjUYLh3QxL34WUQrw+14T92MMla/vjH+80f/
 NWmngOJz6CORhAQ52gzeRJEknJGUvCMFo2lY5mUBfNIx1k761D8dwepm6nB+KcTS8r29
 Z/tL8471T4EdmOur5LT0/MvjtYjU5dlT04NZIO3jsWRzYtfZk2gRGL474nJBcrAeqOHW
 PBvBIg6dtvZlqNAGWAFD+Obd03An8gMA9WnL4BzFHq4M+MltcqsinuY3fAsPawHp7R6o
 gmp4MOp1xj5bRkLarNdnDzD1aaiEhTalnZZmaSr5gNDoxZUMjq/Tan25jljU+w/4gKRS
 /bbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MXb6dcYiaIaX9vW+hIgXAOrUp0mAL09kFtXf/8jaaiQ=;
 b=H2S9Hh/uDM7qBTzzirM/vsfIN7/65bCbTckqyWKLmUyd6PVan8metIjg2srTPL4Exf
 lrPljo4S/CzUVhUKozOPOvX+rrMlevNeoLaycvPSK3uAL0xP1MnIziGoG7NHZ6sa5rXl
 Z/eyYQcIi4nHNGMvOgSM54sbXPR/0b3DGA/IhubFmr65QRJXQBPMqUIEH25pw5YersNg
 ZqV4vwTdtgKmgPHApHKFd8pqGapOmZC3lLbOvNMYT335UZWrxbvrxQiZJFD5Q/8GnxGv
 GrvH+Ii2097K+OEqE0I0pDTbbaBxRsIO07CE8hORF1+3/aoplUSMjtFDAJaAy/cAPI1o
 eQ9w==
X-Gm-Message-State: AOAM531PMkjFkR7iPF6pAO6TzCxuYJ0eIeMQEgmoQp3lr/yiOir5Abw4
 +iT0sectgsj3J452hNYsqMQ=
X-Google-Smtp-Source: ABdhPJzJ4l1a9rSOdkV9CuwVNPwfslbOek/f6oelAsw9LuF2HFvchYiiPxOVoaPIELc7zCRCOUd3kA==
X-Received: by 2002:adf:aadd:0:b0:1f0:4848:2748 with SMTP id
 i29-20020adfaadd000000b001f048482748mr10101067wrc.75.1646694056979; 
 Mon, 07 Mar 2022 15:00:56 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 l25-20020a1c7919000000b0038999b380e9sm538653wme.38.2022.03.07.15.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 15:00:56 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] serial: 8250_mtk: make two read-only arrays static const
Date: Mon,  7 Mar 2022 23:00:55 +0000
Message-Id: <20220307230055.168241-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_150058_350523_561844F3 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Don't populate the read-only arrays fraction_L_mapping and
fraction_M_mapping on the stack but instead make them static
const. Also makes the object code a little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/tty/serial/8250/8250_mtk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index fb65dc601b23..f4a0caa56f84 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -289,10 +289,10 @@ static void
 mtk8250_set_termios(struct uart_port *port, struct ktermios *termios,
 			struct ktermios *old)
 {
-	unsigned short fraction_L_mapping[] = {
+	static const unsigned short fraction_L_mapping[] = {
 		0, 1, 0x5, 0x15, 0x55, 0x57, 0x57, 0x77, 0x7F, 0xFF, 0xFF
 	};
-	unsigned short fraction_M_mapping[] = {
+	static const unsigned short fraction_M_mapping[] = {
 		0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3
 	};
 	struct uart_8250_port *up = up_to_u8250p(port);
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
