Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD942C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Feb 2022 12:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRqVp7zS16Ej/f59fobFAlDk/NdLeOgi5L3G9ygsEbg=; b=Ucg3ebG/GcnkM6
	2OcLUk+9SHQ2zuzAV7z3ncT2JTJhusv72XUdU8oJKQICHLrXwj454J5Invl9+dgejEEf69n2wGIl6
	a6mPTRO+c+HNRi6CyMHksqUCPTPZ3bQuJu4H5c4Zj9n62wR0QWG6gBMFDPFhV6cZrnX3B/9HuF8jp
	daRNeBQSRgV0Qpf0qOpgVYKZNmtt48v1THZZuvZ9qQDoVURpnlAPpjSfNLl1so493/C9eP9Vf3+fP
	L049vgcZNsQ5pcH/TjTpPAxWaV+YJUMS51S3cZhK3BtYMFdGlI9Ck48FPwcJWU+wcgUVNWDdKfIuH
	RDHgyNks4Zpkw6G9ZoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEs8x-00C2kP-KN; Tue, 01 Feb 2022 12:20:19 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEs8X-00C2cO-52; Tue, 01 Feb 2022 12:19:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6CB15CE1862;
 Tue,  1 Feb 2022 12:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A4CC340F3;
 Tue,  1 Feb 2022 12:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643717990;
 bh=YPnsZuKHzTt0USZewAkQ8dcDN1KgYjxmgRotElZ29kA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lzzyS+Je27Vic0KQ6SKZsB0x5RgTquGiRDYZvxgfXQeUubcPo3/lUdndokVU4WUBD
 6D44M30SVOrfUIVhqtOvyZLkqzjGzIn83fqhDIc2QiJtdB9PxmA9WP5rzY03djGxze
 pFuiyLhORMfcnsTguuG//idDDgk86SV3+HCRzQ47UmWN5NdRKx7S4NJdyJ9JVm/bJ4
 yV655smSrIyI869ex8sGxnUOy9XtmOkFTAG/pwIQfdTbRZ+91xxLLDLfOjZRsg4jik
 ppogTt/KiEfwFfkSrx1VFWY7uiaWYb9o8WA6vmEDclI10v38BM4NLxBOXOY0g+DJKg
 LpJqqIbFh++ww==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1nErsj-004d46-RR; Tue, 01 Feb 2022 12:03:33 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH 12/12] genirq: Kill irq_chip::parent_device
Date: Tue,  1 Feb 2022 12:03:10 +0000
Message-Id: <20220201120310.878267-13-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201120310.878267-1-maz@kernel.org>
References: <20220201120310.878267-1-maz@kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, matthias.bgg@gmail.com,
 grygorii.strashko@ti.com, ssantosh@kernel.org, khilman@kernel.org,
 tglx@linutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 kernel@esmil.dk
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_041953_603030_E7834E2C 
X-CRM114-Status: GOOD (  15.29  )
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

Now that noone is using irq_chip::parent_device in the tree, get
rid of it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/irq.h | 2 --
 kernel/irq/chip.c   | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 848e1e12c5c6..2cb2e2ac2703 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -456,7 +456,6 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
 /**
  * struct irq_chip - hardware interrupt chip descriptor
  *
- * @parent_device:	pointer to parent device for irqchip
  * @name:		name for /proc/interrupts
  * @irq_startup:	start up the interrupt (defaults to ->enable if NULL)
  * @irq_shutdown:	shut down the interrupt (defaults to ->disable if NULL)
@@ -503,7 +502,6 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
  * @flags:		chip specific flags
  */
 struct irq_chip {
-	struct device	*parent_device;
 	const char	*name;
 	unsigned int	(*irq_startup)(struct irq_data *data);
 	void		(*irq_shutdown)(struct irq_data *data);
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index a2a12cdbe872..24b6f2b40e5e 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1560,9 +1560,6 @@ int irq_chip_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 
 static struct device *irq_get_parent_device(struct irq_data *data)
 {
-	if (data->chip->parent_device)
-		return data->chip->parent_device;
-
 	if (data->domain)
 		return data->domain->dev;
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
