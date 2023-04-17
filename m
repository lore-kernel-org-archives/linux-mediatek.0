Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFBAC77B70
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 09:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZocelY8Xzrm6tgwprT9z94nG/u6U7wBfo/19biInwZI=; b=G8jzPClAJfFCYEJTx1NKsoNhJh
	YZSJfDNmKVdWqOGmCI31Ulh/btZTopg2LOsv7OHfB47jlI1momL4Qmqq+vFj2PtCmTXoSElOg646o
	3jSPRqQobWzPaz53RzAOPThknNGSlOVymttEE186a1aAJLkw/al7CfmCJbJ5mFRNflbU5iSRpRTYr
	AY6S4AuX8Ch/KfC6CnP3IQjF8tAxFo7YWoovt3guAFBeHMnW7y/1UF1nj6zSYV6gPMmLeE7C4eeAm
	QmOpWYw3cQVeGi592JIkdpQA656sefochZQJOeBhpQN3Dq5mVetlpWYVKgSH1GVO6kh1kzIAtjCh/
	vj3i0+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poLAY-00FYiM-0v;
	Mon, 17 Apr 2023 09:29:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poLAS-00FYbh-2k;
	Mon, 17 Apr 2023 09:29:04 +0000
X-UUID: 454efdfedd0211edb7d8d11f642b8e78-20230417
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZocelY8Xzrm6tgwprT9z94nG/u6U7wBfo/19biInwZI=;
	b=BB6SFsh29mmRrhNOBnpVa0b3i0Yo875FWC0/Hc940xeFy6ErleEYHL1n/aCMbd82n6adUt1Dt6ujj3SGbv5Zve9B4ucWRXzXHFaSD9Nx0AmD6GRSmp00cHgcElpFkfk0vXwfnSTGi2+8FMjXP3JFiAaH61r7B4mTpJZHPXcYnc4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:3be20388-d716-4ceb-95d0-9705e207c2b7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:c5b537eb-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 454efdfedd0211edb7d8d11f642b8e78-20230417
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <walter.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 238774868; Mon, 17 Apr 2023 02:28:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 17 Apr 2023 17:08:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 17 Apr 2023 17:08:17 +0800
From: <walter.chang@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <stanley.chu@mediatek.com>,
	<Chun-hung.Wu@mediatek.com>, <Freddy.Hsin@mediatek.com>, Walter Chang
	<walter.chang@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] clocksource/drivers/arm_arch_timer: Add workaround for MediaTek MMIO timer
Date: Mon, 17 Apr 2023 17:06:28 +0800
Message-ID: <20230417090635.13202-1-walter.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_022900_912308_D6A98050 
X-CRM114-Status: GOOD (  19.15  )
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

From: Walter Chang <walter.chang@mediatek.com>

The MT69XX series SoCs have the incomplete implementation issue in the
mmio timer. Specifically, the hardware only implements the TVAL
functionality, but not the CVAL functionality. This hardware limitation
will cause set_next_event_mem() fail to set the actual expiration time
when writing a value to the CVAL. On these platforms, the mmio timer's
internal expiration time will still be judged as 0 (the value of TVAL),
resulting in the mmio timer not functioning as intended.

The workaround is to use TVAL in addition to CVAL for these affected
platforms.

Signed-off-by: Walter Chang <walter.chang@mediatek.com>
---
 Documentation/arm64/silicon-errata.rst |  4 ++++
 drivers/clocksource/Kconfig            |  9 ++++++++
 drivers/clocksource/arm_arch_timer.c   | 29 ++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/Documentation/arm64/silicon-errata.rst b/Documentation/arm64/silicon-errata.rst
index ec5f889d7681..ca1893713a4c 100644
--- a/Documentation/arm64/silicon-errata.rst
+++ b/Documentation/arm64/silicon-errata.rst
@@ -209,3 +209,7 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Fujitsu        | A64FX           | E#010001        | FUJITSU_ERRATUM_010001      |
 +----------------+-----------------+-----------------+-----------------------------+
+
++----------------+-----------------+-----------------+-----------------------------+
+| MediaTek       | MT69XX series   | #690001         | MEDIATEK_ERRATUM_690001     |
++----------------+-----------------+-----------------+-----------------------------+
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 5fc8f0e7fb38..475356b8dbdc 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -368,6 +368,15 @@ config SUN50I_ERRATUM_UNKNOWN1
 	  the Allwinner A64 SoC. The workaround will only be active if the
 	  allwinner,erratum-unknown1 property is found in the timer node.
 
+config MEDIATEK_ERRATUM_690001
+	bool "Workaround for MediaTek MT69XX erratum 690001"
+	depends on ARM_ARCH_TIMER && ARM64
+	help
+	  This option enables a workaround for incomplete implementation
+	  in the MMIO timer on the MediaTek MT69XX SoCs. The workaround
+	  will only be active if mediatek,erratum-690001 property is
+	  found in the timer node.
+
 config ARM_GLOBAL_TIMER
 	bool "Support for the ARM global timer" if COMPILE_TEST
 	select TIMER_OF if OF
diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index e09d4427f604..920570d57fc0 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -389,6 +389,10 @@ static u64 notrace sun50i_a64_read_cntvct_el0(void)
 }
 #endif
 
+#ifdef CONFIG_MEDIATEK_ERRATUM_690001
+static bool arch_timer_mem_sne_use_tval __ro_after_init;
+#endif
+
 #ifdef CONFIG_ARM_ARCH_TIMER_OOL_WORKAROUND
 DEFINE_PER_CPU(const struct arch_timer_erratum_workaround *, timer_unstable_counter_workaround);
 EXPORT_SYMBOL_GPL(timer_unstable_counter_workaround);
@@ -783,6 +787,19 @@ static __always_inline void set_next_event_mem(const int access, unsigned long e
 		cnt = arch_counter_get_cnt_mem(timer, CNTPCT_LO);
 
 	arch_timer_reg_write(access, ARCH_TIMER_REG_CVAL, evt + cnt, clk);
+#ifdef CONFIG_MEDIATEK_ERRATUM_690001
+	if (arch_timer_mem_sne_use_tval) {
+		/* Due to the incomplete implementation of mmio timer on
+		 * specific MediaTek platforms, CVAL has not been implemented.
+		 * Therefore, the workaround is to use TVAL in addition to
+		 * CVAL.
+		 */
+		if (access == ARCH_TIMER_MEM_VIRT_ACCESS)
+			writel_relaxed(evt, timer->base + 0x38);
+		else
+			writel_relaxed(evt, timer->base + 0x28);
+	}
+#endif
 	arch_timer_reg_write(access, ARCH_TIMER_REG_CTRL, ctrl, clk);
 }
 
@@ -878,7 +895,16 @@ static void __arch_timer_setup(unsigned type,
 				arch_timer_set_next_event_phys_mem;
 		}
 
+#ifdef CONFIG_MEDIATEK_ERRATUM_690001
+		if (arch_timer_mem_sne_use_tval) {
+			pr_info("Enabling mediatek,erratum-690001 for mmio timer\n");
+			max_delta = CLOCKSOURCE_MASK(31);
+		} else {
+			max_delta = CLOCKSOURCE_MASK(56);
+		}
+#else
 		max_delta = CLOCKSOURCE_MASK(56);
+#endif
 	}
 
 	clk->set_state_shutdown(clk);
@@ -1591,6 +1617,9 @@ static int __init arch_timer_mem_of_init(struct device_node *np)
 		frame->valid = true;
 	}
 
+#ifdef CONFIG_MEDIATEK_ERRATUM_690001
+	arch_timer_mem_sne_use_tval = of_property_read_bool(np, "mediatek,erratum-690001");
+#endif
 	frame = arch_timer_mem_find_best_frame(timer_mem);
 	if (!frame) {
 		pr_err("Unable to find a suitable frame in timer @ %pa\n",
-- 
2.18.0


