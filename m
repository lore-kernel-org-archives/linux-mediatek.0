Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8E2C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 09:42:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 419E761157
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 09:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 419E761157
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QbxWX+jxpcP5En19Ln7Gq0PT9vnDvJAlDO8j1W9mX10=; b=Agp/i6j+LjuoWN4wVJz5YKUBWl
	G7q248EblpQukjGrKF+nwan6x3aTg+2umfg3AlCWRc0spDvIcrJlcWOuuzQ957PKafKOR54D+WFYi
	8VzwQXkQW/8S8xcXJCGHqtuU4YpqxP8A6YH/ReGQw+z4o8rBntlQMorJ/E39rWvBHzzuSdEy778Lx
	XQnZUtKe5NTWlemwWyRqHEfkMvW9Df6QmWQ3570fLV8UTJX18xlifApIbgXbxNbDM6HXdb7zq58pU
	m0PnEQ2kzfea5tkfx86pAz2sho8qshGn5LQbhFTUWj/KvSlvfuTXWG7oqQewTt9KALWClvBZBZTUK
	V2uQ14JQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leaW1-003qOF-1y; Thu, 06 May 2021 09:41:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leaVd-003qKT-32
 for linux-mediatek@desiato.infradead.org; Thu, 06 May 2021 09:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=im3bW5S/RccCslH1ytS/60IAtgmqJ8ojz0Ph9k/9qWs=; b=ZoSVoBFZIgSzgKBYcjkNKPNlUg
 DHpayu9lZ/ANKpgMtIWDxPbjRu6vjYG99+OrstVWt4BFbt5KHjAgbE6su4ysU9EVBpqBwIcmuu67O
 uLDhkkIzMry7Tnukh7SDL5U+rYt+2seJmvK85HSn7Ta8Wu62AejI7XhFMJPYF7A1yE2b+BrZ3ovV0
 Us7iqtTSV68TinROMLQ0J3BaC6vHlz2Gf5TGdz1yfk+DcjszPb462p6Mb4zumq7J7c0Bzrvi/egmH
 jcROiRhMkPVtjDLBbSkrmZWx/DTr5oPp663kqIt1JUDI9O4sYZ8TfzCTFsl3o00BpH60HrKJcwQo6
 Tbw7my3Q==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leaVZ-005uy8-My
 for linux-mediatek@lists.infradead.org; Thu, 06 May 2021 09:41:27 +0000
Received: by mail-wr1-x431.google.com with SMTP id d4so4871317wru.7
 for <linux-mediatek@lists.infradead.org>; Thu, 06 May 2021 02:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=im3bW5S/RccCslH1ytS/60IAtgmqJ8ojz0Ph9k/9qWs=;
 b=xfTmqsaKXwpEB/rXveA+jNE+YDH8DxS5V8W4znJwi7rH20ezI1Xrtcq77tNM9VCLV8
 HrR9Bfv/QVMfw60TQz+HIJJaTUqJvXQjqXzcUyrmrLqiwqOWvVMTYCVka+RlavzOpDSh
 yD4N4CdTVSS0b+pRv53KUui/kPT6g2IqFzXv4pvOkQod92RjSJFxucoGlcCspr5Rguz1
 5hy5Ow9EnjvhZzHZIEFt71R0XjY2fLujLcUYBmqCoTCIFwEpCIM4Ha2oPlYqf5tMCazS
 HvkSZQEh7TNwa0vgDVMoMIlAr34PaHPupBnbldtf6jpgDGC55ojrm8k42PZYLQ2N/isB
 VxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=im3bW5S/RccCslH1ytS/60IAtgmqJ8ojz0Ph9k/9qWs=;
 b=n+bpIwES+d9bWTPqx0HCH7tAVlf04R3dsW6LsVxGlwVrJisGEn8UIC4dBtzlBBgkyj
 5LW9tOVmOiu9Qny7bNahmms9xYElePj2GOmxOWrVpokE2xmWLuaNB/66oeqbEh3Uk/Wt
 cnOw3C8jxkDUlKLaL5c4CzcQjS4OvXakQnoXLw2se0tWQRtRcwUEm1zrqFnRQ8cUyMBS
 4FmiRYDP2tZ3DQkZ5yOPxILrt33UDtOmDgSWJlwC8yEJj4Deak082xKdlWLon4VEJIor
 0Kq0z47ZeWyPGIHe877GpEYthLDBwGgVKWHNYd8urw2LqDy6eQUPYPVR12+ZIMkozk/N
 VRkQ==
X-Gm-Message-State: AOAM532BkH5FHhC7ZDMMhxJyI8hbTRe01VgL0TELwGgX0HjW3M52dPve
 3nEZwFF0QpzdFsP0GsoFrT9rzg==
X-Google-Smtp-Source: ABdhPJyyacVKUsInWu2QNVxNsp4hBSCs/PIda849V+LVCcMhPZfTLMy8u/hxAPB4PZauPG21v3Qb1A==
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr3987777wrb.298.1620294082122;
 Thu, 06 May 2021 02:41:22 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:2492:c5b6:6c3f:6de4])
 by smtp.gmail.com with ESMTPSA id y14sm3360421wrs.64.2021.05.06.02.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 02:41:21 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH 0/3] MT6358 PMIC button support
Date: Thu,  6 May 2021 11:41:12 +0200
Message-Id: <20210506094116.638527-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_024125_916415_7E25FEA0 
X-CRM114-Status: UNSURE (   9.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MediaTek MT6358 PMIC has support for two buttons: PWR and HOME.

The interrupt logic is a little different than other PMICs from the
same family:
* for MT6323 and MT6397, we have one interrupt source per button
* for MT6358, we have two interrupts lines per button: the press and
* release interrupts are distinct sources.

This series depends on [1]

[1] https://lore.kernel.org/linux-arm-kernel/20210429143811.2030717-1-mkorpershoek@baylibre.com/

Mattijs Korpershoek (3):
  mfd: mt6397: add mt6358 register definitions for power key
  mfd: mt6397: keys: use named IRQs instead of index
  mfd: mt6397: add PMIC keys for MT6358

 drivers/mfd/mt6397-core.c            | 20 ++++++++++++++++----
 include/linux/mfd/mt6358/registers.h |  2 ++
 2 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
