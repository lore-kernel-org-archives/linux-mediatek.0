Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2158CE748FA
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 16:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aLqyuV3WHU1tmRucfRRbNKiUdX9Z1rFjqb2ZE34s0NQ=; b=jkosdPbwtNw1719fX+KOY5GJdK
	+GSVvvvq+JQzJ5TnCgUyOJr3YFR8nBfYtPZJmvjFUq20FK38p6RqxmuqzS9zGdJqok0a5XZ09ycQu
	Xw+Iw05kZLArB+ObJVFDFTMTAEa78Yauu4df1VY32W3gAljxnAkTucnyQLjQ/iQo6P917ok9r13o3
	YeTUb5JSCKV48Jw96MrqyUO38wZxR3grd6pg2t5NgItAtOzK9LQPpfS5NvaPfnBPxQJyix6cX+byL
	p4qjz4biYlI3Uih11A5IRb0+qr/prrCXgi36Ny//1qfHRfP0l6dcyrs3vkyt+cK8E31WxNq89Dxew
	yiOy3rcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnM3o-00D5qa-2p;
	Mon, 02 Oct 2023 16:46:20 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnM3k-00D5oQ-0l
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Oct 2023 16:46:18 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-692c02adeefso10656771b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Oct 2023 09:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696265174; x=1696869974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aLqyuV3WHU1tmRucfRRbNKiUdX9Z1rFjqb2ZE34s0NQ=;
        b=LmydDOfccyzV4UKYJ25i9M2VDuhe+09T+xeIXp/8XoIApm8sHqjT5sOQfQ0ZeFFz+r
         BMIC3T348OD4E/EH1aIpyiHQ0o2OyVW3Gz7vV3jkSZ383rdzi5ANG3Tu/Ng77IhemgBT
         lBD29KKsMuRiffO6sPuMV2IosLEACI+aYuwS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696265174; x=1696869974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLqyuV3WHU1tmRucfRRbNKiUdX9Z1rFjqb2ZE34s0NQ=;
        b=HpDTVa83f/jJkdDno36CO7VafvWKD2PUJpukQTeYuj77fMye5k/8T0DpdvJ/rLVtnS
         ynIPR22eAqccQkGIUh5bfN+hrVrwoEQ+AnzE5+NJpRA9lSj9TdDKSDHErklxudd/pNIU
         BP19d/szmJkWeRsg4JpHN4bRoqtdCvPSYctLnqCO6/O83pjXOqv/QHaCVzNdrv7rEA3P
         09b9kOQnkf1UqxitM0NLXDsyCyKh95h5zzpA6VJVTdFeq9/HoPm/aiYiA1tk3Vz18yKz
         Uhtt11/gxgYMo+lvUAkk8dKL/Y6/aOf5hAKSF7ux90h1JYvjX17ZZPnOMWi+eJXxgtWi
         76kQ==
X-Gm-Message-State: AOJu0YzxaDx5/WOVhwYsXiQyHogR5qh0Js9zoYRVc4lPgW9NxX5Fh2wg
	RJ8OS+znqTOrjOOA64CR53VS2w==
X-Google-Smtp-Source: AGHT+IFuyESTg1qXH/EpmpZCYlorecz5cuQHSkF+/6rKpci8edHI/LtYiWRbzzYyGr4lSooBLvepRg==
X-Received: by 2002:a05:6a20:a110:b0:13d:1d14:6693 with SMTP id q16-20020a056a20a11000b0013d1d146693mr12076717pzk.45.1696265173921;
        Mon, 02 Oct 2023 09:46:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:bb:b2b6:1831:5edd])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902d2c300b001c737950e4dsm8455904plc.2.2023.10.02.09.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 09:46:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Misono Tomohiro <misono.tomohiro@fujitsu.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] arm64: smp: Fix pseudo NMI issues w/ broken Mediatek FW
Date: Mon,  2 Oct 2023 09:45:29 -0700
Message-ID: <20231002094526.1.Ie8f760213053e3d11592f892b30912dbac6b8b48@changeid>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_094616_302121_4E9A2B09 
X-CRM114-Status: GOOD (  16.45  )
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

Some mediatek devices have the property
"mediatek,broken-save-restore-fw" in their GIC. This means that,
although the hardware supports pseudo-NMI, the firmware has a bug
that blocks enabling it. When we're in this state,
system_uses_irq_prio_masking() will return true but we'll fail to
actually enable the IRQ in the GIC.

Let's make the code handle this. We'll detect that we failed to
request an IPI as NMI and fallback to requesting it normally. Though
we expect that either all of our requests will fail or all will
succeed, it's just as cheap to keep a per-IPI bitmap and that keeps us
robust.

Fixes: 331a1b3a836c ("arm64: smp: Add arch support for backtrace using pseudo-NMI")
Reported-by: Chen-Yu Tsai <wenst@chromium.org>
Closes: https://issuetracker.google.com/issues/197061987#comment68
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/kernel/smp.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 814d9aa93b21..0a6002243a8c 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -87,6 +87,7 @@ enum ipi_msg_type {
 static int ipi_irq_base __ro_after_init;
 static int nr_ipi __ro_after_init = NR_IPI;
 static struct irq_desc *ipi_desc[MAX_IPI] __ro_after_init;
+DECLARE_BITMAP(ipi_is_nmi, MAX_IPI);
 
 static void ipi_setup(int cpu);
 
@@ -986,7 +987,7 @@ static void ipi_setup(int cpu)
 		return;
 
 	for (i = 0; i < nr_ipi; i++) {
-		if (ipi_should_be_nmi(i)) {
+		if (test_bit(i, ipi_is_nmi)) {
 			prepare_percpu_nmi(ipi_irq_base + i);
 			enable_percpu_nmi(ipi_irq_base + i, 0);
 		} else {
@@ -1004,7 +1005,7 @@ static void ipi_teardown(int cpu)
 		return;
 
 	for (i = 0; i < nr_ipi; i++) {
-		if (ipi_should_be_nmi(i)) {
+		if (test_bit(i, ipi_is_nmi)) {
 			disable_percpu_nmi(ipi_irq_base + i);
 			teardown_percpu_nmi(ipi_irq_base + i);
 		} else {
@@ -1022,17 +1023,21 @@ void __init set_smp_ipi_range(int ipi_base, int n)
 	nr_ipi = min(n, MAX_IPI);
 
 	for (i = 0; i < nr_ipi; i++) {
-		int err;
+		int err = -EINVAL;
 
 		if (ipi_should_be_nmi(i)) {
 			err = request_percpu_nmi(ipi_base + i, ipi_handler,
 						 "IPI", &cpu_number);
-			WARN(err, "Could not request IPI %d as NMI, err=%d\n",
-			     i, err);
-		} else {
+			if (err)
+				pr_info_once("NMI unavailable; fallback to IRQ\n");
+			else
+				set_bit(i, ipi_is_nmi);
+		}
+
+		if (err) {
 			err = request_percpu_irq(ipi_base + i, ipi_handler,
 						 "IPI", &cpu_number);
-			WARN(err, "Could not request IPI %d as IRQ, err=%d\n",
+			WARN(err, "Could not request IPI %d, err=%d\n",
 			     i, err);
 		}
 
-- 
2.42.0.582.g8ccd20d70d-goog


