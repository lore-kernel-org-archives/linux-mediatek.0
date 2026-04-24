Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A999FE51E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2026 08:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TC5sryHvai/IFNjebXX2bmIEa1ygkcl6y12sT/MqiyU=; b=l7KY+g9y9P1XE5bCTGQ8ucMWsk
	L6C/nsCu4e0loIBWw7g4EFTRTtwDS73di74SqhY1ACdreJte93gf+ErmbOzjxnSQv3Io+s3DgtoLg
	07Tyh6duc4UH0mBDFSPOnSZci1hiQ4RzBbcfMA1JHwTtjIpDL2QQQSQ3GgD9Auu6b3MG5p1+BHXhM
	M8ClMDBSA7cR9RBUHqIhO/sabGJcA5moXVNwyxChrcZPmB2xcNKDKj/LUDJkzOlEu6NL+KnsaV/Es
	1HeaqOLLjWJjHDiGPZA1gGQb/IfLrVWY8uG9yGxD7z/D6g/xBK5CUQ7yFagCTaE70+xtJDkUeLd6v
	uj8foo+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCEC-0000000CtCp-2M70;
	Fri, 24 Apr 2026 08:49:36 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCEA-0000000CtAa-1ROY
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Apr 2026 08:49:35 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-79a7109f568so92207047b3.1
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Apr 2026 01:49:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777020573; cv=none;
        d=google.com; s=arc-20240605;
        b=TXw03oAlHsCIajWGFA9Aaf/Q8ojdv+DT9vsHiSfHXJJXWui/8fv4XUxix0S1zi4nqI
         YsYK2TT2adek5uQ37I+E6vUoy/UpbDmHhyPjrODm+2ZOK2qsDSJp9xMLP0oHYtbFVH0K
         V7kdeigHU+yYgNFy7kJu2FYH0HtjplfJI33K8tSw/W1530KyXRImve8O/0hATMa3urBr
         QEbahHxUf2J/dk6x6XoUnsqai5kmTPSVmWoGMRvWPWzOLgGfVrNrRwAikC1QjMTFhp6/
         bm6eWoWe7wmqMqxuAomHtS0Lp4ZYMRi47suV3VpWXKb8JWgy+TxD0r2UW/CJ8NG3OHZ6
         whGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=TC5sryHvai/IFNjebXX2bmIEa1ygkcl6y12sT/MqiyU=;
        fh=JWRSMhjnPJaDtHrSra33e7Lv3t7WeNG6amstfHjqQ0w=;
        b=KkgKWCW66GVtKZo4vZH3CI/0AFILJXrabWQXEmiKeWePtUYIo0d6YntQ5tHBc6ZfkZ
         DbrdqYaUCjOSI3iGMgREI2Sj4IYPDHWjd6bRm9xCaKcLExXUtrXMOQjCrhftwOvoRh55
         L2Hjw5Z00gKs/qjC8CukHlG5t2VzVHr7LFwNl4/zRO0ZGZvmyy5vU9Ie+kcfIxRi+sIp
         YbcF3SWehOuu9v6+w0mdKTtwk8On6A4kjXzwcfau9D8a+Vp+01RUIoVtlCA0Jq/N4X7w
         QTREaQHmjJKcGkO8BLaB0H9h2jB28748tNarZoAHQLfnxWpSlxpsNxB2+JevhAYQmI78
         s/2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777020573; x=1777625373; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TC5sryHvai/IFNjebXX2bmIEa1ygkcl6y12sT/MqiyU=;
        b=SExYq4h+pedVvxFpelYZ5Zg9N2152uHpzhMpqIsuBd4SvyzDbmer0PsxDJZqExX7V6
         A3TtmL1KcNDgeMUoE+qowwBb1M+GVFdPezBrXAncNUhBkAQxMqlIJvFrHpmKIxja6VNb
         qWdF0ACWw4jJgmXIRaNk292URcHmYsymgUIBEnlDrI9qMswuezoPnl01fCUEshZ4EuPm
         9rzIz9PYb9KP1g1P2GyYcV7xn/Y5V1TTyxAy8u4lRiD4QhGXB/+kLlPb4Ux8rE9Uawx0
         mVkqGpbu1y5JVOoGO1HDyaFDMc8dedPfucma40dpGx5ruc+CoLZ3SQuRLDNsMVqijEMN
         uHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777020573; x=1777625373;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TC5sryHvai/IFNjebXX2bmIEa1ygkcl6y12sT/MqiyU=;
        b=UY8ChmQZIQlH+Q7vdrMFjEo+w6wIUKnLVHOL1c0umVRAL6VS+vnQXwjjgXJxobaeKI
         CzpBGuVbLIOoFpLKQplqtFy+Ky+LB9305aaCDv/lt5HlytJtpPbhBC+pV5EkfCEjVXjK
         +s/lbP8oenUXpWcQQrKjQJQZe09A4nsRdX/0jrNHBgyHuv7cfrRp9KKb4vAFDHNK08wU
         efQaSORQ0obvJIOtT6L4S820EWuBlEBa5eN8oSiM5ap+6/Vc4Q5lKOCbEE2wb3kq2qRZ
         HfDmMiXIG2jJF9wPYPALXfgJxXHKwC6pcQe9o3cuH1lBQAh3sXrLoBaZIXr4Agds4zDr
         AjBA==
X-Gm-Message-State: AOJu0Yyn17PUvrkM2abq8lGwjJ/vetsOv3sbn9MLnCapieK35ICZXUuf
	jbezPvAS0KAiLjlAvk0K+SFdWdtUoeteV8cz4O/ntQtDLh1FL1DRVwbQIqJdVcP2Te7iNOzEGCV
	NqUx/6D/oLJcdsKwovSDGqWno7Z7V53Y=
X-Gm-Gg: AeBDievle2f9SXuuWtSVfeTusge+7Xf45cXpOFVsIkNI8kQ/MwewT0uysnm2ooLnnU6
	ynPW4bzCeDDHl4CFRer692bE9NXWBj03ABspOzEyszeO1OI0Jnq1B0gu9Hk5h4BL2NjHWhVPKNa
	mA65TlTP1CtoZSrL8BmcAIiAjdIjvJhknJG7PmzTlmLYVGWVSsVkr/jvQnoC9FVCULYeXJ9ELzg
	TNsTspzKpfhEiquhEtT6/CAArhHxByar/bRtDx5/avtZ79+gIaAn52iNF1OJYQM8JMFq3NmHU8Q
	Zh4urbzSJhtCSmnCMZrE
X-Received: by 2002:a05:690c:d8b:b0:7b6:f4f:f06a with SMTP id
 00721157ae682-7b9eceb28c8mr332370627b3.6.1777020572775; Fri, 24 Apr 2026
 01:49:32 -0700 (PDT)
MIME-Version: 1.0
From: Ginger <ginger.jzllee@gmail.com>
Date: Fri, 24 Apr 2026 16:49:23 +0800
X-Gm-Features: AQROBzCVA3oYYXxTtDJfcspzfCj9Q7thAzG4DSQEsKbms5pQBTOVnyE5hkMlJ1g
Message-ID: <CAGp+u1bXAX4qJRnLvfaYdfjE7JYzfCw03_4+bumhaQpwNTzvzg@mail.gmail.com>
Subject: [bug report] Potential deadlock bug in 'drivers/dma/mediatek/mtk-hsdma.c',
 between 'mtk_hsdma_irq()' and 'mtk_hsdma_free_active_desc()'
To: sean.wang@mediatek.com
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_014934_398262_9A3664DD 
X-CRM114-Status: UNSURE (   4.63  )
X-CRM114-Notice: Please train this message.
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

Dear Linux kernel maintainers,

My research-based static analyzer found a potential deadlock bug
within the ''drivers/dma/mediatek' subsystem, more specifically, in
''drivers/dma/mediatek/mtk-hsdma.c'.
This deadlock potentially occurs with the involvement of hard irq.

Kernel version: long-term kernel v6.18.9

Potential concurrent triggering executions:
T0:
mtk_hsdma_irq [t1]
       --> mtk_hsdma_free_rooms_in_ring
             --> spin_lock(&hvc->vc.lock); [t2]

T1:
mtk_hsdma_free_active_desc
    --> spin_lock(&hvc->vc.lock); [t0]

T1 can run in the normal process context and does not disable hardware
irqs in acquiring the spin lock. If T0 (i.e., the hard irq context)
occurs after T1 acquires the lock and both happen within the same CPU,
then T0 will not proceed because it cannot hold the spin lock that has
already been possessed by T1, yet T1 cannot proceed because the hard
irq runs disables preempts.

Thank you for your time and consideration.

Best regards,
Ginger

