Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42710C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:27:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 530A561A36
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 530A561A36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/4HIuV/8SmpdHpVNg2JnyqqZB2OK5FLpg3HD/yuuaqE=; b=R3UxjcNRi58yeg+L+cJ5s6+pSo
	0uvnZ0sDGfbEz6+K0VTwOHBVFwzb1SipqAEZU8nX1H85NN6EevHUX/NJH9B1NixLQ6zcfRm8ZLvH0
	S8ndLU/SiS9dYCcbe/p4W6UuPEgqm2+2kpeaUQgeWS0vdqJciPkbYpBwaM1kg7AvacAUBJo8flT8b
	/hPy3xpRgn6a6wDwXH2VikeDHoLAmxdRV+5ot2piHmIleSpvkLJN731un5RCoUnZH7gMXltiDqfDk
	CRqZTC6MtbgudVHdtiGBydVOLYSJfBH3I1jHZfySYzPgWpGfl6vCovRc/u4gbMF9YK7rIGa/rPlz/
	WamMNfDw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgqlI-003BoI-3b; Wed, 12 May 2021 15:27:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqlF-003BnB-0s
 for linux-mediatek@desiato.infradead.org; Wed, 12 May 2021 15:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=qo9U0GYt6DMr0n2/j17Wlk3nBr9MEvK6tP9ZxY2RR0c=; b=muPpPUbVjMZQnqQKqiOVy4xEDu
 kjJnLPXYOSoYV/BXwYFcex9lzWrgIxBFtnHvSmiKBpoKTJq6cmH2mOAIGgl8euD0K6vb8LfOHB8EG
 0nBjQEgwz9BBAPltj9KtBB3S7MIModcQlI1w87qKZ5Xrw+VX8BgyoBm0OapT1y3MfUiOzRwdfBjqD
 1fjGNmiYKGHy1dxrP7V/fnGFzX/l1+YAow3XJ3FdiiP7E4syoI/HNN3wpWfy4USo7lZJe9WmBJs3r
 DxPLDobzQPIVqQttdetb/W0suXoSgerJybEQuHfKIKQOLdK8BaNFNNJw/ygkEZbV+ZqRJOujvbgUA
 IH97CgqA==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqlB-00AW6z-Ov
 for linux-mediatek@lists.infradead.org; Wed, 12 May 2021 15:26:55 +0000
Received: by mail-wm1-x32c.google.com with SMTP id s82so13152219wmf.3
 for <linux-mediatek@lists.infradead.org>; Wed, 12 May 2021 08:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qo9U0GYt6DMr0n2/j17Wlk3nBr9MEvK6tP9ZxY2RR0c=;
 b=Eby89UI0IAG4vUd4hCA4VLnkKIT10UJ9/FY4KM9dxGiMIRkb4azADDaexbelr6k5sx
 XaoSmEef3ysKxVIHnzOPRMNZThU27cJ1GKGBtGyEnQgOi6a8607JtxknevpszcKNRFhD
 uh2JvmBFdIhylyI33YepaRx/D71R4ORs1oIGMx5pmmB+hsVh8C7V0Oc2V5xofLGv8qjZ
 s9GMae2bTFsdZSx/9JlBQON45QdycONzsC7ZWHtdrgSO5qVrUwNupo2xBe9D01gHvGoj
 x/djK7Vu3wNSbhop6bSEW02MjHafRJq97BhcTFUO4I1ZRn+3moKhxnVMZFibQpkmW/zC
 uEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qo9U0GYt6DMr0n2/j17Wlk3nBr9MEvK6tP9ZxY2RR0c=;
 b=dheTXV4I9OoaQpz6uBAHWKEsy3IYpmK1Kv/8J9cbVZCznA19rPhIZGTDSiUsIl+C14
 5vdKeu4QhhNTT/8cmtkXDY0LLfFKMjoObi4BKYGY8hHGHt4OQdnGLhgWv56+Ddu0zzIj
 n27KrtmYUMQ5DhqHzAUX5siJRs7TuVFaYou40eBDL2sIzhWNJqWVVKKO6ZR7EXfDSBfO
 3+al43upkRw2HpImULzwy1BkxG2WAfxQHFqOlQ+baiBQAcBE3be1SGSC2UMQ+f5UjRGL
 wpUpLqCv6hI0yGmjYx0G9bqqI7vHqxHSHYu+zpm/znyRBIVwyxIQcyrVDFkuKYoj1Wpt
 nbyQ==
X-Gm-Message-State: AOAM533Zq0ZekhYxcr/Bg1SL210HGuP08BrbYcwtfomRfyLISG+bnZd7
 yqVW4WJb9TIvbYByalqGGltW1Q==
X-Google-Smtp-Source: ABdhPJxK4OXOZyM8UmJPCc+lhHTTxoneOlyV6LIU6uC/nUXyW+Iz1VKA97tGwMOkipkrPdSRylyeZQ==
X-Received: by 2002:a1c:e408:: with SMTP id b8mr8749252wmh.85.1620833211941;
 Wed, 12 May 2021 08:26:51 -0700 (PDT)
Received: from mkorpershoek-XPS-13-9370.home
 (lfbn-tou-1-1465-169.w90-89.abo.wanadoo.fr. [90.89.34.169])
 by smtp.gmail.com with ESMTPSA id b7sm30931256wri.83.2021.05.12.08.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 08:26:51 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v2 0/3] input: MT6358 PMIC button support
Date: Wed, 12 May 2021 17:26:45 +0200
Message-Id: <20210512152648.39961-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_082653_829729_6639C93D 
X-CRM114-Status: GOOD (  10.93  )
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

The MediaTek MT6358 PMIC has support for two buttons: PWR and HOME.

The interrupt logic is a little different than other PMICs from the
same family:
for MT6323 and MT6397, we have one interrupt source per button
* for MT6358, we have two interrupts lines per button: the press and
* release interrupts are distinct sources.

Initially, this series contained both mfd and input patches.
To simplify maintenance and review the original series [1] has
been split.

Changes since v1 at [2]:
- cover letter title prefixed with 'input'

This series depends on [3]

[1] https://lore.kernel.org/r/87tunpw339.fsf@baylibre.com
[2] https://lore.kernel.org/r/20210506153718.256903-1-mkorpershoek@baylibre.com
[3] https://lore.kernel.org/r/20210506094116.638527-1-mkorpershoek@baylibre.com

Mattijs Korpershoek (3):
  Input: mtk-pmic-keys - use get_irq_byname() instead of index
  dt-bindings: input: mtk-pmic-keys: add MT6358 binding definition
  Input: mtk-pmic-keys - add support for MT6358

 .../bindings/input/mtk-pmic-keys.txt          |  5 +-
 drivers/input/keyboard/mtk-pmic-keys.c        | 56 +++++++++++++++++--
 2 files changed, 56 insertions(+), 5 deletions(-)

-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
