Return-Path: <SRS0=2/VK=DO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41186C4363D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 10:33:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5510207EA
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 10:33:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R9XgJ/4f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+EdZXdh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5510207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hGcy6G+kCwBbbeEzEurn2PCv8yeCfew2+dEP2JegmvQ=; b=R9XgJ/4fWTxVd9WjgU0lc2JJ4Q
	U+vw1/s1FYBeFLoXiCI6yxIN9IBIHlu9/8WLebxkblyrKJZHBcknaflYa0PWz5mt0wCP3lSEq2FTN
	eqXHr3tIsqWFJrI2qYTbEiDbm2wEl4lPh+Ijxi/uzKlTc4IVvjo1Ofxc1qpGJaf9cmdWvzNQ+VpI4
	qBri2GoGTSpn6dTX1hsJYGfodpZIio8OC8L7yVDKOC1wQ1QjtGYkXMQYOmsU5slol+/zo11QRgwao
	QstRjP3eD7Pgw00xhdY4DIYrOao5HM8zPMGHpOf5OTYfIWLL1qOHkfxISbbO80jRVK3YseZYk5zyS
	EtyicQjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ6lB-0004cP-DM; Wed, 07 Oct 2020 10:33:25 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ6l8-0004aT-OL; Wed, 07 Oct 2020 10:33:23 +0000
Received: by mail-pl1-x643.google.com with SMTP id c6so778325plr.9;
 Wed, 07 Oct 2020 03:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M3tlMfmcucV1zILBhUWjczI44sbzhxfScjMFqTyVtfk=;
 b=V+EdZXdh3WXACskuSFWkEslHjaSHeOyHbk5urn/r6LtXMAVWt5lHUfWDAQ0zytZZbh
 3L7WJljVGd0/Xc+DeHhhuG+lUm9HOp2CdIAZjGFbuXdagsdgN34Eao261w6gGsvBu8j6
 ZwM3ZRljE7XLwIFk+omAq5veIGzMBmavDBlsPbRlHk3vWZhnWwYtIhEPGXvLqI1Fd4sf
 oylEgrJZx9gxKaHRrEziQZvP6UNQT0mQL24Y7TeflKMD4n8EmfG8B6bMJBgqo8TTfMdN
 Tx9V1brSvAgnn+Fkzpf5ncgS+bygkG0p8Sbasn/yXIiu5rWlGl/cjocgjZM1MFXDexWc
 33rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M3tlMfmcucV1zILBhUWjczI44sbzhxfScjMFqTyVtfk=;
 b=iFzUO85ykzX+oNB3jtu6EWaIq1CwVbzTGHVoex42rkkUobzs+BdgsZ6FglbRvwYriE
 KgeIXsVub15VokcS5QfmpQNvnVG8/1MlFil2n1Fhw/YRmgI6HoFctBZg0/bI5lFC5ItB
 oQzCsDocAFfaWJZFxpxNwn+WGSOMY+SG3i8m8CeAMoSyw3aBbz/QyJetYgXB6mH4gb1g
 h1ZNV95UehMEgRj+haen2l7Ue9M3Sxmz4mQzX7VJ2upmLB/cBilIpLvRVqEhpCKRIsgE
 YVrcCLhptRphCKezLAtUgbCn8vycLUDY46uWY9QCmW26imr9drXjXzNDoazMVvTPjbL0
 OwuA==
X-Gm-Message-State: AOAM530HdTuYAR5uURIkMLzz0F1QKrNpVlPWP7Q6ABz3SqjSIacqW/cA
 rnwmBwlxoiEr1UYLHjKDHA4=
X-Google-Smtp-Source: ABdhPJwE6r0kuIjeK1ca92N4FWqvoEAr6NMSoJPQLDSm8giSzgJoYOAMJSkBaHhQlUB4kpvEe4HyqA==
X-Received: by 2002:a17:902:74c6:b029:d3:b3bd:22c3 with SMTP id
 f6-20020a17090274c6b02900d3b3bd22c3mr2370640plt.52.1602066798863; 
 Wed, 07 Oct 2020 03:33:18 -0700 (PDT)
Received: from localhost.localdomain ([49.207.204.22])
 by smtp.gmail.com with ESMTPSA id v129sm2705327pfc.76.2020.10.07.03.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 03:33:17 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: kvalo@codeaurora.org
Subject: [PATCH v2 0/3] wireless: convert tasklets to use new
Date: Wed,  7 Oct 2020 16:03:06 +0530
Message-Id: <20201007103309.363737-1-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_063322_800980_22224F7A 
X-CRM114-Status: GOOD (  10.40  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: ryder.lee@mediatek.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, kuba@kernel.org,
 Allen Pais <apais@linux.microsoft.com>, davem@davemloft.net, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Allen Pais <apais@linux.microsoft.com>

This series converts the remaining drivers to use new
tasklet_setup() API.

The patches are based on wireless-drivers-next (c2568c8c9e63)

v2:
  Split mt76 and mt7601u

Allen Pais (3):
  wireless: mt76: convert tasklets to use new tasklet_setup() API
  wireless: mt7601u: convert tasklets to use new tasklet_setup() API
  ath11k: convert tasklets to use new tasklet_setup() API

 drivers/net/wireless/ath/ath11k/pci.c              |  7 +++----
 drivers/net/wireless/mediatek/mt76/mt7603/beacon.c |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7603/init.c   |  3 +--
 drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/mmio.c   |  6 +++---
 drivers/net/wireless/mediatek/mt76/mt76x02_dfs.c   | 10 +++++-----
 drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c  |  7 +++----
 drivers/net/wireless/mediatek/mt76/usb.c           |  6 +++---
 drivers/net/wireless/mediatek/mt7601u/dma.c        | 12 ++++++------
 9 files changed, 27 insertions(+), 30 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
