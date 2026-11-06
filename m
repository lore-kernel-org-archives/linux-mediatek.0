Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76D0606A33E
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 16:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N6Bch8zS;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RPKFc9rU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IVRbH9fbQr7HvpMOmMZEA1Ly5MPApVblIj53P80z6C0=; b=N6Bch8zS8EQwRUwsRVylVzeLBQ
	ds12ppXvTmKJgbUUk7jWc62gV4pe4JO3VDaCX/mYbpKeRcZK0ZjvVMw0fBkhgbagIul/kSDwJPnat
	SfdUDvnBixUJH11rImFrw/qfiYaQvOG4eNSBFZR1lWiJ1OgsZ6DoGOBwUm9HN1P3Uh3gsce+Uf/3e
	PEkcaSf4TeEsJqBu70dnc54pGomet0tHLebv78s9SOKfwUn15m7s/4Q4BZ+VsSBMCRsyS44U88Aqx
	J6QKe8i+NFdm+YX2RJvCHfKLj5gwoG/+U6YFY2B8wd+svkffozTINgoomD/Ekzdgpr+5d/X3R4wTL
	j4cmELdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMNQ-0000000CvxO-0YXS;
	Fri, 06 Nov 2026 16:01:16 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMNM-0000000Cvw4-1iuV
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Nov 2026 16:01:14 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso4488065ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Nov 2026 08:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793980871; x=1794585671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IVRbH9fbQr7HvpMOmMZEA1Ly5MPApVblIj53P80z6C0=;
        b=RPKFc9rUc4/Q1UP7sncZAf4SBgI2WTuMAeLKzHJl66Er95x3mDn5UOX/ueYckSzz3B
         VX6ZEyG2Pr/qiKOwuXbvekz64pE/9pLicMNxlRzMZ8HuxdOqe2PoJZNKan944+S/Hdvd
         uMq8dy58eIa0xqGpMJMOXHOnVMkD8Jd6nYkgxT69nZpDpNvvFi9oPGxWmHq+RFAU52fU
         KI1nbk1Kjf9zvBh5f2yCENxSy+MfLiAphZVuK7QJ8oJKJ1k/EqN6iqLhC/SJG2vLc7W8
         S4kopFOdRpfZltlweuH+yk6T0+1LBozuB5tU46IRJniPc+ovdhMbBpaTyolAqtGeXV95
         l7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793980871; x=1794585671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVRbH9fbQr7HvpMOmMZEA1Ly5MPApVblIj53P80z6C0=;
        b=2XRB1UIPFaYDJ5G1ilbY9sd5ZM85LWFpAzrNg2CWOrDgE9bzbRlJuVQO2PDl4Zz9vi
         6i8h4fF0QlRrqccaQamrU3L+HiuMzAHVE8ea93bHI/NAVRLbLy1MGyxH9FENfIRKtzVj
         cKAO3hLd3Sbzo/fVVlm1u6BequdIGren+RyAIUrOfHIqRp7MJj9ZNeb50O3CEoPIygCE
         OeFo0CXom+A2hjFEGtAtMjP34P9+TmptMC4JjIgzw4S3DZmitbm475oF5twLxhEzL6l8
         BcHYyomtG6y3BzRCC3CFMcCqTid98Vt1oDs5ly5s5F1FhFvPPNJgrbisFp70Ha0BgBKC
         Bjmw==
X-Forwarded-Encrypted: i=1; AL+hErFknnc7F8equVdzs/4qjF8YvXidstUpbcMdL0/Aj8jpBqXVrmfWl9LWpJal86bpT2i/VKuYgXNrSzA1FL/BEA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/jaVWOCyA+buQdvakrYy3+sL2/I5U+kNM6/K6RixfZG4KF7ToE
	FXILw1Iow/iYjpFcXuJIIXegl9nUgqDSFkw1TUu6LryRMtpAq2PDefmm
X-Gm-Gg: AYBFou1Rlfi5Bmq99qeO9zdopHPUay9iYE6so0vIzhTs7m4atf0ecZ3+FEDchzGf/DW
	rm7YiMgaQ6ZgxtUucORce+z9+25ip+tSnauw4TsVHIGAnf3GpYUXodmx0NbpTbd3Sv299jVsMlg
	28djC+s944cxxokltxXkx/WeMVZ2jXvqDEvB1fUXqY+e6mgCYuxSP/HpxPV80oCGbhFIbngk95N
	CzG/FCmXn+SOuI85xJ0BUzGH8LFu4FgVlg3NdgKxCbRzoAU+KadCDqAq7yzmHM/V5w5xDTvTCIC
	v/zQx64mr9EE/tSB8m/+v3ipriw8SF3ZR5tR0Ove85hKvwy1S+ac7JIxQwVw7PvoKw1PyXsmsRi
	9SNz03f8x/g5zrRxHu2n8vqusF7NHAJD4xeAmy14WINY3ElPI3I+X4z3Dl1QkxpbitFSTCM4BoB
	ybHMcvv1BWJjauOpNt7WQq0w2Y1RwVqTmUxAevRRbDOO824RCyKvUAGwMfCPAzqNXIrMupwPiCQ
	LLLIBCnjNrctST0gYpNQ6mx
X-Received: by 2002:a17:90b:5905:b0:3ac:9c37:942e with SMTP id 98e67ed59e1d1-3b0db70add1mr2802118a91.49.1793980871142;
        Fri, 06 Nov 2026 08:01:11 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a7fbcbsm727930a12.25.2026.11.06.08.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:01:09 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH 0/3] power: supply: fix work-vs-devres teardown use-after-free
Date: Sat,  7 Nov 2026 01:00:54 +0900
Message-ID: <20261106160057.2754689-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_080112_911240_34FB2C1F 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Hyunjung Ko <hj351016@gmail.com>

Three power-supply drivers register a poll/detect/charger-detect work for
device-managed cancellation (devm_[delayed_]work_autocancel()) in their probe
*before* they register the power_supply via devm_power_supply_register(). devres
unwinds in reverse order, so on unbind the power_supply device is released first
and the work is cancelled last. The work handlers call power_supply_changed()
and dereference the power_supply, so a work instance still pending/running in
that window touches the already-freed power_supply device -> use-after-free.

Each patch moves the devm work-cancel registration to *after*
devm_power_supply_register() (and before the IRQ/poll that arms the work), so
teardown drains the work before the power_supply is freed. No functional change
otherwise. The relocated devm_[delayed_]work_autocancel() still runs its INIT
before the work's first queue site, so no queue-before-INIT window is added.

This is the same class as the recently-applied cimax2/extcon work-vs-devres
fixes. Found by static analysis / code review; none is reproduced on hardware
(each needs its charger/PMIC/gauge chip and is not QEMU-reproducible) -- treat
accordingly.


Hyunjung Ko (3):
  power: supply: ltc2941: drain poll work before the power supply is
    unregistered
  power: supply: axp20x_usb_power: drain vbus_detect work before
    unregistering the supply
  power: supply: mt6360_charger: drain chrdet_work before the power
    supply is freed

 drivers/power/supply/axp20x_usb_power.c      | 16 +++++++++++-----
 drivers/power/supply/ltc2941-battery-gauge.c | 10 +++++-----
 drivers/power/supply/mt6360_charger.c        | 13 ++++++++++---
 3 files changed, 26 insertions(+), 13 deletions(-)

-- 
2.43.0


