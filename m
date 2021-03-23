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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EAAC433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 11:56:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 739B36191F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 11:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 739B36191F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qzJ5TbDhMjJdgQzB7WSTX7jIwagoaAjL7q5raf+2lH4=; b=IRkHxgcvQW5NlE49VrGkjjReME
	CddDUKtUFfsj5O7q3YlQPiNlNh2HTqYE5uAImr1qdMsed2oFmD8LTbTFi55KqibcKzZ1Sas2xnpDg
	5uMI3k/4lC6X0ObOkkJK1Gxlz8ahLF0KcQBS27hMAFoioRsRX4duhwEOvHVEPW/rg6bHi6n8GIRa1
	odaWWKxltGbiZNa71R+wCDwCfH/3KD6R15YIhJdeUP/wYoEubzte5XFExjA0iRCnylReqKrH46bx3
	UVDM/1fTWg3ueueI5NkCPxt+D8vPkDXbAbnCw+XkGFDDdP/4TsGhdvHsOsH7M3mFOfyk8PQvPWimc
	M5mq1jmg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOfda-00EqbY-AN; Tue, 23 Mar 2021 11:55:54 +0000
Received: from m12-17.163.com ([220.181.12.17])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOfcs-00EqLz-Mz; Tue, 23 Mar 2021 11:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=yld4K
 a6D/wNwWDvksBvh6iy6WYppMiQm7zrvFrJHt3s=; b=dW1Sny9s5Ae6DtuW+PeGB
 7ASNO/xvjQSC91dY8DM6YSVAflJQZk+32eQtPnOzNgYi97YEa+/8d4FupeT09nsG
 CQA4txSQWGKEm+dGduNrsZlpQVAoGlx7K2MX7bZ14WjnSTqXv9hGCuNfGP+FJi0V
 7SDne3DzAROU4I3GOeJFew=
Received: from caizhichao.ccdomain.com (unknown [218.94.48.178])
 by smtp13 (Coremail) with SMTP id EcCowAA3P5f01llgllIkrg--.21875S2;
 Tue, 23 Mar 2021 19:54:37 +0800 (CST)
From: caizhichao <tomstomsczc@163.com>
To: gregkh@linuxfoundation.org,
	matthias.bgg@gmail.com
Cc: jirislaby@kernel.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, caizhichao <caizhichao@yulong.com>
Subject: [PATCH v3] tty:serial: fix spelling typo of values
Date: Tue, 23 Mar 2021 19:53:27 +0800
Message-Id: <20210323115327.1199-1-tomstomsczc@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: EcCowAA3P5f01llgllIkrg--.21875S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr1DJF1fXF4DAw48Gw4fAFb_yoWfuFcE9r
 1kXwsxZwnYyFnYkw15Arn8urWIka1UWF1xA3W8X3srA398Za1kAFy0vrZ8tr1vqFn3Ary7
 Ar1DKr1xtw1DujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnjL9UUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: pwrp23prpvu6rf6rljoofrz/1tbiXx5eil1502GPfQAAsx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_115511_674301_C1861BC4 
X-CRM114-Status: GOOD (  11.36  )
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

Signed-off-by: Zhichao Cai <caizhichao@yulong.com>
---
v3: use full name and capitalize personal name.
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
