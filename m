Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3555C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 09:45:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4E7A60F9E
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 09:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A4E7A60F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xj3qGiSsACvIJSfKZUKuMeLKxBn7VYFIqRh7eKnTgfA=; b=a3waZfY44APgaR
	IkoDET7BS/PvTkmP/Y2CzY3MHmzqXaEdY7VfUD9lovtX7oj1YybCNsR+a6uxhgdW/GQHPXEymoHyE
	3RQc9EsV5WfCGjm8BeJC08O5EeIdiAnJvxbZ5pokMjvi+RidMzLm+7VxbqqXUZwiTla57gg2vKCeL
	UIGjq6xfAUfr8ZtdXfX01ZCmBmzC7kasoqFf1Ki5gIkDbDIUJ8H/Yy3RYtNJGwQvVwbE8GmPXsnlN
	05yiGg/gxqEYVFlSackz6tR4UZw8BQvt7zdqq80uRXEadTgawShxag2uUKc6dTB9gWQviZoR7ElHP
	nBIDJITFGwK0hiNaT2jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8g86-000EgE-2x; Wed, 28 Jul 2021 09:45:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8g81-000EdL-QX; Wed, 28 Jul 2021 09:45:32 +0000
X-UUID: b00c2e210c1e462dae660fd2e1d66c2a-20210728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xF8hbk4jCk23ZVJBz7HdpkmnqD1ada3q8ubhkle6V+8=; 
 b=B6G7tIrO+ZGN38FmIPErTNfQSg2qSIo2eqKjoVzgVFk1EBm5f4c1NmxKvEgmEyKgpGEPy7MJPtNMIccKr+RCRGzjmBhDTWP0JfUX8SwfMjti0u9Qxlkor0S7GfBe1vl3qpg+7gMZM26W2at6hCA5elAK/cbUvpayWsWj6nVWRZc=;
X-UUID: b00c2e210c1e462dae660fd2e1d66c2a-20210728
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1989647693; Wed, 28 Jul 2021 02:45:24 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 02:45:22 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 17:45:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 28 Jul 2021 17:45:21 +0800
From: <yee.lee@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <nicholas.Tang@mediatek.com>, <Kuan-Ying.lee@mediatek.com>,
 <chinwen.chang@mediatek.com>, Yee Lee <yee.lee@mediatek.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Marc Zyngier <maz@kernel.org>, David Brazdil
 <dbrazdil@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Ionela Voinescu <ionela.voinescu@arm.com>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>, Quentin Perret
 <qperret@google.com>, Andrew Scull <ascull@google.com>, James Morse
 <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, "moderated list:ARM64
 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] arm64/cpufeature: Add option to disable mte support
Date: Wed, 28 Jul 2021 17:42:58 +0800
Message-ID: <20210728094302.9949-2-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210728094302.9949-1-yee.lee@mediatek.com>
References: <20210728094302.9949-1-yee.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_024530_702535_A431FF6F 
X-CRM114-Status: GOOD (  17.45  )
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

From: Yee Lee <yee.lee@mediatek.com>

Add a static key to exapnd the logic of system_supports_mte().
This function controls mte enablement in both EL1 and EL0.

The static key, "arm64_mte_support" is default true and can
be disabled via the early_param.

Signed-off-by: Yee Lee <yee.lee@mediatek.com>
---
 arch/arm64/include/asm/cpufeature.h |  4 +++-
 arch/arm64/kernel/cpufeature.c      | 13 +++++++++++++
 arch/arm64/kernel/image-vars.h      |  3 +++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 9bb9d11750d7..0e5c82f2e012 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -420,6 +420,7 @@ static __always_inline bool is_hyp_code(void)
 extern DECLARE_BITMAP(cpu_hwcaps, ARM64_NCAPS);
 extern struct static_key_false cpu_hwcap_keys[ARM64_NCAPS];
 extern struct static_key_false arm64_const_caps_ready;
+extern struct static_key_true arm64_mte_support;
 
 /* ARM64 CAPS + alternative_cb */
 #define ARM64_NPATCHABLE (ARM64_NCAPS + 1)
@@ -756,7 +757,8 @@ static __always_inline bool system_uses_irq_prio_masking(void)
 static inline bool system_supports_mte(void)
 {
 	return IS_ENABLED(CONFIG_ARM64_MTE) &&
-		cpus_have_const_cap(ARM64_MTE);
+		cpus_have_const_cap(ARM64_MTE) &&
+		static_branch_likely(&arm64_mte_support);
 }
 
 static inline bool system_has_prio_mask_debugging(void)
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 0ead8bfedf20..b1602ad3d7c0 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1840,9 +1840,22 @@ static void bti_enable(const struct arm64_cpu_capabilities *__unused)
 }
 #endif /* CONFIG_ARM64_BTI */
 
+DEFINE_STATIC_KEY_TRUE(arm64_mte_support);
+EXPORT_SYMBOL(arm64_mte_support);
 #ifdef CONFIG_ARM64_MTE
+static int __init disable_arm64_mte_support(char *str)
+{
+	static_branch_disable(&arm64_mte_support);
+	return 0;
+}
+early_param("arm64_mte_not_support", disable_arm64_mte_support);
+
 static void cpu_enable_mte(struct arm64_cpu_capabilities const *cap)
 {
+	if(!system_supports_mte()){
+		pr_info("MTE is disabled since system does not support.\n");
+		return ;
+	}
 	/*
 	 * Clear the tags in the zero page. This needs to be done via the
 	 * linear map which has the Tagged attribute.
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index c96a9a0043bf..04cf30ec84e7 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -83,6 +83,9 @@ KVM_NVHE_ALIAS(__icache_flags);
 KVM_NVHE_ALIAS(arm64_const_caps_ready);
 KVM_NVHE_ALIAS(cpu_hwcap_keys);
 
+/* Static key which indicates if system supports mte */
+KVM_NVHE_ALIAS(arm64_mte_support);
+
 /* Static keys which are set if a vGIC trap should be handled in hyp. */
 KVM_NVHE_ALIAS(vgic_v2_cpuif_trap);
 KVM_NVHE_ALIAS(vgic_v3_cpuif_trap);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
