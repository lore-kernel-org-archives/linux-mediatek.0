Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C250C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 09:30:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C94C161963
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 09:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C94C161963
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9IcitmxpppW0FTOrxM/mrjuPWMvGm35xtg2LJcZ7LyA=; b=dYkJCt3MljlrQeNqhx7OSY4Ad0
	FlCpnvZSA5Gs751OGPdrQD46OO1dI67LC5BuQtvoQGWEdd5w6gXRHYONZFDLSnVvVH59VSJwIdgHK
	M/NEW8GLG/isd1JEHysraxgd7c3BHU6MO40USN2p2Jk6dFUMCWYowxGxj7MK5f3OCdGptL9VfAbN3
	w6+lkFssX28AJO6IYjfmCyCN5LpyOn5ShEGpVp8TZBgVart6bO7bjTuuGZDYt4J7ltCgbQiO1bBr3
	t7fWVO8TsSesF7wZEsp3nZCXlffP9nIkNaG47YL82DrZdPhYBU5TcfT5ktzOBslOs/W6sdg2K2v1a
	m2WbACXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOdMd-00ESO7-DS; Tue, 23 Mar 2021 09:30:15 +0000
Received: from m12-15.163.com ([220.181.12.15])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOdMQ-00ESLw-Aj; Tue, 23 Mar 2021 09:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=bipQG
 YVg/aKbJfujEx4JlQC2HuVAoinKOBHzXNgUhQU=; b=Y2Stt8aDoK3pbbJDUJ0ck
 qYfE/+hDen9WV6ndxdUak0h+RuEZapgOx7DRLeYxtZrTqBSfnqFyLYr6ZCkvB0pD
 QRMRTJ4j5qMndtuT4geI0A4ZY9Raned6sor6mDrI+M5PubzTVUIULeQId7hHlhbH
 GPYD/6j+bI5LEaX7c3ZNZU=
Received: from caizhichao.ccdomain.com (unknown [218.94.48.178])
 by smtp11 (Coremail) with SMTP id D8CowAAnp_zDtFlgrhxcGA--.56S2;
 Tue, 23 Mar 2021 17:29:04 +0800 (CST)
From: caizhichao <tomstomsczc@163.com>
To: gregkh@linuxfoundation.org,
	matthias.bgg@gmail.com
Cc: jirislaby@kernel.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, caizhichao <caizhichao@yulong.com>
Subject: [PATCH] tty:serial: fix spelling typo of values
Date: Tue, 23 Mar 2021 17:28:46 +0800
Message-Id: <20210323092846.819-1-tomstomsczc@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: D8CowAAnp_zDtFlgrhxcGA--.56S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr1DZw4fCF13tw45ArWrKrg_yoWfWFcE9r
 WkXwsxZ3sYyF4vkw15Arn8urWSka1UuFn7Aa40qr9rA398Zw4kAFy0vrZ8tw1vqFs3Zr9r
 Ar1UKr1xKw1UWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnjZX7UUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: pwrp23prpvu6rf6rljoofrz/xtbBdQBeilaD+k53QQAAs2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_093003_303526_A2F40930 
X-CRM114-Status: GOOD (  11.11  )
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

From: caizhichao <caizhichao@yulong.com>

vaules -> values

Signed-off-by: caizhichao <caizhichao@yulong.com>
---
 drivers/tty/serial/8250/8250_mtk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index f7d3023..c6633dc 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -325,7 +325,7 @@ static void mtk8250_set_flow_ctrl(struct uart_8250_port *up, int mode)
 	 * Mediatek UARTs use an extra highspeed register (MTK_UART_HIGHS)
 	 *
 	 * We need to recalcualte the quot register, as the claculation depends
-	 * on the vaule in the highspeed register.
+	 * on the value in the highspeed register.
 	 *
 	 * Some baudrates are not supported by the chip, so we use the next
 	 * lower rate supported and update termios c_flag.
-- 
1.9.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
