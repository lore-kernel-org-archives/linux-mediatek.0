Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF826E94135
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 22:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0RzCHBb9WoSeOhmw11duqctRmWYwOtRpdu2I7EOG8ak=; b=Fi13IDaeawDhLCyZVn/x7OGsb0
	fZUI5T0c0+8v7U2feGrhsvvXEHHe6mfQrKNGSAfV+VjggwRbEgY1YGRCrg8rxsPhyZeFpsWak0RWC
	fhJJDeam+TzdEdOI5Ba8+Vc3mBvexoPboCpm2zk6bMIOZ5K7Pz8NBfv46IbMm77Xb/uM0tqOisFdQ
	z1cO0WoZ58fL3xQgbahhaiBMcSTnCZD53iLLiOKh456v7x2NlRJD3aOTSSEdcMHWR/L6fWjEcpGP0
	EMm1GA11/WMYAanKpMn+/dwiPiHUSwHOtg5pdtag9SLxejRwJeZsIXtOEKIZOArhvJ3yvJw4hBNma
	crJzfQWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qot7S-006Znk-2C;
	Fri, 06 Oct 2023 22:16:26 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qot7O-006ZmC-0E
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Oct 2023 22:16:24 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-578d0d94986so1915291a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Oct 2023 15:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696630578; x=1697235378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0RzCHBb9WoSeOhmw11duqctRmWYwOtRpdu2I7EOG8ak=;
        b=Eg2W5c9nmwQA5V0h0O1TgjYO0jojKjvhgfuiiueshXumSbQKsEJ9+i5pLNQKBS0GgZ
         LovoDYS4U4/nEmeu2SyMCjLeasMd2zoiRDXGIho/vNylTPe8cawkawIE5M0rRUi/R1WU
         P0IE0mcGW6ZN9fzROTkF3VGF4HKSL7US0jdbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696630578; x=1697235378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0RzCHBb9WoSeOhmw11duqctRmWYwOtRpdu2I7EOG8ak=;
        b=ABy5/P+y/KpNBCOct04CdkGyw4vf1gyV8G+snH/McdBaYK1s46LPw1TkOrm1pnVR/B
         at7ZeLTOyTEyTlORkW05PDlTlFlkYeaf8wrJnyxH5SCHN0AxDGiqYAE5g4h77tAzR5X3
         Ph6z+LRDKdRCSa5KHG++PlmwnahHQ/vEQ5+PFIHVPPdplhEGaUVkqNOhwn06FsAvVB+i
         4eRDBDjKynSJj/Ip5LmUXyiHL+UuIAcHq34Qsqd+R/5Ag0NWi2BQqWgEmfS8N2rZzt+t
         dscyiD3/79wQB4AukDosDKrClMXsvC2E3DHYQdHB4ujMOYH8ie6KGSc4tWZkpWXROBWh
         5DZw==
X-Gm-Message-State: AOJu0YxCDug+mmEbuANZvRgJLEK85U3X1hprykg+IQYWs/odA7B5bgA/
	A4VPih/p1DwLYI6OQn7n2Slerg==
X-Google-Smtp-Source: AGHT+IHF+LblYJeVzXRHb4Z5bbsiKZ6oGjIBxOn4gbb3wXUJcmjP+I9SQqkZQJ0WyiuqATULZb/vbA==
X-Received: by 2002:a17:90a:f3c4:b0:277:4057:b752 with SMTP id ha4-20020a17090af3c400b002774057b752mr9638126pjb.46.1696630578523;
        Fri, 06 Oct 2023 15:16:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:1f37:5459:32bf:faf9])
        by smtp.gmail.com with ESMTPSA id rj6-20020a17090b3e8600b00276e8e4f1fbsm5946523pjb.1.2023.10.06.15.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 15:16:17 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	James Morse <james.morse@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/3] arm64: Disable GiC priorities on Mediatek devices w/ firmware issues
Date: Fri,  6 Oct 2023 15:15:51 -0700
Message-ID: <20231006151547.1.Ide945748593cffd8ff0feb9ae22b795935b944d6@changeid>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_151622_125391_C893986A 
X-CRM114-Status: GOOD (  16.95  )
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

In commit 44bd78dd2b88 ("irqchip/gic-v3: Disable pseudo NMIs on
Mediatek devices w/ firmware issues") we added a method for detecting
Mediatek devices with broken firmware and disabled pseudo-NMI. While
that worked, it didn't address the problem at a deep enough level.

The fundamental issue with this broken firmware is that it's not
saving and restoring several important GICR registers. The current
list is believed to be:
* GICR_NUM_IPRIORITYR
* GICR_CTLR
* GICR_ISPENDR0
* GICR_ISACTIVER0
* GICR_NSACR

Pseudo-NMI didn't work because it was the only thing (currently) in
the kernel that relied on the broken registers, so forcing pseudo-NMI
off was an effective fix. However, it could be observed that calling
system_uses_irq_prio_masking() on these systems still returned
"true". That caused confusion and led to the need for
commit a07a59415217 ("arm64: smp: avoid NMI IPIs with broken MediaTek
FW"). It's worried that the incorrect value returned by
system_uses_irq_prio_masking() on these systems will continue to
confuse future developers.

Let's fix the issue a little more completely by disabling IRQ
priorities at a deeper level in the kernel. Once we do this we can
revert some of the other bits of code dealing with this quirk.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/kernel/cpufeature.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 2806a2850e78..e35efab8efa9 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2094,9 +2094,30 @@ static int __init early_enable_pseudo_nmi(char *p)
 }
 early_param("irqchip.gicv3_pseudo_nmi", early_enable_pseudo_nmi);
 
+static bool are_gic_priorities_broken(void)
+{
+	bool is_broken = false;
+	struct device_node *np;
+
+	/*
+	 * Detect broken Mediatek firmware that doesn't properly save and
+	 * restore GIC priorities.
+	 */
+	np = of_find_compatible_node(NULL, NULL, "arm,gic-v3");
+	if (np) {
+		is_broken = of_property_read_bool(np, "mediatek,broken-save-restore-fw");
+		of_node_put(np);
+	}
+
+	return is_broken;
+}
+
 static bool can_use_gic_priorities(const struct arm64_cpu_capabilities *entry,
 				   int scope)
 {
+	if (are_gic_priorities_broken())
+		return false;
+
 	/*
 	 * ARM64_HAS_GIC_CPUIF_SYSREGS has a lower index, and is a boot CPU
 	 * feature, so will be detected earlier.
-- 
2.42.0.609.gbb76f46606-goog


