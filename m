Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E16CAC592
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Sep 2025 09:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qhHEebbyU5CnpObkeR/WFFbKDX/bFW3JYSJRh0+BuBk=; b=R+GxkcgbXZ2fu2kckTVgmXpLRb
	jx1/s2twvyxgX4xYz0Nk+dcSvrnrcu4nKhL5wvFDUYsq5bPinp+vOH82ol0sC/MBNqhUfe9qmn60O
	GUlwxCHwiNuG91XwYt+p8b0+yVCNTgQ6WGj9hpNEgRKmAlOEsV7+M0gVCbjP3yEZXWBOrm6/qcwPs
	OeziVryOlNjzj59WnIC2d6A36oX7ijme4CJyXJUK2u+o5qAzTg3yQweOzXJRPNFehl1TMsi04/02T
	yhXIxl1aBTKWX8emTWd0bRWGFZ6KGWNSHY9WHphGPmL0lsMWKXFoLOyOUSZ49gcqlpiRg5sfKKoJb
	OOR8GVaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cup-00000009tbC-3XRP;
	Mon, 22 Sep 2025 09:32:59 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cum-00000009tZa-1jEj
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Sep 2025 09:32:58 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso31420315e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Sep 2025 02:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758533574; x=1759138374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qhHEebbyU5CnpObkeR/WFFbKDX/bFW3JYSJRh0+BuBk=;
        b=cwHq+RgnZuVKH0KNo36IhSMRpH2981VcE1i2Qlpqxgg6LE5bsZ8RV0qK6tk4a679Bq
         0T/2w2k0ZuIqLznHNGMff0bQFwazsqElO+WyhRv8s8zwlgePVbn7ReOW2OaLgNJfgEQT
         RoGygA6nXS/YZ7iDtguvadw6LzvASBTc4YSb1RBUJDphvtsfCkS/6eHBUPo/ZNG0Ew4o
         i8uaK1EZuSo78SN0di8k1YgmvQkyHrylJTEXq6jjL7n0+Rp03x41mmyF7QJttw83a7qy
         VFblEBBzAoH1th8YzTHZQVrFKSbr8BuD9bFVANZECHQ5mK5u6yWxepRxmI1MukZ8+RE3
         GGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758533574; x=1759138374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhHEebbyU5CnpObkeR/WFFbKDX/bFW3JYSJRh0+BuBk=;
        b=mk2hqkQTwbbN6ak6hEWBCsuTaQOq7IP+wmC7mJq90l0uOzmOIqBU0uPUO0TT7CJrDe
         AYiujHIBIoh0BRKd2ifch47aZGz9tFb0cmFKoWteDBRtd0fu+ODuUT0kxv66EwyG/AeP
         QR5qBcvYipyrT9qUjnT7xodLijs8ziC3oKteSv1ORsjpjb135EboUZ/aWdlQ2nJ5KOSi
         wo7uK/lP9XIjFnCRlsgDSB6iUE0C+cWYLW68fjtoUrH/IMOdABc94k+1p168GmnDxd5R
         Adxa1lOFzx0bdY48Fp4H+sP370Xy8BhV4qDwAnbcIOW7QYFgETomJag8lgAV24CHMFKO
         VZ0A==
X-Forwarded-Encrypted: i=1; AJvYcCWbRfYrIxuQmKyZewxAdnoNC9iOpG5fEon5ZjX0NIEcVUTM0Ii41S0ceORqVme8uDDBgAZpkLPWndzxu8JlAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxY0ABq9uSG7rHh3OqGJXHIlApVY8ucywJvhN08kBs1ckmepRhB
	+/UPacAQLR12K37qzcTpV2kJPhZC28wbwPfaDk3mrvl925wFE4Up+AM20zV4OjyPxGg=
X-Gm-Gg: ASbGncuktW2SIJKBiHBkK80CSFFQRoad/1DaY39GN12UOuVXp1aNUQHPjRcOh/fSUQV
	swikT9H0+VFqsQl5EIKHonvKhdK29hnjam1VQvl2lHcV1dqYwkOHXBgcKw9in674vJaTBQsai8t
	EpYBjkPpUOdKlluQSVXZkM/cAuovfMeiiFoQvymuasY9q+D1mQ2A56PBpERkPgkX6exNf9RqSTI
	+7sr8CoMlAv/fowIi+QP47xOwipjS1u2eeu1SHl449WFY2ZguGfp1p6kbP+BKkM802aRyTZKIUA
	yWCErWMBBDvX11E7MyU7/wp8PWsi0thA/dJ8xNLpycX4voMrPTleErnnB6+Xj3TMI/Ry2yimQRF
	PytTwlMnCI5a4ysKfQXV9KqYEJWqJl7ppXxKoxAN62KbU5ZU=
X-Google-Smtp-Source: AGHT+IEB2plkqqlj8/pQzKhUN/RKf5fQe1/aelYENrRva9JJezB9Y4IB22RvtTC11NF9vwVMxX6x3g==
X-Received: by 2002:a05:600c:4fd0:b0:45d:e28c:875a with SMTP id 5b1f17b1804b1-467f0871186mr116478715e9.31.1758533573752;
        Mon, 22 Sep 2025 02:32:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm19735964f8f.37.2025.09.22.02.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:32:53 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH mt76 0/1] wifi: mt76: replace system_wq with system_percpu_wq
Date: Mon, 22 Sep 2025 11:32:42 +0200
Message-ID: <20250922093243.140946-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_023256_466021_E7B37902 
X-CRM114-Status: GOOD (  16.85  )
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

Hi!

Below is a summary of a discussion about the Workqueue API and cpu isolation
considerations. Details and more information are available here:

        "workqueue: Always use wq_select_unbound_cpu() for WORK_CPU_UNBOUND."
        https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/

=== Current situation: problems ===

Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.

This leads to different scenarios if a work item is scheduled on an isolated
CPU where "delay" value is 0 or greater then 0:
        schedule_delayed_work(, 0);

This will be handled by __queue_work() that will queue the work item on the
current local (isolated) CPU, while:

        schedule_delayed_work(, 1);

Will move the timer on an housekeeping CPU, and schedule the work there.

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

=== Plan and future plans ===

This patchset is the first stone on a refactoring needed in order to
address the points aforementioned; it will have a positive impact also
on the cpu isolation, in the long term, moving away percpu workqueue in
favor to an unbound model.

These are the main steps:
1)  API refactoring (that this series is introducing)
    -   Make more clear and uniform the system wq names, both per-cpu and
        unbound. This to avoid any possible confusion on what should be
        used.

    -   Introduction of WQ_PERCPU: this flag is the complement of WQ_UNBOUND,
        introduced in this patchset and used on all the callers that are not
        currently using WQ_UNBOUND.

        WQ_UNBOUND will be removed in a future release cycle.

        Most users don't need to be per-cpu, because they don't have
        locality requirements, because of that, a next future step will be
        make "unbound" the default behavior.

2)  Check who really needs to be per-cpu
    -   Remove the WQ_PERCPU flag when is not strictly required.

3)  Add a new API (prefer local cpu)
    -   There are users that don't require a local execution, like mentioned
        above; despite that, local execution yeld to performance gain.

        This new API will prefer the local execution, without requiring it.

=== Introduced Changes by this series ===

1) [P 1] Replace use of system_wq with system_percpu_wq

        system_wq is a per-CPU workqueue, but his name is not clear.
        Because of that, system_wq has been renamed in system_percpu_wq.


Thanks!

Marco Crivellari (1):
  wifi: mt76: replace use of system_wq with system_percpu_wq

 drivers/net/wireless/mediatek/mt76/mt7921/init.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7925/init.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.51.0


