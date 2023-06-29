Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CF4C001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jun 2023 19:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKFlMf4q7+OSI+/Z3h/oCKDpx6NZBtGqhC20B6VZJFQ=; b=wWFBbf4DMhx75at1lEimKX6sKH
	hMSLRQzhY73STi6ik9wxzbcVuWYYkdHyqxGz3y9F0wYZAOB/mnGI6f8i2gS6ZYXGCbFahOP3QWq/R
	9LMxecc12JSAlEfzkaE6vSaJ9xhYIYYSKGgNikTKDHh3FVKFF972SBvWuhrdDpTvGw6dja/p0aNxh
	N6P42+IiAu1NJuV+qXus9uK4+sT2VyzvD3wA4vis9TLcl+HjCewkYIyT+T/vgnPG488X3Cxn2H+UH
	hKMeC5OghrolmwAV6+XyV62quU2Q4vNY3PM6jpnU+41kTZBDmUEJUnAIjRccOhz8H8lc9Pql9BOgm
	EXQvorzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEwuR-001rlq-0q;
	Thu, 29 Jun 2023 19:02:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEwuF-001rdE-0z;
	Thu, 29 Jun 2023 19:02:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C310161616;
	Thu, 29 Jun 2023 19:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4485AC4339A;
	Thu, 29 Jun 2023 19:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688065334;
	bh=g2nnAaWXoJjDMmOkoyWfPt9dEf5Fmjq1wR3BX/785SQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z3+7hNUXgxo8kC3itjbPW3neRHgEPgHWrJ8e2cVYs9Art35MDBTK6yo2FMSSA9J82
	 4L25QEY+a1ZFT6WqGbbIznX/tz/3dy2IuatSmPJqt/A1J2DVpJgcklJR6dGWribWn9
	 Xp9hCqpbH8speoLzUaFlt0+hjIr8LdDbnyHWu9La/PhabZ7IrJtR1ApMsqdK8w+Ka8
	 mnPUUN1wqDNElV2UN9Z1YM98VuGEvUjjM1mPY2/qo2oIDOf50w7ocfeqtu5hyxYrSf
	 /1IvNQ8E0on8whBZMyan7tkogAmKu55nfiB95dH1yvZvIQXdNw1jSOy+8sU90Pqi8s
	 NrjF7edjpTWbg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	sean.wang@kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 2/5] pinctrl: meditatek: Startup with the IRQs disabled
Date: Thu, 29 Jun 2023 15:02:09 -0400
Message-Id: <20230629190212.908306-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230629190212.908306-1-sashal@kernel.org>
References: <20230629190212.908306-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.248
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_120215_439129_28BE2051 
X-CRM114-Status: GOOD (  15.12  )
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

From: Ricardo Ribalda <ribalda@chromium.org>

[ Upstream commit 11780e37565db4dd064d3243ca68f755c13f65b4 ]

If the system is restarted via kexec(), the peripherals do not start
with a known state.

If the previous system had enabled an IRQs we will receive unexected
IRQs that can lock the system.

[   28.109251] watchdog: BUG: soft lockup - CPU#0 stuck for 26s!
[swapper/0:0]
[   28.109263] Modules linked in:
[   28.109273] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
5.15.79-14458-g4b9edf7b1ac6 #1 9f2e76613148af94acccd64c609a552fb4b4354b
[   28.109284] Hardware name: Google Elm (DT)
[   28.109290] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS
		BTYPE=--)
[   28.109298] pc : __do_softirq+0xa0/0x388
[   28.109309] lr : __do_softirq+0x70/0x388
[   28.109316] sp : ffffffc008003ee0
[   28.109321] x29: ffffffc008003f00 x28: 000000000000000a x27:
0000000000000080
[   28.109334] x26: 0000000000000001 x25: ffffffefa7b350c0 x24:
ffffffefa7b47480
[   28.109346] x23: ffffffefa7b3d000 x22: 0000000000000000 x21:
ffffffefa7b0fa40
[   28.109358] x20: ffffffefa7b005b0 x19: ffffffefa7b47480 x18:
0000000000065b6b
[   28.109370] x17: ffffffefa749c8b0 x16: 000000000000018c x15:
00000000000001b8
[   28.109382] x14: 00000000000d3b6b x13: 0000000000000006 x12:
0000000000057e91
[   28.109394] x11: 0000000000000000 x10: 0000000000000000 x9 :
ffffffefa7b47480
[   28.109406] x8 : 00000000000000e0 x7 : 000000000f424000 x6 :
0000000000000000
[   28.109418] x5 : ffffffefa7dfaca0 x4 : ffffffefa7dfadf0 x3 :
000000000000000f
[   28.109429] x2 : 0000000000000000 x1 : 0000000000000100 x0 :
0000000001ac65c5
[   28.109441] Call trace:
[   28.109447]  __do_softirq+0xa0/0x388
[   28.109454]  irq_exit+0xc0/0xe0
[   28.109464]  handle_domain_irq+0x68/0x90
[   28.109473]  gic_handle_irq+0xac/0xf0
[   28.109480]  call_on_irq_stack+0x28/0x50
[   28.109488]  do_interrupt_handler+0x44/0x58
[   28.109496]  el1_interrupt+0x30/0x58
[   28.109506]  el1h_64_irq_handler+0x18/0x24
[   28.109512]  el1h_64_irq+0x7c/0x80
[   28.109519]  arch_local_irq_enable+0xc/0x18
[   28.109529]  default_idle_call+0x40/0x140
[   28.109539]  do_idle+0x108/0x290
[   28.109547]  cpu_startup_entry+0x2c/0x30
[   28.109554]  rest_init+0xe8/0xf8
[   28.109562]  arch_call_rest_init+0x18/0x24
[   28.109571]  start_kernel+0x338/0x42c
[   28.109578]  __primary_switched+0xbc/0xc4
[   28.109588] Kernel panic - not syncing: softlockup: hung tasks

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Link: https://lore.kernel.org/r/20221122-mtk-pinctrl-v1-1-bedf5655a3d2@chromium.org
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/mediatek/mtk-eint.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 7e526bcf5e0b5..24502dfeb83fc 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -277,12 +277,15 @@ static struct irq_chip mtk_eint_irq_chip = {
 
 static unsigned int mtk_eint_hw_init(struct mtk_eint *eint)
 {
-	void __iomem *reg = eint->base + eint->regs->dom_en;
+	void __iomem *dom_en = eint->base + eint->regs->dom_en;
+	void __iomem *mask_set = eint->base + eint->regs->mask_set;
 	unsigned int i;
 
 	for (i = 0; i < eint->hw->ap_num; i += 32) {
-		writel(0xffffffff, reg);
-		reg += 4;
+		writel(0xffffffff, dom_en);
+		writel(0xffffffff, mask_set);
+		dom_en += 4;
+		mask_set += 4;
 	}
 
 	return 0;
-- 
2.39.2


