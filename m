Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF9E5C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 16:19:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94FFF2078D
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 16:19:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rwqmYjmB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94FFF2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UNu9eSy5i0fannYlH5PxbJOgIvsdgN20CtWDt+STqx8=; b=rwqmYjmB76IpgNg432IgLJq+2p
	mm5wdMbFKgjSKWEvFYPc6iUgYuipvyYOjoX+9W8sDWS/sNFQi0wgqp5j/W+2DpWF5fTE1QvkdGPIr
	O1I2LyZEtz9xMwSZQnmnfuShDoRNZebCHvA0ovDwYcd0wZeS35/mL7C06Ucxr1NTBwAt3iJOt5159
	bE+vGuMieUBzocMQvX6SnmJakL6ml3oSaBjGobAfkkVfefrjFVJWxOcxxxnNFx5tPedYeFHxEyQ1I
	r5p8cnYCaeNY4I+ZHAWXaFcbdc+qPT7PfC14DKdSW/qAwSCc8JsxKwwc5++j8k4OM1RWUNJASR7l0
	RehkFlXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Qo7-0005Lf-05; Wed, 19 Aug 2020 16:19:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Qo1-0005K1-Ul; Wed, 19 Aug 2020 16:19:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id A77BF299C37
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "irqchip/mtk-sysirq: Convert to a platform driver"
Date: Wed, 19 Aug 2020 18:19:07 +0200
Message-Id: <20200819161907.1155110-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_121918_104476_400A5310 
X-CRM114-Status: GOOD (  15.46  )
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
Cc: drinkcat@chromium.org, Jason Cooper <jason@lakedaemon.net>,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 Hanks Chen <hanks.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Frank Wunderlich <linux@fw-web.de>, Collabora Kernel ML <kernel@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This reverts commit f97dbf48ca43009e8b8bcdf07f47fc9f06149b36.

Although converting to a platform driver sounds good, doing this for the
MediaTek devices has a side effect, the probe of the driver is delayed
and the interrupt controller is not available for other drivers when
they probe. For MT8173 that means that the `systimer` and `mtk_cmdq`
drivers will fail to probe with the following errors:

  [    0.000197] Failed to map interrupt for /soc/timer@10008000
  [    0.000209] Failed to initialize '/soc/timer@10008000': -22
  [    0.067386] mtk_cmdq 10212000.mailbox: failed to register ISR (-22)

For MT8183, apart from the above errors, you will get the `pinctrl`
driver without the EINT support, because the `pinctrl` is probed before
the interrupt controller, for what is worth, then it doesn't booting
properly.

  [    0.062309] mt8183-pinctrl 10005000.pinctrl: Failed to add EINT, but pinctrl still can work

While deferring these drivers until the irqchip is available could be an
option, at this point, seems reasonable to revert this commit for now until
all these drivers are properly handling/deferring when the irqchip is not
available.

Cc: Saravana Kannan <saravanak@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Hanks Chen <hanks.chen@mediatek.com>
Fixes: f97dbf48ca43 ("irqchip/mtk-sysirq: Convert to a platform driver")
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 drivers/irqchip/irq-mtk-sysirq.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysirq.c
index 7299c5ab4d10..6ff98b87e5c0 100644
--- a/drivers/irqchip/irq-mtk-sysirq.c
+++ b/drivers/irqchip/irq-mtk-sysirq.c
@@ -231,6 +231,4 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
 	kfree(chip_data);
 	return ret;
 }
-IRQCHIP_PLATFORM_DRIVER_BEGIN(mtk_sysirq)
-IRQCHIP_MATCH("mediatek,mt6577-sysirq", mtk_sysirq_of_init)
-IRQCHIP_PLATFORM_DRIVER_END(mtk_sysirq)
+IRQCHIP_DECLARE(mtk_sysirq, "mediatek,mt6577-sysirq", mtk_sysirq_of_init);
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
