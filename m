Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B9FC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 12:20:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F50E60EBC
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 12:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F50E60EBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uaMoLB60qYevZCD9mUzLanYykozRsc4xqCqZCZxnn34=; b=RnMFk42SomoTJe
	ae1LAUrgfqze0ctnpgh98uO4yxWY9jaYdeAWDUZYeh2qXWBeVYqciUmn/LUONhIl36+EutipXvXqw
	Da9XwNkXmOJiRuYKU0bAIhceI3un5lobJ0bA34uHJLkJeAIQ7CQex8tfbPV1VhhqO0S14Kv9Ru78z
	zQY3dToktLmyjBJhTHAsJ5ybzHijZls7AE1ZzanqGFFN/+59O1CARYU/Lm7q3oO2eVCmATMqkKM3f
	ooTecl4qLRYGGSn+mcZ29G1l8QOswNramgkOyoiWVJnQgzRnot0Xv5Ea9yv7MmZMSzsBstu1fP9me
	yaGAykK5HzeprKfiTYnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD4GO-000WMt-2B; Mon, 09 Aug 2021 12:20:16 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD4G9-000WK4-RX; Mon, 09 Aug 2021 12:20:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id h14so21123229wrx.10;
 Mon, 09 Aug 2021 05:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=n98GGkHlH75W8BYsH/I8e5W6Kr2vLzbeo4fbwBXJ3Dc=;
 b=bmGSsMU69Z+FYDDa22CgTHJBsh2dLq/+bfM2lny9YS/ELdSulu3hKTeb4mePLV/rZg
 zZM1OMp7+Cv0Fo4T/GEK5izk14ouAkvpbhCRd1+kuuwFFnZCGYEK2H5N4Qm0V+ReZcss
 QRGmJ3h+EQBBMAmP522rfoLQdkM9wOVsezx6+yn16/Tx6xzAl2D7AmRk11qojajZjtPo
 K7CztH98KGr7paPIK9fbruUJkTT94+18i/w/Ttl2H7msKdjLUpl3gcnwBLSSwd8mvtmj
 ehrkT/6W4UTnvTLZ5crvJ9OSBPvuzvZAodhA/4ZGZPL6ki6gSZ6tpRyKoUQChbnY3cWA
 QE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=n98GGkHlH75W8BYsH/I8e5W6Kr2vLzbeo4fbwBXJ3Dc=;
 b=HZIBrGidz/WyAJNxQRHCVtjm2/5IeSscnZsCV3VMlTjxq5XRDQtpmvRMxN0AT/W+Fu
 sUakC5chAbKW7hKVt9PHtz8bqhJDm45Lgvzd+DWPihiC+snrLwPyY5P9SYPaiMYDgoyI
 oeq1b0BWJZGan/YbHpQKjA/q+v7uAi+mBU9W98hRpFtqEMBKOTUGCN5H6Siw/1vyonny
 nisMmNTgI/N9x6ikXDamZOAYzwrRSdVGHQGkOk16n+TIXiFql8TwXH+nj7rgcvzouwyP
 m8NnBQgohlOxiyuQ5Ztx6BhiPCHFztnbhIdVhEIbS4k7YmoGW0jkI6iGLrGbeeBK1DeI
 Pm2Q==
X-Gm-Message-State: AOAM530KzJNSUCK/lKnsaNeX8lnBZ4oyYX+MzJMAGSAjo9heT/T28N3u
 v5xh+m6NqJo0qiRYvvx+bXQGhO9wLB4bEw==
X-Google-Smtp-Source: ABdhPJzLba9TFzKyPqRV5u3itGbSRV9z3VNqboRp4OBTfUlSM+1UsdSzLjx9sXxUXFICwP7z+4iCEw==
X-Received: by 2002:a5d:474d:: with SMTP id o13mr6398647wrs.256.1628511599433; 
 Mon, 09 Aug 2021 05:19:59 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id s84sm4432299wme.12.2021.08.09.05.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 05:19:59 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Bilal Wasim
 <bilalwasim676@gmail.com>, CK HU <ck.hu@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] drivers: soc: mediatek: updates for v5.15
Message-ID: <49fc7bef-20db-b98c-9437-dd9e4d00e870@gmail.com>
Date: Mon, 9 Aug 2021 14:19:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_052001_957697_6BA62BBF 
X-CRM114-Status: GOOD (  16.86  )
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

Hi Olof,
Hi Arnd,

Please have a look for the updates of the SoC drivers for Mediatek. If you
wonder why there is no binding patch for the MT8365 mmsys: The binding was
converted to YAML. This got taken by Rob. To minimize merge conflicts I left it
to him to take other mmsys binding patches. Unfortunately there is one mmsys
binding patch taken by Stephen through the clock tree. So there will be a
trivial merge conflict (although not in your tree). A bit of a mess this time,
I'll try to make sure that the bindings for drivers/soc will go through my tree
in the future (which will make my life easier as well...).

Regards,
Matthias

---
The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.14-next-soc

for you to fetch changes up to 25423731956b3d72bc35d336227c88ada49148e8:

  soc: mediatek: mmsys: Fix missing UFOE component in mt8173 table routing
(2021-08-06 16:43:23 +0200)

----------------------------------------------------------------
pm-domains:
- correct mask define if used for update on TOPAXI bus
- mt8173: enable regulator befor turning on MFG_ASYNC

mmsys:
- add a mask property to the routing information
- add support for MT8365
- add UFOE routing for MT8173

----------------------------------------------------------------
Bilal Wasim (2):
      soc: mediatek: pm-domains: Use correct mask for bus_prot_clr
      soc: mediatek: pm-domains: Add domain_supply cap for mfg_async PD

CK Hu (1):
      soc: mmsys: mediatek: add mask to mmsys routes

Enric Balletbo i Serra (1):
      soc: mediatek: mmsys: Fix missing UFOE component in mt8173 table routing

Fabien Parent (1):
      soc: mediatek: mmsys: add MT8365 support

 drivers/soc/mediatek/mt8173-pm-domains.h |   1 +
 drivers/soc/mediatek/mt8183-mmsys.h      |  21 +++--
 drivers/soc/mediatek/mt8365-mmsys.h      |  60 ++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c         |  18 +++-
 drivers/soc/mediatek/mtk-mmsys.h         | 137 ++++++++++++++++++++++---------
 drivers/soc/mediatek/mtk-pm-domains.h    |   2 +-
 6 files changed, 189 insertions(+), 50 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8365-mmsys.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
